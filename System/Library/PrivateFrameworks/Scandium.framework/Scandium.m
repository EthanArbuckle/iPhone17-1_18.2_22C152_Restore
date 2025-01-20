uint64_t query_interface(id **a1, uint64_t a2, uint64_t a3, void *a4)
{
  NSObject *v8;
  _DWORD *v9;
  CFUUIDRef v10;
  CFUUIDRef v11;
  CFAllocatorRef v12;
  CFUUIDRef v13;
  CFUUIDRef v14;
  uint64_t v15;
  uint8_t buf[4];
  const char *v18;
  uint64_t v19;
  CFUUIDBytes v20;

  v19 = *MEMORY[0x263EF8340];
  v8 = sc_get_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v18 = "query_interface";
    _os_log_impl(&dword_25BA34000, v8, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v9 = **a1;
  *(void *)&v20.byte0 = a2;
  *(void *)&v20.byte8 = a3;
  v10 = CFUUIDCreateFromUUIDBytes((CFAllocatorRef)*MEMORY[0x263EFFB08], v20);
  v11 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu);
  if (CFEqual(v10, v11))
  {
    *a4 = v9 + 22;
    ++v9[52];
  }
  else
  {
    v12 = (const __CFAllocator *)*MEMORY[0x263EFFB30];
    v13 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x263EFFB30], 0x6Fu, 0xE2u, 0x2Au, 0xBFu, 0x68u, 0xB9u, 0x11u, 0xDBu, 0xA7u, 0x1Fu, 0, 0x16u, 0xCBu, 0xC1u, 0x10u, 0xF7u);
    if (CFEqual(v10, v13))
    {
      *a4 = v9 + 50;
      ++v9[53];
    }
    else
    {
      v14 = CFUUIDGetConstantUUIDWithBytes(v12, 0, 0, 0, 0, 0, 0, 0, 0, 0xC0u, 0, 0, 0, 0, 0, 0, 0x46u);
      if (CFEqual(v10, v14))
      {
        *a4 = v9 + 50;
        ++v9[54];
      }
      else
      {
        *a4 = 0;
      }
    }
  }
  CFRelease(v10);
  if (*a4) {
    v15 = 0;
  }
  else {
    v15 = 2147483652;
  }

  return v15;
}

uint64_t cfplugin_add_ref(uint64_t **a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v2 = sc_get_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    v6 = "cfplugin_add_ref";
    _os_log_impl(&dword_25BA34000, v2, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v5, 0xCu);
  }

  uint64_t v3 = **a1;
  uint64_t result = *(unsigned int *)(v3 + 208);
  *(_DWORD *)(v3 + 208) = result + 1;
  return result;
}

uint64_t cfplugin_release(id **a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = sc_get_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315138;
    v8 = "cfplugin_release";
    _os_log_impl(&dword_25BA34000, v2, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v7, 0xCu);
  }

  uint64_t v3 = **a1;
  int v4 = v3[52];
  if (!v4)
  {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF488] format:@"attempt to over-release CF plug-in COM interface"];
    int v4 = v3[52];
  }
  uint64_t v5 = (v4 - 1);
  v3[52] = v5;
  [v3 checkRefCounts];

  return v5;
}

uint64_t cfplugin_probe(id **a1, uint64_t a2, io_registry_entry_t a3)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v5 = sc_get_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v27 = "cfplugin_probe";
    _os_log_impl(&dword_25BA34000, v5, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }
  uint64_t v6 = 3758097088;

  int v7 = (id *)**a1;
  *(_DWORD *)buf = 0;
  if (!IORegistryEntryGetParentEntry(a3, "IOService", (io_registry_entry_t *)buf))
  {
    io_registry_entry_t parent = 0;
    if (IORegistryEntryGetParentEntry(*(io_registry_entry_t *)buf, "IOService", &parent))
    {
      IOObjectRelease(*(io_object_t *)buf);
    }
    else
    {
      uint64_t v9 = IOHIDDeviceCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], parent);
      IOObjectRelease(parent);
      IOObjectRelease(*(io_object_t *)buf);
      if (v9)
      {
        uint64_t v10 = IOHIDDeviceOpen(v9, 0);
        if (v10)
        {
          uint64_t v6 = v10;
          CFRelease(v9);
        }
        else
        {
          long long v22 = 0u;
          long long v23 = 0u;
          long long v20 = 0u;
          long long v21 = 0u;
          uint64_t v11 = [&unk_270936C10 countByEnumeratingWithState:&v20 objects:v25 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v21;
            do
            {
              for (uint64_t i = 0; i != v12; ++i)
              {
                if (*(void *)v21 != v13) {
                  objc_enumerationMutation(&unk_270936C10);
                }
                CFStringRef v15 = *(const __CFString **)(*((void *)&v20 + 1) + 8 * i);
                CFTypeRef Property = IOHIDDeviceGetProperty(v9, v15);
                if (Property)
                {
                  v17 = (void *)CFRetain(Property);
                  [v7[28] setObject:v17 forKeyedSubscript:v15];
                }
              }
              uint64_t v12 = [&unk_270936C10 countByEnumeratingWithState:&v20 objects:v25 count:16];
            }
            while (v12);
          }
          v18 = [[SCService alloc] initWithDevice:v9];
          id v19 = v7[2];
          v7[2] = v18;

          CFRelease(v9);
          uint64_t v6 = 0;
        }
      }
    }
  }

  return v6;
}

uint64_t cfplugin_start()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v0 = sc_get_log();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    int v2 = 136315138;
    uint64_t v3 = "cfplugin_start";
    _os_log_impl(&dword_25BA34000, v0, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v2, 0xCu);
  }

  return 0;
}

uint64_t cfplugin_stop()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v0 = sc_get_log();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = 136315138;
    uint64_t v3 = "cfplugin_stop";
    _os_log_impl(&dword_25BA34000, v0, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v2, 0xCu);
  }

  return 0;
}

uint64_t hid_service_add_ref(uint64_t **a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v2 = sc_get_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    uint64_t v6 = "hid_service_add_ref";
    _os_log_impl(&dword_25BA34000, v2, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v5, 0xCu);
  }

  uint64_t v3 = **a1;
  uint64_t result = *(unsigned int *)(v3 + 212);
  *(_DWORD *)(v3 + 212) = result + 1;
  return result;
}

uint64_t hid_service_release(id **a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v2 = sc_get_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315138;
    v8 = "hid_service_release";
    _os_log_impl(&dword_25BA34000, v2, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v7, 0xCu);
  }

  uint64_t v3 = **a1;
  int v4 = v3[53];
  if (!v4)
  {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF488] format:@"attempt to over-release HID service COM interface"];
    int v4 = v3[53];
  }
  uint64_t v5 = (v4 - 1);
  v3[53] = v5;
  [v3 checkRefCounts];

  return v5;
}

uint64_t hid_service_open()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v0 = sc_get_log();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    int v2 = 136315138;
    uint64_t v3 = "hid_service_open";
    _os_log_impl(&dword_25BA34000, v0, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v2, 0xCu);
  }

  return 1;
}

void hid_service_close()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v0 = sc_get_log();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136315138;
    int v2 = "hid_service_close";
    _os_log_impl(&dword_25BA34000, v0, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v1, 0xCu);
  }
}

uint64_t hid_service_copy_property(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sc_get_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    hid_service_copy_property_cold_1();
  }

  [*(id *)(**(void **)a1 + 224) objectForKeyedSubscript:a2];
  return objc_claimAutoreleasedReturnValue();
}

uint64_t hid_service_set_property()
{
  v0 = sc_get_log();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    hid_service_set_property_cold_1();
  }

  return 1;
}

void hid_service_set_event_callback()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v0 = sc_get_log();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    int v1 = 136315138;
    int v2 = "hid_service_set_event_callback";
    _os_log_impl(&dword_25BA34000, v0, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v1, 0xCu);
  }
}

uint64_t hid_service_schedule(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = sc_get_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    uint64_t v5 = "hid_service_schedule";
    _os_log_impl(&dword_25BA34000, v2, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v4, 0xCu);
  }

  return [*(id *)(**(void **)a1 + 16) start];
}

void hid_service_unschedule()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v0 = sc_get_log();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136315138;
    int v2 = "hid_service_unschedule";
    _os_log_impl(&dword_25BA34000, v0, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v1, 0xCu);
  }
}

uint64_t hid_service_copy_event()
{
  v0 = sc_get_log();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    hid_service_copy_event_cold_1(v0);
  }

  return 0;
}

uint64_t hid_service_set_output_event()
{
  v0 = sc_get_log();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    hid_service_set_output_event_cold_1(v0);
  }

  return 3758097095;
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void input_report_callback(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  id v9 = a1;
  uint64_t v10 = v9;
  if (a6 && a7 >= 1)
  {
    uint64_t v11 = [v9 delegateQueue];
    if (v11)
    {
      uint64_t v12 = [MEMORY[0x263EFF8F8] dataWithBytes:a6 length:a7];
      if (v12)
      {
        v13[0] = MEMORY[0x263EF8330];
        v13[1] = 3221225472;
        v13[2] = __input_report_callback_block_invoke;
        v13[3] = &unk_2654A0498;
        id v14 = v10;
        id v15 = v12;
        dispatch_async(v11, v13);
      }
    }
  }
}

const char *ioreturn_string(int a1)
{
  int v1 = a1 + 536870212;
  uint64_t result = "general error";
  switch(v1)
  {
    case 0:
      return result;
    case 1:
      uint64_t result = "can't allocate memory";
      break;
    case 2:
      uint64_t result = "resource shortage";
      break;
    case 3:
      uint64_t result = "error during IPC";
      break;
    case 4:
      uint64_t result = "no such device";
      break;
    case 5:
      uint64_t result = "privilege violation";
      break;
    case 6:
      uint64_t result = "invalid argument";
      break;
    case 7:
      uint64_t result = "device read locked";
      break;
    case 8:
      uint64_t result = "device write locked";
      break;
    case 9:
      uint64_t result = "exclusive access and device already open";
      break;
    case 10:
      uint64_t result = "sent/received messages had different msg_id";
      break;
    case 11:
      uint64_t result = "unsupported function";
      break;
    case 12:
      uint64_t result = "misc. VM failure";
      break;
    case 13:
      uint64_t result = "internal error";
      break;
    case 14:
      uint64_t result = "general I/O error";
      break;
    case 15:
    case 32:
      goto LABEL_5;
    case 16:
      uint64_t result = "can't acquire lock";
      break;
    case 17:
      uint64_t result = "device not open";
      break;
    case 18:
      uint64_t result = "read not supported";
      break;
    case 19:
      uint64_t result = "write not supported";
      break;
    case 20:
      uint64_t result = "alignment error";
      break;
    case 21:
      uint64_t result = "media error";
      break;
    case 22:
      uint64_t result = "device(s) still open";
      break;
    case 23:
      uint64_t result = "RLD failure";
      break;
    case 24:
      uint64_t result = "DMA failure";
      break;
    case 25:
      uint64_t result = "Device Busy";
      break;
    case 26:
      uint64_t result = "I/O Timeout";
      break;
    case 27:
      uint64_t result = "device offline";
      break;
    case 28:
      uint64_t result = "not ready";
      break;
    case 29:
      uint64_t result = "device not attached";
      break;
    case 30:
      uint64_t result = "no DMA channels left";
      break;
    case 31:
      uint64_t result = "no space for data";
      break;
    case 33:
      uint64_t result = "port already exists";
      break;
    case 34:
      uint64_t result = "can't wire down physical memory";
      break;
    case 35:
      uint64_t result = "no interrupt attached";
      break;
    case 36:
      uint64_t result = "no DMA frames enqueued";
      break;
    case 37:
      uint64_t result = "oversized msg received on interrupt port";
      break;
    case 38:
      uint64_t result = "not permitted";
      break;
    case 39:
      uint64_t result = "no power to device";
      break;
    case 40:
      uint64_t result = "media not present";
      break;
    case 41:
      uint64_t result = "media not formatted";
      break;
    case 42:
      uint64_t result = "no such mode";
      break;
    case 43:
      uint64_t result = "data underrun";
      break;
    case 44:
      uint64_t result = "data overrun";
      break;
    case 45:
      uint64_t result = "the device is not working properly";
      break;
    case 46:
      uint64_t result = "a completion routine is required";
      break;
    case 47:
      uint64_t result = "operation aborted";
      break;
    case 48:
      uint64_t result = "bus bandwidth would be exceeded";
      break;
    case 49:
      uint64_t result = "device not responding";
      break;
    case 50:
      uint64_t result = "isochronous I/O request for distant past";
      break;
    case 51:
      uint64_t result = "isochronous I/O request for distant future";
      break;
    case 52:
      uint64_t result = "data was not found";
      break;
    default:
      if ("general error" == -536870911) {
        uint64_t result = "invalid";
      }
      else {
LABEL_5:
      }
        uint64_t result = "unrecognized IOReturn code";
      break;
  }
  return result;
}

void sub_25BA39B24(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_25BA39C6C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_25BA39FBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void __input_report_callback_block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 handleScandiumInputReport:*(void *)(a1 + 40)];
}

void sub_25BA3A438(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_25BA3A4B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_25BA3A510(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_25BA3A578(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  uint64_t v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)SCTimeReference;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
}

uint64_t ae::TimeReference::rtp_to_continuous_time_point(ae::TimeReference *this, uint64_t a2)
{
  uint64_t v4 = a2;
  uint64_t v2 = *((unsigned int *)this + 2);
  if (v2 == -1) {
    std::__throw_bad_variant_access[abi:ne180100]();
  }
  uint64_t v5 = &v4;
  return ((uint64_t (*)(uint64_t **, ae::TimeReference *))off_2709333F8[v2])(&v5, this);
}

void std::__throw_bad_variant_access[abi:ne180100]()
{
  exception = __cxa_allocate_exception(8uLL);
  void *exception = MEMORY[0x263F8C3A8] + 16;
  __cxa_throw(exception, MEMORY[0x263F8C1F8], (void (*)(void *))std::bad_variant_access::~bad_variant_access);
}

{
  void *exception;

  exception = __cxa_allocate_exception(8uLL);
  void *exception = MEMORY[0x263F8C3A8] + 16;
  __cxa_throw(exception, MEMORY[0x263F8C1F8], (void (*)(void *))std::bad_variant_access::~bad_variant_access);
}

uint64_t _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm0EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZNK2ae13TimeReference28rtp_to_continuous_time_pointEyEUlRKT_E_EEJRKNS0_6__baseILNS0_6_TraitE0EJNS_6chrono8durationIxNS_5ratioILl1ELl24000000EEEEENSJ_IxNSK_ILl1ELl32768EEEEEEEEEEEDcSA_DpT0_(void **a1, void *a2)
{
  return 125 * **a1 * *a2 / 3;
}

uint64_t _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm1EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZNK2ae13TimeReference28rtp_to_continuous_time_pointEyEUlRKT_E_EEJRKNS0_6__baseILNS0_6_TraitE0EJNS_6chrono8durationIxNS_5ratioILl1ELl24000000EEEEENSJ_IxNSK_ILl1ELl32768EEEEEEEEEEEDcSA_DpT0_(void **a1, void *a2)
{
  return 1953125 * **a1 * *a2 / 64;
}

std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep std::__variant_detail::__visitation::__base::__dispatcher<0ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<-[SCTimeReference currentRTPTimestamp]::$_0> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,std::chrono::duration<long long,std::ratio<1l,24000000l>>,std::chrono<long long,std::chrono::duration<1l,32768l>>> &>()
{
  return 3 * std::chrono::steady_clock::now().__d_.__rep_ / 125;
}

std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep std::__variant_detail::__visitation::__base::__dispatcher<1ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<-[SCTimeReference currentRTPTimestamp]::$_0> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,std::chrono::duration<long long,std::ratio<1l,24000000l>>,std::chrono<long long,std::chrono::duration<1l,32768l>>> &>()
{
  return (std::chrono::steady_clock::now().__d_.__rep_ << 6) / 1953125;
}

void scandium::PacketDropDetector::handle_packet(scandium::PacketDropDetector *this, unsigned __int8 a2, __int16 a3, uint64_t a4)
{
  v18[3] = *MEMORY[0x263EF8340];
  unsigned __int8 v15 = a2;
  if (std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::find<unsigned char>(this, &v15))
  {
    v16 = &v15;
    __int16 v7 = *((_WORD *)std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::__emplace_unique_key_args<unsigned char,std::piecewise_construct_t const&,std::tuple<unsigned char const&>,std::tuple<>>((uint64_t)this, &v15, (uint64_t)&std::piecewise_construct, &v16)+ 9);
    v16 = &v15;
    *((_WORD *)std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::__emplace_unique_key_args<unsigned char,std::piecewise_construct_t const&,std::tuple<unsigned char const&>,std::tuple<>>((uint64_t)this, &v15, (uint64_t)&std::piecewise_construct, &v16)+ 9) = a3;
    uint64_t v8 = (unsigned __int16)(~v7 + a3);
    if (~v7 + a3)
    {
      v17[0] = @"input_report_id";
      id v9 = [NSNumber numberWithUnsignedChar:v15];
      v18[0] = v9;
      v17[1] = @"drop_count";
      uint64_t v10 = [NSNumber numberWithUnsignedShort:v8];
      v18[1] = v10;
      v17[2] = @"packet_size";
      uint64_t v11 = [NSNumber numberWithUnsignedLong:a4];
      v18[2] = v11;
      uint64_t v12 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:3];

      uint64_t v13 = sc_get_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
        scandium::PacketDropDetector::handle_packet(&v15, v8, v13);
      }

      id v14 = sc_get_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        scandium::PacketDropDetector::handle_packet((uint64_t)v12, v14);
      }

      AnalyticsSendEvent();
    }
  }
  else
  {
    v16 = &v15;
    *((_WORD *)std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::__emplace_unique_key_args<unsigned char,std::piecewise_construct_t const&,std::tuple<unsigned char const&>,std::tuple<>>((uint64_t)this, &v15, (uint64_t)&std::piecewise_construct, &v16)+ 9) = a3;
  }
}

void sub_25BA3AD40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::~__hash_table(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
  if (v2)
  {
    do
    {
      uint64_t v3 = (void *)*v2;
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = 0;
  if (v4) {
    operator delete(v4);
  }
  return a1;
}

uint64_t **std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::find<unsigned char>(void *a1, unsigned __int8 *a2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (!*(void *)&v2) {
    return 0;
  }
  unint64_t v3 = *a2;
  uint8x8_t v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    unint64_t v5 = *a2;
    if (*(void *)&v2 <= v3) {
      unint64_t v5 = v3 % *(void *)&v2;
    }
  }
  else
  {
    unint64_t v5 = (v2.i32[0] - 1) & v3;
  }
  uint64_t v6 = *(uint64_t ****)(*a1 + 8 * v5);
  if (!v6) {
    return 0;
  }
  for (uint64_t result = *v6; result; uint64_t result = (uint64_t **)*result)
  {
    unint64_t v8 = (unint64_t)result[1];
    if (v8 == v3)
    {
      if (*((unsigned __int8 *)result + 16) == v3) {
        return result;
      }
    }
    else
    {
      if (v4.u32[0] > 1uLL)
      {
        if (v8 >= *(void *)&v2) {
          v8 %= *(void *)&v2;
        }
      }
      else
      {
        v8 &= *(void *)&v2 - 1;
      }
      if (v8 != v5) {
        return 0;
      }
    }
  }
  return result;
}

void *std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::__emplace_unique_key_args<unsigned char,std::piecewise_construct_t const&,std::tuple<unsigned char const&>,std::tuple<>>(uint64_t a1, unsigned __int8 *a2, uint64_t a3, unsigned char **a4)
{
  unint64_t v7 = *a2;
  unint64_t v8 = *(void *)(a1 + 8);
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v8 <= v7) {
        unint64_t v4 = v7 % v8;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
    uint64_t v10 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v10)
    {
      uint64_t v11 = *v10;
      if (*v10)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v12 == v7)
          {
            if (*((unsigned __int8 *)v11 + 16) == v7) {
              return v11;
            }
          }
          else
          {
            if (v9.u32[0] > 1uLL)
            {
              if (v12 >= v8) {
                v12 %= v8;
              }
            }
            else
            {
              v12 &= v8 - 1;
            }
            if (v12 != v4) {
              break;
            }
          }
          uint64_t v11 = (void *)*v11;
        }
        while (v11);
      }
    }
  }
  uint64_t v11 = operator new(0x18uLL);
  *uint64_t v11 = 0;
  v11[1] = v7;
  *((unsigned char *)v11 + 16) = **a4;
  *((_WORD *)v11 + 9) = 0;
  float v13 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v14 = *(float *)(a1 + 32);
  if (!v8 || (float)(v14 * (float)v8) < v13)
  {
    BOOL v15 = 1;
    if (v8 >= 3) {
      BOOL v15 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v16 = v15 | (2 * v8);
    unint64_t v17 = vcvtps_u32_f32(v13 / v14);
    if (v16 <= v17) {
      size_t v18 = v17;
    }
    else {
      size_t v18 = v16;
    }
    std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::__rehash<true>(a1, v18);
    unint64_t v8 = *(void *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v8 <= v7) {
        unint64_t v4 = v7 % v8;
      }
      else {
        unint64_t v4 = v7;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
  }
  uint64_t v19 = *(void *)a1;
  long long v20 = *(void **)(*(void *)a1 + 8 * v4);
  if (v20)
  {
    *uint64_t v11 = *v20;
LABEL_38:
    *long long v20 = v11;
    goto LABEL_39;
  }
  *uint64_t v11 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v11;
  *(void *)(v19 + 8 * v4) = a1 + 16;
  if (*v11)
  {
    unint64_t v21 = *(void *)(*v11 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v21 >= v8) {
        v21 %= v8;
      }
    }
    else
    {
      v21 &= v8 - 1;
    }
    long long v20 = (void *)(*(void *)a1 + 8 * v21);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return v11;
}

void sub_25BA3B0CC(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  int v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

void std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::__rehash<true>(uint64_t a1, size_t __n)
{
  if (__n == 1)
  {
    size_t prime = 2;
  }
  else
  {
    size_t prime = __n;
    if ((__n & (__n - 1)) != 0) {
      size_t prime = std::__next_prime(__n);
    }
  }
  int8x8_t v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(void *)&v4) {
    goto LABEL_16;
  }
  if (prime < *(void *)&v4)
  {
    unint64_t v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      unint64_t v5 = std::__next_prime(v5);
    }
    else
    {
      uint64_t v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2) {
        unint64_t v5 = v7;
      }
    }
    if (prime <= v5) {
      size_t prime = v5;
    }
    if (prime < *(void *)&v4)
    {
LABEL_16:
      std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::__do_rehash<true>(a1, prime);
    }
  }
}

void std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::__do_rehash<true>(uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    if (a2 >> 61) {
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    int8x8_t v4 = operator new(8 * a2);
    unint64_t v5 = *(void **)a1;
    *(void *)a1 = v4;
    if (v5) {
      operator delete(v5);
    }
    uint64_t v6 = 0;
    *(void *)(a1 + 8) = a2;
    do
      *(void *)(*(void *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    uint64_t v7 = *(void **)(a1 + 16);
    if (v7)
    {
      unint64_t v8 = v7[1];
      uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2) {
          v8 %= a2;
        }
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v8) = a1 + 16;
      uint64_t v11 = (void *)*v7;
      if (*v7)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= a2) {
              v12 %= a2;
            }
          }
          else
          {
            v12 &= a2 - 1;
          }
          if (v12 != v8)
          {
            if (!*(void *)(*(void *)a1 + 8 * v12))
            {
              *(void *)(*(void *)a1 + 8 * v12) = v7;
              goto LABEL_24;
            }
            *uint64_t v7 = *v11;
            *uint64_t v11 = **(void **)(*(void *)a1 + 8 * v12);
            **(void **)(*(void *)a1 + 8 * v12) = v11;
            uint64_t v11 = v7;
          }
          unint64_t v12 = v8;
LABEL_24:
          uint64_t v7 = v11;
          uint64_t v11 = (void *)*v11;
          unint64_t v8 = v12;
        }
        while (v11);
      }
    }
  }
  else
  {
    uint64_t v10 = *(void **)a1;
    *(void *)a1 = 0;
    if (v10) {
      operator delete(v10);
    }
    *(void *)(a1 + 8) = 0;
  }
}

void sub_25BA3B678(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 80));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_25BA3C510(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va4, a3);
  va_start(va3, a3);
  va_start(va2, a3);
  va_start(va1, a3);
  va_start(locationa, a3);
  id location = va_arg(va1, id);
  va_copy(va2, va1);
  id v10 = va_arg(va2, id);
  va_copy(va3, va2);
  id v12 = va_arg(va3, id);
  va_copy(va4, va3);
  id v14 = va_arg(va4, id);
  objc_destroyWeak((id *)locationa);
  objc_destroyWeak((id *)va1);
  objc_destroyWeak((id *)va2);
  objc_destroyWeak((id *)va3);
  objc_destroyWeak((id *)va4);

  _Unwind_Resume(a1);
}

void sub_25BA3C754(_Unwind_Exception *a1, SCAnalytics *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
}

void scandium::convert_analytics_to_objc(uint64_t a1@<X0>, unsigned __int16 a2@<W1>, _DWORD *a3@<X2>, _DWORD *a4@<X3>, uint64_t a5@<X4>, uint64_t *a6@<X8>, double a7@<D0>)
{
  LODWORD(a7) = *(_DWORD *)a1;
  *a6 = [NSNumber numberWithFloat:a7];
  LODWORD(v13) = *(_DWORD *)(a1 + 4);
  a6[1] = [NSNumber numberWithFloat:v13];
  LODWORD(v14) = *(_DWORD *)(a1 + 8);
  a6[2] = [NSNumber numberWithFloat:v14];
  LODWORD(v15) = *(_DWORD *)(a1 + 12);
  a6[3] = [NSNumber numberWithFloat:v15];
  LODWORD(v16) = *(_DWORD *)(a1 + 16);
  a6[4] = [NSNumber numberWithFloat:v16];
  LODWORD(v17) = *(_DWORD *)(a1 + 20);
  a6[5] = [NSNumber numberWithFloat:v17];
  LODWORD(v18) = *(_DWORD *)(a1 + 24);
  a6[6] = [NSNumber numberWithFloat:v18];
  LODWORD(v19) = *(_DWORD *)(a1 + 28);
  a6[7] = [NSNumber numberWithFloat:v19];
  a6[8] = [NSNumber numberWithInt:*(unsigned int *)(a1 + 32)];
  a6[9] = [NSNumber numberWithInt:*(unsigned int *)(a1 + 36)];
  a6[10] = [NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
  a6[11] = [NSNumber numberWithInt:*(unsigned int *)(a1 + 44)];
  a6[12] = [NSNumber numberWithUnsignedShort:*(unsigned __int16 *)(a1 + 48)];
  a6[13] = [NSNumber numberWithUnsignedChar:*(unsigned __int8 *)(a1 + 50)];
  a6[14] = [NSNumber numberWithUnsignedChar:*(unsigned __int8 *)(a1 + 51)];
  a6[15] = [NSNumber numberWithUnsignedChar:*(unsigned __int8 *)(a1 + 52)];
  a6[16] = [NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
  a6[17] = [NSNumber numberWithInt:*(unsigned int *)(a1 + 60)];
  a6[18] = [NSNumber numberWithInt:*(unsigned int *)(a1 + 64)];
  a6[19] = [NSNumber numberWithBool:*(_DWORD *)(a1 + 64) != -1];
  int v21 = *(unsigned __int8 *)(a1 + 76);
  if (*(unsigned char *)(a1 + 76))
  {
    LODWORD(v20) = *(_DWORD *)(a1 + 72);
    long long v22 = [NSNumber numberWithFloat:v20];
  }
  else
  {
    long long v22 = 0;
  }
  id v96 = v22;
  a6[20] = (uint64_t)v22;
  if (a3)
  {
    LODWORD(v23) = *a3;
    v24 = [NSNumber numberWithFloat:v23];
  }
  else
  {
    v24 = 0;
  }
  a6[21] = (uint64_t)v24;
  if (a4)
  {
    LODWORD(v25) = *a4;
    v26 = [NSNumber numberWithFloat:v25];
  }
  else
  {
    v26 = 0;
  }
  a6[22] = (uint64_t)v26;
  a6[23] = [NSNumber numberWithUnsignedShort:*(unsigned __int16 *)(a1 + 68)];
  a6[24] = [NSNumber numberWithUnsignedShort:*(unsigned __int16 *)(a1 + 70)];
  uint64_t v97 = a2 & 0xFF00;
  if ((a2 & 0xFF00) != 0)
  {
    v27 = [NSNumber numberWithChar:(char)a2];
  }
  else
  {
    v27 = 0;
  }
  a6[25] = (uint64_t)v27;
  a6[26] = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 108)];
  a6[27] = [NSNumber numberWithBool:a5];
  a6[28] = [NSNumber numberWithInt:*(unsigned int *)(a1 + 80)];
  a6[29] = [NSNumber numberWithInt:*(unsigned int *)(a1 + 84)];
  LODWORD(v28) = *(_DWORD *)(a1 + 88);
  a6[30] = [NSNumber numberWithFloat:v28];
  LODWORD(v29) = *(_DWORD *)(a1 + 92);
  a6[31] = [NSNumber numberWithFloat:v29];
  LODWORD(v30) = *(_DWORD *)(a1 + 96);
  a6[32] = [NSNumber numberWithFloat:v30];
  LODWORD(v31) = *(_DWORD *)(a1 + 100);
  a6[33] = [NSNumber numberWithFloat:v31];
  LODWORD(v32) = *(_DWORD *)(a1 + 104);
  a6[34] = [NSNumber numberWithFloat:v32];
  LODWORD(v33) = *(_DWORD *)(a1 + 112);
  a6[35] = [NSNumber numberWithFloat:v33];
  LODWORD(v34) = *(_DWORD *)(a1 + 116);
  a6[36] = [NSNumber numberWithFloat:v34];
  LODWORD(v35) = *(_DWORD *)(a1 + 120);
  a6[37] = [NSNumber numberWithFloat:v35];
  LODWORD(v36) = *(_DWORD *)(a1 + 124);
  a6[38] = [NSNumber numberWithFloat:v36];
  LODWORD(v37) = *(_DWORD *)(a1 + 128);
  a6[39] = [NSNumber numberWithFloat:v37];
  LODWORD(v38) = *(_DWORD *)(a1 + 132);
  a6[40] = [NSNumber numberWithFloat:v38];
  LODWORD(v39) = *(_DWORD *)(a1 + 136);
  a6[41] = [NSNumber numberWithFloat:v39];
  LODWORD(v40) = *(_DWORD *)(a1 + 140);
  a6[42] = [NSNumber numberWithFloat:v40];
  LODWORD(v41) = *(_DWORD *)(a1 + 144);
  a6[43] = [NSNumber numberWithFloat:v41];
  LODWORD(v42) = *(_DWORD *)(a1 + 148);
  a6[44] = [NSNumber numberWithFloat:v42];
  LODWORD(v43) = *(_DWORD *)(a1 + 152);
  a6[45] = [NSNumber numberWithFloat:v43];
  a6[46] = [NSNumber numberWithUnsignedShort:*(unsigned __int16 *)(a1 + 156)];
  a6[47] = [NSNumber numberWithUnsignedShort:*(unsigned __int16 *)(a1 + 158)];
  a6[48] = [NSNumber numberWithUnsignedShort:*(unsigned __int16 *)(a1 + 160)];
  a6[49] = [NSNumber numberWithUnsignedShort:*(unsigned __int16 *)(a1 + 162)];
  a6[50] = [NSNumber numberWithUnsignedShort:*(unsigned __int16 *)(a1 + 164)];
  a6[51] = [NSNumber numberWithUnsignedShort:*(unsigned __int16 *)(a1 + 166)];
  a6[52] = [NSNumber numberWithUnsignedShort:*(unsigned __int16 *)(a1 + 168)];
  a6[53] = [NSNumber numberWithUnsignedShort:*(unsigned __int16 *)(a1 + 170)];
  a6[54] = [NSNumber numberWithUnsignedShort:*(unsigned __int16 *)(a1 + 172)];
  a6[55] = [NSNumber numberWithUnsignedShort:*(unsigned __int16 *)(a1 + 174)];
  a6[56] = [NSNumber numberWithUnsignedShort:*(unsigned __int16 *)(a1 + 176)];
  a6[57] = [NSNumber numberWithUnsignedChar:*(unsigned __int8 *)(a1 + 178)];
  a6[58] = [NSNumber numberWithUnsignedShort:*(unsigned __int16 *)(a1 + 180)];
  a6[59] = [NSNumber numberWithInt:*(unsigned int *)(a1 + 184)];
  a6[60] = [NSNumber numberWithInt:*(unsigned int *)(a1 + 188)];
  a6[61] = [NSNumber numberWithInt:*(unsigned int *)(a1 + 192)];
  a6[62] = [NSNumber numberWithInt:*(unsigned int *)(a1 + 196)];
  a6[63] = [NSNumber numberWithInt:*(unsigned int *)(a1 + 200)];
  a6[64] = [NSNumber numberWithInt:*(unsigned int *)(a1 + 204)];
  a6[65] = [NSNumber numberWithInt:*(unsigned int *)(a1 + 208)];
  a6[66] = [NSNumber numberWithInt:*(unsigned int *)(a1 + 212)];
  a6[67] = [NSNumber numberWithInt:*(unsigned int *)(a1 + 216)];
  a6[68] = [NSNumber numberWithInt:*(unsigned int *)(a1 + 220)];
  a6[69] = [NSNumber numberWithInt:*(unsigned int *)(a1 + 224)];
  a6[70] = [NSNumber numberWithInt:*(unsigned int *)(a1 + 228)];
  a6[71] = [NSNumber numberWithInt:*(unsigned int *)(a1 + 232)];
  a6[72] = [NSNumber numberWithInt:*(unsigned int *)(a1 + 236)];
  a6[73] = [NSNumber numberWithInt:*(unsigned int *)(a1 + 240)];
  a6[74] = [NSNumber numberWithInt:*(unsigned int *)(a1 + 244)];
  LODWORD(v44) = *(_DWORD *)(a1 + 248);
  a6[75] = [NSNumber numberWithFloat:v44];
  LODWORD(v45) = *(_DWORD *)(a1 + 252);
  a6[76] = [NSNumber numberWithFloat:v45];
  LODWORD(v46) = *(_DWORD *)(a1 + 256);
  a6[77] = [NSNumber numberWithFloat:v46];
  LODWORD(v47) = *(_DWORD *)(a1 + 260);
  a6[78] = [NSNumber numberWithFloat:v47];
  LODWORD(v48) = *(_DWORD *)(a1 + 264);
  a6[79] = [NSNumber numberWithFloat:v48];
  LODWORD(v49) = *(_DWORD *)(a1 + 268);
  a6[80] = [NSNumber numberWithFloat:v49];
  LODWORD(v50) = *(_DWORD *)(a1 + 272);
  a6[81] = [NSNumber numberWithFloat:v50];
  LODWORD(v51) = *(_DWORD *)(a1 + 276);
  a6[82] = [NSNumber numberWithFloat:v51];
  LODWORD(v52) = *(_DWORD *)(a1 + 280);
  a6[83] = [NSNumber numberWithFloat:v52];
  LODWORD(v53) = *(_DWORD *)(a1 + 284);
  a6[84] = [NSNumber numberWithFloat:v53];
  LODWORD(v54) = *(_DWORD *)(a1 + 288);
  a6[85] = [NSNumber numberWithFloat:v54];
  LODWORD(v55) = *(_DWORD *)(a1 + 292);
  a6[86] = [NSNumber numberWithFloat:v55];
  LODWORD(v56) = *(_DWORD *)(a1 + 296);
  a6[87] = [NSNumber numberWithFloat:v56];
  LODWORD(v57) = *(_DWORD *)(a1 + 300);
  a6[88] = [NSNumber numberWithFloat:v57];
  LODWORD(v58) = *(_DWORD *)(a1 + 304);
  a6[89] = [NSNumber numberWithFloat:v58];
  LODWORD(v59) = *(_DWORD *)(a1 + 308);
  a6[90] = [NSNumber numberWithFloat:v59];
  LODWORD(v60) = *(_DWORD *)(a1 + 312);
  a6[91] = [NSNumber numberWithFloat:v60];
  LODWORD(v61) = *(_DWORD *)(a1 + 316);
  a6[92] = [NSNumber numberWithFloat:v61];
  LODWORD(v62) = *(_DWORD *)(a1 + 320);
  a6[93] = [NSNumber numberWithFloat:v62];
  LODWORD(v63) = *(_DWORD *)(a1 + 324);
  a6[94] = [NSNumber numberWithFloat:v63];
  LODWORD(v64) = *(_DWORD *)(a1 + 328);
  a6[95] = [NSNumber numberWithFloat:v64];
  LODWORD(v65) = *(_DWORD *)(a1 + 332);
  a6[96] = [NSNumber numberWithFloat:v65];
  LODWORD(v66) = *(_DWORD *)(a1 + 336);
  a6[97] = [NSNumber numberWithFloat:v66];
  LODWORD(v67) = *(_DWORD *)(a1 + 340);
  a6[98] = [NSNumber numberWithFloat:v67];
  LODWORD(v68) = *(_DWORD *)(a1 + 344);
  a6[99] = [NSNumber numberWithFloat:v68];
  LODWORD(v69) = *(_DWORD *)(a1 + 348);
  a6[100] = [NSNumber numberWithFloat:v69];
  LODWORD(v70) = *(_DWORD *)(a1 + 352);
  a6[101] = [NSNumber numberWithFloat:v70];
  LODWORD(v71) = *(_DWORD *)(a1 + 356);
  a6[102] = [NSNumber numberWithFloat:v71];
  LODWORD(v72) = *(_DWORD *)(a1 + 360);
  a6[103] = [NSNumber numberWithFloat:v72];
  LODWORD(v73) = *(_DWORD *)(a1 + 364);
  a6[104] = [NSNumber numberWithFloat:v73];
  LODWORD(v74) = *(_DWORD *)(a1 + 368);
  a6[105] = [NSNumber numberWithFloat:v74];
  LODWORD(v75) = *(_DWORD *)(a1 + 372);
  a6[106] = [NSNumber numberWithFloat:v75];
  LODWORD(v76) = *(_DWORD *)(a1 + 376);
  a6[107] = [NSNumber numberWithFloat:v76];
  LODWORD(v77) = *(_DWORD *)(a1 + 380);
  a6[108] = [NSNumber numberWithFloat:v77];
  LODWORD(v78) = *(_DWORD *)(a1 + 384);
  a6[109] = [NSNumber numberWithFloat:v78];
  LODWORD(v79) = *(_DWORD *)(a1 + 388);
  a6[110] = [NSNumber numberWithFloat:v79];
  LODWORD(v80) = *(_DWORD *)(a1 + 392);
  a6[111] = [NSNumber numberWithFloat:v80];
  LODWORD(v81) = *(_DWORD *)(a1 + 396);
  a6[112] = [NSNumber numberWithFloat:v81];
  LODWORD(v82) = *(_DWORD *)(a1 + 400);
  a6[113] = [NSNumber numberWithFloat:v82];
  LODWORD(v83) = *(_DWORD *)(a1 + 404);
  a6[114] = [NSNumber numberWithFloat:v83];
  LODWORD(v84) = *(_DWORD *)(a1 + 408);
  a6[115] = [NSNumber numberWithFloat:v84];
  LODWORD(v85) = *(_DWORD *)(a1 + 412);
  a6[116] = [NSNumber numberWithFloat:v85];
  LODWORD(v86) = *(_DWORD *)(a1 + 416);
  a6[117] = [NSNumber numberWithFloat:v86];
  LODWORD(v87) = *(_DWORD *)(a1 + 420);
  a6[118] = [NSNumber numberWithFloat:v87];
  LODWORD(v88) = *(_DWORD *)(a1 + 424);
  a6[119] = [NSNumber numberWithFloat:v88];
  LODWORD(v89) = *(_DWORD *)(a1 + 428);
  a6[120] = [NSNumber numberWithFloat:v89];
  LODWORD(v90) = *(_DWORD *)(a1 + 432);
  a6[121] = [NSNumber numberWithFloat:v90];
  LODWORD(v91) = *(_DWORD *)(a1 + 436);
  a6[122] = [NSNumber numberWithFloat:v91];
  LODWORD(v92) = *(_DWORD *)(a1 + 440);
  a6[123] = [NSNumber numberWithFloat:v92];
  LODWORD(v93) = *(_DWORD *)(a1 + 444);
  a6[124] = [NSNumber numberWithFloat:v93];
  LODWORD(v94) = *(_DWORD *)(a1 + 448);
  a6[125] = [NSNumber numberWithFloat:v94];
  LODWORD(v95) = *(_DWORD *)(a1 + 452);
  a6[126] = [NSNumber numberWithFloat:v95];
  if (v97) {

  }
  if (a4) {
  if (a3)
  }

  if (v21)
  {
  }
}

void sub_25BA3D278(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9, uint64_t a10)
{
  if (v12) {
  if (v11)
  }

  if (v15) {
  _Unwind_Resume(a1);
  }
}

void sub_25BA3D6D4()
{
}

void sub_25BA3D6DC()
{
}

void sub_25BA3D6E4()
{
}

void sub_25BA3D6EC()
{
}

void sub_25BA3D6F4()
{
}

void sub_25BA3D6FC()
{
}

void sub_25BA3D704()
{
}

void sub_25BA3D70C()
{
}

void sub_25BA3D714()
{
}

void sub_25BA3D71C()
{
}

void sub_25BA3D724()
{
}

void sub_25BA3D72C()
{
}

void sub_25BA3D734()
{
}

void sub_25BA3D73C()
{
}

void sub_25BA3D744()
{
}

void sub_25BA3D74C()
{
}

void sub_25BA3D754()
{
}

void sub_25BA3D75C()
{
}

void sub_25BA3D764()
{
}

void sub_25BA3D76C()
{
}

void sub_25BA3D774()
{
}

void sub_25BA3D77C()
{
}

void sub_25BA3D784()
{
}

void sub_25BA3D78C()
{
}

void sub_25BA3D794()
{
}

void sub_25BA3D79C()
{
}

void sub_25BA3D7A4()
{
}

void sub_25BA3D7AC()
{
}

void sub_25BA3D7B4()
{
}

void sub_25BA3D7BC()
{
}

void sub_25BA3D7C4()
{
}

void sub_25BA3D7CC()
{
}

void sub_25BA3D7D4()
{
}

void sub_25BA3D7DC()
{
}

void sub_25BA3D7E4()
{
}

void sub_25BA3D7EC()
{
}

void sub_25BA3D7F4()
{
}

void sub_25BA3D7FC()
{
}

void sub_25BA3D804()
{
}

void sub_25BA3D80C()
{
}

void sub_25BA3D814()
{
}

void sub_25BA3D81C()
{
}

void sub_25BA3D824()
{
}

void sub_25BA3D82C()
{
}

void sub_25BA3D834()
{
}

void sub_25BA3D83C()
{
}

void sub_25BA3D844()
{
}

void sub_25BA3D84C()
{
}

void sub_25BA3D854()
{
}

void sub_25BA3D85C()
{
}

void sub_25BA3D864()
{
}

void sub_25BA3D86C()
{
}

void sub_25BA3D874()
{
}

void sub_25BA3D87C()
{
}

void sub_25BA3D884()
{
}

void sub_25BA3D88C()
{
}

void sub_25BA3D894()
{
}

void sub_25BA3D89C()
{
}

void sub_25BA3D8A4()
{
}

void sub_25BA3D8AC()
{
}

void sub_25BA3D8B4()
{
}

void sub_25BA3D8BC()
{
}

void sub_25BA3D8C4()
{
}

void sub_25BA3D8CC()
{
}

void sub_25BA3D8D4()
{
}

void sub_25BA3D8DC()
{
}

void sub_25BA3D8E4()
{
}

void sub_25BA3D8EC()
{
}

void sub_25BA3D8F4()
{
}

void sub_25BA3D8FC()
{
}

void sub_25BA3D904()
{
}

void sub_25BA3D90C()
{
}

void sub_25BA3D914()
{
}

void sub_25BA3D91C()
{
}

void sub_25BA3D924()
{
}

void sub_25BA3D92C()
{
}

void sub_25BA3D934()
{
}

void sub_25BA3D93C()
{
}

void sub_25BA3D944()
{
}

void sub_25BA3D94C()
{
}

void sub_25BA3D954()
{
}

void sub_25BA3D95C()
{
}

void sub_25BA3D964()
{
}

void sub_25BA3D96C()
{
}

void sub_25BA3D974()
{
}

void sub_25BA3D97C()
{
}

void sub_25BA3D984()
{
}

void sub_25BA3D98C()
{
}

void sub_25BA3D994()
{
}

void sub_25BA3D99C()
{
}

void sub_25BA3D9A4()
{
}

void sub_25BA3D9AC()
{
}

void sub_25BA3D9B4()
{
}

void sub_25BA3D9BC()
{
}

void sub_25BA3D9C4()
{
}

void sub_25BA3D9CC()
{
}

void sub_25BA3D9D4()
{
}

void sub_25BA3D9DC()
{
}

void sub_25BA3D9E4()
{
}

void sub_25BA3D9EC()
{
}

void sub_25BA3D9F4()
{
}

void sub_25BA3D9FC()
{
}

void sub_25BA3DA04()
{
}

void sub_25BA3DA0C()
{
}

void sub_25BA3DA14()
{
}

void sub_25BA3DA1C()
{
}

void sub_25BA3DA24()
{
}

void sub_25BA3DA2C()
{
}

void sub_25BA3DA34()
{
}

void sub_25BA3DA3C()
{
}

void sub_25BA3DA44()
{
}

void sub_25BA3DA4C()
{
}

void sub_25BA3DA54()
{
}

void sub_25BA3DA5C()
{
}

void sub_25BA3DA64()
{
}

void sub_25BA3DA6C()
{
}

void sub_25BA3DA74()
{
}

void sub_25BA3DA7C()
{
}

void sub_25BA3DB18(_Unwind_Exception *a1, SCAnalytics *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
}

void sub_25BA3DBDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_25BA3DC94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_25BA3DEDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,SCAnalytics *a35)
{
  _Unwind_Resume(a1);
}

void sub_25BA3F1EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

NSNumber *numberOrNsNull(NSNumber *a1)
{
  int v1 = a1;
  int8x8_t v2 = v1;
  if (v1)
  {
    uint64_t v3 = v1;
  }
  else
  {
    uint64_t v3 = [MEMORY[0x263EFF9D0] null];
  }
  int8x8_t v4 = v3;

  return v4;
}

void SCAnalytics::~SCAnalytics(SCAnalytics *this)
{
}

void sub_25BA3F940(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL std::type_info::operator==[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a2 + 8);
  if (v2 == v3) {
    return 1;
  }
  if ((v3 & v2) < 0 != __OFSUB__(v2, v3)) {
    return strcmp((const char *)(v2 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL)) == 0;
  }
  return 0;
}

void sub_25BA3FB80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_25BA3FDB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_25BA3FFEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
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

{
  size_t v4;
  size_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

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

void std::string::__throw_length_error[abi:ne180100]()
{
}

{
  std::__throw_length_error[abi:ne180100]("basic_string");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_2654A0420, MEMORY[0x263F8C060]);
}

{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_2654A0420, MEMORY[0x263F8C060]);
}

void sub_25BA40164(_Unwind_Exception *a1)
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

void *std::__function::__value_func<void ()(BOOL)>::~__value_func[abi:ne180100](void *a1)
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

void *std::__function::__value_func<void ()(scandium::AbortReason,scandium::Analytics const&)>::~__value_func[abi:ne180100](void *a1)
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

void *std::__function::__value_func<void ()(scandium::Result,scandium::Analytics const&)>::~__value_func[abi:ne180100](void *a1)
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

id ****std::unique_ptr<scandium::Processor>::reset[abi:ne180100](id *****a1, id ****a2)
{
  uint64_t result = *a1;
  *a1 = a2;
  if (result)
  {
    scandium::Processor::~Processor(result);
    JUMPOUT(0x26116E390);
  }
  return result;
}

id sc_get_log()
{
  if (sc_get_log_onceToken != -1) {
    dispatch_once(&sc_get_log_onceToken, &__block_literal_global);
  }
  v0 = (void *)sc_get_log_log;
  return v0;
}

void __sc_get_log_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.scandium", "framework");
  int v1 = (void *)sc_get_log_log;
  sc_get_log_log = (uint64_t)v0;
}

_DWORD *iirSOS_new(int a1, uint64_t a2)
{
  size_t v4 = malloc_type_malloc(0x18uLL, 0x10C004046BDA19FuLL);
  size_t v5 = v4;
  if (a1 >= 0) {
    int v6 = a1;
  }
  else {
    int v6 = a1 + 1;
  }
  int v7 = (a1 & 1) + (v6 >> 1);
  *size_t v4 = a1;
  v4[1] = v7;
  *((void *)v4 + 1) = a2;
  *((void *)v4 + 2) = malloc_type_calloc(v7, 8uLL, 0x100004052888210uLL);
  return v5;
}

uint64_t iirSOS_delete(void **a1)
{
  if (!a1) {
    return 2;
  }
  free(a1[2]);
  free(a1);
  return 0;
}

uint64_t iirSOS_init(uint64_t a1)
{
  if (!a1) {
    return 2;
  }
  int v1 = *(_DWORD *)(a1 + 4);
  if (v1 >= 1)
  {
    int v2 = 2 * v1;
    uint64_t v3 = *(void **)(a1 + 16);
    if (v2 <= 1) {
      int v2 = 1;
    }
    bzero(v3, 4 * v2);
  }
  return 0;
}

uint64_t iirSOS_setCoefs(uint64_t a1, uint64_t a2)
{
  uint64_t result = 2;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = 0;
      *(void *)(a1 + 8) = a2;
    }
  }
  return result;
}

uint64_t iirSOS_process(uint64_t a1, float *a2, float *a3, unsigned int a4)
{
  uint64_t result = 2;
  if (a1 && a2 && a3)
  {
    if ((a4 & 0x80000000) != 0)
    {
      return 4;
    }
    else
    {
      uint64_t v6 = *(unsigned int *)(a1 + 4);
      if ((int)v6 >= 1)
      {
        uint64_t v7 = 0;
        uint64_t v10 = a1 + 8;
        uint64_t v8 = *(void *)(a1 + 8);
        uint64_t v9 = *(void *)(v10 + 8);
        do
        {
          float v11 = *(float *)(v9 + 8 * v7);
          uint64_t v12 = (2 * v7) | 1;
          float v13 = *(float *)(v9 + 4 * v12);
          if (a4)
          {
            double v14 = (float *)(v8 + 20 * v7);
            float v15 = *v14;
            float v16 = v14[1];
            float v17 = v14[2];
            float v18 = -v14[3];
            float v19 = -v14[4];
            uint64_t v20 = a4;
            int v21 = a3;
            do
            {
              float v22 = *a2++;
              float v23 = v11 + (float)(v15 * v22);
              *v21++ = v23;
              float v11 = v13 + (float)((float)(v23 * v18) + (float)(v16 * v22));
              float v13 = (float)(v23 * v19) + (float)(v17 * v22);
              --v20;
            }
            while (v20);
          }
          *(float *)(v9 + 8 * v7) = v11;
          *(float *)(v9 + 4 * v12) = v13;
          ++v7;
          a2 = a3;
        }
        while (v7 != v6);
      }
      return 0;
    }
  }
  return result;
}

void Scandium::ScandiumPPG::find_slope(const float *a1, unsigned int a2, unsigned int a3, float **a4)
{
  unint64_t v8 = (2 * a3) | 1;
  LODWORD(v11[0]) = 0;
  std::vector<float>::vector(__C, v8, v11);
  float __A = (float)a3;
  float __B = -(float)a3;
  vDSP_vgen(&__A, &__B, __C[0], 1, v8);
  float v12 = 0.0;
  vDSP_svesq(__C[0], 1, &v12, v8);
  vDSP_vsdiv(__C[0], 1, &v12, __C[0], 1, v8);
  unsigned int v9 = 2 * a3 + a2;
  int v10 = 0;
  std::vector<float>::vector(v11, 2 * a3 + v9, &v10);
  vDSP_vclr(v11[0], 1, a3);
  vDSP_vclr(&v11[0][v9 - 1], -1, a3);
  vDSP_mmov(a1, &v11[0][a3], a2, 1uLL, a2, a2);
  std::vector<float>::resize((uint64_t)a4, v9);
  vDSP_conv(v11[0], 1, &__C[0][2 * a3], -1, *a4, 1, v9, v8);
  std::vector<float>::resize((uint64_t)a4, a2);
  if (v11[0])
  {
    v11[1] = v11[0];
    operator delete(v11[0]);
  }
  if (__C[0])
  {
    __C[1] = __C[0];
    operator delete(__C[0]);
  }
}

void sub_25BA41A2C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<float>::resize(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 2;
  if (a2 <= v2)
  {
    if (a2 < v2) {
      *(void *)(a1 + 8) = *(void *)a1 + 4 * a2;
    }
  }
  else
  {
    std::vector<float>::__append((char **)a1, a2 - v2);
  }
}

void *std::vector<float>::vector(void *a1, unint64_t a2, _DWORD *a3)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<float>::__vallocate[abi:ne180100](a1, a2);
    uint64_t v6 = (_DWORD *)a1[1];
    uint64_t v7 = &v6[a2];
    uint64_t v8 = 4 * a2;
    do
    {
      *v6++ = *a3;
      v8 -= 4;
    }
    while (v8);
    a1[1] = v7;
  }
  return a1;
}

void sub_25BA41B00(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<float>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 62) {
    std::vector<float>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[4 * v4];
  return result;
}

void std::vector<float>::__throw_length_error[abi:ne180100]()
{
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(4 * a2);
}

void sub_25BA41BF8(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::vector<float>::__append(char **a1, unint64_t a2)
{
  uint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  size_t v5 = v6;
  uint64_t v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 2)
  {
    if (a2)
    {
      bzero(*(void **)(v4 - 8), 4 * a2);
      v7 += 4 * a2;
    }
    a1[1] = v7;
  }
  else
  {
    uint64_t v8 = *a1;
    uint64_t v9 = v7 - *a1;
    unint64_t v10 = a2 + (v9 >> 2);
    if (v10 >> 62) {
      std::vector<float>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v11 = v9 >> 2;
    uint64_t v12 = v5 - v8;
    if (v12 >> 1 > v10) {
      unint64_t v10 = v12 >> 1;
    }
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v13 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v13 = v10;
    }
    if (v13)
    {
      double v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v4, v13);
      uint64_t v8 = *a1;
      uint64_t v7 = a1[1];
    }
    else
    {
      double v14 = 0;
    }
    float v15 = &v14[4 * v11];
    float v16 = &v14[4 * v13];
    bzero(v15, 4 * a2);
    float v17 = &v15[4 * a2];
    while (v7 != v8)
    {
      int v18 = *((_DWORD *)v7 - 1);
      v7 -= 4;
      *((_DWORD *)v15 - 1) = v18;
      v15 -= 4;
    }
    *a1 = v15;
    a1[1] = v17;
    a1[2] = v16;
    if (v8)
    {
      operator delete(v8);
    }
  }
}

uint64_t findPeaks(float *a1, int a2, vDSP_Length *__I, float a4, unsigned int a5, int a6, const float *__C, float *a8, int *a9, unsigned int *a10)
{
  if (a6) {
    float v10 = -1.0;
  }
  else {
    float v10 = 1.0;
  }
  uint64_t v11 = (a2 - 1);
  if (v11 < 2) {
    goto LABEL_75;
  }
  uint64_t v18 = 0;
  char v19 = 0;
  unsigned int v20 = 0;
  float v21 = 0.0;
  int v22 = -1;
  do
  {
    float v23 = &a1[v18];
    float v24 = v10 * v23[1];
    float v25 = v10 * v23[2];
    if (v19)
    {
      if (v24 == v25)
      {
        char v19 = 1;
        goto LABEL_30;
      }
      if (v24 < v25) {
        goto LABEL_28;
      }
      char v19 = 0;
      __C[v20] = v21;
      a9[v20] = v22;
    }
    else
    {
      float v26 = v10 * a1[v18];
      if (v24 <= a4 || v24 <= v26 || v24 <= v25)
      {
        if (v24 > a4 && v24 > v26 && v24 == v25)
        {
          int v22 = v18 + 1;
          char v19 = 1;
          float v21 = v10 * v23[1];
          goto LABEL_30;
        }
LABEL_28:
        char v19 = 0;
        goto LABEL_30;
      }
      char v19 = 0;
      __C[v20] = v24;
      a9[v20] = v18 + 1;
    }
    ++v20;
LABEL_30:
    ++v18;
  }
  while (v11 - 1 != v18);
  if (!v20)
  {
LABEL_75:
    *a10 = 0;
    return 0xFFFFFFFFLL;
  }
  for (vDSP_Length i = 0; i != v20; ++i)
    __I[i] = i;
  vDSP_vsorti(__C, __I, 0, v20, -1);
  if (v20 != 1)
  {
    uint64_t v32 = 0;
    do
    {
      vDSP_Length v33 = __I[v32];
      int v34 = a9[v33];
      if (v34)
      {
        if ((int)v33 >= 1)
        {
          unint64_t v35 = __I[v32] + 1;
          do
          {
            uint64_t v36 = (v35 - 2);
            int v37 = a9[v36];
            if (v37)
            {
              if (v34 - v37 >= a5) {
                break;
              }
              a9[v36] = 0;
            }
            --v35;
          }
          while (v35 > 1);
        }
        unsigned int v38 = v33 + 1;
        if (v38 < v20)
        {
          double v39 = &a9[v38];
          do
          {
            if (*v39)
            {
              if (*v39 - v34 >= a5) {
                break;
              }
              *double v39 = 0;
            }
            ++v39;
            ++v38;
          }
          while (v20 > v38);
        }
      }
      ++v32;
    }
    while (v32 != v20 - 1);
  }
  unsigned int v40 = 0;
  if (v20 <= 1) {
    uint64_t v41 = 1;
  }
  else {
    uint64_t v41 = v20;
  }
  double v42 = a9;
  double v43 = (float *)__C;
  do
  {
    int v45 = *v42++;
    int v44 = v45;
    if (v45)
    {
      a9[v40] = v44;
      __C[v40++] = *v43;
    }
    ++v43;
    --v41;
  }
  while (v41);
  uint64_t result = 0;
  *a10 = v40;
  if (a8 && v40)
  {
    for (uint64_t j = 0; j != v40; ++j)
    {
      uint64_t v48 = a9[j];
      int v49 = v48 & ((int)v48 >> 31);
      double v50 = &a1[v48];
      int v51 = a9[j];
      while (1)
      {
        BOOL v52 = __OFSUB__(v51--, 1);
        if (v51 < 0 != v52) {
          break;
        }
        float v53 = *v50;
        float v54 = *--v50;
        if ((float)(v10 * v54) >= (float)(v10 * v53))
        {
          int v49 = v51 + 1;
          break;
        }
      }
      float v55 = v10 * a1[v49];
      if (v48 <= v11) {
        int v56 = v11;
      }
      else {
        int v56 = a9[j];
      }
      double v57 = &a1[(int)v48 + 1];
      while (v11 > v48)
      {
        float v58 = v10 * *v57;
        float v59 = v10 * *(v57++ - 1);
        LODWORD(v48) = v48 + 1;
        if (v58 >= v59)
        {
          int v56 = v48 - 1;
          break;
        }
      }
      if (v55 <= (float)(v10 * a1[v56])) {
        float v55 = v10 * a1[v56];
      }
      a8[j] = -(float)(v55 - (float)(v10 * __C[j]));
    }
    return 0;
  }
  return result;
}

uint64_t Scandium::ScandiumPPG::scandium_signal_conditioning_t::scandium_signal_conditioning_t(uint64_t a1)
{
  *(void *)(a1 + 56) = 0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  Scandium::ScandiumPPG::scandium_signal_conditioning_t::reset((Scandium::ScandiumPPG::scandium_signal_conditioning_t *)a1);
  return a1;
}

void sub_25BA4204C(_Unwind_Exception *a1)
{
  std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100]((void *)(v1 + 32));
  _Unwind_Resume(a1);
}

_DWORD *Scandium::ScandiumPPG::scandium_signal_conditioning_t::reset(Scandium::ScandiumPPG::scandium_signal_conditioning_t *this)
{
  uint64_t v2 = *(void *)this;
  if (v2) {
    iirSOS_setCoefs(v2, (uint64_t)&Scandium::ScandiumPPG::ac_lpf);
  }
  else {
    *(void *)this = iirSOS_new(2, (uint64_t)&Scandium::ScandiumPPG::ac_lpf);
  }
  uint64_t v3 = *((void *)this + 1);
  if (v3) {
    iirSOS_setCoefs(v3, (uint64_t)&Scandium::ScandiumPPG::ac_hpf);
  }
  else {
    *((void *)this + 1) = iirSOS_new(2, (uint64_t)&Scandium::ScandiumPPG::ac_hpf);
  }
  uint64_t v4 = *((void *)this + 2);
  if (v4) {
    iirSOS_setCoefs(v4, (uint64_t)&Scandium::ScandiumPPG::dc_lpf_section1);
  }
  else {
    *((void *)this + 2) = iirSOS_new(2, (uint64_t)&Scandium::ScandiumPPG::dc_lpf_section1);
  }
  uint64_t v5 = *((void *)this + 3);
  if (v5)
  {
    return (_DWORD *)iirSOS_setCoefs(v5, (uint64_t)&Scandium::ScandiumPPG::dc_lpf_section2);
  }
  else
  {
    uint64_t result = iirSOS_new(2, (uint64_t)&Scandium::ScandiumPPG::dc_lpf_section2);
    *((void *)this + 3) = result;
  }
  return result;
}

void Scandium::ScandiumPPG::scandium_signal_conditioning_t::~scandium_signal_conditioning_t(void ***this)
{
}

uint64_t Scandium::ScandiumPPG::scandium_signal_conditioning_t::process(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(const void **)(a2 + 8);
  unint64_t v7 = *(unsigned int *)(a2 + 16);
  vDSP_Length v33 = 0;
  uint64_t v34 = 0;
  uint64_t v32 = 0;
  std::vector<float>::__init_with_size[abi:ne180100]<float const*,float const*>(&v32, v6, (uint64_t)v6 + 4 * v7, v7);
  double v29 = 0;
  double v30 = 0;
  uint64_t v31 = 0;
  __p = 0;
  v27 = 0;
  uint64_t v28 = 0;
  if (*(void *)(a2 + 8))
  {
    **(float **)a3 = stats::mean((stats *)v32, (const float *)((unint64_t)(v33 - (unsigned char *)v32) >> 2)) / 1000000.0;
    uint64_t v8 = Scandium::ScandiumPPG::scandium_signal_conditioning_t::compute_ac(a1, (uint64_t)&v32, (float **)&v29)
      || Scandium::ScandiumPPG::scandium_signal_conditioning_t::compute_dc((uint64_t)a1, (uint64_t)&v32, (uint64_t)&__p);
    uint64_t v9 = v29;
    if (v30 - (unsigned char *)v29 != v27 - (unsigned char *)__p) {
      __assert_rtn("process", "scandium_signal_conditioning.cpp", 133, "ac_out.size() == dc_out.size()");
    }
    if (!v8)
    {
      uint64_t v10 = *(void *)(a3 + 8);
      *(void *)(v10 + 8) = *(void *)v10;
      std::vector<float>::reserve((void **)v10, (v30 - v9) >> 2);
      uint64_t v9 = v30;
      if (v30 != v29)
      {
        unint64_t v11 = 0;
        uint64_t v9 = v29;
        do
        {
          if (v11 >= (v27 - (unsigned char *)__p) >> 2) {
            std::vector<float>::__throw_out_of_range[abi:ne180100]();
          }
          float v12 = (float)(*(float *)&v9[4 * v11] * -100.0) / *((float *)__p + v11);
          uint64_t v13 = *(void *)(a3 + 8);
          double v14 = *(float **)(v13 + 8);
          unint64_t v15 = *(void *)(v13 + 16);
          if ((unint64_t)v14 >= v15)
          {
            float v17 = *(float **)v13;
            uint64_t v18 = ((uint64_t)v14 - *(void *)v13) >> 2;
            unint64_t v19 = v18 + 1;
            if ((unint64_t)(v18 + 1) >> 62) {
              std::vector<float>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v20 = v15 - (void)v17;
            if (v20 >> 1 > v19) {
              unint64_t v19 = v20 >> 1;
            }
            if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFFCLL) {
              unint64_t v21 = 0x3FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v21 = v19;
            }
            if (v21)
            {
              int v22 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v13 + 16, v21);
              float v17 = *(float **)v13;
              double v14 = *(float **)(v13 + 8);
            }
            else
            {
              int v22 = 0;
            }
            float v23 = (float *)&v22[4 * v18];
            *float v23 = v12;
            float v16 = v23 + 1;
            while (v14 != v17)
            {
              int v24 = *((_DWORD *)v14-- - 1);
              *((_DWORD *)v23-- - 1) = v24;
            }
            *(void *)uint64_t v13 = v23;
            *(void *)(v13 + 8) = v16;
            *(void *)(v13 + 16) = &v22[4 * v21];
            if (v17) {
              operator delete(v17);
            }
          }
          else
          {
            *double v14 = v12;
            float v16 = v14 + 1;
          }
          *(void *)(v13 + 8) = v16;
          ++v11;
          uint64_t v9 = v29;
        }
        while (v11 < (v30 - (unsigned char *)v29) >> 2);
      }
    }
    if (__p)
    {
      v27 = __p;
      operator delete(__p);
      uint64_t v9 = v29;
    }
    if (v9)
    {
      double v30 = v9;
      operator delete(v9);
    }
  }
  else
  {
    uint64_t v8 = 4;
  }
  if (v32)
  {
    vDSP_Length v33 = v32;
    operator delete(v32);
  }
  return v8;
}

void sub_25BA4242C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17)
{
  if (__p) {
    operator delete(__p);
  }
  if (a13) {
    operator delete(a13);
  }
  if (a16) {
    operator delete(a16);
  }
  _Unwind_Resume(exception_object);
}

BOOL Scandium::ScandiumPPG::scandium_signal_conditioning_t::compute_ac(uint64_t *a1, uint64_t a2, float **a3)
{
  __dst = 0;
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  __p = 0;
  float v17 = 0;
  uint64_t v18 = 0;
  std::vector<float>::resize((uint64_t)a3, (uint64_t)(*(void *)(a2 + 8) - *(void *)a2) >> 2);
  std::vector<float>::resize((uint64_t)&__dst, (uint64_t)(*(void *)(a2 + 8) - *(void *)a2) >> 2);
  std::vector<float>::resize((uint64_t)&__p, (uint64_t)(*(void *)(a2 + 8) - *(void *)a2) >> 2);
  uint64_t v6 = *(void *)(a2 + 8);
  if (v6 != *(void *)a2) {
    memmove(__dst, *(const void **)a2, v6 - *(void *)a2);
  }
  unint64_t v7 = (float *)__dst;
  uint64_t v8 = v20;
  if (__dst != v20)
  {
    float v9 = *(float *)__dst;
    do
    {
      *unint64_t v7 = *v7 - v9;
      ++v7;
    }
    while (v7 != v8);
  }
  if (iirSOS_init(*a1)
    || iirSOS_process(*a1, (float *)__dst, (float *)__p, (*(void *)(a2 + 8) - *(void *)a2) >> 2))
  {
    BOOL v10 = 1;
  }
  else
  {
    float v12 = (float *)__p;
    uint64_t v13 = v17;
    if (__p != v17)
    {
      float v14 = *(float *)__p;
      do
      {
        *float v12 = *v12 - v14;
        ++v12;
      }
      while (v12 != v13);
    }
    int v15 = iirSOS_init(a1[1]);
    if (!v15) {
      int v15 = iirSOS_process(a1[1], (float *)__p, *a3, (*(void *)(a2 + 8) - *(void *)a2) >> 2);
    }
    BOOL v10 = v15 != 0;
  }
  if (__p)
  {
    float v17 = (float *)__p;
    operator delete(__p);
  }
  if (__dst)
  {
    uint64_t v20 = (float *)__dst;
    operator delete(__dst);
  }
  return v10;
}

void sub_25BA425D8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, void *a12, uint64_t a13)
{
  if (__p) {
    operator delete(__p);
  }
  if (a12) {
    operator delete(a12);
  }
  _Unwind_Resume(exception_object);
}

BOOL Scandium::ScandiumPPG::scandium_signal_conditioning_t::compute_dc(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __dst = 0;
  int v22 = 0;
  uint64_t v23 = 0;
  __p = 0;
  unint64_t v19 = 0;
  uint64_t v20 = 0;
  std::vector<float>::resize(a3, (uint64_t)(*(void *)(a2 + 8) - *(void *)a2) >> 2);
  std::vector<float>::resize((uint64_t)&__dst, (uint64_t)(*(void *)(a2 + 8) - *(void *)a2) >> 2);
  std::vector<float>::resize((uint64_t)&__p, (uint64_t)(*(void *)(a2 + 8) - *(void *)a2) >> 2);
  uint64_t v6 = *(void *)(a2 + 8);
  if (v6 != *(void *)a2) {
    memmove(__dst, *(const void **)a2, v6 - *(void *)a2);
  }
  unint64_t v7 = (float *)__dst;
  uint64_t v8 = v22;
  float v9 = *(float *)__dst;
  while (v7 != v8)
  {
    *unint64_t v7 = *v7 - v9;
    ++v7;
  }
  int v10 = iirSOS_init(*(void *)(a1 + 16));
  if (!v10) {
    int v10 = iirSOS_process(*(void *)(a1 + 16), (float *)__dst, (float *)__p, (*(void *)(a2 + 8) - *(void *)a2) >> 2);
  }
  unint64_t v11 = (float *)__p;
  float v12 = v19;
  if (__p != v19)
  {
    do
    {
      *unint64_t v11 = *v11 * 0.00000034061;
      ++v11;
    }
    while (v11 != v12);
  }
  if (v10)
  {
    BOOL v13 = 1;
  }
  else
  {
    int v15 = iirSOS_init(*(void *)(a1 + 24));
    if (!v15) {
      int v15 = iirSOS_process(*(void *)(a1 + 24), (float *)__p, *(float **)a3, (*(void *)(a2 + 8) - *(void *)a2) >> 2);
    }
    BOOL v13 = v15 != 0;
    float v16 = *(float **)a3;
    float v17 = *(float **)(a3 + 8);
    while (v16 != v17)
    {
      float *v16 = v9 + *v16;
      ++v16;
    }
  }
  if (__p)
  {
    unint64_t v19 = (float *)__p;
    operator delete(__p);
  }
  if (__dst)
  {
    int v22 = (float *)__dst;
    operator delete(__dst);
  }
  return v13;
}

void sub_25BA42790(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, void *a12, uint64_t a13)
{
  if (__p) {
    operator delete(__p);
  }
  if (a12) {
    operator delete(a12);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<float>::reserve(void **a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (unsigned char *)*a1) >> 2)
  {
    if (a2 >> 62) {
      std::vector<float>::__throw_length_error[abi:ne180100]();
    }
    int64_t v5 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    uint64_t v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v3, a2);
    unint64_t v7 = &v6[v5 & 0xFFFFFFFFFFFFFFFCLL];
    float v9 = &v6[4 * v8];
    int v10 = (char *)*a1;
    unint64_t v11 = (char *)a1[1];
    float v12 = v7;
    if (v11 != *a1)
    {
      float v12 = v7;
      do
      {
        int v13 = *((_DWORD *)v11 - 1);
        v11 -= 4;
        *((_DWORD *)v12 - 1) = v13;
        v12 -= 4;
      }
      while (v11 != v10);
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
    {
      operator delete(v10);
    }
  }
}

void *std::vector<float>::__init_with_size[abi:ne180100]<float const*,float const*>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    uint64_t result = std::vector<float>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      uint64_t result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_25BA428C4(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<float>::__throw_out_of_range[abi:ne180100]()
{
}

void std::__throw_out_of_range[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::out_of_range::out_of_range[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_2654A0428, MEMORY[0x263F8C068]);
}

void sub_25BA42940(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::out_of_range::out_of_range[abi:ne180100](std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C390] + 16);
  return result;
}

void *std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](void *a1)
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

uint64_t Scandium::ScandiumPPG::get_blank_path_idx(Scandium::ScandiumPPG *this)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v5 = (int)this;
  v6[4] = xmmword_25BA633A8;
  v6[5] = unk_25BA633B8;
  v6[6] = xmmword_25BA633C8;
  v6[7] = unk_25BA633D8;
  v6[0] = xmmword_25BA63368;
  v6[1] = unk_25BA63378;
  v6[2] = xmmword_25BA63388;
  v6[3] = unk_25BA63398;
  std::unordered_map<int,int>::unordered_map((uint64_t)v4, (int *)v6, 16);
  if (std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::find<int>(v4, &v5))
  {
    uint64_t v1 = std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::find<int>(v4, &v5);
    if (!v1) {
      std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
    }
    uint64_t v2 = *((unsigned int *)v1 + 5);
  }
  else
  {
    uint64_t v2 = 0xFFFFFFFFLL;
  }
  std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::~__hash_table((uint64_t)v4);
  return v2;
}

void sub_25BA42AE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t Scandium::ScandiumPPG::scandium_calibration_t::process(float a1, float a2, uint64_t a3, int a4, int a5, float *a6)
{
  uint64_t coeff = Scandium::ScandiumPPG::scandium_calibration_t::get_coeff(Scandium::ScandiumPPG::path_array[4 * a4 + a5], __p);
  Scandium::ScandiumPPG::scandium_calibration_t::compute_calibration_coeffs(a1, a2, coeff, (float **)__p, a6);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  return 0;
}

uint64_t Scandium::ScandiumPPG::scandium_calibration_t::get_coeff@<X0>(unsigned __int8 a1@<W1>, void *a2@<X8>)
{
  v18[2] = *MEMORY[0x263EF8340];
  unsigned __int8 v11 = a1;
  uint64_t v3 = operator new(0x48uLL);
  v3[8] = 0;
  *(_OWORD *)uint64_t v3 = xmmword_25BA633E8;
  *((_OWORD *)v3 + 1) = unk_25BA633F8;
  *((_OWORD *)v3 + 2) = xmmword_25BA63408;
  *((_OWORD *)v3 + 3) = *(_OWORD *)"j;g?";
  v12[0] = 0;
  memset(v13, 0, sizeof(v13));
  std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(v13, v3, (uint64_t)(v3 + 9), 0x12uLL);
  uint64_t v4 = operator new(0x48uLL);
  v4[8] = 0;
  *(_OWORD *)uint64_t v4 = xmmword_25BA63430;
  *((_OWORD *)v4 + 1) = unk_25BA63440;
  *((_OWORD *)v4 + 2) = xmmword_25BA63450;
  *((_OWORD *)v4 + 3) = unk_25BA63460;
  char v14 = 1;
  memset(v15, 0, sizeof(v15));
  std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(v15, v4, (uint64_t)(v4 + 9), 0x12uLL);
  int v5 = operator new(0x48uLL);
  v5[8] = 0;
  *(_OWORD *)int v5 = xmmword_25BA63478;
  *((_OWORD *)v5 + 1) = unk_25BA63488;
  *((_OWORD *)v5 + 2) = xmmword_25BA63498;
  *((_OWORD *)v5 + 3) = unk_25BA634A8;
  char v16 = 2;
  v18[0] = 0;
  v18[1] = 0;
  uint64_t v17 = 0;
  std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v17, v5, (uint64_t)(v5 + 9), 0x12uLL);
  std::unordered_map<Scandium::ScandiumPPG::PathType,std::vector<float>>::unordered_map((uint64_t)v10, v12, 3);
  for (uint64_t i = 0; i != -12; i -= 4)
  {
    uint64_t v7 = (void *)v18[i - 1];
    if (v7)
    {
      v18[i] = v7;
      operator delete(v7);
    }
  }
  operator delete(v5);
  operator delete(v4);
  operator delete(v3);
  size_t v8 = std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::find<unsigned char>(v10, &v11);
  if (!v8) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(a2, v8[3], (uint64_t)v8[4], ((char *)v8[4] - (char *)v8[3]) >> 2);
  return std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,std::vector<float>>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,std::vector<float>>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,std::vector<float>>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,std::vector<float>>>>::~__hash_table((uint64_t)v10);
}

void sub_25BA42D74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
  uint64_t v21 = 0;
  while (1)
  {
    int v22 = *(void **)(v19 + v21 + 72);
    if (v22)
    {
      *(void *)(v19 + v21 + 80) = v22;
      operator delete(v22);
    }
    v21 -= 32;
    if (v21 == -96)
    {
      operator delete(v18);
      operator delete(v17);
      operator delete(v16);
      _Unwind_Resume(a1);
    }
  }
}

uint64_t Scandium::ScandiumPPG::scandium_calibration_t::compute_calibration_coeffs(float a1, float a2, uint64_t a3, float **a4, float *a5)
{
  float v5 = (float)(a2 / 850.0) + -1.0;
  float v6 = (float)(a1 / 660.0) + -1.0;
  uint64_t v7 = *a4;
  *a5 = (float)((float)((float)((float)(**a4 + (float)((*a4)[1] * v6)) + (float)((*a4)[2] * (float)(v6 * v6)))
                      + (float)((*a4)[3] * v5))
              + (float)((*a4)[4] * (float)(v5 * v5)))
      + (float)((float)(v6 * (*a4)[5]) * v5);
  a5[1] = (float)((float)((float)((float)(v7[6] + (float)(v7[7] * v6)) + (float)(v7[8] * (float)(v6 * v6)))
                        + (float)(v7[9] * v5))
                + (float)(v7[10] * (float)(v5 * v5)))
        + (float)((float)(v6 * v7[11]) * v5);
  a5[2] = (float)((float)((float)((float)(v7[12] + (float)(v7[13] * v6)) + (float)(v7[14] * (float)(v6 * v6)))
                        + (float)(v7[15] * v5))
                + (float)(v7[16] * (float)(v5 * v5)))
        + (float)((float)(v6 * v7[17]) * v5);
  return 0;
}

void *std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    float v6 = result;
    uint64_t result = std::vector<float>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      uint64_t result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_25BA42F48(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::unordered_map<int,int>::unordered_map(uint64_t a1, int *a2, uint64_t a3)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = 1065353216;
  if (a3)
  {
    uint64_t v5 = 8 * a3;
    do
    {
      std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::__emplace_unique_key_args<int,std::pair<int const,int> const&>(a1, a2, a2);
      a2 += 2;
      v5 -= 8;
    }
    while (v5);
  }
  return a1;
}

void sub_25BA42FC8(_Unwind_Exception *a1)
{
  std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

void *std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::__emplace_unique_key_args<int,std::pair<int const,int> const&>(uint64_t a1, int *a2, void *a3)
{
  unint64_t v6 = *a2;
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v3 = *a2;
      if (v7 <= v6) {
        unint64_t v3 = v6 % v7;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }
    float v9 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v9)
    {
      int v10 = *v9;
      if (*v9)
      {
        do
        {
          unint64_t v11 = v10[1];
          if (v11 == v6)
          {
            if (*((_DWORD *)v10 + 4) == v6) {
              return v10;
            }
          }
          else
          {
            if (v8.u32[0] > 1uLL)
            {
              if (v11 >= v7) {
                v11 %= v7;
              }
            }
            else
            {
              v11 &= v7 - 1;
            }
            if (v11 != v3) {
              break;
            }
          }
          int v10 = (void *)*v10;
        }
        while (v10);
      }
    }
  }
  int v10 = operator new(0x18uLL);
  *int v10 = 0;
  v10[1] = v6;
  v10[2] = *a3;
  float v12 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    BOOL v14 = 1;
    if (v7 >= 3) {
      BOOL v14 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v15 = v14 | (2 * v7);
    unint64_t v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16) {
      size_t v17 = v16;
    }
    else {
      size_t v17 = v15;
    }
    std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::__rehash<true>(a1, v17);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= v6) {
        unint64_t v3 = v6 % v7;
      }
      else {
        unint64_t v3 = v6;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }
  }
  uint64_t v18 = *(void *)a1;
  uint64_t v19 = *(void **)(*(void *)a1 + 8 * v3);
  if (v19)
  {
    *int v10 = *v19;
LABEL_38:
    *uint64_t v19 = v10;
    goto LABEL_39;
  }
  *int v10 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v10;
  *(void *)(v18 + 8 * v3) = a1 + 16;
  if (*v10)
  {
    unint64_t v20 = *(void *)(*v10 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v20 >= v7) {
        v20 %= v7;
      }
    }
    else
    {
      v20 &= v7 - 1;
    }
    uint64_t v19 = (void *)(*(void *)a1 + 8 * v20);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return v10;
}

void sub_25BA431E4(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t *std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::find<int>(void *a1, int *a2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (!*(void *)&v2) {
    return 0;
  }
  unint64_t v3 = *a2;
  uint8x8_t v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    unint64_t v5 = *a2;
    if (*(void *)&v2 <= v3) {
      unint64_t v5 = v3 % *(void *)&v2;
    }
  }
  else
  {
    unint64_t v5 = (*(void *)&v2 - 1) & v3;
  }
  unint64_t v6 = *(uint64_t ***)(*a1 + 8 * v5);
  if (!v6) {
    return 0;
  }
  for (uint64_t result = *v6; result; uint64_t result = (uint64_t *)*result)
  {
    unint64_t v8 = result[1];
    if (v8 == v3)
    {
      if (*((_DWORD *)result + 4) == v3) {
        return result;
      }
    }
    else
    {
      if (v4.u32[0] > 1uLL)
      {
        if (v8 >= *(void *)&v2) {
          v8 %= *(void *)&v2;
        }
      }
      else
      {
        v8 &= *(void *)&v2 - 1;
      }
      if (v8 != v5) {
        return 0;
      }
    }
  }
  return result;
}

uint64_t std::unordered_map<Scandium::ScandiumPPG::PathType,std::vector<float>>::unordered_map(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = 1065353216;
  if (a3)
  {
    uint64_t v5 = 32 * a3;
    do
    {
      std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,std::vector<float>>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,std::vector<float>>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,std::vector<float>>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,std::vector<float>>>>::__emplace_unique_key_args<Scandium::ScandiumPPG::PathType,std::pair<Scandium::ScandiumPPG::PathType const,std::vector<float>> const&>(a1, a2, (uint64_t)a2);
      a2 += 32;
      v5 -= 32;
    }
    while (v5);
  }
  return a1;
}

void sub_25BA43310(_Unwind_Exception *a1)
{
  std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,std::vector<float>>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,std::vector<float>>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,std::vector<float>>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,std::vector<float>>>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

uint64_t **std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,std::vector<float>>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,std::vector<float>>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,std::vector<float>>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,std::vector<float>>>>::__emplace_unique_key_args<Scandium::ScandiumPPG::PathType,std::pair<Scandium::ScandiumPPG::PathType const,std::vector<float>> const&>(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  unint64_t v5 = *a2;
  unint64_t v6 = *(void *)(a1 + 8);
  if (v6)
  {
    uint8x8_t v7 = (uint8x8_t)vcnt_s8((int8x8_t)v6);
    v7.i16[0] = vaddlv_u8(v7);
    if (v7.u32[0] > 1uLL)
    {
      unint64_t v3 = *a2;
      if (v6 <= v5) {
        unint64_t v3 = v5 % v6;
      }
    }
    else
    {
      unint64_t v3 = (v6 - 1) & v5;
    }
    unint64_t v8 = *(uint64_t ****)(*(void *)a1 + 8 * v3);
    if (v8)
    {
      for (uint64_t result = *v8; result; uint64_t result = (uint64_t **)*result)
      {
        unint64_t v10 = (unint64_t)result[1];
        if (v10 == v5)
        {
          if (*((unsigned __int8 *)result + 16) == v5) {
            return result;
          }
        }
        else
        {
          if (v7.u32[0] > 1uLL)
          {
            if (v10 >= v6) {
              v10 %= v6;
            }
          }
          else
          {
            v10 &= v6 - 1;
          }
          if (v10 != v3) {
            break;
          }
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,std::vector<float>>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,std::vector<float>>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,std::vector<float>>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,std::vector<float>>>>::__construct_node_hash<std::pair<Scandium::ScandiumPPG::PathType const,std::vector<float>> const&>(a1, *a2, a3, (uint64_t)v19);
  float v11 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v12 = *(float *)(a1 + 32);
  if (!v6 || (float)(v12 * (float)v6) < v11)
  {
    BOOL v13 = 1;
    if (v6 >= 3) {
      BOOL v13 = (v6 & (v6 - 1)) != 0;
    }
    unint64_t v14 = v13 | (2 * v6);
    unint64_t v15 = vcvtps_u32_f32(v11 / v12);
    if (v14 <= v15) {
      size_t v16 = v15;
    }
    else {
      size_t v16 = v14;
    }
    std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::__rehash<true>(a1, v16);
    unint64_t v6 = *(void *)(a1 + 8);
    if ((v6 & (v6 - 1)) != 0)
    {
      if (v6 <= v5) {
        unint64_t v3 = v5 % v6;
      }
      else {
        unint64_t v3 = v5;
      }
    }
    else
    {
      unint64_t v3 = (v6 - 1) & v5;
    }
  }
  size_t v17 = *(void **)(*(void *)a1 + 8 * v3);
  if (v17)
  {
    *(void *)v19[0] = *v17;
    void *v17 = v19[0];
  }
  else
  {
    *(void *)v19[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v19[0];
    *(void *)(*(void *)a1 + 8 * v3) = a1 + 16;
    if (*(void *)v19[0])
    {
      unint64_t v18 = *(void *)(*(void *)v19[0] + 8);
      if ((v6 & (v6 - 1)) != 0)
      {
        if (v18 >= v6) {
          v18 %= v6;
        }
      }
      else
      {
        v18 &= v6 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v18) = v19[0];
    }
  }
  uint64_t result = (uint64_t **)v19[0];
  ++*(void *)(a1 + 24);
  return result;
}

void sub_25BA4353C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<Scandium::ScandiumPPG::PathType,std::vector<float>>,void *>>>::operator()[abi:ne180100]((uint64_t)&a11, __p);
  }
  _Unwind_Resume(exception_object);
}

void *std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,std::vector<float>>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,std::vector<float>>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,std::vector<float>>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,std::vector<float>>>>::__construct_node_hash<std::pair<Scandium::ScandiumPPG::PathType const,std::vector<float>> const&>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7 = a1 + 16;
  unint64_t v8 = operator new(0x30uLL);
  *(void *)a4 = v8;
  *(void *)(a4 + 8) = v7;
  *(unsigned char *)(a4 + 16) = 0;
  void *v8 = 0;
  v8[1] = a2;
  *((unsigned char *)v8 + 16) = *(unsigned char *)a3;
  v8[4] = 0;
  v8[5] = 0;
  v8[3] = 0;
  uint64_t result = std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(v8 + 3, *(const void **)(a3 + 8), *(void *)(a3 + 16), (uint64_t)(*(void *)(a3 + 16) - *(void *)(a3 + 8)) >> 2);
  *(unsigned char *)(a4 + 16) = 1;
  return result;
}

void sub_25BA435E4(_Unwind_Exception *a1)
{
  *uint64_t v1 = 0;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<Scandium::ScandiumPPG::PathType,std::vector<float>>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<Scandium::ScandiumPPG::PathType,std::vector<float>>,void *>>>::operator()[abi:ne180100](uint64_t a1, void *__p)
{
  if (*(unsigned char *)(a1 + 8))
  {
    uint64_t v3 = (void *)__p[3];
    if (v3)
    {
      __p[4] = v3;
      operator delete(v3);
    }
  }
  else if (!__p)
  {
    return;
  }
  operator delete(__p);
}

uint64_t std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,std::vector<float>>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,std::vector<float>>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,std::vector<float>>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,std::vector<float>>>>::~__hash_table(uint64_t a1)
{
  std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,std::vector<float>>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,std::vector<float>>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,std::vector<float>>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,std::vector<float>>>>::__deallocate_node(a1, *(void **)(a1 + 16));
  int8x8_t v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,std::vector<float>>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,std::vector<float>>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,std::vector<float>>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,std::vector<float>>>>::__deallocate_node(int a1, void *__p)
{
  if (__p)
  {
    int8x8_t v2 = __p;
    do
    {
      uint64_t v3 = (void *)*v2;
      uint8x8_t v4 = (void *)v2[3];
      if (v4)
      {
        v2[4] = v4;
        operator delete(v4);
      }
      operator delete(v2);
      int8x8_t v2 = v3;
    }
    while (v3);
  }
}

uint64_t Scandium::find_optical_gen(unsigned __int8 **a1)
{
  std::string::basic_string[abi:ne180100]<0>(v43, "N157");
  long long v45 = *(_OWORD *)v43;
  uint64_t v46 = v44;
  uint64_t v44 = 0;
  *(_OWORD *)double v43 = 0uLL;
  v47[0] = 1;
  std::string::basic_string[abi:ne180100]<0>(v41, "N158");
  long long v48 = *(_OWORD *)v41;
  uint64_t v49 = v42;
  v41[1] = 0;
  uint64_t v42 = 0;
  v41[0] = 0;
  int v50 = 1;
  std::string::basic_string[abi:ne180100]<0>(&v39, "N187");
  long long v51 = v39;
  uint64_t v52 = v40;
  uint64_t v40 = 0;
  long long v39 = 0uLL;
  int v53 = 1;
  std::string::basic_string[abi:ne180100]<0>(v37, "N188");
  long long v54 = *(_OWORD *)v37;
  uint64_t v55 = v38;
  v37[1] = 0;
  uint64_t v38 = 0;
  v37[0] = 0;
  int v56 = 1;
  std::string::basic_string[abi:ne180100]<0>(&v35, "N197");
  long long v57 = v35;
  uint64_t v58 = v36;
  uint64_t v36 = 0;
  long long v35 = 0uLL;
  int v59 = 1;
  std::string::basic_string[abi:ne180100]<0>(v33, "N198");
  long long v60 = *(_OWORD *)v33;
  uint64_t v61 = v34;
  v33[1] = 0;
  uint64_t v34 = 0;
  v33[0] = 0;
  int v62 = 1;
  std::string::basic_string[abi:ne180100]<0>(v31, "N199");
  long long v63 = *(_OWORD *)v31;
  uint64_t v64 = v32;
  v31[1] = 0;
  uint64_t v32 = 0;
  v31[0] = 0;
  int v65 = 1;
  std::string::basic_string[abi:ne180100]<0>(v29, "N207");
  long long v66 = *(_OWORD *)v29;
  uint64_t v67 = v30;
  v29[1] = 0;
  uint64_t v30 = 0;
  v29[0] = 0;
  int v68 = 2;
  std::string::basic_string[abi:ne180100]<0>(v27, "N208");
  long long v69 = *(_OWORD *)v27;
  uint64_t v70 = v28;
  v27[1] = 0;
  uint64_t v28 = 0;
  v27[0] = 0;
  int v71 = 2;
  std::string::basic_string[abi:ne180100]<0>(v25, "N210");
  long long v72 = *(_OWORD *)v25;
  uint64_t v73 = v26;
  v25[1] = 0;
  uint64_t v26 = 0;
  v25[0] = 0;
  int v74 = 2;
  std::string::basic_string[abi:ne180100]<0>(__p, "N217");
  long long v75 = *(_OWORD *)__p;
  uint64_t v76 = v24;
  __p[1] = 0;
  uint64_t v24 = 0;
  __p[0] = 0;
  int v77 = 3;
  std::string::basic_string[abi:ne180100]<0>(&v21, "N218");
  long long v78 = v21;
  uint64_t v79 = v22;
  int v80 = 3;
  if (SHIBYTE(v24) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v26) < 0) {
    operator delete(v25[0]);
  }
  if (SHIBYTE(v28) < 0) {
    operator delete(v27[0]);
  }
  if (SHIBYTE(v30) < 0) {
    operator delete(v29[0]);
  }
  if (SHIBYTE(v32) < 0) {
    operator delete(v31[0]);
  }
  if (SHIBYTE(v34) < 0) {
    operator delete(v33[0]);
  }
  if (SHIBYTE(v36) < 0) {
    operator delete((void *)v35);
  }
  if (SHIBYTE(v38) < 0) {
    operator delete(v37[0]);
  }
  if (SHIBYTE(v40) < 0) {
    operator delete((void *)v39);
  }
  if (SHIBYTE(v42) < 0) {
    operator delete(v41[0]);
  }
  if (SHIBYTE(v44) < 0) {
    operator delete(v43[0]);
  }
  uint64_t v2 = 0;
  int v3 = *((char *)a1 + 23);
  if (v3 >= 0) {
    uint8x8_t v4 = (unsigned __int8 *)a1;
  }
  else {
    uint8x8_t v4 = *a1;
  }
  if (v3 >= 0) {
    int64_t v5 = *((unsigned __int8 *)a1 + 23);
  }
  else {
    int64_t v5 = (int64_t)a1[1];
  }
  unint64_t v6 = &v4[v5];
  while (1)
  {
    uint64_t v7 = &v45 + 2 * v2;
    unint64_t v8 = *((unsigned __int8 *)v7 + 23);
    unint64_t v9 = *((void *)v7 + 1);
    if ((v8 & 0x80u) == 0) {
      unint64_t v10 = (char *)(&v45 + 2 * v2);
    }
    else {
      unint64_t v10 = *(char **)v7;
    }
    if ((v8 & 0x80u) == 0) {
      int64_t v11 = *((unsigned __int8 *)v7 + 23);
    }
    else {
      int64_t v11 = *((void *)v7 + 1);
    }
    if (v11)
    {
      if (v5 >= v11)
      {
        int v12 = *v10;
        int64_t v13 = v5;
        unint64_t v14 = v4;
        while (1)
        {
          uint64_t v15 = v13 - v11;
          if (v15 == -1) {
            break;
          }
          size_t v16 = (unsigned __int8 *)memchr(v14, v12, v15 + 1);
          if (!v16) {
            break;
          }
          size_t v17 = v16;
          if (!memcmp(v16, v10, v11))
          {
            if (v17 == v6 || v17 != v4) {
              goto LABEL_52;
            }
            goto LABEL_46;
          }
          unint64_t v14 = v17 + 1;
          int64_t v13 = v6 - (v17 + 1);
          if (v13 < v11) {
            goto LABEL_52;
          }
        }
      }
      goto LABEL_52;
    }
LABEL_46:
    if ((v8 & 0x80) != 0)
    {
      unint64_t v8 = v9;
      if (v5 == v9) {
        break;
      }
    }
    else if (v5 == v8)
    {
      break;
    }
    if (v5 <= v8) {
      std::string::__throw_out_of_range[abi:ne180100]();
    }
    if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * v4[v8] + 60) & 0x400) == 0) {
      break;
    }
LABEL_52:
    if (++v2 == 12)
    {
      uint64_t v18 = 0;
      goto LABEL_55;
    }
  }
  uint64_t v18 = v47[8 * v2];
LABEL_55:
  uint64_t v19 = 48;
  do
  {
    if (SHIBYTE(v43[v19 + 1]) < 0) {
      operator delete(v43[v19 - 1]);
    }
    v19 -= 4;
  }
  while (v19 * 8);
  return v18;
}

void sub_25BA43B84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25,void *a26,uint64_t a27,int a28,__int16 a29,char a30,char a31,void *a32,uint64_t a33,int a34,__int16 a35,char a36,char a37,void *a38,uint64_t a39,int a40,__int16 a41,char a42,char a43,void *a44,uint64_t a45,int a46,__int16 a47,char a48,char a49,void *a50,uint64_t a51,int a52,__int16 a53,char a54,char a55,void *a56,uint64_t a57,int a58,__int16 a59,char a60,char a61,void *a62,uint64_t a63)
{
  if (a19 < 0) {
    operator delete(__p);
  }
  if (a25 < 0) {
    operator delete(a20);
  }
  if (a31 < 0) {
    operator delete(a26);
  }
  if (a37 < 0) {
    operator delete(a32);
  }
  if (a43 < 0) {
    operator delete(a38);
  }
  if (a49 < 0) {
    operator delete(a44);
  }
  if (a55 < 0) {
    operator delete(a50);
  }
  if (a61 < 0) {
    operator delete(a56);
  }
  if (a67 < 0) {
    operator delete(a62);
  }
  if (a72 < 0) {
    operator delete(a68);
  }
  if (a74 < 0) {
    operator delete(a73);
  }
  for (; v75 != &a75; v75 -= 32)
  {
    if (*(v75 - 9) < 0) {
      operator delete(*((void **)v75 - 4));
    }
  }
  _Unwind_Resume(a1);
}

uint64_t Scandium::convert_legacy_start_pkt@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)(a2 + 111) = 0;
  *(_OWORD *)(a2 + 80) = 0u;
  *(_OWORD *)(a2 + 96) = 0u;
  *(_OWORD *)(a2 + 48) = 0u;
  *(_OWORD *)(a2 + 6std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)a2 = 0u;
  uint64_t v2 = *(unsigned int *)(a1 + 116);
  if (v2 == -1) {
    std::__throw_bad_variant_access[abi:ne180100]();
  }
  int64_t v5 = &v4;
  return ((uint64_t (*)(char **, uint64_t))off_270933668[v2])(&v5, a1);
}

float *Scandium::fill_valid(float *this, float *a2, float a3)
{
  if ((LODWORD(a3) & 0x7FFFFFFFu) <= 0x7F7FFFFF) {
    *this = a3;
  }
  return this;
}

uint64_t Scandium::flag_to_abort_reason(uint64_t result, void *a2)
{
  if ((result & 0x80) != 0)
  {
    *a2 |= 0x400uLL;
    if ((result & 0x800) == 0)
    {
LABEL_3:
      if ((result & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((result & 0x800) == 0)
  {
    goto LABEL_3;
  }
  *a2 |= 0x200uLL;
  if ((result & 0x20) == 0)
  {
LABEL_4:
    if ((result & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  *a2 |= 2uLL;
  if ((result & 0x40) == 0)
  {
LABEL_5:
    if ((result & 0x2000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  *a2 |= 4uLL;
  if ((result & 0x2000) == 0)
  {
LABEL_6:
    if ((result & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  *a2 |= 4uLL;
  if ((result & 0x100) == 0)
  {
LABEL_7:
    if ((result & 0x200) == 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  *a2 |= 1uLL;
  if ((result & 0x200) == 0)
  {
LABEL_8:
    if ((result & 0x400) == 0) {
      goto LABEL_9;
    }
    goto LABEL_18;
  }
LABEL_17:
  *a2 |= 0x40uLL;
  if ((result & 0x400) == 0)
  {
LABEL_9:
    if ((result & 0x80000000) == 0) {
      return result;
    }
LABEL_19:
    *a2 |= 0x100uLL;
    return result;
  }
LABEL_18:
  *a2 |= 0x80uLL;
  if ((result & 0x80000000) != 0) {
    goto LABEL_19;
  }
  return result;
}

float Scandium::sort_median(Scandium *this, const float *a2)
{
  if ((int)a2 <= 0) {
    Scandium::sort_median();
  }
  uint64_t v2 = this;
  if (!this) {
    Scandium::sort_median();
  }
  char v3 = (char)a2;
  __p = 0;
  unint64_t v20 = 0;
  uint64_t v4 = a2;
  uint64_t v21 = 0;
  std::vector<float>::reserve(&__p, a2);
  p_p = &__p;
  uint64_t v5 = 4 * v4;
  do
  {
    if ((*(_DWORD *)v2 & 0x7FFFFFFFu) <= 0x7F7FFFFF) {
      std::back_insert_iterator<std::vector<float>>::operator=[abi:ne180100]((uint64_t *)&p_p, v2);
    }
    uint64_t v2 = (Scandium *)((char *)v2 + 4);
    v5 -= 4;
  }
  while (v5);
  unint64_t v6 = (float *)__p;
  if (v20 == __p)
  {
    float v15 = NAN;
    if (!__p) {
      return v15;
    }
    goto LABEL_20;
  }
  std::__sort<std::__less<float,float> &,float *>();
  unint64_t v8 = (float *)__p;
  unint64_t v9 = v20;
  unint64_t v10 = ((char *)v20 - (unsigned char *)__p) >> 2;
  if (v3)
  {
    unint64_t v16 = (2 * v10 - 2) & 0xFFFFFFFFFFFFFFFCLL;
    size_t v17 = (float *)((char *)__p + v16);
    if ((char *)__p + v16 != (char *)v20) {
      std::__nth_element[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<float *>>((float *)__p, (float *)((char *)__p + v16), v20, v7);
    }
    float v15 = *v17;
  }
  else
  {
    unint64_t v11 = v10 >> 1;
    int v12 = (float *)((char *)__p + 4 * v11 - 4);
    if (v12 != v20)
    {
      float v7 = std::__nth_element[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<float *>>((float *)__p, (float *)__p + v11 - 1, v20, v7);
      unint64_t v8 = (float *)__p;
      unint64_t v9 = v20;
      unint64_t v11 = (unint64_t)(((char *)v20 - (unsigned char *)__p) >> 2) >> 1;
    }
    float v13 = *v12;
    unint64_t v14 = &v8[v11];
    if (v14 != v9) {
      std::__nth_element[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<float *>>(v8, &v8[v11], v9, v7);
    }
    float v15 = (float)(v13 + *v14) * 0.5;
  }
  unint64_t v6 = (float *)__p;
  if (__p)
  {
LABEL_20:
    unint64_t v20 = v6;
    operator delete(v6);
  }
  return v15;
}

void sub_25BA43F8C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::string::__throw_out_of_range[abi:ne180100]()
{
}

__n128 std::__variant_detail::__visitation::__base::__dispatcher<0ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<overloaded<Scandium::convert_legacy_start_pkt(std::variant<Scandium::sc_sess_start_pkt_v3_t,Scandium::sc_sess_start_pkt_v4_t> const&)::$_0,Scandium::convert_legacy_start_pkt(std::variant<Scandium::sc_sess_start_pkt_v3_t,Scandium::sc_sess_start_pkt_v4_t> const&)::$_1>> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,Scandium::sc_sess_start_pkt_v3_t,Scandium::sc_sess_start_pkt_v4_t> const&>@<Q0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  *(void *)a2 = *(void *)a1;
  *(void *)(a2 + 7) = *(void *)(a1 + 7);
  *(_DWORD *)(a2 + 110) = *(_DWORD *)(a1 + 107);
  *(unsigned char *)(a2 + 11std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = *(unsigned char *)(a1 + 111);
  *(_DWORD *)(a2 + 15) = *(_DWORD *)(a1 + 15);
  *(void *)(a2 + 19) = *(void *)(a1 + 19);
  *(_OWORD *)(a2 + 27) = *(_OWORD *)(a1 + 27);
  *(_OWORD *)(a2 + 43) = *(_OWORD *)(a1 + 43);
  *(_OWORD *)(a2 + 59) = *(_OWORD *)(a1 + 59);
  *(_OWORD *)(a2 + 75) = *(_OWORD *)(a1 + 75);
  __n128 result = *(__n128 *)(a1 + 91);
  *(__n128 *)(a2 + 91) = result;
  *(unsigned char *)(a2 + 107) = -1;
  *(_WORD *)(a2 + 108) = -1;
  return result;
}

__n128 std::__variant_detail::__visitation::__base::__dispatcher<1ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<overloaded<Scandium::convert_legacy_start_pkt(std::variant<Scandium::sc_sess_start_pkt_v3_t,Scandium::sc_sess_start_pkt_v4_t> const&)::$_0,Scandium::convert_legacy_start_pkt(std::variant<Scandium::sc_sess_start_pkt_v3_t,Scandium::sc_sess_start_pkt_v4_t> const&)::$_1>> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,Scandium::sc_sess_start_pkt_v3_t,Scandium::sc_sess_start_pkt_v4_t> const&>@<Q0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  long long v2 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(a2 + 6std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(a2 + 80) = v2;
  *(_OWORD *)(a2 + 96) = *(_OWORD *)(a1 + 96);
  *(_DWORD *)(a2 + 111) = *(_DWORD *)(a1 + 111);
  long long v3 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_OWORD *)(a2 + 16) = v3;
  __n128 result = *(__n128 *)(a1 + 32);
  long long v5 = *(_OWORD *)(a1 + 48);
  *(__n128 *)(a2 + 32) = result;
  *(_OWORD *)(a2 + 48) = v5;
  return result;
}

uint64_t *std::back_insert_iterator<std::vector<float>>::operator=[abi:ne180100](uint64_t *a1, _DWORD *a2)
{
  uint64_t v4 = *a1;
  long long v5 = *(_DWORD **)(*a1 + 8);
  unint64_t v6 = (void *)(*a1 + 16);
  if ((unint64_t)v5 >= *v6)
  {
    unint64_t v8 = *(_DWORD **)v4;
    uint64_t v9 = ((uint64_t)v5 - *(void *)v4) >> 2;
    unint64_t v10 = v9 + 1;
    if ((unint64_t)(v9 + 1) >> 62) {
      std::vector<float>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v11 = *v6 - (void)v8;
    if (v11 >> 1 > v10) {
      unint64_t v10 = v11 >> 1;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v12 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v10;
    }
    if (v12)
    {
      float v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)v6, v12);
      unint64_t v8 = *(_DWORD **)v4;
      long long v5 = *(_DWORD **)(v4 + 8);
    }
    else
    {
      float v13 = 0;
    }
    unint64_t v14 = &v13[4 * v9];
    float v15 = &v13[4 * v12];
    *(_DWORD *)unint64_t v14 = *a2;
    float v7 = v14 + 4;
    while (v5 != v8)
    {
      int v16 = *--v5;
      *((_DWORD *)v14 - 1) = v16;
      v14 -= 4;
    }
    *(void *)uint64_t v4 = v14;
    *(void *)(v4 + 8) = v7;
    *(void *)(v4 + 16) = v15;
    if (v8) {
      operator delete(v8);
    }
  }
  else
  {
    *long long v5 = *a2;
    float v7 = v5 + 1;
  }
  *(void *)(v4 + 8) = v7;
  return a1;
}

float std::__nth_element[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<float *>>(float *a1, float *a2, float *a3, float result)
{
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    do
    {
      unint64_t v7 = v4 - a1;
      if (v7 < 2) {
        break;
      }
      if (v7 == 3)
      {
        std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<float *>>(a1, a1 + 1, v4 - 1);
        return result;
      }
      if (v7 == 2)
      {
        __n128 result = *(v4 - 1);
        float v30 = *a1;
        if (result < *a1)
        {
          *a1 = result;
          *(v4 - 1) = v30;
        }
        return result;
      }
      if ((char *)v4 - (char *)a1 <= 31)
      {
        return std::__selection_sort[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<float *>>(a1, v4, result);
      }
      unint64_t v8 = &a1[v7 >> 1];
      uint64_t v9 = v4 - 1;
      int v10 = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<float *>>(a1, v8, v4 - 1);
      __n128 result = *a1;
      if (*a1 >= *v8)
      {
        uint64_t v11 = v4 - 1;
        while (--v11 != a1)
        {
          if (*v11 < *v8)
          {
            *a1 = *v11;
            *uint64_t v11 = result;
            ++v10;
            goto LABEL_13;
          }
        }
        uint64_t v21 = a1 + 1;
        if (result >= *v9)
        {
          while (v21 != v9)
          {
            float v22 = *v21;
            if (result < *v21)
            {
              *v21++ = *v9;
              *uint64_t v9 = v22;
              goto LABEL_45;
            }
            ++v21;
          }
          return result;
        }
LABEL_45:
        if (v21 == v9) {
          return result;
        }
        while (1)
        {
          float v25 = *a1;
          do
          {
            float v26 = *v21++;
            __n128 result = v26;
          }
          while (v25 >= v26);
          v27 = v21 - 1;
          do
          {
            float v28 = *--v9;
            float v29 = v28;
          }
          while (v25 < v28);
          if (v27 >= v9) {
            break;
          }
          float *v27 = v29;
          *uint64_t v9 = result;
        }
        a1 = v21 - 1;
        if (v27 > a2) {
          return result;
        }
      }
      else
      {
        uint64_t v11 = v4 - 1;
LABEL_13:
        unint64_t v12 = a1 + 1;
        if (a1 + 1 >= v11)
        {
          int v16 = a1 + 1;
        }
        else
        {
          float v13 = a1 + 1;
          while (1)
          {
            float v14 = *v8;
            do
            {
              float v15 = *v13++;
              __n128 result = v15;
            }
            while (v15 < v14);
            int v16 = v13 - 1;
            do
            {
              float v17 = *--v11;
              float v18 = v17;
            }
            while (v17 >= v14);
            if (v16 >= v11) {
              break;
            }
            float *v16 = v18;
            *uint64_t v11 = result;
            ++v10;
            if (v16 == v8) {
              unint64_t v8 = v11;
            }
          }
        }
        if (v16 != v8)
        {
          __n128 result = *v8;
          float v19 = *v16;
          if (*v8 < *v16)
          {
            float *v16 = result;
            float *v8 = v19;
            ++v10;
          }
        }
        if (v16 == a2) {
          return result;
        }
        if (!v10)
        {
          if (v16 <= a2)
          {
            uint64_t v23 = v16 + 1;
            while (v23 != v4)
            {
              float v24 = *(v23 - 1);
              __n128 result = *v23++;
              if (result < v24) {
                goto LABEL_29;
              }
            }
          }
          else
          {
            while (v12 != v16)
            {
              float v20 = *(v12 - 1);
              __n128 result = *v12++;
              if (result < v20) {
                goto LABEL_29;
              }
            }
          }
          return result;
        }
LABEL_29:
        if (v16 <= a2) {
          a1 = v16 + 1;
        }
        else {
          uint64_t v4 = v16;
        }
      }
    }
    while (v4 != a2);
  }
  return result;
}

uint64_t std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<float *>>(float *a1, float *a2, float *a3)
{
  float v3 = *a2;
  float v4 = *a1;
  float v5 = *a3;
  if (*a2 < *a1)
  {
    if (v5 < v3)
    {
      *a1 = v5;
      *a3 = v4;
      return 1;
    }
    *a1 = v3;
    *a2 = v4;
    if (*a3 >= v4) {
      return 1;
    }
    *a2 = *a3;
    *a3 = v4;
    return 2;
  }
  if (v5 < v3)
  {
    *a2 = v5;
    *a3 = v3;
    float v6 = *a1;
    if (*a2 >= *a1) {
      return 1;
    }
    *a1 = *a2;
    *a2 = v6;
    return 2;
  }
  return 0;
}

float std::__selection_sort[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<float *>>(float *a1, float *a2, float result)
{
  while (a1 != a2 - 1)
  {
    float v3 = a1++;
    if (v3 != a2 && a1 != a2)
    {
      __n128 result = *v3;
      float v4 = a1;
      float v5 = v3;
      float v6 = a1;
      do
      {
        float v7 = *v6++;
        float v8 = v7;
        if (v7 < result)
        {
          __n128 result = v8;
          float v5 = v4;
        }
        float v4 = v6;
      }
      while (v6 != a2);
      if (v5 != v3)
      {
        __n128 result = *v3;
        *float v3 = *v5;
        *float v5 = result;
      }
    }
  }
  return result;
}

uint64_t std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::~pair(uint64_t a1)
{
  if (*(char *)(a1 + 23) < 0) {
    operator delete(*(void **)a1);
  }
  return a1;
}

uint64_t std::function<void ()(Scandium::AbortReason)>::operator()(uint64_t a1, char a2)
{
  char v4 = a2;
  uint64_t v2 = *(void *)(a1 + 24);
  if (!v2) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  return (*(uint64_t (**)(uint64_t, char *))(*(void *)v2 + 48))(v2, &v4);
}

uint64_t std::function<void ()(BOOL)>::operator()(uint64_t a1, char a2)
{
  char v4 = a2;
  uint64_t v2 = *(void *)(a1 + 24);
  if (!v2) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  return (*(uint64_t (**)(uint64_t, char *))(*(void *)v2 + 48))(v2, &v4);
}

uint64_t std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::pair[abi:ne180100]<char const(&)[13],char const(&)[7],0>(uint64_t a1, char *a2, char *a3)
{
  float v5 = std::string::basic_string[abi:ne180100]<0>((void *)a1, a2);
  std::string::basic_string[abi:ne180100]<0>(v5 + 4, a3);
  *(_DWORD *)(a1 + 6std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = 5;
  return a1;
}

void sub_25BA4473C(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::__variant_detail::__dtor<std::__variant_detail::__traits<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>,(std::__variant_detail::_Trait)1>::~__dtor(uint64_t a1)
{
  uint64_t v2 = *(unsigned int *)(a1 + 32);
  if (v2 != -1) {
    ((void (*)(char *, uint64_t))off_270933678[v2])(&v4, a1);
  }
  *(_DWORD *)(a1 + 32) = -1;
  return a1;
}

void _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm5EEE10__dispatchB8ne180100IOZNS0_6__dtorINS0_8__traitsIJbixfdNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_7variantIJNS_6vectorIbNSB_IbEEEENSF_IiNSB_IiEEEENSF_IxNSB_IxEEEENSF_IfNSB_IfEEEENSF_IdNSB_IdEEEENSF_ISD_NSB_ISD_EEEEEEEEEELNS0_6_TraitE1EE9__destroyB8ne180100EvEUlRT_E_JRNS0_6__baseILSU_1EJbixfdSD_SS_EEEEEEDcSW_DpT0_(uint64_t a1, uint64_t a2)
{
  if (*(char *)(a2 + 23) < 0) {
    operator delete(*(void **)a2);
  }
}

uint64_t _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm6EEE10__dispatchB8ne180100IOZNS0_6__dtorINS0_8__traitsIJbixfdNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_7variantIJNS_6vectorIbNSB_IbEEEENSF_IiNSB_IiEEEENSF_IxNSB_IxEEEENSF_IfNSB_IfEEEENSF_IdNSB_IdEEEENSF_ISD_NSB_ISD_EEEEEEEEEELNS0_6_TraitE1EE9__destroyB8ne180100EvEUlRT_E_JRNS0_6__baseILSU_1EJbixfdSD_SS_EEEEEEDcSW_DpT0_(uint64_t a1, uint64_t a2)
{
  return std::__variant_detail::__dtor<std::__variant_detail::__traits<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>,(std::__variant_detail::_Trait)1>::~__dtor(a2);
}

uint64_t std::__variant_detail::__dtor<std::__variant_detail::__traits<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>,(std::__variant_detail::_Trait)1>::~__dtor(uint64_t a1)
{
  uint64_t v2 = *(unsigned int *)(a1 + 24);
  if (v2 != -1) {
    ((void (*)(char *, uint64_t))off_2709336B0[v2])(&v4, a1);
  }
  *(_DWORD *)(a1 + 2std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = -1;
  return a1;
}

void _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm0EEE10__dispatchB8ne180100IOZNS0_6__dtorINS0_8__traitsIJNS_6vectorIbNS_9allocatorIbEEEENS8_IiNS9_IiEEEENS8_IxNS9_IxEEEENS8_IfNS9_IfEEEENS8_IdNS9_IdEEEENS8_INS_12basic_stringIcNS_11char_traitsIcEENS9_IcEEEENS9_ISO_EEEEEEELNS0_6_TraitE1EE9__destroyB8ne180100EvEUlRT_E_JRNS0_6__baseILSS_1EJSB_SD_SF_SH_SJ_SQ_EEEEEEDcSU_DpT0_(uint64_t a1, void **a2)
{
  if (*a2) {
    operator delete(*a2);
  }
}

void _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm1EEE10__dispatchB8ne180100IOZNS0_6__dtorINS0_8__traitsIJNS_6vectorIbNS_9allocatorIbEEEENS8_IiNS9_IiEEEENS8_IxNS9_IxEEEENS8_IfNS9_IfEEEENS8_IdNS9_IdEEEENS8_INS_12basic_stringIcNS_11char_traitsIcEENS9_IcEEEENS9_ISO_EEEEEEELNS0_6_TraitE1EE9__destroyB8ne180100EvEUlRT_E_JRNS0_6__baseILSS_1EJSB_SD_SF_SH_SJ_SQ_EEEEEEDcSU_DpT0_(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)a2;
  if (*(void *)a2)
  {
    *(void *)(a2 + 8) = v2;
    operator delete(v2);
  }
}

void _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm2EEE10__dispatchB8ne180100IOZNS0_6__dtorINS0_8__traitsIJNS_6vectorIbNS_9allocatorIbEEEENS8_IiNS9_IiEEEENS8_IxNS9_IxEEEENS8_IfNS9_IfEEEENS8_IdNS9_IdEEEENS8_INS_12basic_stringIcNS_11char_traitsIcEENS9_IcEEEENS9_ISO_EEEEEEELNS0_6_TraitE1EE9__destroyB8ne180100EvEUlRT_E_JRNS0_6__baseILSS_1EJSB_SD_SF_SH_SJ_SQ_EEEEEEDcSU_DpT0_(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)a2;
  if (*(void *)a2)
  {
    *(void *)(a2 + 8) = v2;
    operator delete(v2);
  }
}

void _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm3EEE10__dispatchB8ne180100IOZNS0_6__dtorINS0_8__traitsIJNS_6vectorIbNS_9allocatorIbEEEENS8_IiNS9_IiEEEENS8_IxNS9_IxEEEENS8_IfNS9_IfEEEENS8_IdNS9_IdEEEENS8_INS_12basic_stringIcNS_11char_traitsIcEENS9_IcEEEENS9_ISO_EEEEEEELNS0_6_TraitE1EE9__destroyB8ne180100EvEUlRT_E_JRNS0_6__baseILSS_1EJSB_SD_SF_SH_SJ_SQ_EEEEEEDcSU_DpT0_(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)a2;
  if (*(void *)a2)
  {
    *(void *)(a2 + 8) = v2;
    operator delete(v2);
  }
}

void _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm4EEE10__dispatchB8ne180100IOZNS0_6__dtorINS0_8__traitsIJNS_6vectorIbNS_9allocatorIbEEEENS8_IiNS9_IiEEEENS8_IxNS9_IxEEEENS8_IfNS9_IfEEEENS8_IdNS9_IdEEEENS8_INS_12basic_stringIcNS_11char_traitsIcEENS9_IcEEEENS9_ISO_EEEEEEELNS0_6_TraitE1EE9__destroyB8ne180100EvEUlRT_E_JRNS0_6__baseILSS_1EJSB_SD_SF_SH_SJ_SQ_EEEEEEDcSU_DpT0_(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)a2;
  if (*(void *)a2)
  {
    *(void *)(a2 + 8) = v2;
    operator delete(v2);
  }
}

void _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm5EEE10__dispatchB8ne180100IOZNS0_6__dtorINS0_8__traitsIJNS_6vectorIbNS_9allocatorIbEEEENS8_IiNS9_IiEEEENS8_IxNS9_IxEEEENS8_IfNS9_IfEEEENS8_IdNS9_IdEEEENS8_INS_12basic_stringIcNS_11char_traitsIcEENS9_IcEEEENS9_ISO_EEEEEEELNS0_6_TraitE1EE9__destroyB8ne180100EvEUlRT_E_JRNS0_6__baseILSS_1EJSB_SD_SF_SH_SJ_SQ_EEEEEEDcSU_DpT0_(uint64_t a1, void **a2)
{
  uint64_t v2 = a2;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v2);
}

void std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)v2);
    float v3 = **a1;
    operator delete(v3);
  }
}

void std::vector<std::string>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 24)
  {
    if (*(char *)(i - 1) < 0) {
      operator delete(*(void **)(i - 24));
    }
  }
  a1[1] = v2;
}

uint64_t std::__function::__value_func<void ()(Scandium::AbortReason)>::__value_func[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(void *)(a1 + 2std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = a1;
      (*(void (**)(void, uint64_t))(**(void **)(a2 + 24) + 24))(*(void *)(a2 + 24), a1);
    }
    else
    {
      *(void *)(a1 + 2std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 16))(v3);
    }
  }
  else
  {
    *(void *)(a1 + 2std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = 0;
  }
  return a1;
}

uint64_t std::__function::__value_func<void ()(BOOL)>::__value_func[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(void *)(a1 + 2std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = a1;
      (*(void (**)(void, uint64_t))(**(void **)(a2 + 24) + 24))(*(void *)(a2 + 24), a1);
    }
    else
    {
      *(void *)(a1 + 2std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 16))(v3);
    }
  }
  else
  {
    *(void *)(a1 + 2std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = 0;
  }
  return a1;
}

{
  void *v3;
  uint64_t v4;

  uint64_t v3 = (void *)(a2 + 24);
  char v4 = *(void *)(a2 + 24);
  if (v4)
  {
    if (v4 == a2)
    {
      *(void *)(a1 + 2std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = a1;
      (*(void (**)(void, uint64_t))(*(void *)*v3 + 24))(*v3, a1);
      return a1;
    }
    *(void *)(a1 + 2std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = v4;
  }
  else
  {
    uint64_t v3 = (void *)(a1 + 24);
  }
  *uint64_t v3 = 0;
  return a1;
}

void *std::__function::__value_func<void ()(Scandium::AbortReason)>::~__value_func[abi:ne180100](void *a1)
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

void std::__throw_bad_function_call[abi:ne180100]()
{
  exception = __cxa_allocate_exception(8uLL);
}

void std::bad_function_call::~bad_function_call(std::bad_function_call *this)
{
  std::exception::~exception(this);
  JUMPOUT(0x26116E390);
}

uint64_t std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::unordered_map(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = 1065353216;
  if (a3)
  {
    uint64_t v5 = 72 * a3;
    do
    {
      std::__hash_table<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&>(a1, a2, (long long *)a2);
      a2 += 72;
      v5 -= 72;
    }
    while (v5);
  }
  return a1;
}

void sub_25BA44C10(_Unwind_Exception *a1)
{
  std::__hash_table<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&>(uint64_t a1, unsigned __int8 *a2, long long *a3)
{
  float v7 = (void *)(a1 + 24);
  unint64_t v8 = std::__string_hash<char>::operator()[abi:ne180100](a1 + 24, (uint64_t)a2);
  unint64_t v9 = v8;
  unint64_t v10 = *(void *)(a1 + 8);
  if (v10)
  {
    uint8x8_t v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
    v11.i16[0] = vaddlv_u8(v11);
    unint64_t v12 = v11.u32[0];
    if (v11.u32[0] > 1uLL)
    {
      unint64_t v3 = v8;
      if (v8 >= v10) {
        unint64_t v3 = v8 % v10;
      }
    }
    else
    {
      unint64_t v3 = (v10 - 1) & v8;
    }
    float v13 = *(unsigned __int8 ***)(*(void *)a1 + 8 * v3);
    if (v13)
    {
      for (uint64_t i = *v13; i; uint64_t i = *(unsigned __int8 **)i)
      {
        unint64_t v15 = *((void *)i + 1);
        if (v15 == v9)
        {
          if (std::equal_to<std::string>::operator()[abi:ne180100](a1 + 32, i + 16, a2)) {
            return i;
          }
        }
        else
        {
          if (v12 > 1)
          {
            if (v15 >= v10) {
              v15 %= v10;
            }
          }
          else
          {
            v15 &= v10 - 1;
          }
          if (v15 != v3) {
            break;
          }
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>>>::__construct_node_hash<std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&>(a1, v9, a3, (uint64_t)v25);
  float v16 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v17 = *(float *)(a1 + 32);
  if (!v10 || (float)(v17 * (float)v10) < v16)
  {
    BOOL v18 = 1;
    if (v10 >= 3) {
      BOOL v18 = (v10 & (v10 - 1)) != 0;
    }
    unint64_t v19 = v18 | (2 * v10);
    unint64_t v20 = vcvtps_u32_f32(v16 / v17);
    if (v19 <= v20) {
      size_t v21 = v20;
    }
    else {
      size_t v21 = v19;
    }
    std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::__rehash<true>(a1, v21);
    unint64_t v10 = *(void *)(a1 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v9 >= v10) {
        unint64_t v3 = v9 % v10;
      }
      else {
        unint64_t v3 = v9;
      }
    }
    else
    {
      unint64_t v3 = (v10 - 1) & v9;
    }
  }
  float v22 = *(void **)(*(void *)a1 + 8 * v3);
  if (v22)
  {
    *(void *)v25[0] = *v22;
    *float v22 = v25[0];
  }
  else
  {
    *(void *)v25[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v25[0];
    *(void *)(*(void *)a1 + 8 * v3) = a1 + 16;
    if (*(void *)v25[0])
    {
      unint64_t v23 = *(void *)(*(void *)v25[0] + 8);
      if ((v10 & (v10 - 1)) != 0)
      {
        if (v23 >= v10) {
          v23 %= v10;
        }
      }
      else
      {
        v23 &= v10 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v23) = v25[0];
    }
  }
  uint64_t i = (unsigned __int8 *)v25[0];
  v25[0] = 0;
  ++*v7;
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,void *>>>>::reset[abi:ne180100]((uint64_t)v25, 0);
  return i;
}

void sub_25BA44E90(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,void *>>>>::reset[abi:ne180100]((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

std::string *std::__hash_table<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>>>::__construct_node_hash<std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, long long *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7 = a1 + 16;
  unint64_t v8 = (char *)operator new(0x58uLL);
  *(void *)a4 = v8;
  *(void *)(a4 + 8) = v7;
  *(unsigned char *)(a4 + 16) = 0;
  *(void *)unint64_t v8 = 0;
  *((void *)v8 + 1) = a2;
  __n128 result = std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::pair[abi:ne180100]((std::string *)(v8 + 16), a3);
  *(unsigned char *)(a4 + 16) = 1;
  return result;
}

void sub_25BA44F08(_Unwind_Exception *a1)
{
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,void *>>>>::reset[abi:ne180100](v1, 0);
  _Unwind_Resume(a1);
}

unint64_t std::__string_hash<char>::operator()[abi:ne180100](uint64_t a1, uint64_t a2)
{
  unint64_t v2 = *(void *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    unint64_t v3 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(void *)a2;
    unint64_t v3 = v2;
  }
  return std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100]((uint64_t)&v5, (uint64_t *)a2, v3);
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100](uint64_t a1, uint64_t *a2, unint64_t a3)
{
  if (a3 > 0x20)
  {
    if (a3 > 0x40)
    {
      uint64_t v4 = *(uint64_t *)((char *)a2 + a3 - 48);
      uint64_t v5 = *(uint64_t *)((char *)a2 + a3 - 40);
      uint64_t v6 = *(uint64_t *)((char *)a2 + a3 - 24);
      uint64_t v8 = *(uint64_t *)((char *)a2 + a3 - 64);
      uint64_t v7 = *(uint64_t *)((char *)a2 + a3 - 56);
      uint64_t v9 = *(uint64_t *)((char *)a2 + a3 - 16);
      uint64_t v10 = *(uint64_t *)((char *)a2 + a3 - 8);
      unint64_t v11 = v7 + v9;
      unint64_t v12 = 0x9DDFEA08EB382D69
          * (v6 ^ ((0x9DDFEA08EB382D69 * (v6 ^ (v4 + a3))) >> 47) ^ (0x9DDFEA08EB382D69 * (v6 ^ (v4 + a3))));
      unint64_t v13 = 0x9DDFEA08EB382D69 * (v12 ^ (v12 >> 47));
      unint64_t v14 = v8 + a3 + v7 + v4;
      uint64_t v15 = v14 + v5;
      unint64_t v16 = __ROR8__(v14, 44) + v8 + a3 + __ROR8__(v5 + v8 + a3 - 0x622015F714C7D297 * (v12 ^ (v12 >> 47)), 21);
      uint64_t v17 = v7 + v9 + *(uint64_t *)((char *)a2 + a3 - 32) - 0x4B6D499041670D8DLL;
      uint64_t v18 = v17 + v6 + v9;
      uint64_t v19 = __ROR8__(v18, 44);
      uint64_t v20 = v18 + v10;
      uint64_t v21 = v19 + v17 + __ROR8__(v17 + v5 + v10, 21);
      uint64_t v23 = *a2;
      float v22 = a2 + 4;
      unint64_t v24 = v23 - 0x4B6D499041670D8DLL * v5;
      uint64_t v25 = -(uint64_t)((a3 - 1) & 0xFFFFFFFFFFFFFFC0);
      do
      {
        uint64_t v26 = *(v22 - 3);
        uint64_t v27 = v24 + v15 + v11 + v26;
        uint64_t v28 = v22[2];
        uint64_t v29 = v22[3];
        uint64_t v30 = v22[1];
        unint64_t v11 = v30 + v15 - 0x4B6D499041670D8DLL * __ROR8__(v11 + v16 + v28, 42);
        uint64_t v31 = v13 + v20;
        uint64_t v32 = *(v22 - 2);
        uint64_t v33 = *(v22 - 1);
        uint64_t v34 = *(v22 - 4) - 0x4B6D499041670D8DLL * v16;
        uint64_t v35 = v34 + v20 + v33;
        uint64_t v36 = v34 + v26 + v32;
        uint64_t v15 = v36 + v33;
        uint64_t v37 = __ROR8__(v36, 44) + v34;
        unint64_t v38 = (0xB492B66FBE98F273 * __ROR8__(v27, 37)) ^ v21;
        unint64_t v24 = 0xB492B66FBE98F273 * __ROR8__(v31, 33);
        unint64_t v16 = v37 + __ROR8__(v35 + v38, 21);
        unint64_t v39 = v24 + v21 + *v22;
        uint64_t v20 = v39 + v30 + v28 + v29;
        uint64_t v21 = __ROR8__(v39 + v30 + v28, 44) + v39 + __ROR8__(v11 + v32 + v39 + v29, 21);
        v22 += 8;
        unint64_t v13 = v38;
        v25 += 64;
      }
      while (v25);
      unint64_t v40 = v24
          - 0x622015F714C7D297
          * ((0x9DDFEA08EB382D69
            * (v21 ^ ((0x9DDFEA08EB382D69 * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69 * (v21 ^ v16)))) ^ ((0x9DDFEA08EB382D69 * (v21 ^ ((0x9DDFEA08EB382D69 * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69 * (v21 ^ v16)))) >> 47));
      unint64_t v41 = 0x9DDFEA08EB382D69
          * (v40 ^ (v38
                  - 0x4B6D499041670D8DLL * (v11 ^ (v11 >> 47))
                  - 0x622015F714C7D297
                  * ((0x9DDFEA08EB382D69
                    * (v20 ^ ((0x9DDFEA08EB382D69 * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69 * (v20 ^ v15)))) ^ ((0x9DDFEA08EB382D69 * (v20 ^ ((0x9DDFEA08EB382D69 * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69 * (v20 ^ v15)))) >> 47))));
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v40 ^ (v41 >> 47) ^ v41)) ^ ((0x9DDFEA08EB382D69 * (v40 ^ (v41 >> 47) ^ v41)) >> 47));
    }
    else
    {
      return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_33_to_64[abi:ne180100](a2, a3);
    }
  }
  else if (a3 > 0x10)
  {
    return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_17_to_32[abi:ne180100](a2, a3);
  }
  else
  {
    return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_0_to_16[abi:ne180100](a2, a3);
  }
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_0_to_16[abi:ne180100](_DWORD *a1, unint64_t a2)
{
  if (a2 < 9)
  {
    if (a2 < 4)
    {
      unint64_t result = 0x9AE16A3B2F90404FLL;
      if (a2)
      {
        unint64_t v8 = (0xC949D7C7509E6557 * (a2 + 4 * *((unsigned __int8 *)a1 + a2 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                      * (*(unsigned __int8 *)a1 | ((unint64_t)*((unsigned __int8 *)a1 + (a2 >> 1)) << 8)));
        return 0x9AE16A3B2F90404FLL * (v8 ^ (v8 >> 47));
      }
    }
    else
    {
      uint64_t v6 = *(unsigned int *)((char *)a1 + a2 - 4);
      unint64_t v7 = 0x9DDFEA08EB382D69 * (((8 * *a1) + a2) ^ v6);
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v6 ^ (v7 >> 47) ^ v7)) ^ ((0x9DDFEA08EB382D69 * (v6 ^ (v7 >> 47) ^ v7)) >> 47));
    }
  }
  else
  {
    uint64_t v3 = *(void *)((char *)a1 + a2 - 8);
    uint64_t v4 = __ROR8__(v3 + a2, a2);
    return (0x9DDFEA08EB382D69
          * ((0x9DDFEA08EB382D69
            * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *(void *)a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *(void *)a1)))) ^ ((0x9DDFEA08EB382D69 * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *(void *)a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *(void *)a1)))) >> 47))) ^ v3;
  }
  return result;
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_17_to_32[abi:ne180100](void *a1, uint64_t a2)
{
  uint64_t v2 = a1[1];
  unint64_t v3 = 0xB492B66FBE98F273 * *a1;
  uint64_t v4 = __ROR8__(0x9AE16A3B2F90404FLL * *(void *)((char *)a1 + a2 - 8), 30) + __ROR8__(v3 - v2, 43);
  unint64_t v5 = v3 + a2 + __ROR8__(v2 ^ 0xC949D7C7509E6557, 20) - 0x9AE16A3B2F90404FLL * *(void *)((char *)a1 + a2 - 8);
  unint64_t v6 = 0x9DDFEA08EB382D69 * (v5 ^ (v4 - 0x3C5A37A36834CED9 * *(void *)((char *)a1 + a2 - 16)));
  return 0x9DDFEA08EB382D69
       * ((0x9DDFEA08EB382D69 * (v5 ^ (v6 >> 47) ^ v6)) ^ ((0x9DDFEA08EB382D69 * (v5 ^ (v6 >> 47) ^ v6)) >> 47));
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_33_to_64[abi:ne180100](void *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)((char *)a1 + a2 - 16);
  uint64_t v3 = *a1 - 0x3C5A37A36834CED9 * (v2 + a2);
  uint64_t v5 = a1[2];
  uint64_t v4 = a1[3];
  uint64_t v6 = __ROR8__(v3 + v4, 52);
  uint64_t v7 = v3 + a1[1];
  uint64_t v8 = __ROR8__(v7, 7);
  uint64_t v9 = v7 + v5;
  uint64_t v10 = *(void *)((char *)a1 + a2 - 32) + v5;
  uint64_t v11 = v8 + __ROR8__(*a1 - 0x3C5A37A36834CED9 * (v2 + a2), 37) + v6 + __ROR8__(v9, 31);
  uint64_t v12 = *(void *)((char *)a1 + a2 - 24) + v10 + v2;
  unint64_t v13 = 0xC3A5C85C97CB3127 * (v12 + *(void *)((char *)a1 + a2 - 8) + v4 + v11)
      - 0x651E95C4D06FBFB1
      * (v9
       + v4
       + __ROR8__(v10, 37)
       + __ROR8__(*(void *)((char *)a1 + a2 - 24) + v10, 7)
       + __ROR8__(*(void *)((char *)a1 + a2 - 8) + v4 + v10, 52)
       + __ROR8__(v12, 31));
  return 0x9AE16A3B2F90404FLL
       * ((v11 - 0x3C5A37A36834CED9 * (v13 ^ (v13 >> 47))) ^ ((v11 - 0x3C5A37A36834CED9 * (v13 ^ (v13 >> 47))) >> 47));
}

uint64_t std::equal_to<std::string>::operator()[abi:ne180100](uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  uint64_t v3 = a3;
  uint64_t v4 = a2[23];
  if ((v4 & 0x80u) == 0) {
    uint64_t v5 = a2[23];
  }
  else {
    uint64_t v5 = *((void *)a2 + 1);
  }
  uint64_t v6 = a3[23];
  int v7 = (char)v6;
  if ((v6 & 0x80u) != 0) {
    uint64_t v6 = *((void *)a3 + 1);
  }
  if (v5 != v6) {
    return 0;
  }
  if (v7 < 0) {
    uint64_t v3 = *(unsigned __int8 **)a3;
  }
  if ((v4 & 0x80) != 0) {
    return memcmp(*(const void **)a2, v3, *((void *)a2 + 1)) == 0;
  }
  if (!a2[23]) {
    return 1;
  }
  uint64_t v8 = v4 - 1;
  do
  {
    int v10 = *a2++;
    int v9 = v10;
    int v12 = *v3++;
    int v11 = v12;
    BOOL v14 = v8-- != 0;
    uint64_t result = v9 == v11;
  }
  while (v9 == v11 && v14);
  return result;
}

std::string *std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::pair[abi:ne180100](std::string *this, long long *a2)
{
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v4 = *a2;
    this->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v4;
  }
  std::__variant_detail::__copy_constructor<std::__variant_detail::__traits<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>,(std::__variant_detail::_Trait)1>::__copy_constructor((uint64_t)&this[1].__r_.__value_.__l.__size_, (uint64_t)(a2 + 2));
  return this;
}

void sub_25BA454D0(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  uint64_t v5 = this;
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
    uint64_t v5 = v8;
  }
  else
  {
    *((unsigned char *)&this->__r_.__value_.__s + 23) = __sz;
  }
  memmove(v5, __s, __sz + 1);
}

uint64_t std::__variant_detail::__copy_constructor<std::__variant_detail::__traits<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>,(std::__variant_detail::_Trait)1>::__copy_constructor(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = 0;
  *(_DWORD *)(a1 + 32) = -1;
  std::__variant_detail::__ctor<std::__variant_detail::__traits<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::__generic_construct[abi:ne180100]<std::__variant_detail::__copy_constructor<std::__variant_detail::__traits<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>,(std::__variant_detail::_Trait)1> const&>(a1, a2);
  return a1;
}

void sub_25BA455C0(_Unwind_Exception *a1)
{
  std::__variant_detail::__dtor<std::__variant_detail::__traits<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>,(std::__variant_detail::_Trait)1>::~__dtor(v1);
  _Unwind_Resume(a1);
}

uint64_t std::__variant_detail::__ctor<std::__variant_detail::__traits<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::__generic_construct[abi:ne180100]<std::__variant_detail::__copy_constructor<std::__variant_detail::__traits<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>,(std::__variant_detail::_Trait)1> const&>(uint64_t result, uint64_t a2)
{
  uint64_t v3 = result;
  uint64_t v4 = *(unsigned int *)(result + 32);
  if (v4 != -1) {
    uint64_t result = ((uint64_t (*)(char *, uint64_t))off_270933678[v4])(&v7, result);
  }
  *(_DWORD *)(v3 + 32) = -1;
  uint64_t v5 = *(unsigned int *)(a2 + 32);
  if (v5 != -1)
  {
    uint64_t result = ((uint64_t (*)(char *, uint64_t, uint64_t))off_270933730[v5])(&v6, v3, a2);
    *(_DWORD *)(v3 + 32) = v5;
  }
  return result;
}

void _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm0ELm0EEE10__dispatchB8ne180100IOZNS0_6__ctorINS0_8__traitsIJbixfdNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_7variantIJNS_6vectorIbNSB_IbEEEENSF_IiNSB_IiEEEENSF_IxNSB_IxEEEENSF_IfNSB_IfEEEENSF_IdNSB_IdEEEENSF_ISD_NSB_ISD_EEEEEEEEEEE19__generic_constructB8ne180100IRKNS0_18__copy_constructorIST_LNS0_6_TraitE1EEEEEvRSU_OT_EUlRS12_OT0_E_JRNS0_6__baseILSX_1EJbixfdSD_SS_EEERKS1A_EEEDcS12_DpT0_(uint64_t a1, unsigned char *a2, unsigned char *a3)
{
  *a2 = *a3;
}

void _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm1ELm1EEE10__dispatchB8ne180100IOZNS0_6__ctorINS0_8__traitsIJbixfdNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_7variantIJNS_6vectorIbNSB_IbEEEENSF_IiNSB_IiEEEENSF_IxNSB_IxEEEENSF_IfNSB_IfEEEENSF_IdNSB_IdEEEENSF_ISD_NSB_ISD_EEEEEEEEEEE19__generic_constructB8ne180100IRKNS0_18__copy_constructorIST_LNS0_6_TraitE1EEEEEvRSU_OT_EUlRS12_OT0_E_JRNS0_6__baseILSX_1EJbixfdSD_SS_EEERKS1A_EEEDcS12_DpT0_(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  *a2 = *a3;
}

void _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm2ELm2EEE10__dispatchB8ne180100IOZNS0_6__ctorINS0_8__traitsIJbixfdNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_7variantIJNS_6vectorIbNSB_IbEEEENSF_IiNSB_IiEEEENSF_IxNSB_IxEEEENSF_IfNSB_IfEEEENSF_IdNSB_IdEEEENSF_ISD_NSB_ISD_EEEEEEEEEEE19__generic_constructB8ne180100IRKNS0_18__copy_constructorIST_LNS0_6_TraitE1EEEEEvRSU_OT_EUlRS12_OT0_E_JRNS0_6__baseILSX_1EJbixfdSD_SS_EEERKS1A_EEEDcS12_DpT0_(uint64_t a1, void *a2, void *a3)
{
  *a2 = *a3;
}

float _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm3ELm3EEE10__dispatchB8ne180100IOZNS0_6__ctorINS0_8__traitsIJbixfdNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_7variantIJNS_6vectorIbNSB_IbEEEENSF_IiNSB_IiEEEENSF_IxNSB_IxEEEENSF_IfNSB_IfEEEENSF_IdNSB_IdEEEENSF_ISD_NSB_ISD_EEEEEEEEEEE19__generic_constructB8ne180100IRKNS0_18__copy_constructorIST_LNS0_6_TraitE1EEEEEvRSU_OT_EUlRS12_OT0_E_JRNS0_6__baseILSX_1EJbixfdSD_SS_EEERKS1A_EEEDcS12_DpT0_(uint64_t a1, _DWORD *a2, float *a3)
{
  float result = *a3;
  *a2 = *(_DWORD *)a3;
  return result;
}

double _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm4ELm4EEE10__dispatchB8ne180100IOZNS0_6__ctorINS0_8__traitsIJbixfdNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_7variantIJNS_6vectorIbNSB_IbEEEENSF_IiNSB_IiEEEENSF_IxNSB_IxEEEENSF_IfNSB_IfEEEENSF_IdNSB_IdEEEENSF_ISD_NSB_ISD_EEEEEEEEEEE19__generic_constructB8ne180100IRKNS0_18__copy_constructorIST_LNS0_6_TraitE1EEEEEvRSU_OT_EUlRS12_OT0_E_JRNS0_6__baseILSX_1EJbixfdSD_SS_EEERKS1A_EEEDcS12_DpT0_(uint64_t a1, void *a2, double *a3)
{
  double result = *a3;
  *a2 = *(void *)a3;
  return result;
}

void _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm5ELm5EEE10__dispatchB8ne180100IOZNS0_6__ctorINS0_8__traitsIJbixfdNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_7variantIJNS_6vectorIbNSB_IbEEEENSF_IiNSB_IiEEEENSF_IxNSB_IxEEEENSF_IfNSB_IfEEEENSF_IdNSB_IdEEEENSF_ISD_NSB_ISD_EEEEEEEEEEE19__generic_constructB8ne180100IRKNS0_18__copy_constructorIST_LNS0_6_TraitE1EEEEEvRSU_OT_EUlRS12_OT0_E_JRNS0_6__baseILSX_1EJbixfdSD_SS_EEERKS1A_EEEDcS12_DpT0_(int a1, std::string *this, long long *a3)
{
  if (*((char *)a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a3, *((void *)a3 + 1));
  }
  else
  {
    long long v3 = *a3;
    this->__r_.__value_.__r.__words[2] = *((void *)a3 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v3;
  }
}

uint64_t _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm6ELm6EEE10__dispatchB8ne180100IOZNS0_6__ctorINS0_8__traitsIJbixfdNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_7variantIJNS_6vectorIbNSB_IbEEEENSF_IiNSB_IiEEEENSF_IxNSB_IxEEEENSF_IfNSB_IfEEEENSF_IdNSB_IdEEEENSF_ISD_NSB_ISD_EEEEEEEEEEE19__generic_constructB8ne180100IRKNS0_18__copy_constructorIST_LNS0_6_TraitE1EEEEEvRSU_OT_EUlRS12_OT0_E_JRNS0_6__baseILSX_1EJbixfdSD_SS_EEERKS1A_EEEDcS12_DpT0_(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return std::__variant_detail::__copy_constructor<std::__variant_detail::__traits<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>,(std::__variant_detail::_Trait)1>::__copy_constructor(a2, a3);
}

uint64_t std::__variant_detail::__copy_constructor<std::__variant_detail::__traits<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>,(std::__variant_detail::_Trait)1>::__copy_constructor(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = 0;
  *(_DWORD *)(a1 + 2std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = -1;
  std::__variant_detail::__ctor<std::__variant_detail::__traits<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>::__generic_construct[abi:ne180100]<std::__variant_detail::__copy_constructor<std::__variant_detail::__traits<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>,(std::__variant_detail::_Trait)1> const&>(a1, a2);
  return a1;
}

void sub_25BA4570C(_Unwind_Exception *a1)
{
  std::__variant_detail::__dtor<std::__variant_detail::__traits<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>,(std::__variant_detail::_Trait)1>::~__dtor(v1);
  _Unwind_Resume(a1);
}

uint64_t std::__variant_detail::__ctor<std::__variant_detail::__traits<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>::__generic_construct[abi:ne180100]<std::__variant_detail::__copy_constructor<std::__variant_detail::__traits<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>,(std::__variant_detail::_Trait)1> const&>(uint64_t result, uint64_t a2)
{
  uint64_t v3 = result;
  uint64_t v4 = *(unsigned int *)(result + 24);
  if (v4 != -1) {
    double result = ((uint64_t (*)(char *, uint64_t))off_2709336B0[v4])(&v7, result);
  }
  *(_DWORD *)(v3 + 2std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = -1;
  uint64_t v5 = *(unsigned int *)(a2 + 24);
  if (v5 != -1)
  {
    double result = ((uint64_t (*)(char *, uint64_t, uint64_t))off_270933768[v5])(&v6, v3, a2);
    *(_DWORD *)(v3 + 2std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = v5;
  }
  return result;
}

void *_ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm0ELm0EEE10__dispatchB8ne180100IOZNS0_6__ctorINS0_8__traitsIJNS_6vectorIbNS_9allocatorIbEEEENS8_IiNS9_IiEEEENS8_IxNS9_IxEEEENS8_IfNS9_IfEEEENS8_IdNS9_IdEEEENS8_INS_12basic_stringIcNS_11char_traitsIcEENS9_IcEEEENS9_ISO_EEEEEEEE19__generic_constructB8ne180100IRKNS0_18__copy_constructorISR_LNS0_6_TraitE1EEEEEvRSS_OT_EUlRS10_OT0_E_JRNS0_6__baseILSV_1EJSB_SD_SF_SH_SJ_SQ_EEERKS18_EEEDcS10_DpT0_(uint64_t a1, void *a2, uint64_t a3)
{
  return std::vector<BOOL>::vector(a2, a3);
}

void *_ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm1ELm1EEE10__dispatchB8ne180100IOZNS0_6__ctorINS0_8__traitsIJNS_6vectorIbNS_9allocatorIbEEEENS8_IiNS9_IiEEEENS8_IxNS9_IxEEEENS8_IfNS9_IfEEEENS8_IdNS9_IdEEEENS8_INS_12basic_stringIcNS_11char_traitsIcEENS9_IcEEEENS9_ISO_EEEEEEEE19__generic_constructB8ne180100IRKNS0_18__copy_constructorISR_LNS0_6_TraitE1EEEEEvRSS_OT_EUlRS10_OT0_E_JRNS0_6__baseILSV_1EJSB_SD_SF_SH_SJ_SQ_EEERKS18_EEEDcS10_DpT0_(uint64_t a1, void *a2, uint64_t a3)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  return std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(a2, *(const void **)a3, *(void *)(a3 + 8), (uint64_t)(*(void *)(a3 + 8) - *(void *)a3) >> 2);
}

void *_ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm2ELm2EEE10__dispatchB8ne180100IOZNS0_6__ctorINS0_8__traitsIJNS_6vectorIbNS_9allocatorIbEEEENS8_IiNS9_IiEEEENS8_IxNS9_IxEEEENS8_IfNS9_IfEEEENS8_IdNS9_IdEEEENS8_INS_12basic_stringIcNS_11char_traitsIcEENS9_IcEEEENS9_ISO_EEEEEEEE19__generic_constructB8ne180100IRKNS0_18__copy_constructorISR_LNS0_6_TraitE1EEEEEvRSS_OT_EUlRS10_OT0_E_JRNS0_6__baseILSV_1EJSB_SD_SF_SH_SJ_SQ_EEERKS18_EEEDcS10_DpT0_(uint64_t a1, void *a2, uint64_t a3)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  return std::vector<long long>::__init_with_size[abi:ne180100]<long long *,long long *>(a2, *(const void **)a3, *(void *)(a3 + 8), (uint64_t)(*(void *)(a3 + 8) - *(void *)a3) >> 3);
}

void *_ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm3ELm3EEE10__dispatchB8ne180100IOZNS0_6__ctorINS0_8__traitsIJNS_6vectorIbNS_9allocatorIbEEEENS8_IiNS9_IiEEEENS8_IxNS9_IxEEEENS8_IfNS9_IfEEEENS8_IdNS9_IdEEEENS8_INS_12basic_stringIcNS_11char_traitsIcEENS9_IcEEEENS9_ISO_EEEEEEEE19__generic_constructB8ne180100IRKNS0_18__copy_constructorISR_LNS0_6_TraitE1EEEEEvRSS_OT_EUlRS10_OT0_E_JRNS0_6__baseILSV_1EJSB_SD_SF_SH_SJ_SQ_EEERKS18_EEEDcS10_DpT0_(uint64_t a1, void *a2, uint64_t a3)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  return std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(a2, *(const void **)a3, *(void *)(a3 + 8), (uint64_t)(*(void *)(a3 + 8) - *(void *)a3) >> 2);
}

void *_ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm4ELm4EEE10__dispatchB8ne180100IOZNS0_6__ctorINS0_8__traitsIJNS_6vectorIbNS_9allocatorIbEEEENS8_IiNS9_IiEEEENS8_IxNS9_IxEEEENS8_IfNS9_IfEEEENS8_IdNS9_IdEEEENS8_INS_12basic_stringIcNS_11char_traitsIcEENS9_IcEEEENS9_ISO_EEEEEEEE19__generic_constructB8ne180100IRKNS0_18__copy_constructorISR_LNS0_6_TraitE1EEEEEvRSS_OT_EUlRS10_OT0_E_JRNS0_6__baseILSV_1EJSB_SD_SF_SH_SJ_SQ_EEERKS18_EEEDcS10_DpT0_(uint64_t a1, void *a2, uint64_t a3)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  return std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(a2, *(const void **)a3, *(void *)(a3 + 8), (uint64_t)(*(void *)(a3 + 8) - *(void *)a3) >> 3);
}

std::string *_ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm5ELm5EEE10__dispatchB8ne180100IOZNS0_6__ctorINS0_8__traitsIJNS_6vectorIbNS_9allocatorIbEEEENS8_IiNS9_IiEEEENS8_IxNS9_IxEEEENS8_IfNS9_IfEEEENS8_IdNS9_IdEEEENS8_INS_12basic_stringIcNS_11char_traitsIcEENS9_IcEEEENS9_ISO_EEEEEEEE19__generic_constructB8ne180100IRKNS0_18__copy_constructorISR_LNS0_6_TraitE1EEEEEvRSS_OT_EUlRS10_OT0_E_JRNS0_6__baseILSV_1EJSB_SD_SF_SH_SJ_SQ_EEERKS18_EEEDcS10_DpT0_(uint64_t a1, std::string *a2, long long **a3)
{
  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  return std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(a2, *a3, a3[1], 0xAAAAAAAAAAAAAAABLL * (((char *)a3[1] - (char *)*a3) >> 3));
}

void *std::vector<BOOL>::vector(void *a1, uint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  uint64_t v4 = *(void *)(a2 + 8);
  if (v4)
  {
    std::vector<BOOL>::__vallocate[abi:ne180100](a1, v4);
    std::vector<BOOL>::__construct_at_end<std::__bit_iterator<std::vector<BOOL>,true,0ul>,std::__bit_iterator<std::vector<BOOL>,true,0ul>>(a1, *(void **)a2, 0, (void *)(*(void *)a2 + 8 * (*(void *)(a2 + 8) >> 6)), *(void *)(a2 + 8) & 0x3F, *(void *)(a2 + 8));
  }
  return a1;
}

void *std::vector<BOOL>::__vallocate[abi:ne180100](void *a1, uint64_t a2)
{
  if (a2 < 0) {
    std::vector<float>::__throw_length_error[abi:ne180100]();
  }
  double result = std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)(a1 + 2), ((unint64_t)(a2 - 1) >> 6) + 1);
  *a1 = result;
  a1[1] = 0;
  a1[2] = v4;
  return result;
}

void std::vector<BOOL>::__construct_at_end<std::__bit_iterator<std::vector<BOOL>,true,0ul>,std::__bit_iterator<std::vector<BOOL>,true,0ul>>(void *a1, void *a2, unint64_t a3, void *a4, int a5, uint64_t a6)
{
  unint64_t v6 = a1[1];
  unint64_t v7 = v6 + a6;
  a1[1] = v6 + a6;
  if (!v6 || ((v7 - 1) ^ (v6 - 1)) >= 0x40)
  {
    if (v7 >= 0x41) {
      unint64_t v8 = (v7 - 1) >> 6;
    }
    else {
      unint64_t v8 = 0;
    }
    *(void *)(*a1 + 8 * v8) = 0;
  }
  uint64_t v9 = *a1 + 8 * (v6 >> 6);
  int v10 = v6 & 0x3F;
  std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::__bit_iterator<std::vector<BOOL>,true,0ul>,std::__bit_iterator<std::vector<BOOL>,true,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>>(a2, a3, a4, a5, (uint64_t)&v9, (uint64_t)v11);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(8 * a2);
}

void std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::__bit_iterator<std::vector<BOOL>,true,0ul>,std::__bit_iterator<std::vector<BOOL>,true,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>>(void *a1@<X1>, unint64_t a2@<X2>, void *a3@<X3>, int a4@<W4>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  LODWORD(v6) = a2;
  unint64_t v7 = *(uint64_t **)a5;
  int v8 = *(_DWORD *)(a5 + 8);
  if (a1 != a3 || a2 != a4)
  {
    do
    {
      uint64_t v9 = 1 << v8;
      if ((*a1 >> a2)) {
        uint64_t v10 = *v7 | v9;
      }
      else {
        uint64_t v10 = *v7 & ~v9;
      }
      *unint64_t v7 = v10;
      BOOL v11 = v6 == 63;
      BOOL v12 = v6 == 63;
      uint64_t v6 = (a2 + 1);
      if (v11) {
        uint64_t v6 = 0;
      }
      if (v8 == 63)
      {
        int v8 = 0;
        *(void *)a5 = ++v7;
      }
      else
      {
        ++v8;
      }
      a1 += v12;
      a2 = v6 | a2 & 0xFFFFFFFF00000000;
      *(_DWORD *)(a5 + 8) = v8;
    }
    while (a1 != a3 || v6 != a4);
    a1 = a3;
  }
  *(void *)a6 = a1;
  *(void *)(a6 + 8) = a2;
  *(void *)(a6 + 16) = v7;
  *(_DWORD *)(a6 + 2std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = v8;
}

void *std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    double result = std::vector<float>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      double result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_25BA45AB8(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void *std::vector<long long>::__init_with_size[abi:ne180100]<long long *,long long *>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    double result = std::vector<long long>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      double result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_25BA45B34(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<long long>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::vector<float>::__throw_length_error[abi:ne180100]();
  }
  double result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

void *std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    double result = std::vector<long long>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      double result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_25BA45BF4(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

std::string *std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(std::string *result, long long *a2, long long *a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    std::vector<std::string>::__vallocate[abi:ne180100](result, a4);
    double result = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string*,std::string*,std::string*>((uint64_t)&v6->__r_.__value_.__r.__words[2], a2, a3, (std::string *)v6->__r_.__value_.__l.__size_);
    v6->__r_.__value_.__l.__size_ = (std::string::size_type)result;
  }
  return result;
}

void sub_25BA45C78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  *(void *)(v9 + 8) = v10;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

char *std::vector<std::string>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    std::vector<float>::__throw_length_error[abi:ne180100]();
  }
  double result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[24 * v4];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(24 * a2);
}

std::string *std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string*,std::string*,std::string*>(uint64_t a1, long long *a2, long long *a3, std::string *this)
{
  uint64_t v4 = this;
  BOOL v11 = this;
  BOOL v12 = this;
  v9[0] = a1;
  v9[1] = &v11;
  v9[2] = &v12;
  char v10 = 0;
  if (a2 != a3)
  {
    uint64_t v6 = a2;
    do
    {
      if (*((char *)v6 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(v4, *(const std::string::value_type **)v6, *((void *)v6 + 1));
        uint64_t v4 = v12;
      }
      else
      {
        long long v7 = *v6;
        v4->__r_.__value_.__r.__words[2] = *((void *)v6 + 2);
        *(_OWORD *)&v4->__r_.__value_.__l.__data_ = v7;
      }
      uint64_t v6 = (long long *)((char *)v6 + 24);
      BOOL v12 = ++v4;
    }
    while (v6 != a3);
  }
  char v10 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v9);
  return v4;
}

void sub_25BA45DE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = **(void **)(a1 + 16);
  uint64_t v2 = **(void **)(a1 + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 - 1) < 0) {
      operator delete(*(void **)(v1 - 24));
    }
    v1 -= 24;
  }
}

void std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = a2;
  if (v2)
  {
    if (*(unsigned char *)(a1 + 16)) {
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,0>((uint64_t)v2 + 16);
    }
    operator delete(v2);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,0>(uint64_t a1)
{
  std::__variant_detail::__dtor<std::__variant_detail::__traits<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>,(std::__variant_detail::_Trait)1>::~__dtor(a1 + 32);
  if (*(char *)(a1 + 23) < 0)
  {
    uint64_t v2 = *(void **)a1;
    operator delete(v2);
  }
}

uint64_t std::__hash_table<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>>>::~__hash_table(uint64_t a1)
{
  std::__hash_table<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>>>::__deallocate_node(a1, *(void **)(a1 + 16));
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void std::__hash_table<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>>>::__deallocate_node(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v2 = a2;
    do
    {
      uint64_t v3 = (void *)*v2;
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,0>((uint64_t)(v2 + 2));
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
}

float stats::mean(stats *this, const float *a2)
{
  if ((int)a2 <= 0) {
    stats::mean();
  }
  if (!this) {
    stats::mean();
  }
  float v3 = 0.0;
  vDSP_meanv_wrapper((uint64_t)this, 1, &v3, a2);
  return v3;
}

float stats::variance(stats *this, const float *a2, int a3)
{
  if ((int)a2 <= 0) {
    stats::variance();
  }
  if (!this) {
    stats::variance();
  }
  int v5 = (int)a2;
  uint64_t v11 = 0;
  uint64_t __A = 0;
  __C = 0;
  char v10 = 0;
  vDSP_Length v6 = a2;
  std::vector<float>::resize((uint64_t)&__C, a2);
  vDSP_meanv_wrapper((uint64_t)this, 1, (float *)&__A + 1, v6);
  vDSP_vsub((const float *)this->cp_time, 1, (const float *)&__A + 1, 0, __C, 1, v6);
  vDSP_dotpr(__C, 1, __C, 1, (float *)&__A, v6);
  float v7 = *(float *)&__A / (float)(v5 - (a3 ^ 1));
  *(float *)&uint64_t __A = v7;
  if (__C)
  {
    char v10 = __C;
    operator delete(__C);
  }
  return v7;
}

void sub_25BA460CC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

float stats::covariance(stats *this, const float *a2, const float *a3, const float *a4, int a5)
{
  if ((int)a2 <= 0) {
    stats::covariance();
  }
  unsigned int v5 = a2;
  if (a4 != a2) {
    stats::covariance();
  }
  if (!this) {
    stats::covariance();
  }
  if (!a3) {
    stats::covariance();
  }
  uint64_t __A = 0;
  float v17 = 0.0;
  __C = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  float __B = 0;
  BOOL v12 = 0;
  uint64_t v13 = 0;
  std::vector<float>::resize((uint64_t)&__C, a2);
  std::vector<float>::resize((uint64_t)&__B, v5);
  vDSP_meanv_wrapper((uint64_t)this, 1, (float *)&__A + 1, v5);
  vDSP_vsub((const float *)this->cp_time, 1, (const float *)&__A + 1, 0, __C, 1, v5);
  vDSP_meanv_wrapper((uint64_t)a3, 1, (float *)&__A, v5);
  vDSP_vsub(a3, 1, (const float *)&__A, 0, __B, 1, v5);
  vDSP_dotpr(__C, 1, __B, 1, &v17, v5);
  float v9 = v17 / (float)(int)(v5 - (a5 ^ 1));
  float v17 = v9;
  if (__B)
  {
    BOOL v12 = __B;
    operator delete(__B);
  }
  if (__C)
  {
    uint64_t v15 = __C;
    operator delete(__C);
  }
  return v9;
}

void sub_25BA46250(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, void *a12, uint64_t a13)
{
  if (__p) {
    operator delete(__p);
  }
  if (a12) {
    operator delete(a12);
  }
  _Unwind_Resume(exception_object);
}

float stats::std(stats *this, const float *a2, int a3)
{
  if ((int)a2 <= 0) {
    stats::std();
  }
  if (!this) {
    stats::std();
  }
  return sqrtf(stats::variance(this, a2, a3));
}

float stats::median(stats *this, const float *a2)
{
  if ((int)a2 <= 0) {
    stats::median();
  }
  if (!this) {
    stats::median();
  }
  char v3 = (char)a2;
  __p = 0;
  uint64_t v18 = 0;
  uint64_t v4 = a2;
  uint64_t v19 = 0;
  std::vector<float>::reserve(&__p, a2);
  std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,float const*,float const*,std::back_insert_iterator<std::vector<float>>,0>(this, &this->cp_time[v4], (uint64_t)&__p);
  vDSP_Length v6 = (float *)__p;
  float v7 = v18;
  unint64_t v8 = ((char *)v18 - (unsigned char *)__p) >> 2;
  if (v3)
  {
    unint64_t v14 = (2 * v8 - 2) & 0xFFFFFFFFFFFFFFFCLL;
    uint64_t v15 = (float *)((char *)__p + v14);
    if ((char *)__p + v14 != (char *)v18) {
      std::__nth_element[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<float *>>((float *)__p, (float *)((char *)__p + v14), v18, v5);
    }
    float v13 = *v15;
  }
  else
  {
    unint64_t v9 = v8 >> 1;
    char v10 = (float *)((char *)__p + 4 * v9 - 4);
    if (v10 != v18)
    {
      float v5 = std::__nth_element[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<float *>>((float *)__p, (float *)__p + v9 - 1, v18, v5);
      vDSP_Length v6 = (float *)__p;
      float v7 = v18;
      unint64_t v9 = (unint64_t)(((char *)v18 - (unsigned char *)__p) >> 2) >> 1;
    }
    float v11 = *v10;
    BOOL v12 = &v6[v9];
    if (v12 != v7) {
      std::__nth_element[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<float *>>(v6, &v6[v9], v7, v5);
    }
    float v13 = (float)(v11 + *v12) * 0.5;
  }
  if (__p)
  {
    uint64_t v18 = (float *)__p;
    operator delete(__p);
  }
  return v13;
}

void sub_25BA463D0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

float stats::max(stats *this, const float *a2)
{
  if ((int)a2 <= 0) {
    stats::max();
  }
  if (!this) {
    stats::max();
  }
  float v3 = 0.0;
  vDSP_maxv_wrapper((uint64_t)this, 1, &v3, a2);
  return v3;
}

float stats::min(stats *this, const float *a2)
{
  if ((int)a2 <= 0) {
    stats::min();
  }
  if (!this) {
    stats::min();
  }
  float v3 = 0.0;
  vDSP_minv_wrapper((uint64_t)this, 1, &v3, a2);
  return v3;
}

void stats::median_vdsp(stats *this, vDSP_Length *a2, unint64_t *a3)
{
  if ((int)a3 <= 0) {
    stats::median_vdsp();
  }
  if (!this) {
    stats::median_vdsp();
  }
  if (!a2) {
    stats::median_vdsp();
  }
  stats::percentile(this, a2, (vDSP_Length)a3, 50.0);
}

void stats::percentile(stats *this, vDSP_Length *__I, vDSP_Length __N, float a4)
{
  if ((int)__N <= 0) {
    stats::percentile();
  }
  if (!this) {
    stats::percentile();
  }
  if (!__I) {
    stats::percentile();
  }
  if (a4 < 0.0 || a4 > 100.0) {
    stats::percentile();
  }
  vDSP_vsorti((const float *)this->cp_time, __I, 0, __N, 1);
}

stats *stats::linear_interp(stats *this, float *a2, float *a3, int a4)
{
  if (a4 >= 1)
  {
    uint64_t v4 = a4;
    float v5 = a2;
    do
    {
      *v5++ = *(float *)this->cp_time;
      --v4;
    }
    while (v4);
  }
  if ((int)a3 > 1)
  {
    uint64_t v6 = 1;
    float v7 = &a2[a4];
    do
    {
      if (a4 >= 1)
      {
        for (uint64_t i = 0; i != a4; ++i)
          v7[i] = *(float *)&this->cp_time[v6 - 1]
                + (float)((float)((float)(*(float *)&this->cp_time[v6] - *(float *)&this->cp_time[v6 - 1])
                                * (float)(i + 1))
                        / (float)a4);
      }
      ++v6;
      v7 += a4;
    }
    while (v6 != a3);
  }
  return this;
}

float stats::pearsonr(stats *this, stats *a2, const float *a3)
{
  float v5 = this;
  float v6 = stats::mean(this, a3);
  float v7 = stats::mean(a2, a3);
  float v8 = stats::std(v5, a3, 1);
  float v9 = stats::std(a2, a3, 1);
  if ((int)a3 < 1)
  {
    double v11 = 0.0;
  }
  else
  {
    uint64_t v10 = a3;
    double v11 = 0.0;
    do
    {
      float v12 = *(float *)v5->cp_time;
      float v5 = (stats *)((char *)v5 + 4);
      double v13 = v12 - v6;
      float v14 = *(float *)a2->cp_time;
      a2 = (stats *)((char *)a2 + 4);
      double v11 = v11 + v13 * (v14 - v7);
      --v10;
    }
    while (v10);
  }
  return v11 / ((double)(int)a3 * v8 * v9);
}

_DWORD *std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,float const*,float const*,std::back_insert_iterator<std::vector<float>>,0>(_DWORD *a1, _DWORD *a2, uint64_t a3)
{
  float v3 = a1;
  uint64_t v6 = a3;
  if (a1 == a2) {
    return a1;
  }
  uint64_t v4 = a2;
  do
    std::back_insert_iterator<std::vector<float>>::operator=[abi:ne180100](&v6, v3++);
  while (v3 != v4);
  return v4;
}

double Scandium::ScandiumPPG::scandium_beat_detection_t::scandium_beat_detection_reset(Scandium::ScandiumPPG::scandium_beat_detection_t *this)
{
  double result = 0.0;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = 0u;
  *((_DWORD *)this + 21) = 0;
  return result;
}

double Scandium::ScandiumPPG::scandium_beat_detection_t::scandium_beat_detection_t(Scandium::ScandiumPPG::scandium_beat_detection_t *this)
{
  *(_OWORD *)((char *)this + std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = Scandium::ScandiumPPG::bpfCoef;
  *(_OWORD *)((char *)this + 20) = unk_25BA63508;
  *(void *)((char *)this + 36) = 0x3F7B986FBFFDC753;
  *((_DWORD *)this + 20) = 1007231301;
  *(_DWORD *)this = 2;
  *((void *)this + 16) = 0;
  *((void *)this + 17) = 0;
  *((void *)this + 15) = 0;
  *((void *)this + 1660std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = 0;
  double result = 0.0;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = 0u;
  *(void *)((char *)this + 8std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = 0;
  *(void *)((char *)this + 100) = 0;
  *(void *)((char *)this + 92) = 0;
  *((_DWORD *)this + 27) = 0;
  *((void *)this + 16600) = 0;
  *((_OWORD *)this + 8298) = 0u;
  *((_OWORD *)this + 8299) = 0u;
  *((_OWORD *)this + 8296) = 0u;
  *((_OWORD *)this + 8297) = 0u;
  *((_OWORD *)this + 829std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = 0u;
  *((_OWORD *)this + 8295) = 0u;
  *((_OWORD *)this + 8293) = 0u;
  return result;
}

void Scandium::ScandiumPPG::scandium_beat_detection_t::scandium_beat_detection_process(uint64_t a1, stats *a2, stats *a3, stats *this)
{
  uint64_t v108 = *MEMORY[0x263EF8340];
  memset(&v89, 0, sizeof(v89));
  long long v75 = (const void *)(a1 + 132624);
  Scandium::ScandiumPPG::scandium_beat_detection_t::compute_mav((stats *)a1, this, a1 + 132624);
  stats::linear_interp(a2, (float *)(a1 + 92304), (float *)0x3C0, 4);
  uint64_t v73 = a2;
  uint64_t v6 = (uint64_t *)(a1 + 132784);
  float v7 = *(float *)(a1 + 92304);
  uint64_t v8 = 3840;
  uint64_t v9 = a1 + 92304;
  do
  {
    double v10 = Scandium::ScandiumPPG::iirSos<float,4>::process((unsigned int *)a1, *(float *)v9 - v7);
    *(_DWORD *)(v9 + 15360) = LODWORD(v10);
    v9 += 4;
    --v8;
  }
  while (v8);
  double v11 = (uint64_t *)(a1 + 88);
  Scandium::ScandiumPPG::scandium_beat_detection_t::get_beats_and_flags(a1, a1 + 92304, a1 + 107664, (uint64_t)v75, 0x4Du, a1 + 88, (int *)(a1 + 130704), (std::vector<int> *)(a1 + 132760), (uint64_t *)(a1 + 132784));
  uint64_t v13 = *(void *)(a1 + 88);
  uint64_t v12 = *(void *)(a1 + 96);
  uint64_t v14 = v12 - v13;
  if (v12 == v13)
  {
    unsigned int v16 = 0;
  }
  else
  {
    unint64_t v15 = 0;
    unsigned int v16 = 0;
    unint64_t v17 = v14 >> 2;
    uint64_t v18 = *v6;
    do
    {
      if (((*(void *)(v18 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v15) & 1) == 0)
      {
        *(_DWORD *)(v13 + 4 * v16) = *(_DWORD *)(v13 + 4 * v15);
        *(_DWORD *)(*(void *)(a1 + 120) + 4 * v16++) = *(_DWORD *)(*(void *)(a1 + 120) + 4 * v15);
      }
      ++v15;
    }
    while (v17 > v15);
  }
  std::vector<int>::size_type v19 = v16;
  std::vector<float>::resize(a1 + 88, v16);
  uint64_t v76 = (void *)(a1 + 120);
  std::vector<int>::resize((std::vector<int> *)(a1 + 120), v19);
  Scandium::ScandiumPPG::scandium_beat_detection_t::get_hr_from_beat_times(v20, (int32x2_t *)(a1 + 88));
  Scandium::ScandiumPPG::scandium_beat_detection_t::get_beats_and_flags(a1, a1 + 92304, a1 + 107664, (uint64_t)v75, (int)(45.0 / *(float *)(a1 + 112) * 256.0 + 0.5), a1 + 88, (int *)(a1 + 130704), (std::vector<int> *)(a1 + 132760), (uint64_t *)(a1 + 132784));
  stats::linear_interp(a3, (float *)(a1 + 92304), (float *)0x3C0, 4);
  double v87 = 0;
  v88[0] = 0;
  v88[1] = 0;
  Scandium::ScandiumPPG::find_slope((const float *)(a1 + 92304), 0xF00u, 5u, (float **)&v87);
  memset(&v86, 0, sizeof(v86));
  Scandium::ScandiumPPG::scandium_beat_detection_t::find_max_slope(v21, &v87, a1 + 130704, (void *)(a1 + 132760), &v86);
  float v22 = *(_DWORD **)(a1 + 120);
  *(void *)(a1 + 128) = v22;
  unint64_t v23 = *(void *)(a1 + 132792);
  if (v23)
  {
    unint64_t v24 = 0;
    unsigned int v25 = 0;
    uint64_t v26 = (void *)(a1 + 136);
    do
    {
      if (((*(void *)(*v6 + ((v24 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v24) & 1) == 0)
      {
        std::vector<int>::pointer begin = v86.__begin_;
        if ((unint64_t)v22 >= *v26)
        {
          uint64_t v29 = (_DWORD *)*v76;
          uint64_t v30 = ((uint64_t)v22 - *v76) >> 2;
          unint64_t v31 = v30 + 1;
          if ((unint64_t)(v30 + 1) >> 62) {
            std::vector<float>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v32 = *v26 - (void)v29;
          if (v32 >> 1 > v31) {
            unint64_t v31 = v32 >> 1;
          }
          if ((unint64_t)v32 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v33 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v33 = v31;
          }
          if (v33)
          {
            uint64_t v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(a1 + 136, v33);
            uint64_t v29 = *(_DWORD **)(a1 + 120);
            float v22 = *(_DWORD **)(a1 + 128);
          }
          else
          {
            uint64_t v34 = 0;
          }
          uint64_t v35 = &v34[4 * v30];
          *(_DWORD *)uint64_t v35 = begin[v24];
          uint64_t v28 = v35 + 4;
          while (v22 != v29)
          {
            int v36 = *--v22;
            *((_DWORD *)v35 - 1) = v36;
            v35 -= 4;
          }
          *(void *)(a1 + 120) = v35;
          *(void *)(a1 + 128) = v28;
          *(void *)(a1 + 136) = &v34[4 * v33];
          if (v29) {
            operator delete(v29);
          }
        }
        else
        {
          *float v22 = v86.__begin_[v24];
          uint64_t v28 = v22 + 1;
        }
        *(void *)(a1 + 128) = v28;
        unint64_t v23 = *(void *)(a1 + 132792);
        float v22 = v28;
      }
      unint64_t v24 = ++v25;
    }
    while (v23 > v25);
    uint64_t v37 = (_DWORD *)*v76;
  }
  else
  {
    uint64_t v37 = v22;
  }
  LODWORD(__p[0]) = 0;
  unint64_t v38 = std::vector<float>::assign((char **)(a1 + 88), v22 - v37, __p);
  uint64_t v39 = *(void *)(a1 + 120);
  uint64_t v40 = *(void *)(a1 + 128);
  uint64_t v41 = v40 - v39;
  if (v40 != v39)
  {
    uint64_t v42 = 0;
    unint64_t v43 = v41 >> 2;
    uint64_t v44 = *v11;
    do
    {
      *(float *)(v44 + 4 * v42) = (float)((float)*(int *)(v39 + 4 * v42) + 1.0) * 0.0039062;
      ++v42;
    }
    while (v43 > v42);
  }
  Scandium::ScandiumPPG::scandium_beat_detection_t::get_hr_from_beat_times((Scandium::ScandiumPPG::scandium_beat_detection_t *)v38, (int32x2_t *)(a1 + 88));
  uint64_t v46 = *(void *)(a1 + 120);
  uint64_t v47 = *(void *)(a1 + 128);
  uint64_t v48 = v47 - v46;
  if (v47 != v46)
  {
    uint64_t v49 = 0;
    unint64_t v50 = v48 >> 2;
    do
    {
      int v51 = *(_DWORD *)(v46 + 4 * v49);
      if (v51 < 2) {
        int v52 = v51 + 1;
      }
      else {
        int v52 = v51 - 2;
      }
      *(_DWORD *)(v46 + 4 * v49++) = v52 >> 2;
    }
    while (v50 > v49);
  }
  if (SHIBYTE(v89.__r_.__value_.__r.__words[2]) < 0)
  {
    v89.__r_.__value_.__l.__size_ = 21;
    int v53 = (std::string *)v89.__r_.__value_.__r.__words[0];
  }
  else
  {
    *((unsigned char *)&v89.__r_.__value_.__s + 23) = 21;
    int v53 = &v89;
  }
  strcpy((char *)v53, "scandium beat times: ");
  if (*(void *)(a1 + 128) != *(void *)(a1 + 120))
  {
    unint64_t v54 = 0;
    unsigned int v55 = 1;
    do
    {
      std::to_string(&v83, *(float *)(*v11 + 4 * v54));
      int v56 = std::string::append(&v83, " ", 1uLL);
      long long v57 = *(_OWORD *)&v56->__r_.__value_.__l.__data_;
      int64_t v91 = v56->__r_.__value_.__r.__words[2];
      *(_OWORD *)__p = v57;
      v56->__r_.__value_.__l.__size_ = 0;
      v56->__r_.__value_.__r.__words[2] = 0;
      v56->__r_.__value_.__r.__words[0] = 0;
      if (v91 >= 0) {
        uint64_t v58 = __p;
      }
      else {
        uint64_t v58 = (void **)__p[0];
      }
      if (v91 >= 0) {
        std::string::size_type v59 = HIBYTE(v91);
      }
      else {
        std::string::size_type v59 = (std::string::size_type)__p[1];
      }
      long long v45 = std::string::append(&v89, (const std::string::value_type *)v58, v59);
      if (SHIBYTE(v91) < 0) {
        operator delete(__p[0]);
      }
      if (SHIBYTE(v83.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v83.__r_.__value_.__l.__data_);
      }
      unint64_t v54 = v55++;
    }
    while (v54 < (uint64_t)(*(void *)(a1 + 128) - *(void *)(a1 + 120)) >> 2);
  }
  log = Scandium::algs_get_log((Scandium *)v45);
  uint64_t v61 = (std::string *)os_log_type_enabled(log, OS_LOG_TYPE_DEBUG);
  if (v61) {
    Scandium::ScandiumPPG::scandium_beat_detection_t::scandium_beat_detection_process();
  }
  if (SHIBYTE(v89.__r_.__value_.__r.__words[2]) < 0)
  {
    v89.__r_.__value_.__l.__size_ = 21;
    int v62 = (std::string *)v89.__r_.__value_.__r.__words[0];
  }
  else
  {
    *((unsigned char *)&v89.__r_.__value_.__s + 23) = 21;
    int v62 = &v89;
  }
  strcpy((char *)v62, "scandium beat index: ");
  uint64_t v63 = *(void *)(a1 + 120);
  if (*(void *)(a1 + 128) != v63)
  {
    unint64_t v64 = 0;
    unsigned int v65 = 1;
    do
    {
      std::to_string(&v83, *(_DWORD *)(v63 + 4 * v64));
      long long v66 = std::string::append(&v83, " ", 1uLL);
      long long v67 = *(_OWORD *)&v66->__r_.__value_.__l.__data_;
      int64_t v91 = v66->__r_.__value_.__r.__words[2];
      *(_OWORD *)__p = v67;
      v66->__r_.__value_.__l.__size_ = 0;
      v66->__r_.__value_.__r.__words[2] = 0;
      v66->__r_.__value_.__r.__words[0] = 0;
      if (v91 >= 0) {
        int v68 = __p;
      }
      else {
        int v68 = (void **)__p[0];
      }
      if (v91 >= 0) {
        std::string::size_type v69 = HIBYTE(v91);
      }
      else {
        std::string::size_type v69 = (std::string::size_type)__p[1];
      }
      uint64_t v61 = std::string::append(&v89, (const std::string::value_type *)v68, v69);
      if (SHIBYTE(v91) < 0) {
        operator delete(__p[0]);
      }
      if (SHIBYTE(v83.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v83.__r_.__value_.__l.__data_);
      }
      unint64_t v64 = v65;
      uint64_t v63 = *(void *)(a1 + 120);
      ++v65;
    }
    while (v64 < (*(void *)(a1 + 128) - v63) >> 2);
  }
  uint64_t v70 = Scandium::algs_get_log((Scandium *)v61);
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG)) {
    Scandium::ScandiumPPG::scandium_beat_detection_t::scandium_beat_detection_process();
  }
  if (*(void *)(a1 + 132832))
  {
    std::string::basic_string[abi:ne180100]<0>(v84, "beat_detection");
    v81[0] = 0;
    v81[1] = 0;
    uint64_t v82 = 0;
    std::vector<float>::__init_with_size[abi:ne180100]<float const*,float const*>(v81, v73, (uint64_t)&v73[53].dk_xfer[2], 0x3C0uLL);
    std::string::basic_string[abi:ne180100]<0>(__p, "average_dcs_signal");
    long long v92 = *(_OWORD *)v81;
    uint64_t v93 = v82;
    v81[1] = 0;
    uint64_t v82 = 0;
    v81[0] = 0;
    int v94 = 3;
    int v95 = 6;
    v79[0] = 0;
    v79[1] = 0;
    uint64_t v80 = 0;
    std::vector<float>::__init_with_size[abi:ne180100]<float const*,float const*>(v79, a3, (uint64_t)&a3[53].dk_xfer[2], 0x3C0uLL);
    std::string::basic_string[abi:ne180100]<0>(v96, "average_ppg_ir");
    long long v97 = *(_OWORD *)v79;
    uint64_t v98 = v80;
    v79[1] = 0;
    uint64_t v80 = 0;
    v79[0] = 0;
    int v99 = 3;
    int v100 = 6;
    std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::pair[abi:ne180100]<char const(&)[10],std::vector<float>&,0>((uint64_t)&v101, "beat_time", a1 + 88);
    std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::pair[abi:ne180100]<char const(&)[9],std::vector<int>&,0>((uint64_t)&v102, "beat_idx", (uint64_t)v76);
    v77[0] = 0;
    v77[1] = 0;
    uint64_t v78 = 0;
    std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(v77, v75, a1 + 132684, 0xFuLL);
    std::string::basic_string[abi:ne180100]<0>(v103, "mav_1s");
    long long v104 = *(_OWORD *)v77;
    uint64_t v105 = v78;
    v77[1] = 0;
    uint64_t v78 = 0;
    v77[0] = 0;
    int v106 = 3;
    int v107 = 6;
    std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::unordered_map((uint64_t)&v83, (unsigned __int8 *)__p, 5);
    uint64_t v71 = *(void *)(a1 + 132832);
    if (!v71) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    (*(void (**)(uint64_t, void **, std::string *))(*(void *)v71 + 48))(v71, v84, &v83);
    std::__hash_table<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>>>::~__hash_table((uint64_t)&v83);
    unint64_t v72 = 360;
    do
    {
      std::__variant_detail::__dtor<std::__variant_detail::__traits<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v88[v72 / 8]);
      if (*((char *)&v86.__end_cap_.__value_ + v72 + 7) < 0) {
        operator delete(*(void **)((char *)&v86.__begin_ + v72));
      }
      v72 -= 72;
    }
    while (v72);
    if (v77[0])
    {
      v77[1] = v77[0];
      operator delete(v77[0]);
    }
    if (v79[0])
    {
      v79[1] = v79[0];
      operator delete(v79[0]);
    }
    if (v81[0])
    {
      v81[1] = v81[0];
      operator delete(v81[0]);
    }
    if (v85 < 0) {
      operator delete(v84[0]);
    }
  }
  if (v86.__begin_)
  {
    v86.__end_ = v86.__begin_;
    operator delete(v86.__begin_);
  }
  if (v87)
  {
    v88[0] = v87;
    operator delete(v87);
  }
  if (SHIBYTE(v89.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v89.__r_.__value_.__l.__data_);
  }
}

void sub_25BA470C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,int a28,__int16 a29,char a30,char a31,uint64_t a32,uint64_t a33,void *a34,uint64_t a35,int a36,__int16 a37,char a38,char a39,void *a40,uint64_t a41,uint64_t a42,void *a43,uint64_t a44,uint64_t a45,void *a46,uint64_t a47,int a48,__int16 a49,char a50,char a51,void *a52,uint64_t a53,int a54,__int16 a55,char a56,char a57)
{
  for (uint64_t i = 288; i != -72; i -= 72)
    std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::~pair((uint64_t)&a52 + i);
  if (__p) {
    operator delete(__p);
  }
  if (a19) {
    operator delete(a19);
  }
  if (a23) {
    operator delete(a23);
  }
  if (a39 < 0) {
    operator delete(a34);
  }
  if (a40) {
    operator delete(a40);
  }
  if (a43) {
    operator delete(a43);
  }
  if (a51 < 0) {
    operator delete(a46);
  }
  _Unwind_Resume(a1);
}

void Scandium::ScandiumPPG::scandium_beat_detection_t::compute_mav(stats *a1, stats *this, uint64_t a3)
{
  float v5 = a1;
  uint64_t v6 = a1 + 642;
  uint64_t v7 = 3;
  do
  {
    stats::linear_interp(this, (float *)v5[2].cp_time, (float *)0x3C0, 4);
    Scandium::ScandiumPPG::median_filt((Scandium::ScandiumPPG *)&v5[2], (const float *)v5[642].cp_time, (float *)0x10, 3840, 0);
    this = (stats *)((char *)this + 3840);
    float v5 = (stats *)((char *)v5 + 15360);
    --v7;
  }
  while (v7);
  for (uint64_t i = 0; i != 15; ++i)
  {
    *(_DWORD *)(a3 + 4 * i) = 0;
    uint64_t v9 = 3;
    double v10 = v6;
    do
    {
      float v11 = stats::variance(v10, (const float *)0x100, 1);
      if (*(float *)(a3 + 4 * i) >= v11) {
        float v11 = *(float *)(a3 + 4 * i);
      }
      *(float *)(a3 + 4 * i) = v11;
      double v10 = (stats *)((char *)v10 + 15360);
      --v9;
    }
    while (v9);
    uint64_t v6 = (stats *)((char *)v6 + 1024);
  }
}

double Scandium::ScandiumPPG::iirSos<float,4>::process(unsigned int *a1, float a2)
{
  uint64_t v2 = *a1;
  if ((int)v2 < 1) {
    return 0.0;
  }
  double result = (float)(*((float *)a1 + 20) * (float)(a2 - *((float *)a1 + 21)));
  uint64_t v4 = (double *)(a1 + 14);
  float v5 = (float *)(a1 + 3);
  do
  {
    double v6 = result;
    double result = *(v4 - 1) + *(v5 - 2) * result;
    double v7 = *v4 + *(v5 - 1) * v6 - result * v5[1];
    double v8 = *v5 * v6 - result * v5[2];
    *(v4 - 1) = v7;
    *uint64_t v4 = v8;
    v4 += 2;
    v5 += 5;
    --v2;
  }
  while (v2);
  *(float *)&double result = result;
  return result;
}

void Scandium::ScandiumPPG::scandium_beat_detection_t::get_beats_and_flags(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5, uint64_t a6, int *a7, std::vector<int> *a8, uint64_t *a9)
{
  uint64_t v14 = (char **)(a1 + 132688);
  LODWORD(__n) = 0;
  uint64_t v15 = a1 + 126864;
  findPeaks((float *)(a3 + 512), 3584, (vDSP_Length *)(a1 + 123024), -INFINITY, a5, 0, (const float *)(a1 + 126864), (float *)(a1 + 128784), a7, (unsigned int *)&__n);
  unint64_t v16 = __n;
  if (__n)
  {
    uint64_t v17 = __n;
    uint64_t v18 = a7;
    do
    {
      *v18++ += 128;
      --v17;
    }
    while (v17);
  }
  else
  {
    unint64_t v16 = 0;
  }
  __u[0] = 0;
  std::vector<float>::assign((char **)a6, v16, __u);
  __u[0] = 0;
  std::vector<int>::assign((std::vector<int> *)(a6 + 32), __n, __u);
  uint64_t v40 = (uint64_t *)a6;
  if (__n)
  {
    unint64_t v19 = 0;
    uint64_t v20 = *(char **)a6;
    uint64_t v21 = *(void *)(a6 + 32);
    do
    {
      int v22 = a7[v19];
      *(float *)&v20[4 * v19] = (float)(v22 + 1) * 0.0039062;
      if (v22 < 2) {
        int v23 = v22 + 1;
      }
      else {
        int v23 = v22 - 2;
      }
      *(_DWORD *)(v21 + 4 * v19++) = v23 >> 2;
      unint64_t v24 = __n;
    }
    while (v19 < __n);
  }
  else
  {
    unint64_t v24 = 0;
  }
  __u[0] = 0;
  std::vector<float>::assign(v14, v24, __u);
  __u[0] = 0;
  std::vector<float>::assign(v14 + 3, __n, __u);
  __u[0] = 0;
  std::vector<int>::assign(a8, __n, __u);
  if (__n)
  {
    unint64_t v26 = 0;
    do
    {
      if (v26)
      {
        uint64_t v27 = &a7[v26];
        uint64_t v28 = *(v27 - 1);
        uint64_t v29 = a3 + 4 * v28;
        uint64_t v30 = &(*v14)[4 * v26];
        uint64_t v31 = *v27 - v28;
      }
      else
      {
        uint64_t v30 = *v14;
        uint64_t v31 = *a7;
        uint64_t v29 = a3;
      }
      vDSP_minv_wrapper(v29, 1, (float *)v30, v31);
      *(void *)__u = 0;
      uint64_t v32 = a7[v26];
      uint64_t v33 = a3 + 4 * v32 + 4;
      uint64_t v34 = (float *)&v14[3][4 * v26];
      if (v26 == __n - 1)
      {
        vDSP_minvi_wrapper(v33, 1, v34, (vDSP_Length *)__u, 3839 - v32);
        unint64_t v35 = v26 + 1;
      }
      else
      {
        unint64_t v35 = v26 + 1;
        vDSP_minvi_wrapper(v33, 1, v34, (vDSP_Length *)__u, a7[v26 + 1] + ~v32);
      }
      a8->__begin_[v26] = __u[0] + a7[v26] + 1;
      uint64_t v36 = a7[v26];
      float v37 = (float)(*(float *)(v15 + 4 * v26) - *(float *)&(*v14)[4 * v26]) * 100.0 / *(float *)(a2 + 4 * v36);
      *(float *)&(*v14)[4 * v26] = v37;
      unint64_t v38 = v14[3];
      float v39 = (float)(*(float *)(v15 + 4 * v26) - *(float *)&v38[4 * v26]) * 100.0 / *(float *)(a2 + 4 * v36);
      *(float *)&v38[4 * v26] = v39;
      unint64_t v26 = v35;
    }
    while (v35 < __n);
  }
  Scandium::ScandiumPPG::scandium_beat_detection_t::pulse_sanitizer(v25, v40, v14, v14 + 3, a4, a9);
}

void std::vector<int>::resize(std::vector<int> *this, std::vector<int>::size_type __sz)
{
  std::vector<int>::size_type v2 = this->__end_ - this->__begin_;
  if (__sz <= v2)
  {
    if (__sz < v2) {
      this->__end_ = &this->__begin_[__sz];
    }
  }
  else
  {
    std::vector<int>::__append(this, __sz - v2);
  }
}

void Scandium::ScandiumPPG::scandium_beat_detection_t::get_hr_from_beat_times(Scandium::ScandiumPPG::scandium_beat_detection_t *this, int32x2_t *a2)
{
  int32x2_t v3 = *a2;
  uint64_t v4 = *(void *)&a2[1] - *(void *)a2;
  if ((unint64_t)v4 <= 0xB)
  {
    a2[3] = vdup_n_s32(0x7FC00000u);
    a2[1] = v3;
    a2[5] = a2[4];
    return;
  }
  std::vector<float>::vector(&__p, (int)(v4 >> 2));
  float v5 = (float *)*a2;
  double v6 = (float *)a2[1];
  double v7 = (float *)__p;
  if (*(float **)a2 != v6)
  {
    float v9 = *v5;
    double v8 = v5 + 1;
    float v10 = v9;
    *(float *)__p = v9;
    if (v8 != v6)
    {
      float v11 = v7 + 1;
      do
      {
        float v12 = *v8++;
        *v11++ = v12 - v10;
        float v10 = v12;
      }
      while (v8 != v6);
    }
  }
  uint64_t v13 = v7 + 1;
  uint64_t v14 = v18;
  if (v7 + 1 != v18)
  {
    while (*v13 <= 2.0 && *v13 >= 0.4)
    {
      if (++v13 == v18) {
        goto LABEL_20;
      }
    }
    if (v13 != v18)
    {
      uint64_t v15 = v13 + 1;
      if (v13 + 1 != v18)
      {
        do
        {
          float v16 = *v15;
          if (*v15 <= 2.0 && v16 >= 0.4) {
            *v13++ = v16;
          }
          ++v15;
        }
        while (v15 != v14);
      }
    }
    if (v13 != v14)
    {
      uint64_t v18 = v13;
      goto LABEL_21;
    }
LABEL_20:
    uint64_t v13 = v14;
  }
LABEL_21:
  if ((unint64_t)((char *)v13 - (char *)v7) > 7)
  {
    *(float *)a2[3].i32 = 60.0
                        / stats::median((stats *)(v7 + 1), (const float *)(((unint64_t)((char *)v13 - (char *)v7) >> 2) - 1));
    *(float *)&a2[3].i32[1] = 60.0
                            / stats::mean((stats *)((char *)__p + 4), (const float *)(((unint64_t)((char *)v18 - (unsigned char *)__p) >> 2) - 1));
    double v7 = (float *)__p;
    if (!__p) {
      return;
    }
  }
  else
  {
    a2[3] = vdup_n_s32(0x7FC00000u);
    a2[1] = *a2;
    a2[5] = a2[4];
    if (!v7) {
      return;
    }
  }
  uint64_t v18 = v7;
  operator delete(v7);
}

void sub_25BA478B4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void Scandium::ScandiumPPG::scandium_beat_detection_t::find_max_slope(int a1, void *a2, uint64_t a3, void *a4, std::vector<int> *this)
{
  uint64_t v9 = a4[1] - *a4;
  std::vector<int>::reserve(this, (int)(v9 >> 2));
  if ((int)((unint64_t)v9 >> 2) >= 1)
  {
    uint64_t v10 = 0;
    vDSP_Length v25 = 0;
    int v24 = 0;
    uint64_t v11 = ((unint64_t)v9 >> 2);
    do
    {
      vDSP_maxvi_wrapper(*a2 + 4 * *(int *)(a3 + 4 * v10), 1, (float *)&v24, &v25, *(int *)(*a4 + 4 * v10) - (uint64_t)*(int *)(a3 + 4 * v10));
      int v12 = *(_DWORD *)(a3 + 4 * v10) + v25;
      std::vector<int>::pointer end = this->__end_;
      value = this->__end_cap_.__value_;
      if (end >= value)
      {
        std::vector<int>::pointer begin = this->__begin_;
        uint64_t v17 = end - this->__begin_;
        unint64_t v18 = v17 + 1;
        if ((unint64_t)(v17 + 1) >> 62) {
          std::vector<float>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v19 = (char *)value - (char *)begin;
        if (v19 >> 1 > v18) {
          unint64_t v18 = v19 >> 1;
        }
        if ((unint64_t)v19 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v20 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v20 = v18;
        }
        if (v20)
        {
          uint64_t v21 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&this->__end_cap_, v20);
          std::vector<int>::pointer begin = this->__begin_;
          std::vector<int>::pointer end = this->__end_;
        }
        else
        {
          uint64_t v21 = 0;
        }
        int v22 = (int *)&v21[4 * v17];
        *int v22 = v12;
        uint64_t v15 = v22 + 1;
        while (end != begin)
        {
          int v23 = *--end;
          *--int v22 = v23;
        }
        this->__begin_ = v22;
        this->__end_ = v15;
        this->__end_cap_.__value_ = (int *)&v21[4 * v20];
        if (begin) {
          operator delete(begin);
        }
      }
      else
      {
        *std::vector<int>::pointer end = v12;
        uint64_t v15 = end + 1;
      }
      this->__end_ = v15;
      ++v10;
    }
    while (v10 != v11);
  }
}

char *std::vector<float>::assign(char **a1, unint64_t a2, _DWORD *a3)
{
  uint64_t v6 = (uint64_t)a1[2];
  double result = *a1;
  if (a2 <= (v6 - (uint64_t)result) >> 2)
  {
    uint64_t v13 = a1[1];
    unint64_t v14 = (v13 - result) >> 2;
    if (v14 >= a2) {
      uint64_t v15 = a2;
    }
    else {
      uint64_t v15 = (v13 - result) >> 2;
    }
    if (v15)
    {
      float v16 = result;
      do
      {
        *(_DWORD *)float v16 = *a3;
        v16 += 4;
        --v15;
      }
      while (v15);
    }
    if (a2 <= v14)
    {
      a1[1] = &result[4 * a2];
    }
    else
    {
      uint64_t v17 = &v13[4 * (a2 - v14)];
      uint64_t v18 = 4 * a2 - 4 * v14;
      do
      {
        *(_DWORD *)uint64_t v13 = *a3;
        v13 += 4;
        v18 -= 4;
      }
      while (v18);
      a1[1] = v17;
    }
  }
  else
  {
    if (result)
    {
      a1[1] = result;
      operator delete(result);
      uint64_t v6 = 0;
      *a1 = 0;
      a1[1] = 0;
      a1[2] = 0;
    }
    if (a2 >> 62) {
      std::vector<float>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v8 = v6 >> 1;
    if (v6 >> 1 <= a2) {
      uint64_t v8 = a2;
    }
    if ((unint64_t)v6 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v9 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v9 = v8;
    }
    double result = std::vector<float>::__vallocate[abi:ne180100](a1, v9);
    uint64_t v10 = a1[1];
    uint64_t v11 = &v10[4 * a2];
    uint64_t v12 = 4 * a2;
    do
    {
      *(_DWORD *)uint64_t v10 = *a3;
      v10 += 4;
      v12 -= 4;
    }
    while (v12);
    a1[1] = v11;
  }
  return result;
}

void Scandium::ScandiumPPG::median_filt(Scandium::ScandiumPPG *this, const float *a2, float *a3, int a4, int a5)
{
  if ((int)a3 <= 0) {
    Scandium::ScandiumPPG::median_filt();
  }
  if (!this) {
    Scandium::ScandiumPPG::median_filt();
  }
  if (!a2) {
    Scandium::ScandiumPPG::median_filt();
  }
  unsigned int v8 = a3;
  __p = 0;
  uint64_t v29 = 0;
  uint64_t v30 = 0;
  std::vector<float>::reserve(&__p, a3);
  if (a4 >= 1)
  {
    uint64_t v9 = 0;
    uint64_t v10 = a4;
    unint64_t v11 = v8 >> 1;
    int v23 = (_DWORD *)((char *)this + 4 * a4);
    uint64_t v24 = a4 - (int)v11;
    int v25 = v8 - v11;
    BOOL v12 = (v8 & 1) == 0;
    uint64_t v13 = (_DWORD *)((char *)this + 4 * (2 * a4) + -4 * (int)v11);
    if (v12) {
      uint64_t v14 = 0;
    }
    else {
      uint64_t v14 = -1;
    }
    int v22 = v11 - a4;
    unint64_t v15 = v11;
    float v16 = (_DWORD *)((char *)this + 4 * v11);
    do
    {
      std::vector<float>::resize((uint64_t)&__p, 0);
      if (v9 >= v11)
      {
        if (v9 > v24)
        {
          if (a5)
          {
            int v27 = 0;
            std::vector<float>::resize((uint64_t)&__p, v22 + (int)v9, &v27);
          }
          else
          {
            std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,float const*,float const*,std::back_insert_iterator<std::vector<float>>,0>(v13, v23, (uint64_t)&__p);
          }
          int v17 = v9 - v11;
          int v18 = v10;
          goto LABEL_21;
        }
        int v17 = v9 - v11;
      }
      else
      {
        if (a5)
        {
          int v27 = 0;
          std::vector<float>::resize((uint64_t)&__p, v15, &v27);
        }
        else
        {
          std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,float const*,float const*,std::back_insert_iterator<std::vector<float>>,0>(this, v16, (uint64_t)&__p);
        }
        int v17 = 0;
      }
      int v18 = v25 + v9;
LABEL_21:
      std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,float const*,float const*,std::back_insert_iterator<std::vector<float>>,0>((_DWORD *)this + v17, (_DWORD *)this + v18, (uint64_t)&__p);
      unint64_t v20 = (unint64_t)(v14 + (((char *)v29 - (unsigned char *)__p) >> 2)) >> 1;
      uint64_t v21 = (float *)((char *)__p + 4 * v20);
      if (v21 != v29) {
        std::__nth_element[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<float *>>((float *)__p, (float *)__p + v20, v29, v19);
      }
      a2[v9++] = *v21;
      --v15;
      --v13;
      --v16;
    }
    while (v10 != v9);
  }
  if (__p)
  {
    uint64_t v29 = (float *)__p;
    operator delete(__p);
  }
}

void sub_25BA47D48(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<int>::assign(std::vector<int> *this, std::vector<int>::size_type __n, std::vector<int>::const_reference __u)
{
  uint64_t value = (uint64_t)this->__end_cap_.__value_;
  std::vector<int>::pointer begin = this->__begin_;
  if (__n <= (value - (uint64_t)begin) >> 2)
  {
    std::vector<int>::pointer end = this->__end_;
    std::vector<int>::size_type v14 = end - begin;
    if (v14 >= __n) {
      std::vector<int>::size_type v15 = __n;
    }
    else {
      std::vector<int>::size_type v15 = end - begin;
    }
    if (v15)
    {
      float v16 = begin;
      do
      {
        *v16++ = *__u;
        --v15;
      }
      while (v15);
    }
    if (__n <= v14)
    {
      this->__end_ = &begin[__n];
    }
    else
    {
      int v17 = &end[__n - v14];
      std::vector<int>::size_type v18 = 4 * __n - 4 * v14;
      do
      {
        *end++ = *__u;
        v18 -= 4;
      }
      while (v18);
      this->__end_ = v17;
    }
  }
  else
  {
    if (begin)
    {
      this->__end_ = begin;
      operator delete(begin);
      uint64_t value = 0;
      this->__begin_ = 0;
      this->__end_ = 0;
      this->__end_cap_.__value_ = 0;
    }
    if (__n >> 62) {
      std::vector<float>::__throw_length_error[abi:ne180100]();
    }
    std::vector<int>::size_type v8 = value >> 1;
    if (value >> 1 <= __n) {
      std::vector<int>::size_type v8 = __n;
    }
    if ((unint64_t)value >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v9 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v9 = v8;
    }
    std::vector<float>::__vallocate[abi:ne180100](this, v9);
    std::vector<int>::pointer v10 = this->__end_;
    unint64_t v11 = &v10[__n];
    std::vector<int>::size_type v12 = 4 * __n;
    do
    {
      *v10++ = *__u;
      v12 -= 4;
    }
    while (v12);
    this->__end_ = v11;
  }
}

void Scandium::ScandiumPPG::scandium_beat_detection_t::pulse_sanitizer(uint64_t a1, uint64_t *a2, void *a3, void *a4, uint64_t a5, uint64_t *a6)
{
  uint64_t v11 = (a2[1] - *a2) >> 2;
  char v41 = 0;
  std::vector<BOOL>::assign((uint64_t)a6, v11, &v41);
  uint64_t v12 = (v11 - 1);
  uint64_t v13 = *a2;
  if (v12 >= 2)
  {
    uint64_t v14 = 0;
    int v15 = 0;
    uint64_t v16 = *a3;
    uint64_t v17 = *a4;
    uint64_t v18 = *a6;
    float v19 = *(float *)(v13 + 4);
    unint64_t v20 = (float *)(*a4 + 8);
    uint64_t v21 = v12 - 1;
    int v22 = (float *)(*a3 + 8);
    do
    {
      float v23 = *(v22 - 1);
      if (v23 >= *(v20 - 1)) {
        float v23 = *(v20 - 1);
      }
      if (*(float *)(v16 + 4 * v15) <= *(float *)(v17 + 4 * v15)) {
        float v24 = *(float *)(v17 + 4 * v15);
      }
      else {
        float v24 = *(float *)(v16 + 4 * v15);
      }
      float v25 = *v20;
      if (*v22 > *v20) {
        float v25 = *v22;
      }
      float v26 = *(float *)(v13 + 4 * v15);
      float v27 = v19 - v26;
      float v19 = *(float *)(v13 + 8 + 4 * v14);
      float v28 = 60.0 / (float)(v19 - v26);
      BOOL v31 = v24 * 0.5 <= v23 || v25 * 0.5 <= v23 || v27 >= 0.5 || v28 < 30.0;
      if (v31 && (v23 < v24 ? (BOOL v32 = v23 < v25) : (BOOL v32 = 0), !v32 || v27 >= 0.3)) {
        int v15 = v14 + 1;
      }
      else {
        *(void *)(v18 + (((unint64_t)(v14 + 1) >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << (v14
      }
                                                                                                + 1);
      ++v14;
      ++v20;
      ++v22;
    }
    while (v21 != v14);
    uint64_t v13 = *a2;
  }
  for (uint64_t i = 0; i != 15; ++i)
  {
    if (*(float *)(a5 + 4 * i) > 0.001 && v11 != 0)
    {
      unint64_t v35 = 0;
      uint64_t v38 = *a6;
      do
      {
        float v39 = *(float *)(v13 + 4 * v35);
        float v36 = (double)i + -1.0;
        if (v39 >= v36)
        {
          float v37 = (double)i + 1.5;
          BOOL v40 = v39 > v37;
        }
        else
        {
          BOOL v40 = 1;
        }
        if (!v40) {
          *(void *)(v38 + ((v35 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v35;
        }
        ++v35;
      }
      while (v11 != v35);
    }
  }
}

void std::vector<BOOL>::assign(uint64_t a1, unint64_t a2, unsigned char *a3)
{
  *(void *)(a1 + 8) = 0;
  if (a2)
  {
    uint64_t v6 = *(void *)(a1 + 16);
    unint64_t v7 = v6 << 6;
    if (v6 << 6 >= a2)
    {
      *(void *)(a1 + 8) = a2;
    }
    else
    {
      uint64_t v14 = 0;
      long long v15 = 0uLL;
      if ((a2 & 0x8000000000000000) != 0) {
        std::vector<float>::__throw_length_error[abi:ne180100]();
      }
      unint64_t v8 = v6 << 7;
      if (v8 <= ((a2 + 63) & 0xFFFFFFFFFFFFFFC0)) {
        unint64_t v8 = (a2 + 63) & 0xFFFFFFFFFFFFFFC0;
      }
      if (v7 <= 0x3FFFFFFFFFFFFFFELL) {
        unint64_t v9 = v8;
      }
      else {
        unint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
      }
      std::vector<BOOL>::reserve(&v14, v9);
      uint64_t v11 = v14;
      uint64_t v12 = *((void *)&v15 + 1);
      uint64_t v14 = *(char **)a1;
      std::vector<int>::pointer v10 = v14;
      long long v13 = *(_OWORD *)(a1 + 8);
      *(void *)a1 = v11;
      *(void *)(a1 + 8) = a2;
      *(void *)(a1 + 16) = v12;
      long long v15 = v13;
      if (v10) {
        operator delete(v10);
      }
    }
    if (*a3)
    {
      uint64_t v14 = *(char **)a1;
      LODWORD(v15) = 0;
      std::__fill_n[abi:ne180100]<true,std::vector<BOOL>>(&v14, a2);
    }
    else
    {
      uint64_t v14 = *(char **)a1;
      LODWORD(v15) = 0;
      std::__fill_n[abi:ne180100]<false,std::vector<BOOL>>((uint64_t)&v14, a2);
    }
  }
}

void sub_25BA48194(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<int>::reserve(std::vector<int> *this, std::vector<int>::size_type __n)
{
  uint64_t value = this->__end_cap_.__value_;
  p_end_cap = &this->__end_cap_;
  if (__n > value - this->__begin_)
  {
    if (__n >> 62) {
      std::vector<float>::__throw_length_error[abi:ne180100]();
    }
    int64_t v5 = (char *)this->__end_ - (char *)this->__begin_;
    uint64_t v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)p_end_cap, __n);
    unint64_t v7 = (int *)&v6[v5 & 0xFFFFFFFFFFFFFFFCLL];
    unint64_t v9 = (int *)&v6[4 * v8];
    std::vector<int>::pointer begin = this->__begin_;
    std::vector<int>::pointer end = this->__end_;
    uint64_t v12 = v7;
    if (end != this->__begin_)
    {
      uint64_t v12 = v7;
      do
      {
        int v13 = *--end;
        *--uint64_t v12 = v13;
      }
      while (end != begin);
    }
    this->__begin_ = v12;
    this->__end_ = v7;
    this->__end_cap_.__value_ = v9;
    if (begin)
    {
      operator delete(begin);
    }
  }
}

uint64_t Scandium::ScandiumPPG::scandium_beat_detection_t::scandium_get_beats(Scandium::ScandiumPPG::scandium_beat_detection_t *this)
{
  return (uint64_t)this + 88;
}

void std::vector<float>::resize(uint64_t a1, unint64_t a2, _DWORD *a3)
{
  unint64_t v3 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 2;
  if (a2 <= v3)
  {
    if (a2 < v3) {
      *(void *)(a1 + 8) = *(void *)a1 + 4 * a2;
    }
  }
  else
  {
    std::vector<float>::__append((void **)a1, a2 - v3, a3);
  }
}

void std::vector<int>::__append(std::vector<int> *this, std::vector<int>::size_type __n)
{
  uint64_t value = this->__end_cap_.__value_;
  p_end_cap = &this->__end_cap_;
  int64_t v5 = value;
  std::vector<int>::pointer end = p_end_cap[-1].__value_;
  if (__n <= value - end)
  {
    if (__n)
    {
      bzero(p_end_cap[-1].__value_, 4 * __n);
      end += __n;
    }
    this->__end_ = end;
  }
  else
  {
    std::vector<int>::pointer begin = this->__begin_;
    uint64_t v9 = (char *)end - (char *)this->__begin_;
    unint64_t v10 = __n + (v9 >> 2);
    if (v10 >> 62) {
      std::vector<float>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v11 = v9 >> 2;
    uint64_t v12 = (char *)v5 - (char *)begin;
    if (v12 >> 1 > v10) {
      unint64_t v10 = v12 >> 1;
    }
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v13 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v13 = v10;
    }
    if (v13)
    {
      uint64_t v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)p_end_cap, v13);
      std::vector<int>::pointer begin = this->__begin_;
      std::vector<int>::pointer end = this->__end_;
    }
    else
    {
      uint64_t v14 = 0;
    }
    long long v15 = &v14[4 * v11];
    uint64_t v16 = (int *)&v14[4 * v13];
    bzero(v15, 4 * __n);
    uint64_t v17 = (int *)&v15[4 * __n];
    while (end != begin)
    {
      int v18 = *--end;
      *((_DWORD *)v15 - 1) = v18;
      v15 -= 4;
    }
    this->__begin_ = (std::vector<int>::pointer)v15;
    this->__end_ = v17;
    this->__end_cap_.__value_ = v16;
    if (begin)
    {
      operator delete(begin);
    }
  }
}

uint64_t std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::pair[abi:ne180100]<char const(&)[10],std::vector<float>&,0>(uint64_t a1, char *a2, uint64_t a3)
{
  int64_t v5 = std::string::basic_string[abi:ne180100]<0>((void *)a1, a2);
  v5[4] = 0;
  v5[5] = 0;
  v5 += 4;
  v5[2] = 0;
  std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(v5, *(const void **)a3, *(void *)(a3 + 8), (uint64_t)(*(void *)(a3 + 8) - *(void *)a3) >> 2);
  *(_DWORD *)(a1 + 56) = 3;
  *(_DWORD *)(a1 + 6std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = 6;
  return a1;
}

void sub_25BA483FC(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::pair[abi:ne180100]<char const(&)[9],std::vector<int>&,0>(uint64_t a1, char *a2, uint64_t a3)
{
  int64_t v5 = std::string::basic_string[abi:ne180100]<0>((void *)a1, a2);
  v5[4] = 0;
  v5[5] = 0;
  v5 += 4;
  v5[2] = 0;
  std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(v5, *(const void **)a3, *(void *)(a3 + 8), (uint64_t)(*(void *)(a3 + 8) - *(void *)a3) >> 2);
  *(_DWORD *)(a1 + 56) = 1;
  *(_DWORD *)(a1 + 6std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = 6;
  return a1;
}

void sub_25BA4846C(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<BOOL>::reserve(char **a1, unint64_t a2)
{
  if (a2 > (void)a1[2] << 6)
  {
    if ((a2 & 0x8000000000000000) != 0) {
      std::vector<float>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v10 = 0;
    long long v11 = 0uLL;
    std::vector<BOOL>::__vallocate[abi:ne180100](&v10, a2);
    unint64_t v3 = (unint64_t)a1[1];
    uint64_t v8 = *a1;
    int v9 = 0;
    uint64_t v6 = &v8[8 * (v3 >> 6)];
    int v7 = v3 & 0x3F;
    std::vector<BOOL>::__construct_at_end<std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>>(&v10, (uint64_t)&v8, (uint64_t)&v6, v3);
    uint64_t v4 = *a1;
    *a1 = v10;
    unint64_t v10 = v4;
    long long v5 = *(_OWORD *)(a1 + 1);
    *(_OWORD *)(a1 + 1) = v11;
    long long v11 = v5;
    if (v4) {
      operator delete(v4);
    }
  }
}

void sub_25BA48530(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<BOOL>::__construct_at_end<std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>>(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4 = a1[1];
  unint64_t v5 = v4 + a4;
  a1[1] = v4 + a4;
  if (!v4 || ((v5 - 1) ^ (v4 - 1)) >= 0x40)
  {
    if (v5 >= 0x41) {
      unint64_t v6 = (v5 - 1) >> 6;
    }
    else {
      unint64_t v6 = 0;
    }
    *(void *)(*a1 + 8 * v6) = 0;
  }
  int v7 = *(_DWORD *)(a2 + 8);
  uint64_t v8 = *(void *)a3;
  int v9 = *(_DWORD *)(a3 + 8);
  uint64_t v10 = *a1 + 8 * (v4 >> 6);
  uint64_t v16 = *(void *)a2;
  int v17 = v7;
  uint64_t v14 = v8;
  int v15 = v9;
  uint64_t v12 = v10;
  int v13 = v4 & 0x3F;
  std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>,0>(&v16, &v14, &v12, (uint64_t)&v11);
}

void std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>,0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  int v5 = *((_DWORD *)a1 + 2);
  uint64_t v6 = *a2;
  int v7 = *((_DWORD *)a2 + 2);
  uint64_t v16 = *a1;
  int v17 = v5;
  uint64_t v14 = v6;
  int v15 = v7;
  int v8 = *((_DWORD *)a3 + 2);
  uint64_t v12 = *a3;
  int v13 = v8;
  std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>>((uint64_t)&v16, (uint64_t)&v14, (uint64_t)&v12, (uint64_t)&v18);
  int v9 = v19;
  uint64_t v10 = v20;
  int v11 = v21;
  *(void *)a4 = v18;
  *(_DWORD *)(a4 + 8) = v9;
  *(void *)(a4 + 16) = v10;
  *(_DWORD *)(a4 + 2std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = v11;
}

void std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  unint64_t v4 = *(void **)a1;
  int v5 = *(_DWORD *)(a1 + 8);
  for (i = *(_DWORD *)(a3 + 8); *(void *)a1 != *(void *)a2 || v5 != *(_DWORD *)(a2 + 8); int v5 = *(_DWORD *)(a1 + 8))
  {
    int v8 = *(uint64_t **)a3;
    uint64_t v9 = 1 << i;
    if ((*v4 >> v5)) {
      uint64_t v10 = *v8 | v9;
    }
    else {
      uint64_t v10 = *v8 & ~v9;
    }
    uint64_t *v8 = v10;
    if (v5 == 63)
    {
      int v11 = 0;
      *(void *)a1 = v4 + 1;
    }
    else
    {
      int v11 = v5 + 1;
    }
    *(_DWORD *)(a1 + 8) = v11;
    int v12 = *(_DWORD *)(a3 + 8);
    if (v12 == 63)
    {
      int i = 0;
      *(void *)a3 += 8;
    }
    else
    {
      int i = v12 + 1;
    }
    *(_DWORD *)(a3 + 8) = i;
    unint64_t v4 = *(void **)a1;
  }
  *(void *)a4 = v4;
  *(_DWORD *)(a4 + 8) = v5;
  *(void *)(a4 + 16) = *(void *)a3;
  *(_DWORD *)(a4 + 2std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = i;
}

void *std::__fill_n[abi:ne180100]<true,std::vector<BOOL>>(void *result, unint64_t a2)
{
  unint64_t v2 = a2;
  unint64_t v3 = result;
  int v4 = *((_DWORD *)result + 2);
  int v5 = (void *)*result;
  if (v4)
  {
    if ((64 - v4) >= a2) {
      unint64_t v6 = a2;
    }
    else {
      unint64_t v6 = (64 - v4);
    }
    *v5++ |= (0xFFFFFFFFFFFFFFFFLL >> (64 - v4 - v6)) & (-1 << v4);
    unint64_t v2 = a2 - v6;
    *double result = v5;
  }
  unint64_t v7 = v2 >> 6;
  if (v2 >= 0x40) {
    double result = memset(v5, 255, 8 * v7);
  }
  if ((v2 & 0x3F) != 0)
  {
    int v8 = &v5[v7];
    *unint64_t v3 = v8;
    *v8 |= 0xFFFFFFFFFFFFFFFFLL >> -(v2 & 0x3F);
  }
  return result;
}

void std::__fill_n[abi:ne180100]<false,std::vector<BOOL>>(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = a2;
  int v4 = *(_DWORD *)(a1 + 8);
  int v5 = *(void **)a1;
  if (v4)
  {
    if ((64 - v4) >= a2) {
      unint64_t v6 = a2;
    }
    else {
      unint64_t v6 = (64 - v4);
    }
    *v5++ &= ~((0xFFFFFFFFFFFFFFFFLL >> (64 - v4 - v6)) & (-1 << v4));
    unint64_t v2 = a2 - v6;
    *(void *)a1 = v5;
  }
  unint64_t v7 = v2 >> 6;
  if (v2 >= 0x40) {
    bzero(v5, 8 * v7);
  }
  if ((v2 & 0x3F) != 0)
  {
    int v8 = &v5[v7];
    *(void *)a1 = v8;
    *v8 &= ~(0xFFFFFFFFFFFFFFFFLL >> -(v2 & 0x3F));
  }
}

void *std::vector<float>::vector(void *a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<float>::__vallocate[abi:ne180100](a1, a2);
    int v4 = (char *)a1[1];
    bzero(v4, 4 * a2);
    a1[1] = &v4[4 * a2];
  }
  return a1;
}

void sub_25BA4890C(_Unwind_Exception *exception_object)
{
  unint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<float>::__append(void **a1, unint64_t a2, _DWORD *a3)
{
  int v8 = a1[2];
  uint64_t v6 = (uint64_t)(a1 + 2);
  unint64_t v7 = v8;
  uint64_t v9 = *(_DWORD **)(v6 - 8);
  if (a2 <= (v8 - (unsigned char *)v9) >> 2)
  {
    if (a2)
    {
      uint64_t v16 = 4 * a2;
      int v17 = &v9[a2];
      do
      {
        *v9++ = *a3;
        v16 -= 4;
      }
      while (v16);
      uint64_t v9 = v17;
    }
    a1[1] = v9;
  }
  else
  {
    uint64_t v10 = (char *)v9 - (unsigned char *)*a1;
    unint64_t v11 = a2 + (v10 >> 2);
    if (v11 >> 62) {
      std::vector<float>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v12 = v10 >> 2;
    uint64_t v13 = v7 - (unsigned char *)*a1;
    if (v13 >> 1 > v11) {
      unint64_t v11 = v13 >> 1;
    }
    if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v14 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v14 = v11;
    }
    if (v14) {
      int v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v6, v14);
    }
    else {
      int v15 = 0;
    }
    uint64_t v18 = &v15[4 * v12];
    int v19 = &v18[4 * a2];
    uint64_t v20 = 4 * a2;
    int v21 = v18;
    do
    {
      *(_DWORD *)int v21 = *a3;
      v21 += 4;
      v20 -= 4;
    }
    while (v20);
    int v22 = &v15[4 * v14];
    float v23 = (char *)*a1;
    for (int i = (char *)a1[1]; i != v23; i -= 4)
    {
      int v25 = *((_DWORD *)i - 1);
      *((_DWORD *)v18 - 1) = v25;
      v18 -= 4;
    }
    *a1 = v18;
    a1[1] = v19;
    a1[2] = v22;
    if (v23)
    {
      operator delete(v23);
    }
  }
}

void OUTLINED_FUNCTION_0_2(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0xCu);
}

void vDSP_maxv_wrapper(uint64_t a1, vDSP_Stride a2, float *a3, uint64_t a4)
{
  int v8 = (const float *)malloc_type_malloc(4 * a4, 0x100004052888210uLL);
  if (v8)
  {
    uint64_t v9 = (float *)v8;
    if (a4 < 1)
    {
      vDSP_Length v11 = 0;
    }
    else
    {
      uint64_t v10 = 0;
      vDSP_Length v11 = 0;
      do
        v8[v11++] = *(const float *)(a1 + 4 * v10++);
      while ((float)(int)v10 < (float)a4);
    }
    vDSP_maxv(v8, a2, a3, v11);
    free(v9);
  }
  else
  {
    *a3 = NAN;
  }
}

void vDSP_minv_wrapper(uint64_t a1, vDSP_Stride a2, float *a3, uint64_t a4)
{
  int v8 = (const float *)malloc_type_malloc(4 * a4, 0x100004052888210uLL);
  if (v8)
  {
    uint64_t v9 = (float *)v8;
    if (a4 < 1)
    {
      vDSP_Length v11 = 0;
    }
    else
    {
      uint64_t v10 = 0;
      vDSP_Length v11 = 0;
      do
        v8[v11++] = *(const float *)(a1 + 4 * v10++);
      while ((float)(int)v10 < (float)a4);
    }
    vDSP_minv(v8, a2, a3, v11);
    free(v9);
  }
  else
  {
    *a3 = NAN;
  }
}

void vDSP_maxvi_wrapper(uint64_t a1, vDSP_Stride a2, float *a3, vDSP_Length *a4, uint64_t a5)
{
  uint64_t v10 = (const float *)malloc_type_malloc(4 * a5, 0x100004052888210uLL);
  if (v10)
  {
    vDSP_Length v11 = (float *)v10;
    if (a5 < 1)
    {
      vDSP_Length v13 = 0;
    }
    else
    {
      uint64_t v12 = 0;
      vDSP_Length v13 = 0;
      do
        v10[v13++] = *(const float *)(a1 + 4 * v12++);
      while ((float)(int)v12 < (float)a5);
    }
    vDSP_maxvi(v10, a2, a3, a4, v13);
    free(v11);
  }
  else
  {
    *a3 = NAN;
  }
}

void vDSP_minvi_wrapper(uint64_t a1, vDSP_Stride a2, float *a3, vDSP_Length *a4, uint64_t a5)
{
  uint64_t v10 = (const float *)malloc_type_malloc(4 * a5, 0x100004052888210uLL);
  if (v10)
  {
    vDSP_Length v11 = (float *)v10;
    if (a5 < 1)
    {
      vDSP_Length v13 = 0;
    }
    else
    {
      uint64_t v12 = 0;
      vDSP_Length v13 = 0;
      do
        v10[v13++] = *(const float *)(a1 + 4 * v12++);
      while ((float)(int)v12 < (float)a5);
    }
    vDSP_minvi(v10, a2, a3, a4, v13);
    free(v11);
  }
  else
  {
    *a3 = NAN;
  }
}

void vDSP_meanv_wrapper(uint64_t a1, vDSP_Stride a2, float *a3, uint64_t a4)
{
  int v8 = (const float *)malloc_type_malloc(4 * a4, 0x100004052888210uLL);
  if (v8)
  {
    uint64_t v9 = (float *)v8;
    if (a4 < 1)
    {
      vDSP_Length v11 = 0;
    }
    else
    {
      uint64_t v10 = 0;
      vDSP_Length v11 = 0;
      do
        v8[v11++] = *(const float *)(a1 + 4 * v10++);
      while ((float)(int)v10 < (float)a4);
    }
    vDSP_meanv(v8, a2, a3, v11);
    free(v9);
  }
  else
  {
    *a3 = NAN;
  }
}

uint64_t Scandium::algs_get_log(Scandium *this)
{
  if (Scandium::algs_get_log(void)::onceToken != -1) {
    dispatch_once(&Scandium::algs_get_log(void)::onceToken, &__block_literal_global_0);
  }
  return Scandium::algs_get_log(void)::log;
}

os_log_t ___ZN8Scandium12algs_get_logEv_block_invoke()
{
  os_log_t result = os_log_create("com.apple.scandium", "algorithm");
  Scandium::algs_get_log(void)::log = (uint64_t)result;
  return result;
}

void *Scandium::ScandiumPPG::scandium_quality_metric_t::reset(void *this)
{
  *this = 0;
  return this;
}

uint64_t Scandium::ScandiumPPG::scandium_quality_metric_t::scandium_quality_metric_t(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)a1 = 0;
  Scandium::ScandiumPPG::scandium_optical_fom_t::scandium_optical_fom_t(a1 + 8, a3, a4, a5);
  *(void *)(a1 + 432) = 0;
  *(void *)a1 = 0;
  *(unsigned char *)(a1 + 440) = a2;
  return a1;
}

void Scandium::ScandiumPPG::scandium_quality_metric_t::~scandium_quality_metric_t(Scandium::ScandiumPPG::scandium_quality_metric_t *this)
{
}

void Scandium::ScandiumPPG::scandium_quality_metric_t::process(uint64_t a1, uint64_t a2)
{
  uint64_t v90 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 432))
  {
    std::string::basic_string[abi:ne180100]<0>(__p, "quality_metric_in");
    std::string::basic_string[abi:ne180100]<0>(v24, "ir_snip_corr");
    LODWORD(v25) = *(_DWORD *)a2;
    LODWORD(v27[0]) = 3;
    std::string::basic_string[abi:ne180100]<0>((void *)v27 + 1, "red_snip_corr");
    DWORD2(v28) = *(_DWORD *)(a2 + 4);
    *(_DWORD *)&v29[24] = 3;
    std::string::basic_string[abi:ne180100]<0>(v30, "bga_corr");
    int v31 = *(_DWORD *)(a2 + 8);
    int v32 = 3;
    std::string::basic_string[abi:ne180100]<0>(v33, "spo2");
    int v34 = *(_DWORD *)(a2 + 12);
    int v35 = 3;
    std::string::basic_string[abi:ne180100]<0>(v36, "hr");
    int v37 = *(_DWORD *)(a2 + 16);
    int v38 = 3;
    std::string::basic_string[abi:ne180100]<0>(v39, "girpir");
    int v40 = *(_DWORD *)(a2 + 28);
    int v41 = 3;
    std::string::basic_string[abi:ne180100]<0>(v42, "num_good_beats");
    int v43 = *(_DWORD *)(a2 + 20);
    int v44 = 1;
    std::string::basic_string[abi:ne180100]<0>(v45, "num_total_beats");
    int v46 = *(_DWORD *)(a2 + 24);
    int v47 = 1;
    int v4 = *(unsigned __int8 *)(a2 + 32);
    std::string::basic_string[abi:ne180100]<0>(v48, "path_type");
    int v49 = v4;
    int v50 = 1;
    int v5 = *(unsigned __int8 *)(a2 + 36);
    std::string::basic_string[abi:ne180100]<0>(v51, "emitter_idx");
    int v52 = v5;
    int v53 = 1;
    int v6 = *(unsigned __int8 *)(a2 + 37);
    std::string::basic_string[abi:ne180100]<0>(v54, "detector_idx");
    int v55 = v6;
    int v56 = 1;
    std::string::basic_string[abi:ne180100]<0>(v57, "ir_pi");
    int v58 = *(_DWORD *)(a2 + 40);
    int v59 = 3;
    std::string::basic_string[abi:ne180100]<0>(v60, "red_pi");
    int v61 = *(_DWORD *)(a2 + 44);
    int v62 = 3;
    std::string::basic_string[abi:ne180100]<0>(v63, "green_pi");
    int v64 = *(_DWORD *)(a2 + 48);
    int v65 = 3;
    std::string::basic_string[abi:ne180100]<0>(v66, "ir_idc");
    int v67 = *(_DWORD *)(a2 + 52);
    int v68 = 3;
    std::string::basic_string[abi:ne180100]<0>(v69, "red_idc");
    int v70 = *(_DWORD *)(a2 + 56);
    int v71 = 3;
    std::string::basic_string[abi:ne180100]<0>(v72, "green_idc");
    int v73 = *(_DWORD *)(a2 + 60);
    int v74 = 3;
    std::string::basic_string[abi:ne180100]<0>(v75, "ir_idc_agg");
    int v76 = *(_DWORD *)(a2 + 64);
    int v77 = 3;
    std::string::basic_string[abi:ne180100]<0>(v78, "red_idc_agg");
    int v79 = *(_DWORD *)(a2 + 68);
    int v80 = 3;
    std::string::basic_string[abi:ne180100]<0>(v81, "green_idc_agg");
    int v82 = *(_DWORD *)(a2 + 72);
    int v83 = 3;
    std::string::basic_string[abi:ne180100]<0>(v84, "iAmb");
    int v85 = *(_DWORD *)(a2 + 76);
    int v86 = 3;
    std::string::basic_string[abi:ne180100]<0>(v87, "amb_blankslot_noise");
    int v88 = *(_DWORD *)(a2 + 80);
    int v89 = 3;
    std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::unordered_map((uint64_t)v21, (unsigned __int8 *)v24, 22);
    uint64_t v7 = *(void *)(a1 + 432);
    if (!v7) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    (*(void (**)(uint64_t, void **, unsigned char *))(*(void *)v7 + 48))(v7, __p, v21);
    std::__hash_table<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>>>::~__hash_table((uint64_t)v21);
    uint64_t v8 = 1584;
    do
    {
      std::__variant_detail::__dtor<std::__variant_detail::__traits<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v21[v8 + 24]);
      if ((char)v21[v8 + 15] < 0) {
        operator delete(*(void **)((char *)&v24[-4] + v8 - 8));
      }
      v8 -= 72;
    }
    while (v8);
    if (v23 < 0) {
      operator delete(__p[0]);
    }
  }
  float v9 = *(float *)(a2 + 28);
  int v10 = *(unsigned __int8 *)(a2 + 32);
  long long v11 = *(_OWORD *)(a2 + 116);
  long long v12 = *(_OWORD *)(a2 + 148);
  long long v28 = *(_OWORD *)(a2 + 132);
  *(_OWORD *)uint64_t v29 = v12;
  *(_OWORD *)&v29[12] = *(_OWORD *)(a2 + 160);
  long long v13 = *(_OWORD *)(a2 + 52);
  long long v14 = *(_OWORD *)(a2 + 84);
  long long v25 = *(_OWORD *)(a2 + 68);
  long long v26 = v14;
  v27[0] = *(_OWORD *)(a2 + 100);
  v27[1] = v11;
  v24[0] = *(_OWORD *)(a2 + 36);
  v24[1] = v13;
  float v15 = 10.0;
  BOOL v16 = v10 == 2;
  BOOL v17 = v10 == 2;
  BOOL v18 = v16 || v9 >= 10.0;
  unint64_t v19 = *(void *)a1 & 0xFFFFFFFFFFFFFFFCLL | v18;
  if (*(unsigned char *)(a1 + 440) == 1) {
    float v15 = 5.0;
  }
  if (v15 <= v9) {
    BOOL v17 = 1;
  }
  BOOL v16 = !v17;
  uint64_t v20 = 2;
  if (v16) {
    uint64_t v20 = 0;
  }
  *(void *)a1 = v19 | v20;
  Scandium::ScandiumPPG::scandium_quality_metric_t::compute_hw_metric_validity((float *)a1, v24);
}

void sub_25BA49488(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, char a20)
{
  for (uint64_t i = 1512; i != -72; i -= 72)
    std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::~pair((uint64_t)(&a20 + i));
  if (a19 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void Scandium::ScandiumPPG::scandium_quality_metric_t::compute_hw_metric_validity(float *a1, _OWORD *a2)
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  long long v3 = a2[7];
  v68[6] = a2[6];
  v69[0] = v3;
  *(_OWORD *)((char *)v69 + 12) = *(_OWORD *)((char *)a2 + 124);
  long long v4 = a2[3];
  v68[2] = a2[2];
  v68[3] = v4;
  long long v5 = a2[5];
  v68[4] = a2[4];
  v68[5] = v5;
  long long v6 = a2[1];
  v68[0] = *a2;
  v68[1] = v6;
  Scandium::ScandiumPPG::scandium_optical_fom_t::process((uint64_t)(a1 + 2), (float *)v68);
  float v7 = a1[92];
  float v8 = a1[93];
  float v9 = a1[94];
  float v10 = a1[95];
  float v11 = a1[96];
  float v12 = a1[97];
  float v13 = a1[98];
  float v14 = a1[99];
  BOOL v15 = v8 < 1.0 || v7 < 1.0;
  uint64_t v16 = 4;
  if (v15) {
    uint64_t v16 = 0;
  }
  unint64_t v17 = *(void *)a1 & 0xFFFFFFFFFFFFFF83 | v16;
  BOOL v18 = v12 < 1.0 || v11 < 1.0;
  uint64_t v19 = 8;
  if (v18) {
    uint64_t v19 = 0;
  }
  BOOL v20 = v10 < 1.0 || v9 < 1.0;
  uint64_t v21 = 16;
  if (v20) {
    uint64_t v21 = 0;
  }
  unint64_t v22 = v17 | v19 | v21;
  BOOL v23 = v14 > 0.01 || v13 > 0.01;
  uint64_t v24 = 32;
  if (v23) {
    uint64_t v24 = 0;
  }
  float v30 = a1[101];
  int v31 = *((_DWORD *)a1 + 100);
  BOOL v25 = v30 > 0.04 || a1[100] > 0.04;
  uint64_t v26 = 64;
  if (v25) {
    uint64_t v26 = 0;
  }
  *(void *)a1 = v22 | v24 | v26;
  if (*((void *)a1 + 54))
  {
    std::string::basic_string[abi:ne180100]<0>(__p, "optical_fom_out");
    std::string::basic_string[abi:ne180100]<0>(v35, "ir_snr");
    float v36 = v7;
    int v37 = 3;
    std::string::basic_string[abi:ne180100]<0>(v38, "red_snr");
    float v39 = v8;
    int v40 = 3;
    std::string::basic_string[abi:ne180100]<0>(v41, "ir_snbr");
    float v42 = v9;
    int v43 = 3;
    std::string::basic_string[abi:ne180100]<0>(v44, "red_snbr");
    float v45 = v10;
    int v46 = 3;
    std::string::basic_string[abi:ne180100]<0>(v47, "ir_scnr");
    float v48 = v11;
    int v49 = 3;
    std::string::basic_string[abi:ne180100]<0>(v50, "red_scnr");
    float v51 = v12;
    int v52 = 3;
    std::string::basic_string[abi:ne180100]<0>(v53, "ir_sxr");
    float v54 = v13;
    int v55 = 3;
    std::string::basic_string[abi:ne180100]<0>(v56, "red_sxr");
    float v57 = v14;
    int v58 = 3;
    std::string::basic_string[abi:ne180100]<0>(v59, "ir_sxr_ch");
    int v60 = v31;
    int v61 = 3;
    std::string::basic_string[abi:ne180100]<0>(v62, "red_sxr_ch");
    float v63 = v30;
    int v64 = 3;
    uint64_t v27 = *(void *)a1;
    std::string::basic_string[abi:ne180100]<0>(v65, "valid_flags");
    int v66 = v27;
    int v67 = 1;
    std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::unordered_map((uint64_t)v32, v35, 11);
    uint64_t v28 = *((void *)a1 + 54);
    if (!v28) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    (*(void (**)(uint64_t, void **, unsigned char *))(*(void *)v28 + 48))(v28, __p, v32);
    std::__hash_table<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>>>::~__hash_table((uint64_t)v32);
    unint64_t v29 = 792;
    do
    {
      std::__variant_detail::__dtor<std::__variant_detail::__traits<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v32[v29 + 24]);
      if ((char)v32[v29 + 15] < 0) {
        operator delete(*(void **)&v35[v29 - 72]);
      }
      v29 -= 72;
    }
    while (v29);
    if (v34 < 0) {
      operator delete(__p[0]);
    }
  }
}

void sub_25BA49880(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,char a21)
{
  for (uint64_t i = 720; i != -72; i -= 72)
    std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::~pair((uint64_t)(&a21 + i));
  if (a20 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

Scandium::ScandiumPPG::scandium_spo2_t *Scandium::ScandiumPPG::scandium_spo2_t::scandium_spo2_t(Scandium::ScandiumPPG::scandium_spo2_t *this)
{
  *((void *)this + 3) = 0;
  Scandium::ScandiumPPG::scandium_r_ir_ratio_model_wrapper_t::scandium_r_ir_ratio_model_wrapper_t((Scandium::ScandiumPPG::scandium_spo2_t *)((char *)this + 32));
  return this;
}

void sub_25BA4992C(_Unwind_Exception *a1)
{
  std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void Scandium::ScandiumPPG::scandium_spo2_t::~scandium_spo2_t(id **this)
{
  Scandium::ScandiumPPG::scandium_r_ir_ratio_model_wrapper_t::~scandium_r_ir_ratio_model_wrapper_t(this + 4);
  std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this);
}

uint64_t Scandium::ScandiumPPG::scandium_spo2_t::process(uint64_t a1, int *a2, uint64_t a3)
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  uint64_t v31 = 0x7FC000007FC00000;
  uint64_t v6 = Scandium::ScandiumPPG::scandium_r_ir_ratio_model_wrapper_t::process((Scandium **)(a1 + 32), *((void *)a2 + 1), *((void *)a2 + 2), &v31);
  if (v6)
  {
    int v7 = 2143289344;
  }
  else
  {
    **(_DWORD **)(a3 + 8) = HIDWORD(v31);
    int v7 = v31;
    float v8 = (float)(*(float *)&v31 * 1.04) + -0.02;
    *(float *)&uint64_t v31 = v8;
    float v9 = *((float *)a2 + 8) + (float)(*((float *)a2 + 7) * v8);
    if (v9 == 0.0)
    {
      uint64_t v6 = 2;
      float v10 = 0.0;
    }
    else
    {
      uint64_t v6 = 0;
      float v10 = (float)((float)(1.0 - (float)(*((float *)a2 + 6) * v8)) * 100.0) / v9;
    }
    **(float **)a3 = v10;
  }
  if (*(void *)(a1 + 24))
  {
    std::string::basic_string[abi:ne180100]<0>(v29, "ratio_dl_model");
    int v11 = *a2;
    std::string::basic_string[abi:ne180100]<0>(v32, "path_idx");
    int v33 = v11;
    int v34 = 1;
    uint64_t v12 = *((void *)a2 + 2);
    float v13 = *(const void **)v12;
    uint64_t v14 = *(void *)(v12 + 8);
    unint64_t v15 = (v14 - *(void *)v12) >> 2;
    v26[1] = 0;
    uint64_t v27 = 0;
    v26[0] = 0;
    std::vector<float>::__init_with_size[abi:ne180100]<std::__wrap_iter<float *>,std::__wrap_iter<float *>>(v26, v13, v14, v15);
    std::string::basic_string[abi:ne180100]<0>(v35, "input_red");
    long long v36 = *(_OWORD *)v26;
    uint64_t v37 = v27;
    v26[1] = 0;
    uint64_t v27 = 0;
    v26[0] = 0;
    int v38 = 3;
    int v39 = 6;
    uint64_t v16 = *((void *)a2 + 1);
    unint64_t v17 = *(const void **)v16;
    uint64_t v18 = *(void *)(v16 + 8);
    unint64_t v19 = (v18 - *(void *)v16) >> 2;
    __p[1] = 0;
    uint64_t v25 = 0;
    __p[0] = 0;
    std::vector<float>::__init_with_size[abi:ne180100]<std::__wrap_iter<float *>,std::__wrap_iter<float *>>(__p, v17, v18, v19);
    std::string::basic_string[abi:ne180100]<0>(v40, "input_ir");
    long long v41 = *(_OWORD *)__p;
    uint64_t v42 = v25;
    __p[1] = 0;
    uint64_t v25 = 0;
    __p[0] = 0;
    int v43 = 3;
    int v44 = 6;
    std::string::basic_string[abi:ne180100]<0>(v45, "ratio");
    int v46 = v31;
    int v47 = 3;
    BOOL v20 = *(float **)a3;
    std::string::basic_string[abi:ne180100]<0>(v48, "spo2_out");
    int v49 = *(_DWORD *)v20;
    int v50 = 3;
    std::string::basic_string[abi:ne180100]<0>(v51, "raw_ratio");
    int v52 = v7;
    int v53 = 3;
    std::string::basic_string[abi:ne180100]<0>(v54, "raw_conf");
    int v55 = HIDWORD(v31);
    int v56 = 3;
    std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::unordered_map((uint64_t)v28, (unsigned __int8 *)v32, 7);
    uint64_t v21 = *(void *)(a1 + 24);
    if (!v21) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    (*(void (**)(uint64_t, void **, unsigned char *))(*(void *)v21 + 48))(v21, v29, v28);
    std::__hash_table<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>>>::~__hash_table((uint64_t)v28);
    uint64_t v22 = 504;
    do
    {
      std::__variant_detail::__dtor<std::__variant_detail::__traits<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v28[v22 + 32]);
      if ((char)v28[v22 + 23] < 0) {
        operator delete(*(void **)&v28[v22]);
      }
      v22 -= 72;
    }
    while (v22);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    if (v26[0])
    {
      v26[1] = v26[0];
      operator delete(v26[0]);
    }
    if (v30 < 0) {
      operator delete(v29[0]);
    }
  }
  return v6;
}

void sub_25BA49CD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,uint64_t a27,char a28)
{
  for (uint64_t i = 432; i != -72; i -= 72)
    std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::~pair((uint64_t)(&a28 + i));
  if (__p) {
    operator delete(__p);
  }
  if (a13) {
    operator delete(a13);
  }
  if (a26 < 0) {
    operator delete(a21);
  }
  _Unwind_Resume(a1);
}

uint64_t Scandium::ScandiumPPG::scandium_spo2_t::compute_orthogonal_regression(uint64_t a1, uint64_t a2, uint64_t a3, float *a4)
{
  long long v5 = *(stats **)a2;
  uint64_t v6 = *(void *)(a2 + 8);
  float v7 = 0.0;
  if (*(void *)a2 == v6
    || (uint64_t v9 = *(void *)(a3 + 8), *(void *)a3 == v9)
    || (uint64_t v10 = v6 - (void)v5, v10 >> 2 != (v9 - *(void *)a3) >> 2))
  {
    uint64_t result = 1;
  }
  else
  {
    float v12 = stats::variance(v5, (const float *)((unint64_t)v10 >> 2), 1);
    float v13 = stats::variance(*(stats **)a3, (const float *)((*(void *)(a3 + 8) - *(void *)a3) >> 2), 1);
    float v14 = stats::covariance(*(stats **)a2, (const float *)((*(void *)(a2 + 8) - *(void *)a2) >> 2), *(const float **)a3, (const float *)((*(void *)(a3 + 8) - *(void *)a3) >> 2), 1);
    uint64_t result = 0;
    float v16 = v12 - v13;
    float v17 = (float)((float)(v14 * 4.0) * v14) + (float)(v16 * v16);
    if (v17 < 0.0) {
      float v17 = 0.0;
    }
    float v7 = (float)(sqrtf(v17) - v16) / (float)(v14 + v14);
  }
  *a4 = v7;
  return result;
}

void *std::vector<float>::__init_with_size[abi:ne180100]<std::__wrap_iter<float *>,std::__wrap_iter<float *>>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    uint64_t result = std::vector<float>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      uint64_t result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_25BA49EF4(_Unwind_Exception *exception_object)
{
  long long v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void Scandium::ScandiumPPG::scandium_r_ir_ratio_model_wrapper_t::scandium_r_ir_ratio_model_wrapper_t(Scandium::ScandiumPPG::scandium_r_ir_ratio_model_wrapper_t *this)
{
}

void sub_25BA49F60(_Unwind_Exception *exception_object)
{
  long long v3 = *v1;
  *uint64_t v1 = 0;
  if (v3) {
    std::default_delete<Scandium::ScandiumPPG::scandium_r_ir_ratio_model_t>::operator()[abi:ne180100]((uint64_t)v1, v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t Scandium::ScandiumPPG::scandium_r_ir_ratio_model_t::init(Scandium::ScandiumPPG::scandium_r_ir_ratio_model_t *this)
{
  uint64_t v2 = objc_opt_new();
  long long v3 = (void *)*((void *)this + 4);
  *((void *)this + std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = v2;

  long long v4 = (void *)*((void *)this + 4);
  if (v4)
  {
    [v4 setComputeUnits:0];
    id v22 = 0;
    uint64_t v5 = [objc_alloc(MEMORY[0x263F00DA8]) initWithShape:&unk_270936C58 dataType:65568 error:&v22];
    id v6 = v22;
    uint64_t v7 = *(void **)this;
    *(void *)this = v5;

    id v21 = v6;
    uint64_t v8 = [objc_alloc(MEMORY[0x263F00DA8]) initWithShape:&unk_270936C58 dataType:65568 error:&v21];
    uint64_t v9 = v21;

    uint64_t v10 = (void *)*((void *)this + 1);
    *((void *)this + 1) = v8;

    if (*(void *)this && *((void *)this + 1))
    {
      float v12 = [ScandiumRIrRatioModel alloc];
      uint64_t v13 = *((void *)this + 4);
      BOOL v20 = v9;
      uint64_t v14 = [(ScandiumRIrRatioModel *)v12 initWithConfiguration:v13 error:&v20];
      unint64_t v15 = v20;

      float v16 = (void *)*((void *)this + 3);
      *((void *)this + 3) = v14;

      if (!v15) {
        return 1;
      }
      uint64_t v18 = Scandium::algs_get_log(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_25BA34000, v18, OS_LOG_TYPE_DEFAULT, "scandium r/ir model initialization failed", buf, 2u);
      }
      uint64_t v9 = v15;
    }
    else
    {
      uint64_t v18 = Scandium::algs_get_log(v11);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_25BA34000, v18, OS_LOG_TYPE_DEFAULT, "scandium r/ir model input initialization failed", buf, 2u);
      }
    }
  }
  else
  {
    uint64_t v9 = Scandium::algs_get_log(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_25BA34000, v9, OS_LOG_TYPE_DEFAULT, "scandium r/ir model config initialization failed", buf, 2u);
    }
  }

  return 0;
}

void sub_25BA4A1A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void Scandium::ScandiumPPG::scandium_r_ir_ratio_model_wrapper_t::~scandium_r_ir_ratio_model_wrapper_t(id **this)
{
  uint64_t v1 = *this;
  *this = 0;
  if (v1) {
    std::default_delete<Scandium::ScandiumPPG::scandium_r_ir_ratio_model_t>::operator()[abi:ne180100]((uint64_t)this, v1);
  }
}

BOOL Scandium::ScandiumPPG::scandium_r_ir_ratio_model_wrapper_t::process(Scandium **a1, uint64_t a2, uint64_t a3, _DWORD *a4)
{
  return !Scandium::ScandiumPPG::scandium_r_ir_ratio_model_t::process(*a1, a2, a3, a4, a4 + 1);
}

BOOL Scandium::ScandiumPPG::scandium_r_ir_ratio_model_t::process(Scandium *a1, uint64_t a2, uint64_t a3, _DWORD *a4, _DWORD *a5)
{
  if (*(void *)(a3 + 8) - *(void *)a3 == 3840 && *(void *)(a2 + 8) - *(void *)a2 == 3840)
  {
    memmove((void *)[*((id *)a1 + 1) dataPointer], *(const void **)a2, 0xF00uLL);
    uint64_t v10 = *(unsigned char **)a3;
    uint64_t v9 = *(unsigned char **)(a3 + 8);
    int v11 = (void *)[*(id *)a1 dataPointer];
    if (v9 != v10) {
      memmove(v11, v10, v9 - v10);
    }
    float v12 = [[ScandiumRIrRatioModelInput alloc] initWithIr:*((void *)a1 + 1) red:*(void *)a1];
    uint64_t v13 = (void *)*((void *)a1 + 2);
    *((void *)a1 + 2) = v12;

    uint64_t v14 = [*((id *)a1 + 3) model];
    uint64_t v15 = *((void *)a1 + 2);
    id v32 = 0;
    float v16 = [v14 predictionFromFeatures:v15 error:&v32];
    float v17 = v32;

    BOOL v19 = v17 == 0;
    if (v17)
    {
      BOOL v20 = Scandium::algs_get_log(v18);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v31 = 0;
        _os_log_impl(&dword_25BA34000, v20, OS_LOG_TYPE_DEFAULT, "scandium r/ir model prediction failed", (uint8_t *)&v31, 2u);
      }
    }
    else
    {
      id v21 = [ScandiumRIrRatioModelOutput alloc];
      id v22 = [v16 featureValueForName:@"Identity"];
      BOOL v23 = [v22 multiArrayValue];
      BOOL v20 = [(ScandiumRIrRatioModelOutput *)v21 initWithIdentity:v23];

      uint64_t v24 = [v20 Identity];
      uint64_t v25 = [v24 objectAtIndexedSubscript:0];
      [v25 floatValue];
      *a4 = v26;

      uint64_t v27 = [v20 Identity];
      uint64_t v28 = [v27 objectAtIndexedSubscript:1];
      [v28 floatValue];
      *a5 = v29;
    }
  }
  else
  {
    float v17 = Scandium::algs_get_log(a1);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_25BA34000, v17, OS_LOG_TYPE_DEFAULT, "scandium r/ir model invalid input size", buf, 2u);
    }
    BOOL v19 = 0;
  }

  return v19;
}

void sub_25BA4A468(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25BA4A4D4()
{
}

void std::default_delete<Scandium::ScandiumPPG::scandium_r_ir_ratio_model_t>::operator()[abi:ne180100](uint64_t a1, id *a2)
{
  if (a2)
  {

    JUMPOUT(0x26116E390);
  }
}

double Scandium::ScandiumPPG::scandium_channel_combination_t::scandium_channel_combination_t(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  double result = 0.0;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_DWORD *)(a1 + 88) = 1065353216;
  *(void *)(a1 + 136) = a2;
  *(void *)(a1 + 14std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = a3;
  *(void *)(a1 + 608) = 0;
  *(_OWORD *)(a1 + 152) = 0u;
  *(_OWORD *)(a1 + 168) = 0u;
  *(_OWORD *)(a1 + 18std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = 0u;
  *(_OWORD *)(a1 + 200) = 0u;
  *(_OWORD *)(a1 + 216) = 0u;
  *(_OWORD *)(a1 + 232) = 0u;
  return result;
}

void Scandium::ScandiumPPG::scandium_channel_combination_t::~scandium_channel_combination_t(Scandium::ScandiumPPG::scandium_channel_combination_t *this)
{
  std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100]((void *)this + 73);
  uint64_t v2 = (void *)*((void *)this + 28);
  if (v2) {
    operator delete(v2);
  }
  long long v3 = (void *)*((void *)this + 25);
  if (v3)
  {
    *((void *)this + 26) = v3;
    operator delete(v3);
  }
  long long v4 = (void *)*((void *)this + 22);
  if (v4)
  {
    *((void *)this + 23) = v4;
    operator delete(v4);
  }
  uint64_t v5 = (void *)*((void *)this + 19);
  if (v5)
  {
    *((void *)this + 20) = v5;
    operator delete(v5);
  }
  std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::~__hash_table((uint64_t)this + 56);
  if (*((char *)this + 23) < 0) {
    operator delete(*(void **)this);
  }
}

int32x2_t Scandium::ScandiumPPG::scandium_channel_combination_t::init_module(std::string *this, std::string *__str)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  std::string::size_type v4 = this[5].__r_.__value_.__r.__words[2];
  if (*(_DWORD *)v4 == 2)
  {
    if (*(unsigned char *)(v4 + 10))
    {
      std::string::__assign_external(this, "BACKGROUND-WRIST-ROTATED", 0x18uLL);
      *(_OWORD *)&this[1].__r_.__value_.__l.__data_ = xmmword_25BA64E90;
      this[1].__r_.__value_.__r.__words[2] = 0x4079999A40480000;
      LOWORD(this[2].__r_.__value_.__l.__data_) = 257;
      long long v12 = xmmword_25BA6353C;
      uint64_t v13 = 0x3F19999A00000000;
      std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__assign_unique<std::pair<Scandium::ScandiumPPG::PathType const,float> const*>(&this[2].__r_.__value_.__l.__size_, (uint64_t)&v12, (uint64_t)&v14);
    }
    else
    {
      if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
      {
        this->__r_.__value_.__l.__size_ = 17;
        id v6 = (char *)this->__r_.__value_.__r.__words[0];
      }
      else
      {
        *((unsigned char *)&this->__r_.__value_.__s + 23) = 17;
        id v6 = (char *)this;
      }
      strcpy(v6, "BACKGROUND-NORMAL");
      *(_OWORD *)&this[1].__r_.__value_.__l.__data_ = xmmword_25BA64E90;
      this[1].__r_.__value_.__r.__words[2] = 0x4079999A40480000;
      LOWORD(this[2].__r_.__value_.__l.__data_) = 257;
      long long v12 = xmmword_25BA6353C;
      uint64_t v13 = 0x3F19999A00000000;
      std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__assign_unique<std::pair<Scandium::ScandiumPPG::PathType const,float> const*>(&this[2].__r_.__value_.__l.__size_, (uint64_t)&v12, (uint64_t)&v14);
    }
  }
  else
  {
    if (*(_DWORD *)v4 != 1) {
      goto LABEL_14;
    }
    if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
    {
      this->__r_.__value_.__l.__size_ = 10;
      uint64_t v5 = (char *)this->__r_.__value_.__r.__words[0];
    }
    else
    {
      *((unsigned char *)&this->__r_.__value_.__s + 23) = 10;
      uint64_t v5 = (char *)this;
    }
    strcpy(v5, "FOREGROUND");
    *(_OWORD *)&this[1].__r_.__value_.__l.__data_ = xmmword_25BA64EA0;
    this[1].__r_.__value_.__r.__words[2] = 0x4079999A40480000;
    LOWORD(this[2].__r_.__value_.__l.__data_) = 256;
    long long v12 = xmmword_25BA6353C;
    uint64_t v13 = 0x3F19999A00000000;
    std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__assign_unique<std::pair<Scandium::ScandiumPPG::PathType const,float> const*>(&this[2].__r_.__value_.__l.__size_, (uint64_t)&v12, (uint64_t)&v14);
  }
  this[4].__r_.__value_.__r.__words[0] = 0xBF80000041266666;
  LODWORD(this[4].__r_.__value_.__r.__words[1]) = -1058642330;
  *(std::string::size_type *)((char *)&this[4].__r_.__value_.__r.__words[1] + std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = 0;
  *(std::string::size_type *)((char *)this[5].__r_.__value_.__r.__words + std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = 0;
  *(std::string::size_type *)((char *)&this[4].__r_.__value_.__r.__words[2] + std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = 0;
LABEL_14:
  if (__str[5].__r_.__value_.__s.__data_[16])
  {
    std::string::operator=(this, __str);
    long long v7 = *(_OWORD *)&__str[1].__r_.__value_.__l.__data_;
    *(_OWORD *)((char *)&this[1].__r_.__value_.__r.__words[1] + 2) = *(_OWORD *)((char *)&__str[1].__r_.__value_.__r.__words[1]
                                                                               + 2);
    *(_OWORD *)&this[1].__r_.__value_.__l.__data_ = v7;
    if (this != __str)
    {
      LODWORD(this[3].__r_.__value_.__r.__words[2]) = __str[3].__r_.__value_.__r.__words[2];
      std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,void *> *>>(&this[2].__r_.__value_.__l.__size_, (uint64_t *)__str[3].__r_.__value_.__l.__data_, 0);
    }
    long long v8 = *(_OWORD *)&__str[4].__r_.__value_.__l.__data_;
    long long v9 = *(_OWORD *)&__str[4].__r_.__value_.__r.__words[2];
    LODWORD(this[5].__r_.__value_.__r.__words[1]) = __str[5].__r_.__value_.__r.__words[1];
    *(_OWORD *)&this[4].__r_.__value_.__l.__data_ = v8;
    *(_OWORD *)&this[4].__r_.__value_.__r.__words[2] = v9;
  }
  Scandium::ScandiumPPG::scandium_channel_combination_t::unpack_input_values((Scandium::ScandiumPPG::scandium_channel_combination_t *)this);
  *(_OWORD *)&this[10].__r_.__value_.__r.__words[1] = 0u;
  uint64_t v10 = &this[10].__r_.__value_.__s.__data_[8];
  *((_OWORD *)v10 + 18) = 0u;
  *((_OWORD *)v10 + 19) = 0u;
  *((_OWORD *)v10 + 16) = 0u;
  *((_OWORD *)v10 + 17) = 0u;
  *((_OWORD *)v10 + 1std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = 0u;
  *((_OWORD *)v10 + 15) = 0u;
  *((_OWORD *)v10 + 12) = 0u;
  *((_OWORD *)v10 + 13) = 0u;
  *((_OWORD *)v10 + 10) = 0u;
  *((_OWORD *)v10 + 11) = 0u;
  *((_OWORD *)v10 + 8) = 0u;
  *((_OWORD *)v10 + 9) = 0u;
  *((_OWORD *)v10 + 6) = 0u;
  *((_OWORD *)v10 + 7) = 0u;
  *((_OWORD *)v10 + std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = 0u;
  *((_OWORD *)v10 + 5) = 0u;
  *((_OWORD *)v10 + 2) = 0u;
  *((_OWORD *)v10 + 3) = 0u;
  *((_OWORD *)v10 + 1) = 0u;
  int32x2_t result = vdup_n_s32(0x7FC00000u);
  *((int32x2_t *)v10 + 40) = result;
  return result;
}

void Scandium::ScandiumPPG::scandium_channel_combination_t::unpack_input_values(Scandium::ScandiumPPG::scandium_channel_combination_t *this)
{
  *((void *)this + 20) = *((void *)this + 19);
  uint64_t v2 = (char *)this + 176;
  std::string::size_type v4 = (char *)this + 200;
  uint64_t v3 = *((void *)this + 25);
  *((void *)this + 23) = *((void *)this + 22);
  *((void *)this + 26) = v3;
  *((void *)this + 29) = 0;
  uint64_t v5 = *((void *)this + 18);
  uint64_t v15 = (char *)this + 152;
  for (uint64_t i = 20; i != 660; i += 40)
  {
    int v14 = *(_DWORD *)(v5 + i);
    std::back_insert_iterator<std::vector<float>>::operator=[abi:ne180100]((uint64_t *)&v15, &v14);
  }
  uint64_t v7 = *((void *)this + 18);
  uint64_t v15 = v2;
  for (uint64_t j = 16; j != 656; j += 40)
  {
    int v14 = *(_DWORD *)(v7 + j);
    std::back_insert_iterator<std::vector<float>>::operator=[abi:ne180100]((uint64_t *)&v15, &v14);
  }
  uint64_t v9 = *((void *)this + 18);
  uint64_t v15 = v4;
  for (uint64_t k = 24; k != 664; k += 40)
  {
    int v14 = *(_DWORD *)(v9 + k);
    std::back_insert_iterator<std::vector<float>>::operator=[abi:ne180100]((uint64_t *)&v15, &v14);
  }
  int v11 = (char *)this + 224;
  uint64_t v12 = *((void *)this + 18);
  for (uint64_t m = 36; m != 676; m += 40)
  {
    LOBYTE(v15) = *(unsigned char *)(v12 + m);
    std::vector<BOOL>::push_back((uint64_t)v11, &v15);
  }
}

float Scandium::ScandiumPPG::scandium_channel_combination_t::log_coreanalytics_metrics(uint64_t a1, uint64_t a2)
{
  std::string::size_type v4 = *(void ***)a2;
  uint64_t v5 = (long long *)(a1 + 248);
  id v6 = *(_OWORD **)(*(void *)a2 + 8);
  uint64_t v7 = (void *)(*(void *)a2 + 16);
  if ((unint64_t)v6 >= *v7)
  {
    uint64_t v12 = ((char *)v6 - (unsigned char *)*v4) >> 6;
    unint64_t v13 = v12 + 1;
    if ((unint64_t)(v12 + 1) >> 58) {
      goto LABEL_82;
    }
    uint64_t v14 = *v7 - (void)*v4;
    if (v14 >> 5 > v13) {
      unint64_t v13 = v14 >> 5;
    }
    if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFC0) {
      unint64_t v15 = 0x3FFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v15 = v13;
    }
    if (v15) {
      float v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::array<float,16ul>>>((uint64_t)v7, v15);
    }
    else {
      float v16 = 0;
    }
    float v17 = &v16[64 * v12];
    uint64_t v18 = &v16[64 * v15];
    long long v19 = *v5;
    long long v20 = v5[1];
    long long v21 = v5[3];
    *((_OWORD *)v17 + 2) = v5[2];
    *((_OWORD *)v17 + 3) = v21;
    *(_OWORD *)float v17 = v19;
    *((_OWORD *)v17 + 1) = v20;
    int v11 = v17 + 64;
    BOOL v23 = (char *)*v4;
    id v22 = (char *)v4[1];
    if (v22 != *v4)
    {
      do
      {
        long long v24 = *((_OWORD *)v22 - 4);
        long long v25 = *((_OWORD *)v22 - 3);
        long long v26 = *((_OWORD *)v22 - 1);
        *((_OWORD *)v17 - 2) = *((_OWORD *)v22 - 2);
        *((_OWORD *)v17 - 1) = v26;
        *((_OWORD *)v17 - std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = v24;
        *((_OWORD *)v17 - 3) = v25;
        v17 -= 64;
        v22 -= 64;
      }
      while (v22 != v23);
      id v22 = (char *)*v4;
    }
    *std::string::size_type v4 = v17;
    v4[1] = v11;
    v4[2] = v18;
    if (v22) {
      operator delete(v22);
    }
  }
  else
  {
    long long v8 = *v5;
    long long v9 = v5[1];
    long long v10 = v5[3];
    v6[2] = v5[2];
    v6[3] = v10;
    _OWORD *v6 = v8;
    v6[1] = v9;
    int v11 = v6 + 4;
  }
  v4[1] = v11;
  uint64_t v27 = *(void ***)(a2 + 8);
  uint64_t v28 = (long long *)(a1 + 312);
  int v29 = v27[1];
  unint64_t v30 = (unint64_t)v27[2];
  if ((unint64_t)v29 >= v30)
  {
    uint64_t v35 = ((char *)v29 - (unsigned char *)*v27) >> 6;
    unint64_t v36 = v35 + 1;
    if ((unint64_t)(v35 + 1) >> 58) {
      goto LABEL_82;
    }
    uint64_t v37 = v30 - (void)*v27;
    if (v37 >> 5 > v36) {
      unint64_t v36 = v37 >> 5;
    }
    if ((unint64_t)v37 >= 0x7FFFFFFFFFFFFFC0) {
      unint64_t v38 = 0x3FFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v38 = v36;
    }
    if (v38) {
      int v39 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::array<float,16ul>>>((uint64_t)(v27 + 2), v38);
    }
    else {
      int v39 = 0;
    }
    int v40 = &v39[64 * v35];
    long long v41 = &v39[64 * v38];
    long long v42 = *v28;
    long long v43 = *(_OWORD *)(a1 + 328);
    long long v44 = *(_OWORD *)(a1 + 360);
    *((_OWORD *)v40 + 2) = *(_OWORD *)(a1 + 344);
    *((_OWORD *)v40 + 3) = v44;
    *(_OWORD *)int v40 = v42;
    *((_OWORD *)v40 + 1) = v43;
    int v34 = v40 + 64;
    int v46 = (char *)*v27;
    float v45 = (char *)v27[1];
    if (v45 != *v27)
    {
      do
      {
        long long v47 = *((_OWORD *)v45 - 4);
        long long v48 = *((_OWORD *)v45 - 3);
        long long v49 = *((_OWORD *)v45 - 1);
        *((_OWORD *)v40 - 2) = *((_OWORD *)v45 - 2);
        *((_OWORD *)v40 - 1) = v49;
        *((_OWORD *)v40 - std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = v47;
        *((_OWORD *)v40 - 3) = v48;
        v40 -= 64;
        v45 -= 64;
      }
      while (v45 != v46);
      float v45 = (char *)*v27;
    }
    void *v27 = v40;
    v27[1] = v34;
    _OWORD v27[2] = v41;
    if (v45) {
      operator delete(v45);
    }
  }
  else
  {
    long long v31 = *v28;
    long long v32 = *(_OWORD *)(a1 + 328);
    long long v33 = *(_OWORD *)(a1 + 360);
    v29[2] = *(_OWORD *)(a1 + 344);
    v29[3] = v33;
    *int v29 = v31;
    v29[1] = v32;
    int v34 = v29 + 4;
  }
  v27[1] = v34;
  int v50 = *(void ***)(a2 + 16);
  float v51 = (long long *)(a1 + 376);
  int v52 = v50[1];
  unint64_t v53 = (unint64_t)v50[2];
  if ((unint64_t)v52 >= v53)
  {
    uint64_t v58 = ((char *)v52 - (unsigned char *)*v50) >> 6;
    unint64_t v59 = v58 + 1;
    if ((unint64_t)(v58 + 1) >> 58) {
      goto LABEL_82;
    }
    uint64_t v60 = v53 - (void)*v50;
    if (v60 >> 5 > v59) {
      unint64_t v59 = v60 >> 5;
    }
    if ((unint64_t)v60 >= 0x7FFFFFFFFFFFFFC0) {
      unint64_t v61 = 0x3FFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v61 = v59;
    }
    if (v61) {
      int v62 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::array<float,16ul>>>((uint64_t)(v50 + 2), v61);
    }
    else {
      int v62 = 0;
    }
    float v63 = &v62[64 * v58];
    int v64 = &v62[64 * v61];
    long long v65 = *v51;
    long long v66 = *(_OWORD *)(a1 + 392);
    long long v67 = *(_OWORD *)(a1 + 424);
    *((_OWORD *)v63 + 2) = *(_OWORD *)(a1 + 408);
    *((_OWORD *)v63 + 3) = v67;
    *(_OWORD *)float v63 = v65;
    *((_OWORD *)v63 + 1) = v66;
    uint64_t v57 = v63 + 64;
    std::string::size_type v69 = (char *)*v50;
    int v68 = (char *)v50[1];
    if (v68 != *v50)
    {
      do
      {
        long long v70 = *((_OWORD *)v68 - 4);
        long long v71 = *((_OWORD *)v68 - 3);
        long long v72 = *((_OWORD *)v68 - 1);
        *((_OWORD *)v63 - 2) = *((_OWORD *)v68 - 2);
        *((_OWORD *)v63 - 1) = v72;
        *((_OWORD *)v63 - std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = v70;
        *((_OWORD *)v63 - 3) = v71;
        v63 -= 64;
        v68 -= 64;
      }
      while (v68 != v69);
      int v68 = (char *)*v50;
    }
    *int v50 = v63;
    v50[1] = v57;
    v50[2] = v64;
    if (v68) {
      operator delete(v68);
    }
  }
  else
  {
    long long v54 = *v51;
    long long v55 = *(_OWORD *)(a1 + 392);
    long long v56 = *(_OWORD *)(a1 + 424);
    v52[2] = *(_OWORD *)(a1 + 408);
    v52[3] = v56;
    *int v52 = v54;
    v52[1] = v55;
    uint64_t v57 = v52 + 4;
  }
  v50[1] = v57;
  int v73 = *(void ***)(a2 + 24);
  int v74 = (long long *)(a1 + 440);
  long long v75 = v73[1];
  unint64_t v76 = (unint64_t)v73[2];
  if ((unint64_t)v75 >= v76)
  {
    uint64_t v81 = ((char *)v75 - (unsigned char *)*v73) >> 6;
    unint64_t v82 = v81 + 1;
    if ((unint64_t)(v81 + 1) >> 58) {
      goto LABEL_82;
    }
    uint64_t v83 = v76 - (void)*v73;
    if (v83 >> 5 > v82) {
      unint64_t v82 = v83 >> 5;
    }
    if ((unint64_t)v83 >= 0x7FFFFFFFFFFFFFC0) {
      unint64_t v84 = 0x3FFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v84 = v82;
    }
    if (v84) {
      int v85 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::array<float,16ul>>>((uint64_t)(v73 + 2), v84);
    }
    else {
      int v85 = 0;
    }
    int v86 = &v85[64 * v81];
    double v87 = &v85[64 * v84];
    long long v88 = *v74;
    long long v89 = *(_OWORD *)(a1 + 456);
    long long v90 = *(_OWORD *)(a1 + 488);
    *((_OWORD *)v86 + 2) = *(_OWORD *)(a1 + 472);
    *((_OWORD *)v86 + 3) = v90;
    *(_OWORD *)int v86 = v88;
    *((_OWORD *)v86 + 1) = v89;
    int v80 = v86 + 64;
    long long v92 = (char *)*v73;
    int64_t v91 = (char *)v73[1];
    if (v91 != *v73)
    {
      do
      {
        long long v93 = *((_OWORD *)v91 - 4);
        long long v94 = *((_OWORD *)v91 - 3);
        long long v95 = *((_OWORD *)v91 - 1);
        *((_OWORD *)v86 - 2) = *((_OWORD *)v91 - 2);
        *((_OWORD *)v86 - 1) = v95;
        *((_OWORD *)v86 - std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = v93;
        *((_OWORD *)v86 - 3) = v94;
        v86 -= 64;
        v91 -= 64;
      }
      while (v91 != v92);
      int64_t v91 = (char *)*v73;
    }
    *int v73 = v86;
    v73[1] = v80;
    v73[2] = v87;
    if (v91) {
      operator delete(v91);
    }
  }
  else
  {
    long long v77 = *v74;
    long long v78 = *(_OWORD *)(a1 + 456);
    long long v79 = *(_OWORD *)(a1 + 488);
    v75[2] = *(_OWORD *)(a1 + 472);
    v75[3] = v79;
    *long long v75 = v77;
    v75[1] = v78;
    int v80 = v75 + 4;
  }
  v73[1] = v80;
  id v96 = *(void ***)(a2 + 32);
  long long v97 = (long long *)(a1 + 504);
  uint64_t v98 = v96[1];
  unint64_t v99 = (unint64_t)v96[2];
  if ((unint64_t)v98 < v99)
  {
    long long v100 = *v97;
    long long v101 = *(_OWORD *)(a1 + 520);
    long long v102 = *(_OWORD *)(a1 + 552);
    v98[2] = *(_OWORD *)(a1 + 536);
    v98[3] = v102;
    *uint64_t v98 = v100;
    v98[1] = v101;
    v103 = v98 + 4;
    goto LABEL_81;
  }
  uint64_t v104 = ((char *)v98 - (unsigned char *)*v96) >> 6;
  unint64_t v105 = v104 + 1;
  if ((unint64_t)(v104 + 1) >> 58) {
LABEL_82:
  }
    std::vector<float>::__throw_length_error[abi:ne180100]();
  uint64_t v106 = v99 - (void)*v96;
  if (v106 >> 5 > v105) {
    unint64_t v105 = v106 >> 5;
  }
  if ((unint64_t)v106 >= 0x7FFFFFFFFFFFFFC0) {
    unint64_t v107 = 0x3FFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v107 = v105;
  }
  if (v107) {
    uint64_t v108 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::array<float,16ul>>>((uint64_t)(v96 + 2), v107);
  }
  else {
    uint64_t v108 = 0;
  }
  v109 = &v108[64 * v104];
  v110 = &v108[64 * v107];
  long long v111 = *v97;
  long long v112 = *(_OWORD *)(a1 + 520);
  long long v113 = *(_OWORD *)(a1 + 552);
  *((_OWORD *)v109 + 2) = *(_OWORD *)(a1 + 536);
  *((_OWORD *)v109 + 3) = v113;
  *(_OWORD *)v109 = v111;
  *((_OWORD *)v109 + 1) = v112;
  v103 = v109 + 64;
  v115 = (char *)*v96;
  v114 = (char *)v96[1];
  if (v114 != *v96)
  {
    do
    {
      long long v116 = *((_OWORD *)v114 - 4);
      long long v117 = *((_OWORD *)v114 - 3);
      long long v118 = *((_OWORD *)v114 - 1);
      *((_OWORD *)v109 - 2) = *((_OWORD *)v114 - 2);
      *((_OWORD *)v109 - 1) = v118;
      *((_OWORD *)v109 - std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = v116;
      *((_OWORD *)v109 - 3) = v117;
      v109 -= 64;
      v114 -= 64;
    }
    while (v114 != v115);
    v114 = (char *)*v96;
  }
  *id v96 = v109;
  v96[1] = v103;
  v96[2] = v110;
  if (v114) {
    operator delete(v114);
  }
LABEL_81:
  v96[1] = v103;
  *(int32x2_t *)(a2 + 4std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = vrev64_s32(*(int32x2_t *)(a1 + 568));
  float result = *(float *)(a1 + 576);
  *(float *)(a2 + 40) = result;
  return result;
}

uint64_t Scandium::ScandiumPPG::scandium_channel_combination_t::get_return_message@<X0>(unsigned __int8 a1@<W1>, std::string *a2@<X8>)
{
  v21[3] = *MEMORY[0x263EF8340];
  unsigned __int8 v7 = a1;
  LOBYTE(v8) = 0;
  std::string::basic_string[abi:ne180100]<0>(v9, "SUCCESS");
  char v10 = 1;
  std::string::basic_string[abi:ne180100]<0>(v11, "MOTION");
  char v12 = 2;
  std::string::basic_string[abi:ne180100]<0>(v13, "POSTURE");
  char v14 = 5;
  std::string::basic_string[abi:ne180100]<0>(v15, "LOW-Conf");
  char v16 = 3;
  std::string::basic_string[abi:ne180100]<0>(v17, "STD-DEV");
  char v18 = 4;
  std::string::basic_string[abi:ne180100]<0>(v19, "HWFoMs");
  char v20 = 6;
  std::string::basic_string[abi:ne180100]<0>(v21, "NOT_REACHED");
  std::unordered_map<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>::unordered_map((uint64_t)v6, (unsigned __int8 *)&v8, 7);
  for (uint64_t i = 0; i != -28; i -= 4)
  {
    if (SHIBYTE(v21[i + 2]) < 0) {
      operator delete((void *)v21[i]);
    }
  }
  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  if (std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::find<unsigned char>(v6, &v7))
  {
    long long v8 = &v7;
    std::string::size_type v4 = (const std::string *)std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::__unordered_map_hasher<Scandium::ScandiumPPG::channel_combination_ret_t,std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::hash<Scandium::ScandiumPPG::channel_combination_ret_t>,std::equal_to<Scandium::ScandiumPPG::channel_combination_ret_t>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::channel_combination_ret_t,std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::equal_to<Scandium::ScandiumPPG::channel_combination_ret_t>,std::hash<Scandium::ScandiumPPG::channel_combination_ret_t>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>>>::__emplace_unique_key_args<Scandium::ScandiumPPG::channel_combination_ret_t,std::piecewise_construct_t const&,std::tuple<Scandium::ScandiumPPG::channel_combination_ret_t const&>,std::tuple<>>((uint64_t)v6, &v7, (uint64_t)&std::piecewise_construct, &v8);
    std::string::operator=(a2, v4 + 1);
  }
  return std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::__unordered_map_hasher<Scandium::ScandiumPPG::channel_combination_ret_t,std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::hash<Scandium::ScandiumPPG::channel_combination_ret_t>,std::equal_to<Scandium::ScandiumPPG::channel_combination_ret_t>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::channel_combination_ret_t,std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::equal_to<Scandium::ScandiumPPG::channel_combination_ret_t>,std::hash<Scandium::ScandiumPPG::channel_combination_ret_t>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>>>::~__hash_table((uint64_t)v6);
}

void sub_25BA4B02C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::__unordered_map_hasher<Scandium::ScandiumPPG::channel_combination_ret_t,std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::hash<Scandium::ScandiumPPG::channel_combination_ret_t>,std::equal_to<Scandium::ScandiumPPG::channel_combination_ret_t>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::channel_combination_ret_t,std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::equal_to<Scandium::ScandiumPPG::channel_combination_ret_t>,std::hash<Scandium::ScandiumPPG::channel_combination_ret_t>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t Scandium::ScandiumPPG::scandium_channel_combination_t::combine_channels(std::string *a1, int a2, float *a3, float *a4, float *a5, int *a6, std::string *__str)
{
  Scandium *return_message;
  NSObject *log;
  std::string *v19;
  std::string *v20;
  int *v21;
  std::string::size_type v22;
  std::string::size_type v23;
  std::string::size_type size;
  unint64_t v25;
  unsigned char v27[40];
  void *__p[2];
  char v29;
  std::string v30;
  uint8_t buf[4];
  std::string *v32;
  __int16 v33;
  std::string *v34;
  int v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void v42[4];
  char v43;
  int v44;
  void v45[4];
  char v46;
  int v47;
  void v48[4];
  float v49;
  int v50;
  void v51[4];
  float v52;
  int v53;
  void v54[4];
  int v55;
  int v56;
  void v57[4];
  char v58;
  int v59;
  void v60[10];

  v60[9] = *MEMORY[0x263EF8340];
  Scandium::ScandiumPPG::scandium_channel_combination_t::init_module(a1, __str);
  *a3 = NAN;
  *a4 = NAN;
  *a5 = NAN;
  if (a2)
  {
    uint64_t v13 = Scandium::ScandiumPPG::scandium_channel_combination_t::combine_dl((Scandium::ScandiumPPG::scandium_channel_combination_t *)a1, a3, a4, a5);
    *(float *)&a1[24].__r_.__value_.__l.__data_ = *a5;
    if (a1[2].__r_.__value_.__s.__data_[0] && !*(unsigned char *)(a1[5].__r_.__value_.__r.__words[2] + 9))
    {
      *a3 = NAN;
      *a4 = NAN;
      uint64_t v13 = 1;
    }
    if (a1[2].__r_.__value_.__s.__data_[1] && !*(unsigned char *)(a1[5].__r_.__value_.__r.__words[2] + 8))
    {
      *a3 = NAN;
      *a4 = NAN;
      uint64_t v13 = 2;
    }
    else if (!v13)
    {
      float v14 = *a3;
      float v15 = *a4;
      if (*(_DWORD *)a1[5].__r_.__value_.__r.__words[2] == 2 && v14 < 85.0)
      {
        float v15 = v15
            * (float)(*(float *)&a1[1].__r_.__value_.__r.__words[2]
                    + (float)(*((float *)&a1[1].__r_.__value_.__r.__words[1] + 1) * v14));
        *a4 = v15;
      }
      *((float *)&a1[23].__r_.__value_.__r.__words[2] + 1) = v15;
      *(float *)&a1[23].__r_.__value_.__r.__words[2] = *a3;
      if (*a4 >= *(float *)&a1[1].__r_.__value_.__r.__words[1])
      {
        uint64_t v13 = 0;
      }
      else
      {
        *a3 = NAN;
        if (*a4 == 0.0)
        {
          uint64_t v13 = 4;
        }
        else if (*a4 == -1.0)
        {
          uint64_t v13 = 3;
        }
        else
        {
          uint64_t v13 = 5;
        }
      }
    }
  }
  else
  {
    uint64_t v13 = 0;
    *a3 = stats::mean((stats *)a1[6].__r_.__value_.__l.__size_, (const float *)((a1[6].__r_.__value_.__r.__words[2] - a1[6].__r_.__value_.__l.__size_) >> 2));
  }
  return_message = (Scandium *)Scandium::ScandiumPPG::scandium_channel_combination_t::get_return_message(v13, &v30);
  log = Scandium::algs_get_log(return_message);
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    long long v19 = a1;
    if (SHIBYTE(a1->__r_.__value_.__r.__words[2]) < 0) {
      long long v19 = (std::string *)a1->__r_.__value_.__r.__words[0];
    }
    char v20 = &v30;
    if ((v30.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      char v20 = (std::string *)v30.__r_.__value_.__r.__words[0];
    }
    *(_DWORD *)buf = 136315394;
    long long v32 = v19;
    long long v33 = 2080;
    int v34 = v20;
    _os_log_impl(&dword_25BA34000, log, OS_LOG_TYPE_DEFAULT, "scandium channel combination mode: %s result: %s", buf, 0x16u);
  }
  if (a1[25].__r_.__value_.__l.__size_)
  {
    std::string::basic_string[abi:ne180100]<0>(__p, "channel_combination");
    long long v21 = (int *)a1[5].__r_.__value_.__r.__words[2];
    std::string::basic_string[abi:ne180100]<0>(buf, "algs_mode");
    uint64_t v35 = *v21;
    unint64_t v36 = 1;
    std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::pair[abi:ne180100]<char const(&)[10],std::string&,0>((uint64_t)&v37, "comb_mode", (long long *)a1);
    std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::pair[abi:ne180100]<char const(&)[11],std::vector<float>&,0>((uint64_t)&v38, "input_spo2", (uint64_t)&a1[6].__r_.__value_.__l.__size_);
    std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::pair[abi:ne180100]<char const(&)[11],std::vector<float>&,0>((uint64_t)&v39, "input_conf", (uint64_t)&a1[7].__r_.__value_.__l.__size_);
    std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::pair[abi:ne180100]<char const(&)[13],std::vector<float>&,0>((uint64_t)&v40, "input_girpir", (uint64_t)&a1[8].__r_.__value_.__l.__size_);
    std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::pair[abi:ne180100]<char const(&)[15],std::vector<BOOL>&,0>((uint64_t)&v41, "input_valid_hw", (uint64_t)&a1[9].__r_.__value_.__l.__size_);
    id v22 = a1[5].__r_.__value_.__r.__words[2];
    std::string::basic_string[abi:ne180100]<0>(v42, "input_motion_flag");
    long long v43 = *(unsigned char *)(v22 + 9);
    long long v44 = 0;
    BOOL v23 = a1[5].__r_.__value_.__r.__words[2];
    std::string::basic_string[abi:ne180100]<0>(v45, "input_posture_flag");
    int v46 = *(unsigned char *)(v23 + 8);
    long long v47 = 0;
    std::string::basic_string[abi:ne180100]<0>(v48, "combined_spo2");
    long long v49 = *a3;
    int v50 = 3;
    std::string::basic_string[abi:ne180100]<0>(v51, "combined_conf");
    int v52 = *a4;
    unint64_t v53 = 3;
    std::string::basic_string[abi:ne180100]<0>(v54, "num_valid_channels");
    long long v55 = *a6;
    long long v56 = 1;
    std::string::basic_string[abi:ne180100]<0>(v57, "enable_metrics");
    uint64_t v58 = a2;
    unint64_t v59 = 0;
    std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::pair[abi:ne180100]<char const(&)[7],std::string&,0>((uint64_t)v60, "result", (long long *)&v30);
    std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::unordered_map((uint64_t)v27, buf, 13);
    size = a1[25].__r_.__value_.__l.__size_;
    if (!size) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    (*(void (**)(std::string::size_type, void **, unsigned char *))(*(void *)size + 48))(size, __p, v27);
    std::__hash_table<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>>>::~__hash_table((uint64_t)v27);
    long long v25 = 936;
    do
    {
      std::__variant_detail::__dtor<std::__variant_detail::__traits<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&__p[v25 / 8 + 1]);
      if ((char)v27[v25 + 39] < 0) {
        operator delete(*(void **)&v27[v25 + 16]);
      }
      v25 -= 72;
    }
    while (v25);
    if (v29 < 0) {
      operator delete(__p[0]);
    }
  }
  if (SHIBYTE(v30.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v30.__r_.__value_.__l.__data_);
  }
  return v13;
}

void sub_25BA4B55C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,char a27)
{
  for (uint64_t i = 864; i != -72; i -= 72)
    std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::~pair((uint64_t)(&a27 + i));
  if (a20 < 0) {
    operator delete(__p);
  }
  if (a26 < 0) {
    operator delete(a21);
  }
  _Unwind_Resume(a1);
}

uint64_t Scandium::ScandiumPPG::scandium_channel_combination_t::combine_dl(Scandium::ScandiumPPG::scandium_channel_combination_t *this, float *a2, float *a3, float *a4)
{
  long long v77 = 0;
  long long v78 = 0;
  uint64_t v79 = 0;
  std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v77, *((const void **)this + 19), *((void *)this + 20), (uint64_t)(*((void *)this + 20) - *((void *)this + 19)) >> 2);
  int v74 = 0;
  long long v75 = 0;
  uint64_t v76 = 0;
  std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v74, *((const void **)this + 22), *((void *)this + 23), (uint64_t)(*((void *)this + 23) - *((void *)this + 22)) >> 2);
  long long v71 = 0;
  long long v72 = 0;
  uint64_t v73 = 0;
  std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v71, *((const void **)this + 25), *((void *)this + 26), (uint64_t)(*((void *)this + 26) - *((void *)this + 25)) >> 2);
  unint64_t v8 = 0;
  uint64_t v9 = *((void *)this + 22);
  uint64_t v10 = *((void *)this + 19);
  int v11 = (float *)((char *)this + 504);
  uint64_t v12 = *((void *)this + 28);
  uint64_t v13 = *((void *)this + 25);
  do
  {
    int v14 = Scandium::ScandiumPPG::path_idx_to_type[v8];
    *(v11 - 6std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = *(float *)(v9 + 4 * v8);
    *(v11 - 48) = *(float *)(v10 + 4 * v8);
    if ((*(void *)(v12 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v8)) {
      float v15 = 1.0;
    }
    else {
      float v15 = 0.0;
    }
    *(v11 - 32) = v15;
    *int v11 = *(float *)(v13 + 4 * v8);
    float v16 = *(float *)(v9 + 4 * v8);
    if (v14 == 2) {
      BOOL v17 = v16 >= *((float *)this + 7);
    }
    else {
      BOOL v17 = v16 >= *((float *)this + 6);
    }
    *(v11 - 16) = (float)v17;
    ++v8;
    ++v11;
  }
  while (v8 != 16);
  unint64_t v61 = a4;
  int v62 = a3;
  float v63 = a2;
  uint64_t v18 = 0;
  float v19 = 0.0;
  float v20 = 0.0;
  do
  {
    char v70 = Scandium::ScandiumPPG::path_idx_to_type[v18];
    long long v21 = (float *)v77;
    float v22 = *((float *)v77 + v18);
    float v23 = 115.0;
    if (v22 <= 115.0) {
      float v23 = *((float *)v77 + v18);
    }
    if (v22 >= 50.0) {
      float v24 = v23;
    }
    else {
      float v24 = 50.0;
    }
    *((float *)v77 + v18) = v24;
    long long v25 = (float *)v74;
    __p = &v70;
    v25[v18] = *((float *)std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__emplace_unique_key_args<Scandium::ScandiumPPG::PathType,std::piecewise_construct_t const&,std::tuple<Scandium::ScandiumPPG::PathType const&>,std::tuple<>>((uint64_t)this + 56, (unsigned __int8 *)&v70, (uint64_t)&std::piecewise_construct, (unsigned char **)&__p)+ 5)* v25[v18];
    long long v26 = (float *)v71;
    if (v70 == 2)
    {
      *((_DWORD *)v71 + v18) = 1101004800;
      float v27 = 20.0;
    }
    else
    {
      float v27 = *((float *)v71 + v18);
    }
    float v28 = v27 / 25.0;
    if (v27 > 50.0) {
      float v28 = 2.0;
    }
    if (v27 >= -25.0) {
      float v29 = v28;
    }
    else {
      float v29 = -1.0;
    }
    v26[v18] = v29;
    float v30 = v25[v18]
        * (float)(1.0 / (float)(expf(-(float)(*((float *)this + 25) + (float)(*((float *)this + 24) * v29))) + 1.0));
    v25[v18] = v30;
    float v19 = v19 + (float)(v21[v18] * v30);
    float v20 = v20 + v30;
    ++v18;
  }
  while (v18 != 16);
  unint64_t v31 = 0;
  long long v32 = (float *)v77;
  long long v33 = (float *)v74;
  uint64_t v34 = *((void *)this + 28);
  float v35 = 0.0;
  float v36 = 0.0;
  do
  {
    if ((*(void *)(v34 + ((v31 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v31)) {
      float v37 = 1.0;
    }
    else {
      float v37 = 0.0;
    }
    double v38 = (float)((float)(v32[v31] - (float)((float)(v19 * 0.0625) / (float)(v20 * 0.0625))) / 15.0);
    float v39 = exp(v38 * v38 * *((float *)this + 26)) * v33[v31];
    float v40 = v37 * v39;
    v33[v31] = v40;
    float v36 = v36 + v40;
    float v35 = v35 + (float)(v32[v31++] * v40);
  }
  while (v31 != 16);
  float v41 = v36 * 0.0625;
  if ((float)(v36 * 0.0625) == 0.0)
  {
    uint64_t v42 = 0;
    *float v63 = NAN;
    *int v62 = 0.0;
    *unint64_t v61 = NAN;
  }
  else
  {
    *float v63 = (float)(v35 * 0.0625) / v41;
    double v43 = 0.0;
    if (v33 != v75)
    {
      long long v44 = v33;
      do
      {
        float v45 = *v44++;
        double v43 = v43 + v45;
      }
      while (v44 != v75);
    }
    __p = 0;
    int v68 = 0;
    uint64_t v69 = 0;
    std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&__p, v33, (uint64_t)v75, v75 - v33);
    int v64 = 0;
    long long v65 = 0;
    uint64_t v66 = 0;
    std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v64, v77, (uint64_t)v78, (v78 - (unsigned char *)v77) >> 2);
    int v46 = (float *)__p;
    long long v47 = v68;
    if (__p != v68)
    {
      long long v49 = (float *)__p;
      do
      {
        float v48 = v43;
        *long long v49 = *v49 / v48;
        ++v49;
      }
      while (v49 != v47);
    }
    int v50 = v64;
    float v51 = v65;
    if (v64 != v65)
    {
      int v52 = v64;
      do
      {
        *int v52 = (float)(*v52 - *v63) * (float)(*v52 - *v63);
        ++v52;
      }
      while (v52 != v51);
    }
    double v53 = 0.0;
    if (v46 != v47)
    {
      long long v54 = v50;
      long long v55 = v46;
      do
      {
        float v56 = *v55++;
        float v57 = v56;
        float v58 = *v54++;
        double v53 = v53 + (float)(v57 * v58);
      }
      while (v55 != v47);
    }
    float v59 = sqrt(v53);
    *unint64_t v61 = v59;
    if (*((float *)this + 11) <= v59)
    {
      *float v63 = NAN;
      *int v62 = -1.0;
      if (v50)
      {
        long long v65 = v50;
        operator delete(v50);
        int v46 = (float *)__p;
      }
      if (v46)
      {
        int v68 = v46;
        operator delete(v46);
      }
      uint64_t v42 = 3;
    }
    else
    {
      *int v62 = v41;
      if (v50)
      {
        long long v65 = v50;
        operator delete(v50);
        int v46 = (float *)__p;
      }
      if (v46)
      {
        int v68 = v46;
        operator delete(v46);
      }
      uint64_t v42 = 0;
    }
  }
  if (v71)
  {
    long long v72 = v71;
    operator delete(v71);
  }
  if (v74)
  {
    long long v75 = (float *)v74;
    operator delete(v74);
  }
  if (v77)
  {
    long long v78 = v77;
    operator delete(v77);
  }
  return v42;
}

void sub_25BA4BAFC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,uint64_t a24,void *a25,uint64_t a26)
{
  if (__p) {
    operator delete(__p);
  }
  if (a19) {
    operator delete(a19);
  }
  if (a22) {
    operator delete(a22);
  }
  if (a25) {
    operator delete(a25);
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
    unsigned __int8 v7 = (std::string *)this->__r_.__value_.__r.__words[0];
  }
  else
  {
    unsigned __int8 v7 = this;
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

void std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,void *> *>>(void *a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v6 = a1[1];
  if (!v6) {
    goto LABEL_9;
  }
  for (uint64_t i = 0; i != v6; *(void *)(*a1 + 8 * i++) = 0)
    ;
  unint64_t v8 = (uint64_t *)a1[2];
  a1[2] = 0;
  a1[3] = 0;
  if (v8)
  {
    while (a2 != a3)
    {
      unint64_t v9 = *((unsigned __int8 *)a2 + 16);
      *((unsigned char *)v8 + 16) = v9;
      *((_DWORD *)v8 + 5) = *((_DWORD *)a2 + 5);
      unint64_t v10 = (uint64_t *)*v8;
      v8[1] = v9;
      inserted = (void *)std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__node_insert_multi_prepare((uint64_t)a1, v9, (unsigned __int8 *)v8 + 16);
      std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__node_insert_multi_perform(a1, v8, inserted);
      a2 = (uint64_t *)*a2;
      unint64_t v8 = v10;
      if (!v10) {
        goto LABEL_9;
      }
    }
    do
    {
      uint64_t v12 = (uint64_t *)*v8;
      operator delete(v8);
      unint64_t v8 = v12;
    }
    while (v12);
  }
  else
  {
LABEL_9:
    while (a2 != a3)
    {
      std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__emplace_multi<std::pair<Scandium::ScandiumPPG::PathType const,float> const&>(a1, a2 + 2);
      a2 = (uint64_t *)*a2;
    }
  }
}

void sub_25BA4BD04(void *a1)
{
  __cxa_begin_catch(a1);
  do
  {
    uint64_t v2 = (void *)*v1;
    operator delete(v1);
    uint64_t v1 = v2;
  }
  while (v2);
  __cxa_rethrow();
}

void sub_25BA4BD24(_Unwind_Exception *a1)
{
}

uint64_t std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__node_insert_multi_prepare(uint64_t a1, unint64_t a2, unsigned __int8 *a3)
{
  unint64_t v6 = *(void *)(a1 + 8);
  float v7 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v8 = *(float *)(a1 + 32);
  if (!v6 || (float)(v8 * (float)v6) < v7)
  {
    uint64_t v9 = 2 * v6;
    BOOL v10 = v6 < 3 || (v6 & (v6 - 1)) != 0;
    size_t v11 = v10 | v9;
    unint64_t v12 = vcvtps_u32_f32(v7 / v8);
    if (v11 <= v12) {
      size_t v13 = v12;
    }
    else {
      size_t v13 = v11;
    }
    std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__rehash<false>(a1, v13);
    unint64_t v6 = *(void *)(a1 + 8);
  }
  uint8x8_t v14 = (uint8x8_t)vcnt_s8((int8x8_t)v6);
  v14.i16[0] = vaddlv_u8(v14);
  if (v14.u32[0] > 1uLL)
  {
    unint64_t v15 = a2;
    if (v6 <= a2) {
      unint64_t v15 = a2 % v6;
    }
  }
  else
  {
    unint64_t v15 = (v6 - 1) & a2;
  }
  uint64_t v16 = *(void *)(*(void *)a1 + 8 * v15);
  if (!v16) {
    return 0;
  }
  int v17 = 0;
  do
  {
    uint64_t result = v16;
    uint64_t v16 = *(void *)v16;
    if (!v16) {
      break;
    }
    unint64_t v19 = *(void *)(v16 + 8);
    if (v14.u32[0] > 1uLL)
    {
      unint64_t v20 = *(void *)(v16 + 8);
      if (v19 >= v6) {
        unint64_t v20 = v19 % v6;
      }
    }
    else
    {
      unint64_t v20 = v19 & (v6 - 1);
    }
    if (v20 != v15) {
      break;
    }
    BOOL v21 = v19 == a2 && *(unsigned __int8 *)(v16 + 16) == *a3;
    int v22 = v17 & !v21;
    v17 |= v21;
  }
  while (v22 != 1);
  return result;
}

void *std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__node_insert_multi_perform(void *result, void *a2, void *a3)
{
  int8x8_t v3 = (int8x8_t)result[1];
  unint64_t v4 = a2[1];
  uint8x8_t v5 = (uint8x8_t)vcnt_s8(v3);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    if (v4 >= *(void *)&v3) {
      v4 %= *(void *)&v3;
    }
  }
  else
  {
    v4 &= *(void *)&v3 - 1;
  }
  if (!a3)
  {
    *a2 = result[2];
    result[2] = a2;
    *(void *)(*result + 8 * vstd::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = result + 2;
    if (!*a2) {
      goto LABEL_19;
    }
    unint64_t v6 = *(void *)(*a2 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v6 >= *(void *)&v3) {
        v6 %= *(void *)&v3;
      }
    }
    else
    {
      v6 &= *(void *)&v3 - 1;
    }
LABEL_18:
    *(void *)(*result + 8 * v6) = a2;
    goto LABEL_19;
  }
  *a2 = *a3;
  *a3 = a2;
  if (*a2)
  {
    unint64_t v6 = *(void *)(*a2 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v6 >= *(void *)&v3) {
        v6 %= *(void *)&v3;
      }
    }
    else
    {
      v6 &= *(void *)&v3 - 1;
    }
    if (v6 != v4) {
      goto LABEL_18;
    }
  }
LABEL_19:
  ++result[3];
  return result;
}

void std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__rehash<false>(uint64_t a1, size_t __n)
{
  if (__n == 1)
  {
    size_t prime = 2;
  }
  else
  {
    size_t prime = __n;
    if ((__n & (__n - 1)) != 0) {
      size_t prime = std::__next_prime(__n);
    }
  }
  int8x8_t v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(void *)&v4) {
    goto LABEL_16;
  }
  if (prime < *(void *)&v4)
  {
    unint64_t v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      unint64_t v5 = std::__next_prime(v5);
    }
    else
    {
      uint64_t v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2) {
        unint64_t v5 = v7;
      }
    }
    if (prime <= v5) {
      size_t prime = v5;
    }
    if (prime < *(void *)&v4)
    {
LABEL_16:
      std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__do_rehash<false>(a1, prime);
    }
  }
}

void std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__do_rehash<false>(uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    if (a2 >> 61) {
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    int8x8_t v4 = operator new(8 * a2);
    unint64_t v5 = *(void **)a1;
    *(void *)a1 = v4;
    if (v5) {
      operator delete(v5);
    }
    uint64_t v6 = 0;
    *(void *)(a1 + 8) = a2;
    do
      *(void *)(*(void *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    uint64_t v7 = *(uint64_t ***)(a1 + 16);
    if (v7)
    {
      unint64_t v8 = (unint64_t)v7[1];
      uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2) {
          v8 %= a2;
        }
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v8) = a1 + 16;
      for (uint64_t i = *v7; *v7; uint64_t i = *v7)
      {
        unint64_t v12 = i[1];
        if (v9.u32[0] > 1uLL)
        {
          if (v12 >= a2) {
            v12 %= a2;
          }
        }
        else
        {
          v12 &= a2 - 1;
        }
        if (v12 == v8)
        {
          uint64_t v7 = (uint64_t **)i;
        }
        else
        {
          size_t v13 = i;
          if (*(void *)(*(void *)a1 + 8 * v12))
          {
            do
            {
              uint8x8_t v14 = v13;
              size_t v13 = (uint64_t *)*v13;
            }
            while (v13 && *((unsigned __int8 *)i + 16) == *((unsigned __int8 *)v13 + 16));
            *uint64_t v7 = v13;
            *uint8x8_t v14 = **(void **)(*(void *)a1 + 8 * v12);
            **(void **)(*(void *)a1 + 8 * v12) = i;
          }
          else
          {
            *(void *)(*(void *)a1 + 8 * v12) = v7;
            uint64_t v7 = (uint64_t **)i;
            unint64_t v8 = v12;
          }
        }
      }
    }
  }
  else
  {
    BOOL v10 = *(void **)a1;
    *(void *)a1 = 0;
    if (v10) {
      operator delete(v10);
    }
    *(void *)(a1 + 8) = 0;
  }
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__emplace_multi<std::pair<Scandium::ScandiumPPG::PathType const,float> const&>(void *a1, uint64_t *a2)
{
  int8x8_t v4 = (unsigned __int8 *)operator new(0x18uLL);
  uint64_t v5 = *a2;
  *((void *)v4 + 2) = *a2;
  *(void *)int8x8_t v4 = 0;
  *((void *)v4 + 1) = v5;
  inserted = (void *)std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__node_insert_multi_prepare((uint64_t)a1, v5, v4 + 16);
  std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__node_insert_multi_perform(a1, v4, inserted);
  return v4;
}

void sub_25BA4C244(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void std::vector<BOOL>::push_back(uint64_t a1, unsigned char *a2)
{
  unint64_t v4 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  if (v4 == v5 << 6)
  {
    if ((uint64_t)(v4 + 1) < 0) {
      std::vector<float>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v6 = v5 << 7;
    if (v6 <= (v4 & 0xFFFFFFFFFFFFFFC0) + 64) {
      unint64_t v6 = (v4 & 0xFFFFFFFFFFFFFFC0) + 64;
    }
    if (v4 <= 0x3FFFFFFFFFFFFFFELL) {
      unint64_t v7 = v6;
    }
    else {
      unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
    }
    std::vector<BOOL>::reserve((char **)a1, v7);
    unint64_t v4 = *(void *)(a1 + 8);
  }
  *(void *)(a1 + 8) = v4 + 1;
  unint64_t v8 = *(char **)a1;
  unint64_t v9 = v4 >> 6;
  uint64_t v10 = 1 << v4;
  if (*a2) {
    uint64_t v11 = *(void *)&v8[8 * v9] | v10;
  }
  else {
    uint64_t v11 = *(void *)&v8[8 * v9] & ~v10;
  }
  *(void *)&v8[8 * v9] = v11;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::array<float,16ul>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 58) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(a2 << 6);
}

uint64_t std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::pair[abi:ne180100]<char const(&)[10],std::string&,0>(uint64_t a1, char *a2, long long *a3)
{
  uint64_t v5 = (std::string *)(std::string::basic_string[abi:ne180100]<0>((void *)a1, a2) + 4);
  if (*((char *)a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v5, *(const std::string::value_type **)a3, *((void *)a3 + 1));
  }
  else
  {
    long long v6 = *a3;
    v5->__r_.__value_.__r.__words[2] = *((void *)a3 + 2);
    *(_OWORD *)&v5->__r_.__value_.__l.__data_ = v6;
  }
  *(_DWORD *)(a1 + 6std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = 5;
  return a1;
}

void sub_25BA4C394(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::pair[abi:ne180100]<char const(&)[11],std::vector<float>&,0>(uint64_t a1, char *a2, uint64_t a3)
{
  uint64_t v5 = std::string::basic_string[abi:ne180100]<0>((void *)a1, a2);
  v5[4] = 0;
  v5[5] = 0;
  v5 += 4;
  v5[2] = 0;
  std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(v5, *(const void **)a3, *(void *)(a3 + 8), (uint64_t)(*(void *)(a3 + 8) - *(void *)a3) >> 2);
  *(_DWORD *)(a1 + 56) = 3;
  *(_DWORD *)(a1 + 6std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = 6;
  return a1;
}

void sub_25BA4C404(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::pair[abi:ne180100]<char const(&)[13],std::vector<float>&,0>(uint64_t a1, char *a2, uint64_t a3)
{
  uint64_t v5 = std::string::basic_string[abi:ne180100]<0>((void *)a1, a2);
  v5[4] = 0;
  v5[5] = 0;
  v5 += 4;
  v5[2] = 0;
  std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(v5, *(const void **)a3, *(void *)(a3 + 8), (uint64_t)(*(void *)(a3 + 8) - *(void *)a3) >> 2);
  *(_DWORD *)(a1 + 56) = 3;
  *(_DWORD *)(a1 + 6std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = 6;
  return a1;
}

void sub_25BA4C474(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::pair[abi:ne180100]<char const(&)[15],std::vector<BOOL>&,0>(uint64_t a1, char *a2, uint64_t a3)
{
  uint64_t v5 = std::string::basic_string[abi:ne180100]<0>((void *)a1, a2);
  std::vector<BOOL>::vector(v5 + 4, a3);
  *(_DWORD *)(a1 + 56) = 0;
  *(_DWORD *)(a1 + 6std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = 6;
  return a1;
}

void sub_25BA4C4D4(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::pair[abi:ne180100]<char const(&)[7],std::string&,0>(uint64_t a1, char *a2, long long *a3)
{
  uint64_t v5 = (std::string *)(std::string::basic_string[abi:ne180100]<0>((void *)a1, a2) + 4);
  if (*((char *)a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v5, *(const std::string::value_type **)a3, *((void *)a3 + 1));
  }
  else
  {
    long long v6 = *a3;
    v5->__r_.__value_.__r.__words[2] = *((void *)a3 + 2);
    *(_OWORD *)&v5->__r_.__value_.__l.__data_ = v6;
  }
  *(_DWORD *)(a1 + 6std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = 5;
  return a1;
}

void sub_25BA4C54C(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__assign_unique<std::pair<Scandium::ScandiumPPG::PathType const,float> const*>(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a2;
  uint64_t v6 = a1[1];
  if (v6)
  {
    for (uint64_t i = 0; i != v6; ++i)
      *(void *)(*a1 + 8 * i) = 0;
    uint64_t v8 = a1[2];
    a1[2] = 0;
    a1[3] = 0;
    if (v8) {
      BOOL v9 = a2 == a3;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9)
    {
      uint64_t v10 = (void *)v8;
    }
    else
    {
      do
      {
        *(unsigned char *)(v8 + 16) = *(unsigned char *)v4;
        *(_DWORD *)(v8 + 20) = *(_DWORD *)(v4 + 4);
        uint64_t v10 = *(void **)v8;
        std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__node_insert_unique(a1, v8);
        v4 += 8;
        if (v10) {
          BOOL v11 = v4 == a3;
        }
        else {
          BOOL v11 = 1;
        }
        uint64_t v8 = (uint64_t)v10;
      }
      while (!v11);
    }
    if (v10)
    {
      do
      {
        unint64_t v12 = (void *)*v10;
        operator delete(v10);
        uint64_t v10 = v12;
      }
      while (v12);
    }
  }
  while (v4 != a3)
  {
    std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__emplace_unique_key_args<Scandium::ScandiumPPG::PathType,std::pair<Scandium::ScandiumPPG::PathType const,float> const&>((uint64_t)a1, (unsigned __int8 *)v4, (void *)v4);
    v4 += 8;
  }
}

void sub_25BA4C648(void *a1)
{
  __cxa_begin_catch(a1);
  do
  {
    uint64_t v2 = (void *)*v1;
    operator delete(v1);
    uint64_t v1 = v2;
  }
  while (v2);
  __cxa_rethrow();
}

void sub_25BA4C668(_Unwind_Exception *a1)
{
}

uint64_t **std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__node_insert_unique(void *a1, uint64_t a2)
{
  uint64_t v2 = (void *)a2;
  uint64_t v5 = (unsigned __int8 *)(a2 + 16);
  unint64_t v4 = *(unsigned __int8 *)(a2 + 16);
  *((void *)v5 - 1) = v4;
  uint64_t v6 = std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__node_insert_unique_prepare[abi:ne180100]((uint64_t)a1, v4, v5);
  if (v6) {
    return v6;
  }
  std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__node_insert_unique_perform[abi:ne180100](a1, v2);
  return (uint64_t **)v2;
}

uint64_t **std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__node_insert_unique_prepare[abi:ne180100](uint64_t a1, unint64_t a2, unsigned __int8 *a3)
{
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3)
  {
    uint8x8_t v4 = (uint8x8_t)vcnt_s8((int8x8_t)v3);
    v4.i16[0] = vaddlv_u8(v4);
    if (v4.u32[0] > 1uLL) {
      uint64_t v5 = v3 <= a2 ? a2 % v3 : a2;
    }
    else {
      uint64_t v5 = (v3 - 1) & a2;
    }
    uint64_t v6 = *(uint64_t ****)(*(void *)a1 + 8 * v5);
    if (v6)
    {
      for (uint64_t i = *v6; i; uint64_t i = (uint64_t **)*i)
      {
        unint64_t v8 = (unint64_t)i[1];
        if (v8 == a2)
        {
          if (*((unsigned __int8 *)i + 16) == *a3) {
            return i;
          }
        }
        else
        {
          if (v4.u32[0] > 1uLL)
          {
            if (v8 >= v3) {
              v8 %= v3;
            }
          }
          else
          {
            v8 &= v3 - 1;
          }
          if (v8 != v5) {
            break;
          }
        }
      }
    }
  }
  float v9 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v10 = *(float *)(a1 + 32);
  if (!v3 || (float)(v10 * (float)v3) < v9)
  {
    uint64_t v11 = 2 * v3;
    BOOL v12 = v3 < 3 || (v3 & (v3 - 1)) != 0;
    size_t v13 = v12 | v11;
    unint64_t v14 = vcvtps_u32_f32(v9 / v10);
    if (v13 <= v14) {
      size_t v15 = v14;
    }
    else {
      size_t v15 = v13;
    }
    std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::__rehash<true>(a1, v15);
  }
  return 0;
}

void *std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__node_insert_unique_perform[abi:ne180100](void *result, void *a2)
{
  int8x8_t v2 = (int8x8_t)result[1];
  unint64_t v3 = a2[1];
  uint8x8_t v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    if (v3 >= *(void *)&v2) {
      v3 %= *(void *)&v2;
    }
  }
  else
  {
    v3 &= *(void *)&v2 - 1;
  }
  uint64_t v5 = *(void **)(*result + 8 * v3);
  if (v5)
  {
    *a2 = *v5;
LABEL_13:
    *uint64_t v5 = a2;
    goto LABEL_14;
  }
  *a2 = result[2];
  result[2] = a2;
  *(void *)(*result + 8 * v3) = result + 2;
  if (*a2)
  {
    unint64_t v6 = *(void *)(*a2 + 8);
    if (v4.u32[0] > 1uLL)
    {
      if (v6 >= *(void *)&v2) {
        v6 %= *(void *)&v2;
      }
    }
    else
    {
      v6 &= *(void *)&v2 - 1;
    }
    uint64_t v5 = (void *)(*result + 8 * v6);
    goto LABEL_13;
  }
LABEL_14:
  ++result[3];
  return result;
}

void *std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__emplace_unique_key_args<Scandium::ScandiumPPG::PathType,std::pair<Scandium::ScandiumPPG::PathType const,float> const&>(uint64_t a1, unsigned __int8 *a2, void *a3)
{
  unint64_t v6 = *a2;
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v3 = *a2;
      if (v7 <= v6) {
        unint64_t v3 = v6 % v7;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }
    float v9 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v9)
    {
      float v10 = *v9;
      if (*v9)
      {
        do
        {
          unint64_t v11 = v10[1];
          if (v11 == v6)
          {
            if (*((unsigned __int8 *)v10 + 16) == v6) {
              return v10;
            }
          }
          else
          {
            if (v8.u32[0] > 1uLL)
            {
              if (v11 >= v7) {
                v11 %= v7;
              }
            }
            else
            {
              v11 &= v7 - 1;
            }
            if (v11 != v3) {
              break;
            }
          }
          float v10 = (void *)*v10;
        }
        while (v10);
      }
    }
  }
  float v10 = operator new(0x18uLL);
  *float v10 = 0;
  v10[1] = v6;
  v10[2] = *a3;
  float v12 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    BOOL v14 = 1;
    if (v7 >= 3) {
      BOOL v14 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v15 = v14 | (2 * v7);
    unint64_t v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16) {
      size_t v17 = v16;
    }
    else {
      size_t v17 = v15;
    }
    std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::__rehash<true>(a1, v17);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= v6) {
        unint64_t v3 = v6 % v7;
      }
      else {
        unint64_t v3 = v6;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }
  }
  uint64_t v18 = *(void *)a1;
  unint64_t v19 = *(void **)(*(void *)a1 + 8 * v3);
  if (v19)
  {
    *float v10 = *v19;
LABEL_38:
    *unint64_t v19 = v10;
    goto LABEL_39;
  }
  *float v10 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v10;
  *(void *)(v18 + 8 * v3) = a1 + 16;
  if (*v10)
  {
    unint64_t v20 = *(void *)(*v10 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v20 >= v7) {
        v20 %= v7;
      }
    }
    else
    {
      v20 &= v7 - 1;
    }
    unint64_t v19 = (void *)(*(void *)a1 + 8 * v20);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return v10;
}

void sub_25BA4CAB0(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t std::unordered_map<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>::unordered_map(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = 1065353216;
  if (a3)
  {
    uint64_t v5 = 32 * a3;
    do
    {
      std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::__unordered_map_hasher<Scandium::ScandiumPPG::channel_combination_ret_t,std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::hash<Scandium::ScandiumPPG::channel_combination_ret_t>,std::equal_to<Scandium::ScandiumPPG::channel_combination_ret_t>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::channel_combination_ret_t,std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::equal_to<Scandium::ScandiumPPG::channel_combination_ret_t>,std::hash<Scandium::ScandiumPPG::channel_combination_ret_t>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>>>::__emplace_unique_key_args<Scandium::ScandiumPPG::channel_combination_ret_t,std::pair<Scandium::ScandiumPPG::channel_combination_ret_t const,std::string> const&>(a1, a2, (uint64_t)a2);
      a2 += 32;
      v5 -= 32;
    }
    while (v5);
  }
  return a1;
}

void sub_25BA4CB28(_Unwind_Exception *a1)
{
  std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::__unordered_map_hasher<Scandium::ScandiumPPG::channel_combination_ret_t,std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::hash<Scandium::ScandiumPPG::channel_combination_ret_t>,std::equal_to<Scandium::ScandiumPPG::channel_combination_ret_t>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::channel_combination_ret_t,std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::equal_to<Scandium::ScandiumPPG::channel_combination_ret_t>,std::hash<Scandium::ScandiumPPG::channel_combination_ret_t>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

uint64_t **std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::__unordered_map_hasher<Scandium::ScandiumPPG::channel_combination_ret_t,std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::hash<Scandium::ScandiumPPG::channel_combination_ret_t>,std::equal_to<Scandium::ScandiumPPG::channel_combination_ret_t>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::channel_combination_ret_t,std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::equal_to<Scandium::ScandiumPPG::channel_combination_ret_t>,std::hash<Scandium::ScandiumPPG::channel_combination_ret_t>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>>>::__emplace_unique_key_args<Scandium::ScandiumPPG::channel_combination_ret_t,std::pair<Scandium::ScandiumPPG::channel_combination_ret_t const,std::string> const&>(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  unint64_t v5 = *a2;
  unint64_t v6 = *(void *)(a1 + 8);
  if (v6)
  {
    uint8x8_t v7 = (uint8x8_t)vcnt_s8((int8x8_t)v6);
    v7.i16[0] = vaddlv_u8(v7);
    if (v7.u32[0] > 1uLL)
    {
      unint64_t v3 = *a2;
      if (v6 <= v5) {
        unint64_t v3 = v5 % v6;
      }
    }
    else
    {
      unint64_t v3 = (v6 - 1) & v5;
    }
    uint8x8_t v8 = *(uint64_t ****)(*(void *)a1 + 8 * v3);
    if (v8)
    {
      for (uint64_t result = *v8; result; uint64_t result = (uint64_t **)*result)
      {
        unint64_t v10 = (unint64_t)result[1];
        if (v10 == v5)
        {
          if (*((unsigned __int8 *)result + 16) == v5) {
            return result;
          }
        }
        else
        {
          if (v7.u32[0] > 1uLL)
          {
            if (v10 >= v6) {
              v10 %= v6;
            }
          }
          else
          {
            v10 &= v6 - 1;
          }
          if (v10 != v3) {
            break;
          }
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::__unordered_map_hasher<Scandium::ScandiumPPG::channel_combination_ret_t,std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::hash<Scandium::ScandiumPPG::channel_combination_ret_t>,std::equal_to<Scandium::ScandiumPPG::channel_combination_ret_t>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::channel_combination_ret_t,std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::equal_to<Scandium::ScandiumPPG::channel_combination_ret_t>,std::hash<Scandium::ScandiumPPG::channel_combination_ret_t>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>>>::__construct_node_hash<std::pair<Scandium::ScandiumPPG::channel_combination_ret_t const,std::string> const&>(a1, *a2, a3, (uint64_t)v19);
  float v11 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v12 = *(float *)(a1 + 32);
  if (!v6 || (float)(v12 * (float)v6) < v11)
  {
    BOOL v13 = 1;
    if (v6 >= 3) {
      BOOL v13 = (v6 & (v6 - 1)) != 0;
    }
    unint64_t v14 = v13 | (2 * v6);
    unint64_t v15 = vcvtps_u32_f32(v11 / v12);
    if (v14 <= v15) {
      size_t v16 = v15;
    }
    else {
      size_t v16 = v14;
    }
    std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::__rehash<true>(a1, v16);
    unint64_t v6 = *(void *)(a1 + 8);
    if ((v6 & (v6 - 1)) != 0)
    {
      if (v6 <= v5) {
        unint64_t v3 = v5 % v6;
      }
      else {
        unint64_t v3 = v5;
      }
    }
    else
    {
      unint64_t v3 = (v6 - 1) & v5;
    }
  }
  size_t v17 = *(void **)(*(void *)a1 + 8 * v3);
  if (v17)
  {
    *(void *)v19[0] = *v17;
    void *v17 = v19[0];
  }
  else
  {
    *(void *)v19[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v19[0];
    *(void *)(*(void *)a1 + 8 * v3) = a1 + 16;
    if (*(void *)v19[0])
    {
      unint64_t v18 = *(void *)(*(void *)v19[0] + 8);
      if ((v6 & (v6 - 1)) != 0)
      {
        if (v18 >= v6) {
          v18 %= v6;
        }
      }
      else
      {
        v18 &= v6 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v18) = v19[0];
    }
  }
  uint64_t result = (uint64_t **)v19[0];
  ++*(void *)(a1 + 24);
  return result;
}

void sub_25BA4CD54(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **__p, uint64_t a11)
{
  if (__p) {
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,void *>>>::operator()[abi:ne180100]((uint64_t)&a11, __p);
  }
  _Unwind_Resume(exception_object);
}

void std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::__unordered_map_hasher<Scandium::ScandiumPPG::channel_combination_ret_t,std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::hash<Scandium::ScandiumPPG::channel_combination_ret_t>,std::equal_to<Scandium::ScandiumPPG::channel_combination_ret_t>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::channel_combination_ret_t,std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::equal_to<Scandium::ScandiumPPG::channel_combination_ret_t>,std::hash<Scandium::ScandiumPPG::channel_combination_ret_t>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>>>::__construct_node_hash<std::pair<Scandium::ScandiumPPG::channel_combination_ret_t const,std::string> const&>(uint64_t a1@<X0>, std::string::size_type a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7 = a1 + 16;
  uint8x8_t v8 = (std::string *)operator new(0x30uLL);
  *(void *)a4 = v8;
  *(void *)(a4 + 8) = v7;
  *(unsigned char *)(a4 + 16) = 0;
  v8->__r_.__value_.__r.__words[0] = 0;
  v8->__r_.__value_.__l.__size_ = a2;
  v8->__r_.__value_.__s.__data_[16] = *(unsigned char *)a3;
  float v9 = v8 + 1;
  if (*(char *)(a3 + 31) < 0)
  {
    std::string::__init_copy_ctor_external(v9, *(const std::string::value_type **)(a3 + 8), *(void *)(a3 + 16));
  }
  else
  {
    *(_OWORD *)&v9->__r_.__value_.__l.__data_ = *(_OWORD *)(a3 + 8);
    v9->__r_.__value_.__r.__words[2] = *(void *)(a3 + 24);
  }
  *(unsigned char *)(a4 + 16) = 1;
}

void sub_25BA4CE10(_Unwind_Exception *a1)
{
  *uint64_t v1 = 0;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,void *>>>::operator()[abi:ne180100](uint64_t a1, void **__p)
{
  if (*(unsigned char *)(a1 + 8))
  {
    if (*((char *)__p + 47) < 0) {
      operator delete(__p[3]);
    }
  }
  else if (!__p)
  {
    return;
  }
  operator delete(__p);
}

uint64_t std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::__unordered_map_hasher<Scandium::ScandiumPPG::channel_combination_ret_t,std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::hash<Scandium::ScandiumPPG::channel_combination_ret_t>,std::equal_to<Scandium::ScandiumPPG::channel_combination_ret_t>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::channel_combination_ret_t,std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::equal_to<Scandium::ScandiumPPG::channel_combination_ret_t>,std::hash<Scandium::ScandiumPPG::channel_combination_ret_t>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>>>::~__hash_table(uint64_t a1)
{
  std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::__unordered_map_hasher<Scandium::ScandiumPPG::channel_combination_ret_t,std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::hash<Scandium::ScandiumPPG::channel_combination_ret_t>,std::equal_to<Scandium::ScandiumPPG::channel_combination_ret_t>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::channel_combination_ret_t,std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::equal_to<Scandium::ScandiumPPG::channel_combination_ret_t>,std::hash<Scandium::ScandiumPPG::channel_combination_ret_t>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>>>::__deallocate_node(a1, *(void ***)(a1 + 16));
  int8x8_t v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::__unordered_map_hasher<Scandium::ScandiumPPG::channel_combination_ret_t,std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::hash<Scandium::ScandiumPPG::channel_combination_ret_t>,std::equal_to<Scandium::ScandiumPPG::channel_combination_ret_t>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::channel_combination_ret_t,std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::equal_to<Scandium::ScandiumPPG::channel_combination_ret_t>,std::hash<Scandium::ScandiumPPG::channel_combination_ret_t>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>>>::__deallocate_node(int a1, void **__p)
{
  if (__p)
  {
    int8x8_t v2 = __p;
    do
    {
      uint64_t v3 = (void **)*v2;
      if (*((char *)v2 + 47) < 0) {
        operator delete(v2[3]);
      }
      operator delete(v2);
      int8x8_t v2 = v3;
    }
    while (v3);
  }
}

void *std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::__unordered_map_hasher<Scandium::ScandiumPPG::channel_combination_ret_t,std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::hash<Scandium::ScandiumPPG::channel_combination_ret_t>,std::equal_to<Scandium::ScandiumPPG::channel_combination_ret_t>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::channel_combination_ret_t,std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::equal_to<Scandium::ScandiumPPG::channel_combination_ret_t>,std::hash<Scandium::ScandiumPPG::channel_combination_ret_t>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>>>::__emplace_unique_key_args<Scandium::ScandiumPPG::channel_combination_ret_t,std::piecewise_construct_t const&,std::tuple<Scandium::ScandiumPPG::channel_combination_ret_t const&>,std::tuple<>>(uint64_t a1, unsigned __int8 *a2, uint64_t a3, unsigned char **a4)
{
  unint64_t v7 = *a2;
  unint64_t v8 = *(void *)(a1 + 8);
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v8 <= v7) {
        unint64_t v4 = v7 % v8;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
    unint64_t v10 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v10)
    {
      float v11 = *v10;
      if (*v10)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v12 == v7)
          {
            if (*((unsigned __int8 *)v11 + 16) == v7) {
              return v11;
            }
          }
          else
          {
            if (v9.u32[0] > 1uLL)
            {
              if (v12 >= v8) {
                v12 %= v8;
              }
            }
            else
            {
              v12 &= v8 - 1;
            }
            if (v12 != v4) {
              break;
            }
          }
          float v11 = (void *)*v11;
        }
        while (v11);
      }
    }
  }
  BOOL v13 = (void *)(a1 + 16);
  float v11 = operator new(0x30uLL);
  *float v11 = 0;
  v11[1] = v7;
  *((unsigned char *)v11 + 16) = **a4;
  v11[4] = 0;
  v11[5] = 0;
  void v11[3] = 0;
  float v14 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v15 = *(float *)(a1 + 32);
  if (!v8 || (float)(v15 * (float)v8) < v14)
  {
    BOOL v16 = 1;
    if (v8 >= 3) {
      BOOL v16 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v17 = v16 | (2 * v8);
    unint64_t v18 = vcvtps_u32_f32(v14 / v15);
    if (v17 <= v18) {
      size_t v19 = v18;
    }
    else {
      size_t v19 = v17;
    }
    std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::__rehash<true>(a1, v19);
    unint64_t v8 = *(void *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v8 <= v7) {
        unint64_t v4 = v7 % v8;
      }
      else {
        unint64_t v4 = v7;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
  }
  uint64_t v20 = *(void *)a1;
  BOOL v21 = *(void **)(*(void *)a1 + 8 * v4);
  if (v21)
  {
    *float v11 = *v21;
LABEL_38:
    *BOOL v21 = v11;
    goto LABEL_39;
  }
  *float v11 = *v13;
  *BOOL v13 = v11;
  *(void *)(v20 + 8 * vstd::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = v13;
  if (*v11)
  {
    unint64_t v22 = *(void *)(*v11 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v22 >= v8) {
        v22 %= v8;
      }
    }
    else
    {
      v22 &= v8 - 1;
    }
    BOOL v21 = (void *)(*(void *)a1 + 8 * v22);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return v11;
}

void sub_25BA4D150(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,void *>>>::operator()[abi:ne180100](v11, v10);
  _Unwind_Resume(a1);
}

void *std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__emplace_unique_key_args<Scandium::ScandiumPPG::PathType,std::piecewise_construct_t const&,std::tuple<Scandium::ScandiumPPG::PathType const&>,std::tuple<>>(uint64_t a1, unsigned __int8 *a2, uint64_t a3, unsigned char **a4)
{
  unint64_t v7 = *a2;
  unint64_t v8 = *(void *)(a1 + 8);
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v8 <= v7) {
        unint64_t v4 = v7 % v8;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
    unint64_t v10 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v10)
    {
      uint64_t v11 = *v10;
      if (*v10)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v12 == v7)
          {
            if (*((unsigned __int8 *)v11 + 16) == v7) {
              return v11;
            }
          }
          else
          {
            if (v9.u32[0] > 1uLL)
            {
              if (v12 >= v8) {
                v12 %= v8;
              }
            }
            else
            {
              v12 &= v8 - 1;
            }
            if (v12 != v4) {
              break;
            }
          }
          uint64_t v11 = (void *)*v11;
        }
        while (v11);
      }
    }
  }
  uint64_t v11 = operator new(0x18uLL);
  *uint64_t v11 = 0;
  v11[1] = v7;
  *((unsigned char *)v11 + 16) = **a4;
  *((_DWORD *)v11 + 5) = 0;
  float v13 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v14 = *(float *)(a1 + 32);
  if (!v8 || (float)(v14 * (float)v8) < v13)
  {
    BOOL v15 = 1;
    if (v8 >= 3) {
      BOOL v15 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v16 = v15 | (2 * v8);
    unint64_t v17 = vcvtps_u32_f32(v13 / v14);
    if (v16 <= v17) {
      size_t v18 = v17;
    }
    else {
      size_t v18 = v16;
    }
    std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::__rehash<true>(a1, v18);
    unint64_t v8 = *(void *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v8 <= v7) {
        unint64_t v4 = v7 % v8;
      }
      else {
        unint64_t v4 = v7;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
  }
  uint64_t v19 = *(void *)a1;
  uint64_t v20 = *(void **)(*(void *)a1 + 8 * v4);
  if (v20)
  {
    *uint64_t v11 = *v20;
LABEL_38:
    *uint64_t v20 = v11;
    goto LABEL_39;
  }
  *uint64_t v11 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v11;
  *(void *)(v19 + 8 * vstd::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = a1 + 16;
  if (*v11)
  {
    unint64_t v21 = *(void *)(*v11 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v21 >= v8) {
        v21 %= v8;
      }
    }
    else
    {
      v21 &= v8 - 1;
    }
    uint64_t v20 = (void *)(*(void *)a1 + 8 * v21);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return v11;
}

void sub_25BA4D380(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void Scandium::ScandiumPPG::calc_ppg_ac_metrics(Scandium::ScandiumPPG *this, const float *a2, float *a3, float *a4, float *a5)
{
  signed int v7 = (int)a2;
  uint8x8_t v9 = (void **)iirSOS_new(6, (uint64_t)&Scandium::ScandiumPPG::dsc_bpf_coeff_64);
  if (iirSOS_init((uint64_t)v9)) {
    goto LABEL_59;
  }
  long long v49 = 0;
  int v50 = 0;
  uint64_t v51 = 0;
  std::vector<float>::__init_with_size[abi:ne180100]<float const*,float const*>(&v49, this, (uint64_t)this + 4 * v7, v7);
  std::vector<float>::vector(v48, v7);
  __p = 0;
  int v46 = 0;
  long long v47 = 0;
  uint64_t v42 = 0;
  double v43 = 0;
  long long v44 = 0;
  iirSOS_process((uint64_t)v9, (float *)v49, (float *)v48[0], v7);
  if (v7 < 1) {
    goto LABEL_50;
  }
  float v40 = a4;
  float v41 = a3;
  uint64_t v10 = 0;
  float v11 = 0.0;
  float v12 = 0.0;
  float v13 = 0.0;
  float v14 = 0.0;
  do
  {
    float v15 = v14;
    float v14 = v13;
    float v13 = *((float *)v48[0] + v10);
    BOOL v16 = v13 <= v14 || v15 <= v14;
    if (v15 < v14 && v14 > v13)
    {
      size_t v18 = v46;
      if (v46 >= v47)
      {
        uint64_t v20 = (float *)__p;
        uint64_t v21 = ((char *)v46 - (unsigned char *)__p) >> 2;
        unint64_t v22 = v21 + 1;
        if ((unint64_t)(v21 + 1) >> 62) {
          goto LABEL_62;
        }
        uint64_t v23 = (char *)v47 - (unsigned char *)__p;
        if (((char *)v47 - (unsigned char *)__p) >> 1 > v22) {
          unint64_t v22 = v23 >> 1;
        }
        if ((unint64_t)v23 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v24 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v24 = v22;
        }
        if (v24)
        {
          long long v25 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v47, v24);
          uint64_t v20 = (float *)__p;
          size_t v18 = v46;
        }
        else
        {
          long long v25 = 0;
        }
        long long v26 = (float *)&v25[4 * v21];
        float *v26 = v14;
        uint64_t v19 = v26 + 1;
        while (v18 != v20)
        {
          int v27 = *((_DWORD *)v18-- - 1);
          *((_DWORD *)v26-- - 1) = v27;
        }
        __p = v26;
        int v46 = v19;
        long long v47 = (float *)&v25[4 * v24];
        if (v20) {
          operator delete(v20);
        }
      }
      else
      {
        *int v46 = v14;
        uint64_t v19 = v18 + 1;
      }
      int v46 = v19;
    }
    if (!v16)
    {
      float v28 = v43;
      if (v43 >= v44)
      {
        float v30 = v42;
        uint64_t v31 = ((char *)v43 - (char *)v42) >> 2;
        unint64_t v32 = v31 + 1;
        if ((unint64_t)(v31 + 1) >> 62) {
LABEL_62:
        }
          std::vector<float>::__throw_length_error[abi:ne180100]();
        uint64_t v33 = (char *)v44 - (char *)v42;
        if (((char *)v44 - (char *)v42) >> 1 > v32) {
          unint64_t v32 = v33 >> 1;
        }
        if ((unint64_t)v33 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v34 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v34 = v32;
        }
        if (v34)
        {
          float v35 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v44, v34);
          float v30 = v42;
          float v28 = v43;
        }
        else
        {
          float v35 = 0;
        }
        float v36 = (float *)&v35[4 * v31];
        *float v36 = v14;
        float v29 = v36 + 1;
        while (v28 != (float *)v30)
        {
          int v37 = *((_DWORD *)v28-- - 1);
          *((_DWORD *)v36-- - 1) = v37;
        }
        uint64_t v42 = (Scandium *)v36;
        long long v44 = (float *)&v35[4 * v34];
        if (v30) {
          operator delete(v30);
        }
      }
      else
      {
        *double v43 = v14;
        float v29 = v43 + 1;
      }
      double v43 = v29;
    }
    float v12 = v12 + v13;
    float v11 = v11 + (float)(v13 * v13);
    ++v10;
  }
  while (v10 != v7);
  *float v40 = sqrtf(fabsf((float)(v11 / (float)v7) - (float)((float)(v12 / (float)v7) * (float)(v12 / (float)v7))));
  if (v46 == __p) {
    goto LABEL_50;
  }
  double v38 = v42;
  if (v43 != (float *)v42)
  {
    float v39 = Scandium::sort_median((Scandium *)__p, (const float *)((unint64_t)((char *)v46 - (unsigned char *)__p) >> 2));
    *float v41 = v39 - Scandium::sort_median(v42, (const float *)((unint64_t)((char *)v43 - (char *)v42) >> 2));
LABEL_50:
    double v38 = v42;
  }
  if (v38) {
    operator delete(v38);
  }
  if (__p)
  {
    int v46 = (float *)__p;
    operator delete(__p);
  }
  if (v48[0])
  {
    v48[1] = v48[0];
    operator delete(v48[0]);
  }
  if (v49)
  {
    int v50 = v49;
    operator delete(v49);
  }
LABEL_59:
  if (v9) {
    iirSOS_delete(v9);
  }
}

void sub_25BA4D6DC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, void *__p,uint64_t a21)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void Scandium::ScandiumPPG::calc_session_mavs(Scandium::ScandiumPPG *this@<X0>, float **a2@<X1>, int a3@<W2>, float **a4@<X8>)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = 0;
  if ((int)a2 >= 64)
  {
    signed int v7 = 0;
    uint64_t v8 = 0;
    uint8x8_t v9 = a4 + 2;
    uint64_t v10 = (a2 - 63);
    uint64_t v11 = a3;
    do
    {
      if ((v8 & 0x1F) == 0)
      {
        float v12 = 0.0;
        if (a3 >= 1)
        {
          uint64_t v13 = v11;
          float v14 = this;
          do
          {
            float v15 = stats::variance((stats *)(*(void *)v14 + 4 * v8), (const float *)0x40, 0);
            if (v15 > v12) {
              float v12 = v15;
            }
            float v14 = (Scandium::ScandiumPPG *)((char *)v14 + 8);
            --v13;
          }
          while (v13);
          signed int v7 = a4[1];
        }
        if ((unint64_t)v7 >= *v9)
        {
          unint64_t v17 = *a4;
          uint64_t v18 = v7 - *a4;
          unint64_t v19 = v18 + 1;
          if ((unint64_t)(v18 + 1) >> 62) {
            std::vector<float>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v20 = *v9 - (void)v17;
          if (v20 >> 1 > v19) {
            unint64_t v19 = v20 >> 1;
          }
          if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v21 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v21 = v19;
          }
          if (v21)
          {
            unint64_t v22 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)v9, v21);
            unint64_t v17 = *a4;
            signed int v7 = a4[1];
          }
          else
          {
            unint64_t v22 = 0;
          }
          uint64_t v23 = (float *)&v22[4 * v18];
          *uint64_t v23 = v12;
          BOOL v16 = v23 + 1;
          while (v7 != v17)
          {
            int v24 = *((_DWORD *)v7-- - 1);
            *((_DWORD *)v23-- - 1) = v24;
          }
          *a4 = v23;
          a4[1] = v16;
          a4[2] = (float *)&v22[4 * v21];
          if (v17) {
            operator delete(v17);
          }
        }
        else
        {
          *signed int v7 = v12;
          BOOL v16 = v7 + 1;
        }
        a4[1] = v16;
        signed int v7 = v16;
      }
      ++v8;
    }
    while (v8 != v10);
  }
}

void sub_25BA4D8B4(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void Scandium::ScandiumPPG::scandium_spo2_monitor_t::scandium_spo2_monitor_t(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  buf[17] = *MEMORY[0x263EF8340];
  *a1 = 0;
  LODWORD(buf[0]) = 0;
  std::string::basic_string[abi:ne180100]<0>(&buf[1], "Unknown");
  LODWORD(buf[4]) = 1;
  std::string::basic_string[abi:ne180100]<0>(&buf[5], "3.0");
  LODWORD(buf[8]) = 2;
  std::string::basic_string[abi:ne180100]<0>(&buf[9], "3.5");
  LODWORD(buf[12]) = 3;
  std::string::basic_string[abi:ne180100]<0>(&buf[13], "3.75");
  std::unordered_map<Scandium::sc_optical_gen_e,std::string>::unordered_map((uint64_t)v19, (int *)buf, 4);
  uint64_t v8 = 0;
  while (1)
  {
    if (SHIBYTE(buf[v8 + 15]) < 0) {
      operator delete((void *)buf[v8 + 13]);
    }
    v8 -= 4;
    if (v8 == -16)
    {
      optical_gen = (Scandium *)Scandium::find_optical_gen((unsigned __int8 **)a2);
      int v18 = (int)optical_gen;
      if (v19[3] == 4)
      {
        log = Scandium::algs_get_log(optical_gen);
        BOOL v11 = os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT);
        if (v11)
        {
          if (*(char *)(a2 + 23) >= 0) {
            float v12 = (unsigned __int8 *)a2;
          }
          else {
            float v12 = *(unsigned __int8 **)a2;
          }
          uint64_t v13 = std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::find<int>(v19, &v18);
          if (!v13) {
            std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
          }
          float v14 = v13 + 3;
          if (*((char *)v13 + 47) < 0) {
            float v14 = (void *)*v14;
          }
          LODWORD(buf[0]) = 136315394;
          *(void *)((char *)buf + std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = v12;
          WORD2(buf[1]) = 2080;
          *(void *)((char *)&buf[1] + 6) = v14;
          _os_log_impl(&dword_25BA34000, log, OS_LOG_TYPE_DEFAULT, "Scandium HW Model: %s, Opt Gen: %s", (uint8_t *)buf, 0x16u);
        }
        if (!v18 && *(void *)(a5 + 24))
        {
          float v15 = Scandium::algs_get_log((Scandium *)v11);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(buf[0]) = 0;
            _os_log_impl(&dword_25BA34000, v15, OS_LOG_TYPE_DEFAULT, "scandium abort handler invalid hw", (uint8_t *)buf, 2u);
          }
          std::function<void ()(Scandium::AbortReason)>::operator()(a5, 8);
        }
        uint64_t v16 = *(unsigned int *)(a3 + 116);
        if (v16 != -1)
        {
          buf[0] = &v17;
          ((void (*)(void *, uint64_t))off_2709337B8[v16])(buf, a3);
          memset(buf, 0, 115);
          Scandium::convert_legacy_start_pkt(a3, (uint64_t)buf);
          operator new();
        }
        std::__throw_bad_variant_access[abi:ne180100]();
      }
      __assert_rtn("scandium_spo2_monitor_t", "scandium_spo2_processor.cpp", 39, "opt_gen_log.size() == static_cast<size_t>(sc_optical_gen_e::num)");
    }
  }
}

void sub_25BA4DC58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::__unordered_map_hasher<Scandium::ScandiumPPG::channel_combination_ret_t,std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::hash<Scandium::ScandiumPPG::channel_combination_ret_t>,std::equal_to<Scandium::ScandiumPPG::channel_combination_ret_t>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::channel_combination_ret_t,std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::equal_to<Scandium::ScandiumPPG::channel_combination_ret_t>,std::hash<Scandium::ScandiumPPG::channel_combination_ret_t>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>>>::~__hash_table((uint64_t)va);
  std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_processor_t>::reset[abi:ne180100](v4, 0);
  _Unwind_Resume(a1);
}

id **std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_processor_t>::reset[abi:ne180100](id ***a1, id **a2)
{
  uint64_t result = *a1;
  *a1 = a2;
  if (result)
  {
    Scandium::ScandiumPPG::scandium_spo2_processor_t::~scandium_spo2_processor_t(result);
    JUMPOUT(0x26116E390);
  }
  return result;
}

void Scandium::ScandiumPPG::scandium_spo2_monitor_t::~scandium_spo2_monitor_t(id ***this)
{
}

void *Scandium::ScandiumPPG::scandium_spo2_processor_t::reset(Scandium::ScandiumPPG::scandium_spo2_processor_t *this)
{
  Scandium::ScandiumPPG::scandium_beat_detection_t::scandium_beat_detection_reset((Scandium::ScandiumPPG::scandium_spo2_processor_t *)((char *)this + 632656));
  for (uint64_t i = 0; i != 2048; i += 128)
    Scandium::ScandiumPPG::scandium_bga_t::scandium_bga_reset((Scandium::ScandiumPPG::scandium_spo2_processor_t *)((char *)this + i + 765496));
  for (uint64_t j = 0; j != 2048; j += 128)
    Scandium::ScandiumPPG::scandium_bga_t::scandium_bga_reset((Scandium::ScandiumPPG::scandium_spo2_processor_t *)((char *)this + j + 767544));
  for (uint64_t k = 0; k != 1024; k += 128)
    Scandium::ScandiumPPG::scandium_bga_t::scandium_bga_reset((Scandium::ScandiumPPG::scandium_spo2_processor_t *)((char *)this + k + 769592));
  Scandium::ScandiumPPG::scandium_calibration_t::reset((Scandium::ScandiumPPG::scandium_spo2_processor_t *)((char *)this + 770792));
  Scandium::ScandiumPPG::scandium_calibration_t::reset((Scandium::ScandiumPPG::scandium_spo2_processor_t *)((char *)this + 770800));
  Scandium::ScandiumPPG::scandium_signal_conditioning_t::reset((Scandium::ScandiumPPG::scandium_spo2_processor_t *)((char *)this + 770616));
  Scandium::scandium_mvmt_detection_t::reset((Scandium::ScandiumPPG::scandium_spo2_processor_t *)((char *)this + 770840));
  uint64_t result = Scandium::ScandiumPPG::scandium_quality_metric_t::reset((void *)this + 96376);
  *((unsigned char *)this + 77252std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = 0;
  *((_DWORD *)this + 19313std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_processor_t>::reset[abi:ne180100](this, 0) = 0;
  *((void *)this + 96566) = 0;
  *(void *)((char *)this + 772556) = 0;
  *(void *)((char *)this + 772548) = 0;
  *((_WORD *)this + 386282) = 0;
  return result;
}

void Scandium::ScandiumPPG::scandium_spo2_monitor_t::scandium_spo2_monitor_process(Scandium::ScandiumPPG::scandium_spo2_processor_t **a1, uint64_t a2)
{
}

void Scandium::ScandiumPPG::scandium_spo2_processor_t::process(Scandium::ScandiumPPG::scandium_spo2_processor_t *this, uint64_t a2)
{
  uint64_t v210 = *MEMORY[0x263EF8340];
  unint64_t v4 = (char *)this + 772520;
  v143 = (int *)((char *)this + 772112);
  v138 = (char *)this + 770698;
  unint64_t v5 = (char *)this + 623320;
  int v6 = *((_DWORD *)this + 193136);
  if (!v6)
  {
    Scandium::ScandiumPPG::scandium_spo2_processor_t::log_start_packet((uint64_t)this, (unsigned __int8 *)this + 120);
    int v6 = *((_DWORD *)v4 + 6);
  }
  uint64_t v7 = 0;
  v159 = 0;
  v158 = 0;
  uint64_t v160 = 0;
  v162 = 0;
  uint64_t v8 = v6;
  uint64_t v164 = 0;
  v163 = 0;
  uint64_t v9 = 4 * v6 + 252;
  int v10 = *((unsigned __int8 *)this + 250);
  do
  {
    float v11 = *(float *)(a2 + 7 + 4 * v7);
    if (v10) {
      float v11 = v11 * 600.0 / ((double)(*((_DWORD *)this + 61) * *((unsigned __int8 *)this + v7 + 770704)) * 10.0);
    }
    *(float *)((char *)this + v9) = v11;
    ++v7;
    v9 += 6400;
  }
  while (v7 != 8);
  uint64_t v12 = 0;
  uint64_t v13 = 4 * v8 + 51452;
  do
  {
    float v14 = *(float *)(a2 + 39 + 4 * v12);
    if (v10) {
      float v14 = v14 * 600.0 / ((double)(*((_DWORD *)this + 61) * *((unsigned __int8 *)this + v12 + 770712)) * 10.0);
    }
    *(float *)((char *)this + v13) = v14;
    ++v12;
    v13 += 6400;
  }
  while (v12 != 16);
  uint64_t v15 = 0;
  uint64_t v16 = 4 * v8 + 153852;
  do
  {
    float v17 = *(float *)(a2 + 103 + 4 * v15);
    if (v10) {
      float v17 = v17 * 600.0 / ((double)(*((_DWORD *)this + 61) * *((unsigned __int8 *)this + v15 + 770728)) * 10.0);
    }
    *(float *)((char *)this + v16) = v17;
    ++v15;
    v16 += 6400;
  }
  while (v15 != 16);
  uint64_t v18 = 0;
  unint64_t v19 = (char *)this + 770700;
  uint64_t v20 = 4 * v8 + 256252;
  do
  {
    float v21 = *(float *)(a2 + 167 + 4 * v18);
    if (v10) {
      float v21 = v21 * 600.0 / ((double)(*((_DWORD *)this + 61) * v19[v18]) * 10.0);
    }
    *(float *)((char *)this + v2std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_processor_t>::reset[abi:ne180100](this, 0) = v21;
    ++v18;
    v20 += 6400;
  }
  while (v18 != 4);
  uint64_t v22 = 0;
  uint64_t v23 = 4 * v8 + 281852;
  do
  {
    float v24 = *(float *)(a2 + 183 + 4 * v22);
    if (v10) {
      float v24 = v24 * 600.0 / ((double)(*((_DWORD *)this + 61) * v19[v22]) * 10.0);
    }
    *(float *)((char *)this + v23) = v24;
    ++v22;
    v23 += 6400;
  }
  while (v22 != 4);
  uint64_t v25 = 0;
  uint64_t v26 = 4 * v8 + 307452;
  do
  {
    *(float *)((char *)this + v26) = (float)*(int *)(a2 + 199 + v25) * 0.000015259;
    v25 += 4;
    v26 += 6400;
  }
  while (v25 != 12);
  uint64_t v27 = 0;
  uint64_t v28 = 4 * v8 + 352252;
  do
  {
    *(float *)((char *)this + v28) = (float)*(int *)(a2 + 211 + v27) * 0.0078125;
    v27 += 4;
    v28 += 6400;
  }
  while (v27 != 16);
  uint64_t v29 = 0;
  uint64_t v30 = 4 * v8 + 326652;
  do
  {
    *(float *)((char *)this + v3std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_processor_t>::reset[abi:ne180100](this, 0) = (float)*(int *)(a2 + 227 + v29) * 0.0078125;
    v29 += 4;
    v30 += 6400;
  }
  while (v29 != 16);
  *((float *)this + v8 + 94463) = (float)*(int *)(a2 + 243) * 0.0078125;
  *((_DWORD *)this + v8 + 15646std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_processor_t>::reset[abi:ne180100](this, 0) = *(_DWORD *)(a2 + 3);
  ++*((_DWORD *)v4 + 6);
  Scandium::ScandiumPPG::scandium_spo2_processor_t::compute_mvmt_posture_bailout(this);
  if (v4[44])
  {
    uint64_t v32 = 4;
LABEL_33:
    uint64_t v33 = *((void *)v4 + 6) | v32;
    *((void *)v4 + 6) = v33;
    goto LABEL_34;
  }
  if (v4[45])
  {
    uint64_t v32 = 2;
    goto LABEL_33;
  }
  uint64_t v33 = *((void *)v4 + 6);
LABEL_34:
  uint64_t v34 = v33 & 0x7FF;
  if ((v33 & 0x7FF) == 0) {
    goto LABEL_47;
  }
  log = Scandium::algs_get_log(v31);
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v36 = 0;
    *((unsigned char *)&__p.__r_.__value_.__s + 23) = 11;
    strcpy((char *)&__p, "00000000000");
    uint64_t v37 = 10;
    do
    {
      if ((*((void *)v4 + 6) >> v36))
      {
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          p_p = &__p;
        }
        else {
          p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
        }
        p_p->__r_.__value_.__s.__data_[v37] = 49;
      }
      ++v36;
      --v37;
    }
    while (v36 != 11);
    float v39 = &__p;
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      float v39 = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    *(_DWORD *)buf = 136315138;
    *(void *)v207 = v39;
    _os_log_impl(&dword_25BA34000, log, OS_LOG_TYPE_DEFAULT, "scandium invalid session reason: %s - force processing", buf, 0xCu);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
LABEL_47:
    int v40 = *((_DWORD *)v4 + 6);
    if (!v34 && (*((_DWORD *)this + v40 + 156459) & 4) == 0) {
      goto LABEL_204;
    }
    goto LABEL_51;
  }
  int v40 = *((_DWORD *)v4 + 6);
LABEL_51:
  v143[5] = v40;
  Scandium::ScandiumPPG::scandium_spo2_processor_t::compute_dropped_samples_metrics(this);
  Scandium::ScandiumPPG::scandium_spo2_processor_t::log_input_signal((uint64_t)this);
  v142 = v5;
  *((_DWORD *)v4 + 5) = 0;
  if (*((int *)this + 59) >= 1)
  {
    v145 = (stats *)((char *)this + 568572);
    v146 = (Scandium::ScandiumPPG::scandium_spo2_processor_t *)((char *)this + 632656);
    v144 = (std::string *)((char *)this + 771456);
    v141 = (char *)this + 623296;
    v139 = (char *)this + 623308;
    v140 = (char *)this + 623368;
    int32x2_t v41 = vdup_n_s32(0x7FC00000u);
    uint64_t v136 = (uint64_t)(v5 + 16);
    v137 = (void **)(v5 + 24);
    uint64_t v135 = (uint64_t)(v5 + 40);
    int v147 = v40;
    do
    {
      Scandium::ScandiumPPG::scandium_spo2_processor_t::reset(this);
      int v42 = *((_DWORD *)v4 + 5);
      int v43 = v40 - 320 * v42;
      if (v43 >= 960) {
        int v43 = 960;
      }
      if (v43 >= 1)
      {
        long long v44 = (const float *)(v43 & ~(v43 >> 31));
        float v45 = stats::mean((stats *)((char *)this + 1280 * v42 + 307452), v44);
        Scandium::fill_valid((float *)this + 193042, v46, v45);
        float v47 = stats::mean((stats *)((char *)this + 1280 * *((int *)v4 + 5) + 313852), v44);
        Scandium::fill_valid((float *)this + 193043, v48, v47);
        float v49 = stats::mean((stats *)((char *)this + 1280 * *((int *)v4 + 5) + 320252), v44);
        Scandium::fill_valid((float *)this + 193044, v50, v49);
        int v42 = *((_DWORD *)v4 + 5);
      }
      BOOL v51 = Scandium::ScandiumPPG::scandium_spo2_processor_t::copy_to_bga_window(this, v42, v40);
      if (*((void *)v4 + 31))
      {
        std::string::basic_string[abi:ne180100]<0>(&v155, "window_process_start");
        std::string::basic_string[abi:ne180100]<0>(&__p, "is_window_valid");
        LOBYTE(v167) = !v51;
        int v170 = 0;
        std::string::basic_string[abi:ne180100]<0>(v171, "window_idx");
        int v172 = *((_DWORD *)v4 + 5);
        int v173 = 1;
        std::string::basic_string[abi:ne180100]<0>(v174, "num_processing_windows");
        v175[0] = *((_DWORD *)this + 59);
        int v176 = 1;
        std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::unordered_map((uint64_t)buf, (unsigned __int8 *)&__p, 3);
        uint64_t v52 = *((void *)v4 + 31);
        if (!v52) {
          std::__throw_bad_function_call[abi:ne180100]();
        }
        (*(void (**)(uint64_t, void **, uint8_t *))(*(void *)v52 + 48))(v52, &v155, buf);
        std::__hash_table<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>>>::~__hash_table((uint64_t)buf);
        for (unint64_t i = 0; i != -216; i -= 72)
        {
          std::__variant_detail::__dtor<std::__variant_detail::__traits<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v175[i / 4]);
          if (SHIBYTE(v174[i / 8 + 2]) < 0) {
            operator delete((void *)v174[i / 8]);
          }
        }
        if (SHIBYTE(v157) < 0) {
          operator delete(v155);
        }
        int v40 = v147;
      }
      if (!v51)
      {
        Scandium::ScandiumPPG::scandium_spo2_processor_t::compute_ppg(this);
        Scandium::ScandiumPPG::scandium_beat_detection_t::scandium_beat_detection_process((uint64_t)v146, (stats *)((char *)this + 615616), (stats *)((char *)this + 619456), v145);
        uint64_t beats = Scandium::ScandiumPPG::scandium_beat_detection_t::scandium_get_beats(v146);
        long long v55 = (void *)beats;
        if (&v158 != (void **)beats)
        {
          std::vector<float>::__assign_with_size[abi:ne180100]<float *,float *>((char *)&v158, *(char **)beats, *(void *)(beats + 8), (uint64_t)(*(void *)(beats + 8) - *(void *)beats) >> 2);
          float v56 = (char *)v55[4];
          uint64_t v161 = v55[3];
          std::vector<float>::__assign_with_size[abi:ne180100]<float *,float *>((char *)&v162, v56, v55[5], (uint64_t)(v55[5] - (void)v56) >> 2);
        }
        Scandium::ScandiumPPG::scandium_spo2_processor_t::compute_window_mvmt_posture((uint64_t)this, (uint64_t)v145);
        if (*((float *)&v161 + 1) > 0.0 && *(float *)&v161 > 0.0)
        {
          float v57 = stats::mean((stats *)((char *)this + 610812), (const float *)0x3C0);
          if (v57 >= 0.0 && v57 <= 45.0)
          {
            Scandium::ScandiumPPG::scandium_spo2_processor_t::compute_bga(this, (Scandium::ScandiumPPG::beats_t *)&v158);
            Scandium::ScandiumPPG::scandium_spo2_processor_t::compute_spo2(this);
            Scandium::ScandiumPPG::scandium_spo2_processor_t::compute_quality_metric(this);
            LODWORD(v155) = 2143289344;
            LODWORD(v1std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100]((void *)this + 51) = 2143289344;
            LODWORD(v149[0]) = 2143289344;
            LODWORD(v148.__r_.__value_.__l.__data_) = 0;
            int v58 = *((unsigned __int8 *)this + 249);
            __p.__r_.__value_.__s.__data_[0] = 0;
            LOBYTE(v173) = 0;
            int v59 = Scandium::ScandiumPPG::scandium_channel_combination_t::combine_channels(v144, v58, (float *)&v155, (float *)&v151, (float *)v149, (int *)&v148, &__p);
            std::__optional_destruct_base<Scandium::ScandiumPPG::channel_combination_param_t,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&__p);
            __p.__r_.__value_.__r.__words[0] = (std::string::size_type)this;
            __p.__r_.__value_.__l.__size_ = (std::string::size_type)this + 24;
            __p.__r_.__value_.__r.__words[2] = (std::string::size_type)this + 48;
            v166 = (char *)this + 72;
            v167 = (char *)this + 96;
            int32x2_t v168 = v41;
            int v169 = 2143289344;
            Scandium::ScandiumPPG::scandium_channel_combination_t::log_coreanalytics_metrics((uint64_t)v144, (uint64_t)&__p);
            uint64_t v61 = *((int *)v4 + 4);
            *(_DWORD *)&v141[4 * v61] = v155;
            __int32 v62 = v168.i32[1];
            *(_DWORD *)&v139[4 * v61] = v169;
            if ((v62 & 0x7FFFFFFFu) <= 0x7F7FFFFF)
            {
              int v64 = (__int32 *)*((void *)v142 + 1);
              unint64_t v63 = *((void *)v142 + 2);
              if ((unint64_t)v64 >= v63)
              {
                long long v90 = *(__int32 **)v142;
                uint64_t v91 = ((uint64_t)v64 - *(void *)v142) >> 2;
                unint64_t v92 = v91 + 1;
                if ((unint64_t)(v91 + 1) >> 62) {
                  goto LABEL_214;
                }
                uint64_t v93 = v63 - (void)v90;
                if (v93 >> 1 > v92) {
                  unint64_t v92 = v93 >> 1;
                }
                if ((unint64_t)v93 >= 0x7FFFFFFFFFFFFFFCLL) {
                  unint64_t v60 = 0x3FFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v60 = v92;
                }
                if (v60)
                {
                  long long v94 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v136, v60);
                  long long v90 = *(__int32 **)v142;
                  int v64 = (__int32 *)*((void *)v142 + 1);
                  __int32 v62 = v168.i32[1];
                }
                else
                {
                  long long v94 = 0;
                }
                long long v95 = &v94[4 * v91];
                *(_DWORD *)long long v95 = v62;
                long long v65 = v95 + 4;
                while (v64 != v90)
                {
                  int v96 = *--v64;
                  *((_DWORD *)v95 - 1) = v96;
                  v95 -= 4;
                }
                *(void *)v142 = v95;
                *((void *)v142 + 1) = v65;
                *((void *)v142 + 2) = &v94[4 * v60];
                if (v90) {
                  operator delete(v90);
                }
              }
              else
              {
                *int v64 = v62;
                long long v65 = v64 + 1;
              }
              *((void *)v142 + 1) = v65;
            }
            __int32 v97 = v168.i32[0];
            if ((v168.i32[0] & 0x7FFFFFFFu) <= 0x7F7FFFFF)
            {
              unint64_t v99 = (char *)*((void *)v142 + 4);
              unint64_t v98 = *((void *)v142 + 5);
              if ((unint64_t)v99 >= v98)
              {
                long long v101 = (char *)*v137;
                uint64_t v102 = (v99 - (unsigned char *)*v137) >> 2;
                unint64_t v103 = v102 + 1;
                if ((unint64_t)(v102 + 1) >> 62) {
LABEL_214:
                }
                  std::vector<float>::__throw_length_error[abi:ne180100]();
                uint64_t v104 = v98 - (void)v101;
                if (v104 >> 1 > v103) {
                  unint64_t v103 = v104 >> 1;
                }
                if ((unint64_t)v104 >= 0x7FFFFFFFFFFFFFFCLL) {
                  unint64_t v60 = 0x3FFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v60 = v103;
                }
                if (v60)
                {
                  unint64_t v105 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v135, v60);
                  long long v101 = (char *)*((void *)v142 + 3);
                  unint64_t v99 = (char *)*((void *)v142 + 4);
                  __int32 v97 = v168.i32[0];
                }
                else
                {
                  unint64_t v105 = 0;
                }
                uint64_t v106 = &v105[4 * v102];
                *(_DWORD *)uint64_t v106 = v97;
                long long v100 = v106 + 4;
                while (v99 != v101)
                {
                  int v107 = *((_DWORD *)v99 - 1);
                  v99 -= 4;
                  *((_DWORD *)v106 - 1) = v107;
                  v106 -= 4;
                }
                *((void *)v142 + 3) = v106;
                *((void *)v142 + std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = v100;
                *((void *)v142 + 5) = &v105[4 * v60];
                if (v101) {
                  operator delete(v101);
                }
              }
              else
              {
                *(_DWORD *)unint64_t v99 = v168.i32[0];
                long long v100 = v99 + 4;
              }
              *((void *)v142 + std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = v100;
            }
            if (v59 == 3) {
              ++v143[8];
            }
            if (*v138 == 2)
            {
              int v108 = *((_DWORD *)v4 + 5);
              switch(v108)
              {
                case 2:
                  uint64_t v114 = *((unsigned int *)v4 + 4);
                  if (v114 > 2) {
                    goto LABEL_213;
                  }
                  Scandium::fill_valid((float *)this + 193021, (float *)v60, *(float *)&v141[4 * v114]);
                  uint64_t v111 = *((unsigned int *)v4 + 4);
                  long long v112 = (float *)((char *)this + 772100);
                  goto LABEL_177;
                case 1:
                  uint64_t v113 = *((unsigned int *)v4 + 4);
                  if (v113 > 2) {
                    goto LABEL_213;
                  }
                  Scandium::fill_valid((float *)this + 193020, (float *)v60, *(float *)&v141[4 * v113]);
                  uint64_t v111 = *((unsigned int *)v4 + 4);
                  long long v112 = (float *)((char *)this + 772096);
LABEL_177:
                  if (v111 > 2) {
LABEL_213:
                  }
                    std::__throw_out_of_range[abi:ne180100]("array::at");
                  Scandium::fill_valid(v112, v110, *(float *)&v139[4 * v111]);
                  break;
                case 0:
                  uint64_t v109 = *((unsigned int *)v4 + 4);
                  if (v109 >= 3) {
                    goto LABEL_213;
                  }
                  Scandium::fill_valid((float *)this + 193019, (float *)v60, *(float *)&v141[4 * v109]);
                  uint64_t v111 = *((unsigned int *)v4 + 4);
                  long long v112 = (float *)((char *)this + 772092);
                  goto LABEL_177;
              }
            }
            int data = (int)v148.__r_.__value_.__l.__data_;
            int v116 = *v143;
            if (*v143 <= SLODWORD(v148.__r_.__value_.__l.__data_)) {
              int v116 = (int)v148.__r_.__value_.__l.__data_;
            }
            if (SLODWORD(v148.__r_.__value_.__l.__data_) >= v143[1]) {
              int data = v143[1];
            }
            int *v143 = v116;
            v143[1] = data;
            long long v117 = memcpy(__dst, (char *)this + 623384, sizeof(__dst));
            *(float *)&v140[4 * *((int *)v4 + 4)] = Scandium::ScandiumPPG::scandium_spo2_processor_t::median_hr_allpaths((uint64_t)v117, (uint64_t)__dst);
            v119 = Scandium::algs_get_log(v118);
            if (os_log_type_enabled(v119, OS_LOG_TYPE_DEFAULT))
            {
              int v120 = *((_DWORD *)v4 + 5);
              uint64_t v121 = *((int *)v4 + 4);
              double v122 = *(float *)&v141[4 * v121];
              double v123 = *(float *)&v140[4 * v121];
              *(_DWORD *)buf = 67109632;
              *(_DWORD *)v207 = v120;
              *(_WORD *)&v207[4] = 2048;
              *(double *)&v207[6] = v122;
              __int16 v208 = 2048;
              double v209 = v123;
              _os_log_impl(&dword_25BA34000, v119, OS_LOG_TYPE_DEFAULT, "scandium session results: session %d spo2: %.9g hr: %.9g", buf, 0x1Cu);
            }
            int v124 = *((_DWORD *)v4 + 4) + 1;
            *((_DWORD *)v4 + std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = v124;
            v143[4] = v124;
            int v40 = v147;
            goto LABEL_78;
          }
        }
        *((void *)v4 + 1) |= 0x20uLL;
      }
      LOBYTE(v59) = 6;
LABEL_78:
      if (*((void *)v4 + 31))
      {
        uint64_t v66 = 0;
        v156 = 0;
        v155 = 0;
        v157 = 0;
        v151 = 0;
        v152 = 0;
        v153 = 0;
        do
        {
          if ((*((void *)v4 + 1) & (1 << v66)) != 0)
          {
            long long v67 = v156;
            if (v156 >= v157)
            {
              uint64_t v69 = (char *)v155;
              uint64_t v70 = (v156 - (unsigned char *)v155) >> 2;
              unint64_t v71 = v70 + 1;
              if ((unint64_t)(v70 + 1) >> 62) {
                goto LABEL_210;
              }
              uint64_t v72 = v157 - (unsigned char *)v155;
              if ((v157 - (unsigned char *)v155) >> 1 > v71) {
                unint64_t v71 = v72 >> 1;
              }
              if ((unint64_t)v72 >= 0x7FFFFFFFFFFFFFFCLL) {
                unint64_t v73 = 0x3FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v73 = v71;
              }
              if (v73)
              {
                int v74 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v157, v73);
                long long v67 = v156;
                uint64_t v69 = (char *)v155;
              }
              else
              {
                int v74 = 0;
              }
              long long v75 = &v74[4 * v70];
              *(_DWORD *)long long v75 = v66;
              int v68 = v75 + 4;
              while (v67 != v69)
              {
                int v76 = *((_DWORD *)v67 - 1);
                v67 -= 4;
                *((_DWORD *)v75 - 1) = v76;
                v75 -= 4;
              }
              v155 = v75;
              v156 = v68;
              v157 = &v74[4 * v73];
              if (v69) {
                operator delete(v69);
              }
            }
            else
            {
              *(_DWORD *)v156 = v66;
              int v68 = v67 + 4;
            }
            v156 = v68;
          }
          if ((*((void *)v4 + 6) & (1 << v66)) != 0)
          {
            long long v77 = v152;
            if (v152 >= v153)
            {
              uint64_t v79 = (char *)v151;
              uint64_t v80 = (v152 - (unsigned char *)v151) >> 2;
              unint64_t v81 = v80 + 1;
              if ((unint64_t)(v80 + 1) >> 62) {
LABEL_210:
              }
                std::vector<float>::__throw_length_error[abi:ne180100]();
              uint64_t v82 = v153 - (unsigned char *)v151;
              if ((v153 - (unsigned char *)v151) >> 1 > v81) {
                unint64_t v81 = v82 >> 1;
              }
              if ((unint64_t)v82 >= 0x7FFFFFFFFFFFFFFCLL) {
                unint64_t v83 = 0x3FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v83 = v81;
              }
              if (v83)
              {
                unint64_t v84 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v153, v83);
                uint64_t v79 = (char *)v151;
                long long v77 = v152;
              }
              else
              {
                unint64_t v84 = 0;
              }
              int v85 = &v84[4 * v80];
              *(_DWORD *)int v85 = v66;
              long long v78 = v85 + 4;
              while (v77 != v79)
              {
                int v86 = *((_DWORD *)v77 - 1);
                v77 -= 4;
                *((_DWORD *)v85 - 1) = v86;
                v85 -= 4;
              }
              v151 = v85;
              v152 = v78;
              v153 = &v84[4 * v83];
              if (v79) {
                operator delete(v79);
              }
            }
            else
            {
              *(_DWORD *)v152 = v66;
              long long v78 = v77 + 4;
            }
            v152 = v78;
          }
          ++v66;
        }
        while (v66 != 11);
        std::string::basic_string[abi:ne180100]<0>(v149, "window_process_end");
        std::string::basic_string[abi:ne180100]<0>(&__p, "window_posture_valid");
        LOBYTE(v167) = *v4;
        int v170 = 0;
        std::string::basic_string[abi:ne180100]<0>(v171, "window_movement_valid");
        LOBYTE(v172) = v4[1];
        int v173 = 0;
        std::string::basic_string[abi:ne180100]<0>(v174, "window_wrist_is_rotated");
        LOBYTE(v175[0]) = v4[2];
        int v176 = 0;
        std::string::basic_string[abi:ne180100]<0>(v177, "window_arm_is_hanging");
        char v178 = v4[3];
        int v179 = 0;
        std::string::basic_string[abi:ne180100]<0>(v180, "window_is_session_full");
        char v181 = v4[4];
        int v182 = 0;
        Scandium::ScandiumPPG::scandium_channel_combination_t::get_return_message(v59, &v148);
        std::string::basic_string[abi:ne180100]<0>(v183, "channel_combination_return");
        int v40 = v147;
        std::string v184 = v148;
        memset(&v148, 0, sizeof(v148));
        int v185 = 5;
        std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::pair[abi:ne180100]<char const(&)[23],std::vector<int>&,0>((uint64_t)&v186, "window_invalid_reasons", (uint64_t)&v155);
        std::string::basic_string[abi:ne180100]<0>(v187, "invalid_sample_counter_total");
        int v188 = *((_DWORD *)v4 + 7);
        int v189 = 1;
        std::string::basic_string[abi:ne180100]<0>(v190, "invalid_sample_counter_cont");
        int v191 = *((_DWORD *)v4 + 8);
        int v192 = 1;
        std::string::basic_string[abi:ne180100]<0>(v193, "invalid_accl_sample_counter_total");
        int v194 = *((_DWORD *)v4 + 9);
        int v195 = 1;
        std::string::basic_string[abi:ne180100]<0>(v196, "invalid_accl_sample_counter_cont");
        int v197 = *((_DWORD *)v4 + 10);
        int v198 = 1;
        std::string::basic_string[abi:ne180100]<0>(v199, "posture_abort");
        char v200 = v4[44];
        int v201 = 0;
        std::string::basic_string[abi:ne180100]<0>(v202, "movement_abort");
        char v203 = v4[45];
        int v204 = 0;
        std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::pair[abi:ne180100]<char const(&)[24],std::vector<int>&,0>((uint64_t)&v205, "session_invalid_reasons", (uint64_t)&v151);
        std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::unordered_map((uint64_t)buf, (unsigned __int8 *)&__p, 14);
        uint64_t v87 = *((void *)v4 + 31);
        if (!v87) {
          std::__throw_bad_function_call[abi:ne180100]();
        }
        (*(void (**)(uint64_t, void **, uint8_t *))(*(void *)v87 + 48))(v87, v149, buf);
        std::__hash_table<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>>>::~__hash_table((uint64_t)buf);
        uint64_t v88 = 1008;
        do
        {
          std::__variant_detail::__dtor<std::__variant_detail::__traits<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v160 + v88);
          if (*((char *)&v158 + v88 + 7) < 0) {
            operator delete((&v156)[(unint64_t)v88 / 8]);
          }
          v88 -= 72;
        }
        while (v88);
        if (SHIBYTE(v148.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v148.__r_.__value_.__l.__data_);
        }
        if (v150 < 0) {
          operator delete(v149[0]);
        }
        if (v151)
        {
          v152 = (char *)v151;
          operator delete(v151);
        }
        if (v155)
        {
          v156 = (char *)v155;
          operator delete(v155);
        }
      }
      *((void *)v4 + 6) |= *((void *)v4 + 1);
      int v89 = *((_DWORD *)v4 + 5) + 1;
      *((_DWORD *)v4 + 5) = v89;
    }
    while (v89 < *((_DWORD *)this + 59));
  }
  Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_hw_fom_core_analytics(this);
  v126 = (const float *)*((unsigned int *)v4 + 4);
  if ((int)v126 < 1
    || (float v127 = stats::max((stats *)((char *)this + 623296), v126),
        (float)(v127 - stats::min((stats *)((char *)this + 623296), (const float *)*((unsigned int *)v4 + 4))) >= 7.0))
  {
    if ((*((_WORD *)v4 + 24) & 0x7FF) != 0)
    {
      v129 = (Scandium *)Scandium::algs_get_log(v125);
      if (v129)
      {
        v130 = Scandium::algs_get_log(v129);
        if (os_log_type_enabled(v130, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v131 = 0;
          *((unsigned char *)&__p.__r_.__value_.__s + 23) = 11;
          strcpy((char *)&__p, "00000000000");
          uint64_t v132 = 10;
          do
          {
            if ((*((void *)v4 + 6) >> v131))
            {
              if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                v133 = &__p;
              }
              else {
                v133 = (std::string *)__p.__r_.__value_.__r.__words[0];
              }
              v133->__r_.__value_.__s.__data_[v132] = 49;
            }
            ++v131;
            --v132;
          }
          while (v131 != 11);
          v134 = &__p;
          if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
            v134 = (std::string *)__p.__r_.__value_.__r.__words[0];
          }
          *(_DWORD *)buf = 136315138;
          *(void *)v207 = v134;
          _os_log_impl(&dword_25BA34000, v130, OS_LOG_TYPE_DEFAULT, "Scandium algs bailout due to: %s", buf, 0xCu);
          if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(__p.__r_.__value_.__l.__data_);
          }
        }
      }
    }
    Scandium::ScandiumPPG::scandium_spo2_processor_t::invoke_abort(this);
  }
  else
  {
    Scandium::ScandiumPPG::scandium_spo2_processor_t::report_rslts(this, v128);
  }
LABEL_204:
  if (v162)
  {
    v163 = v162;
    operator delete(v162);
  }
  if (v158)
  {
    v159 = v158;
    operator delete(v158);
  }
}

void sub_25BA4F1F4(_Unwind_Exception *a1)
{
}

void *Scandium::ScandiumPPG::scandium_spo2_monitor_t::get_core_analytics@<X0>(Scandium::ScandiumPPG::scandium_spo2_monitor_t *this@<X0>, void *a2@<X8>)
{
  return memcpy(a2, (const void *)(*(void *)this + 772072), 0x1B8uLL);
}

uint64_t Scandium::ScandiumPPG::scandium_spo2_processor_t::scandium_spo2_processor_t(uint64_t a1, uint64_t a2, long long *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8, char a9)
{
  v61[4] = *MEMORY[0x263EF8340];
  *(void *)(a1 + 112) = 0;
  *(_OWORD *)(a1 + 8std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_processor_t>::reset[abi:ne180100](this, 0) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 6std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = 0u;
  float v49 = (void *)(a1 + 772768);
  uint64_t v12 = a1 + 772348;
  uint64_t v13 = a1 + 770680;
  uint64_t v14 = a1 + 632488;
  long long v54 = (void *)(a1 + 625816);
  uint64_t v15 = (_OWORD *)(a1 + 623320);
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  long long v16 = *a3;
  long long v17 = a3[1];
  long long v18 = a3[2];
  *(_OWORD *)(a1 + 168) = a3[3];
  *(_OWORD *)(a1 + 152) = v18;
  *(_OWORD *)(a1 + 136) = v17;
  *(_OWORD *)(a1 + 12std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_processor_t>::reset[abi:ne180100](this, 0) = v16;
  long long v19 = a3[4];
  long long v20 = a3[5];
  long long v21 = a3[6];
  *(_DWORD *)(a1 + 231) = *(_DWORD *)((char *)a3 + 111);
  *(_OWORD *)(a1 + 216) = v21;
  *(_OWORD *)(a1 + 20std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_processor_t>::reset[abi:ne180100](this, 0) = v20;
  *(_OWORD *)(a1 + 18std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = v19;
  *(unsigned char *)(a1 + 249) = a8;
  *(unsigned char *)(a1 + 25std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_processor_t>::reset[abi:ne180100](this, 0) = a9;
  bzero((void *)(a1 + 614656), 0x3C0uLL);
  uint64_t v22 = 0;
  v15[1] = 0u;
  v15[2] = 0u;
  *uint64_t v15 = 0u;
  do
  {
    Scandium::ScandiumPPG::BGA_t::reset((Scandium::ScandiumPPG::BGA_t *)(a1 + 623384 + v22));
    v22 += 112;
  }
  while (v22 != 1792);
  *long long v54 = 0;
  v54[1] = 0;
  v54[2] = 0;
  *(_OWORD *)uint64_t v14 = 0u;
  *(_OWORD *)(v14 + 16) = 0u;
  *(_OWORD *)(v14 + 32) = 0u;
  *(_OWORD *)(v14 + 48) = 0u;
  *(_OWORD *)(v14 + 6std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = 0u;
  *(_OWORD *)(v14 + 8std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_processor_t>::reset[abi:ne180100](this, 0) = 0u;
  *(_OWORD *)(v14 + 96) = 0u;
  *(void *)(v14 + 112) = 0;
  Scandium::ScandiumPPG::scandium_beat_detection_t::scandium_beat_detection_t((Scandium::ScandiumPPG::scandium_beat_detection_t *)(a1 + 632656));
  for (uint64_t i = 0; i != 2048; i += 128)
    Scandium::ScandiumPPG::scandium_bga_t::scandium_bga_t((Scandium::ScandiumPPG::scandium_bga_t *)(a1 + 765496 + i));
  for (uint64_t j = 0; j != 2048; j += 128)
    Scandium::ScandiumPPG::scandium_bga_t::scandium_bga_t((Scandium::ScandiumPPG::scandium_bga_t *)(a1 + 767544 + j));
  for (uint64_t k = 0; k != 1024; k += 128)
    double v26 = Scandium::ScandiumPPG::scandium_bga_t::scandium_bga_t((Scandium::ScandiumPPG::scandium_bga_t *)(a1 + 769592 + k));
  Scandium::ScandiumPPG::scandium_signal_conditioning_t::scandium_signal_conditioning_t(a1 + 770616, a2, v26);
  Scandium::ScandiumPPG::scandium_calibration_t::reset((Scandium::ScandiumPPG::scandium_calibration_t *)(a1 + 770792));
  Scandium::ScandiumPPG::scandium_spo2_t::scandium_spo2_t((Scandium::ScandiumPPG::scandium_spo2_t *)(a1 + 770800));
  v61[0] = &unk_2709337D8;
  v61[1] = a1;
  v61[3] = v61;
  v60[0] = &unk_270933858;
  v60[1] = a1;
  v60[3] = v60;
  Scandium::scandium_mvmt_detection_t::scandium_mvmt_detection_t(a1 + 770840, v61, v60);
  std::__function::__value_func<void ()(BOOL)>::~__value_func[abi:ne180100](v60);
  std::__function::__value_func<void ()(BOOL)>::~__value_func[abi:ne180100](v61);
  Scandium::ScandiumPPG::scandium_quality_metric_t::scandium_quality_metric_t(a1 + 771008, *((unsigned char *)a3 + 13), a2, *((unsigned __int8 *)a3 + 107), *((unsigned __int16 *)a3 + 54));
  Scandium::ScandiumPPG::scandium_channel_combination_t::scandium_channel_combination_t(a1 + 771456, v12 + 164, a1 + 625176);
  __asm { FMOV            V0.4S, #-1.0 }
  *(_OWORD *)uint64_t v12 = _Q0;
  *(_OWORD *)(v12 + 16) = _Q0;
  *(_OWORD *)(v12 + 32) = _Q0;
  *(_OWORD *)(v12 + 48) = _Q0;
  *(_OWORD *)(v12 + 6std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = _Q0;
  *(_OWORD *)(v12 + 8std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_processor_t>::reset[abi:ne180100](this, 0) = _Q0;
  *(_OWORD *)(v12 + 96) = _Q0;
  *(_OWORD *)(v12 + 112) = _Q0;
  *(_OWORD *)(v12 + 128) = _Q0;
  *(_OWORD *)(v12 + 14std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = _Q0;
  long long v48 = _Q0;
  *(void *)(v12 + 18std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_processor_t>::reset[abi:ne180100](this, 0) = 0;
  *(void *)(v12 + 22std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_processor_t>::reset[abi:ne180100](this, 0) = 0;
  std::__function::__value_func<void ()(Scandium::ScandiumPPG::SpO2Result)>::__value_func[abi:ne180100](a1 + 772616, a4);
  std::__function::__value_func<void ()(Scandium::AbortReason)>::__value_func[abi:ne180100](a1 + 772648, a5);
  std::__function::__value_func<void ()(BOOL)>::__value_func[abi:ne180100](a1 + 772680, a6);
  std::__function::__value_func<void ()(BOOL)>::__value_func[abi:ne180100](a1 + 772712, a7);
  *float v49 = 0;
  uint64_t v32 = (std::string *)std::string::basic_string[abi:ne180100]<0>(&v55, "ppg");
  int v33 = *(unsigned __int8 *)(v13 + 18);
  if (v33 == 1)
  {
    uint64_t v34 = 0x200000001;
    float v35 = "-foreground";
  }
  else
  {
    if (v33 != 2) {
      goto LABEL_14;
    }
    uint64_t v34 = 0x400000003;
    float v35 = "-background";
  }
  *(void *)(a1 + 236) = v34;
  uint64_t v32 = std::string::append(&v55, v35, 0xBuLL);
LABEL_14:
  log = Scandium::algs_get_log((Scandium *)v32);
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v37 = &v55;
    if ((v55.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      uint64_t v37 = (std::string *)v55.__r_.__value_.__r.__words[0];
    }
    *(_DWORD *)buf = 136315394;
    float v57 = "11.1.4";
    __int16 v58 = 2080;
    int v59 = v37;
    _os_log_impl(&dword_25BA34000, log, OS_LOG_TYPE_DEFAULT, "Scandium Algs v%s Mode: %s", buf, 0x16u);
  }
  Scandium::ScandiumPPG::scandium_spo2_processor_t::reset((Scandium::ScandiumPPG::scandium_spo2_processor_t *)a1);
  if (a2 == 1) {
    int v38 = 2388286;
  }
  else {
    int v38 = 4608846;
  }
  *(_DWORD *)(a1 + 24std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = v38;
  *(_DWORD *)(v12 + 168) = a2;
  int v39 = *((unsigned __int8 *)a3 + 13);
  *(_DWORD *)(v12 + 16std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = v39;
  *(_DWORD *)(v12 + 196) = 0;
  *(_DWORD *)(v12 + 188) = 0;
  *(unsigned char *)uint64_t v13 = *(unsigned char *)a3;
  *(_WORD *)(v13 + 2) = *(_WORD *)((char *)a3 + 1);
  *(void *)(v13 + 8) = *(void *)((char *)a3 + 3);
  *(_WORD *)(v13 + 16) = *(_WORD *)((char *)a3 + 11);
  *(unsigned char *)(v13 + 18) = v39;
  *(unsigned char *)(v13 + 19) = *((unsigned char *)a3 + 14);
  *(_OWORD *)(a1 + 772072) = 0u;
  *(_OWORD *)(a1 + 772088) = 0u;
  *(_OWORD *)(a1 + 77210std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = 0u;
  *(void *)(a1 + 772117) = 0;
  *(_OWORD *)(a1 + 772128) = 0u;
  *(_OWORD *)(a1 + 77214std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = 0u;
  *(_OWORD *)(a1 + 77216std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_processor_t>::reset[abi:ne180100](this, 0) = 0u;
  *(_OWORD *)(a1 + 772176) = 0u;
  *(_OWORD *)(a1 + 772192) = 0u;
  *(_OWORD *)(a1 + 772208) = 0u;
  *(void *)(a1 + 772222) = 0;
  *(_OWORD *)(a1 + 772232) = 0u;
  *(_OWORD *)(a1 + 772248) = 0u;
  *(_OWORD *)(a1 + 77226std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = 0u;
  *(_OWORD *)(a1 + 77228std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_processor_t>::reset[abi:ne180100](this, 0) = 0u;
  *(_OWORD *)(a1 + 772296) = 0u;
  *(_OWORD *)(a1 + 772312) = 0u;
  *(_OWORD *)(a1 + 772328) = 0u;
  *(_DWORD *)(a1 + 77234std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = 0;
  *(unsigned char *)(v12 + 16std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_processor_t>::reset[abi:ne180100](this, 0) = 0;
  *(_WORD *)(v12 + 162) = 0;
  *(_OWORD *)(v13 + 1408) = v48;
  *(_OWORD *)(v13 + 142std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = xmmword_25BA64EB0;
  *(_WORD *)(v13 + 144std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_processor_t>::reset[abi:ne180100](this, 0) = *((_WORD *)a3 + 55);
  *(unsigned char *)(v13 + 1442) = *((unsigned char *)a3 + 112);
  *(_WORD *)(v13 + 1443) = *(_WORD *)((char *)a3 + 113);
  __asm { FMOV            V0.2S, #-1.0 }
  *(void *)(v13 + 1512) = _D0;
  *(_OWORD *)(v13 + 148std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_processor_t>::reset[abi:ne180100](this, 0) = xmmword_25BA64EC0;
  *(_OWORD *)(v13 + 1496) = xmmword_25BA64ED0;
  *(void *)&long long v41 = -1;
  *((void *)&v41 + 1) = -1;
  *(void *)(v13 + 1452) = -1;
  *(_OWORD *)(a1 + 772316) = v41;
  *(_OWORD *)(a1 + 772332) = v41;
  *(_OWORD *)uint64_t v12 = v48;
  *(_OWORD *)(v12 + 16) = v48;
  *(_DWORD *)(v12 + 32) = -1082130432;
  *(_OWORD *)(v12 + 36) = v48;
  *(_OWORD *)(v12 + 52) = v48;
  *(_OWORD *)(v12 + 68) = v48;
  *(_OWORD *)(v12 + 8std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = v48;
  *(_OWORD *)(v12 + 10std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_processor_t>::reset[abi:ne180100](this, 0) = v48;
  *(_OWORD *)(v12 + 116) = v48;
  *(_OWORD *)(v12 + 132) = v48;
  *(void *)(v12 + 148) = _D0;
  *(_DWORD *)(v12 + 156) = -1082130432;
  *(_DWORD *)(v13 + 160std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_processor_t>::reset[abi:ne180100](this, 0) = -1082130432;
  *(void *)(v13 + 152std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_processor_t>::reset[abi:ne180100](this, 0) = 0xBF800000C0000000;
  *(unsigned char *)(v12 + 16std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_processor_t>::reset[abi:ne180100](this, 0) = *((unsigned char *)a3 + 107);
  *(_WORD *)(v12 + 162) = *((_WORD *)a3 + 54);
  *(unsigned char *)(a1 + 248) = 1;
  int v42 = *(unsigned __int8 *)(v13 + 18);
  if (v42 == 1)
  {
    uint64_t v45 = 0x4000000020;
    uint64_t v43 = 0x200000001;
    uint64_t v44 = 0x40C000003F800000;
    int v46 = 64;
  }
  else
  {
    if (v42 != 2) {
      goto LABEL_26;
    }
    uint64_t v43 = 0x400000003;
    uint64_t v44 = 981668463;
    uint64_t v45 = 0xA0000000A0;
    int v46 = 1600;
  }
  *(void *)(a1 + 236) = v43;
  *(void *)(v12 + 228) = v45;
  *(_DWORD *)(v12 + 236) = v46;
  *(_DWORD *)(v12 + 24std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_processor_t>::reset[abi:ne180100](this, 0) = 981668463;
  *(void *)(v12 + 24std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = v44;
  *(_DWORD *)(v12 + 26std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_processor_t>::reset[abi:ne180100](this, 0) = 1060439283;
  *(_DWORD *)(v12 + 252) = 0;
  *(_DWORD *)(v12 + 256) = 0;
LABEL_26:
  Scandium::scandium_mvmt_detection_t::set_config((int32x2_t *)(a1 + 770840), a1 + 772576);
  *(_DWORD *)(v13 + 2std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_processor_t>::reset[abi:ne180100](this, 0) = *(_DWORD *)((char *)a3 + 15);
  *(void *)(v13 + 2std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = *(void *)((char *)a3 + 19);
  *(_OWORD *)(a1 + 770712) = *(long long *)((char *)a3 + 27);
  *(_OWORD *)(a1 + 770728) = *(long long *)((char *)a3 + 43);
  *(_OWORD *)(a1 + 77074std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = *(long long *)((char *)a3 + 59);
  *(_OWORD *)(a1 + 77076std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_processor_t>::reset[abi:ne180100](this, 0) = *(long long *)((char *)a3 + 75);
  *(_OWORD *)(a1 + 770776) = *(long long *)((char *)a3 + 91);
  if (SHIBYTE(v55.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v55.__r_.__value_.__l.__data_);
  }
  return a1;
}

void sub_25BA4FA24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, Scandium::ScandiumPPG::scandium_channel_combination_t *a10, Scandium::ScandiumPPG::scandium_quality_metric_t *a11, id **a12, Scandium::ScandiumPPG::scandium_calibration_t *a13, Scandium::ScandiumPPG::scandium_signal_conditioning_t *a14, Scandium::ScandiumPPG::scandium_beat_detection_t *a15, uint64_t a16, uint64_t a17, uint64_t a18, Scandium::scandium_mvmt_detection_t *a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,void *a24,uint64_t a25,void *__p,uint64_t a27,int a28,__int16 a29,char a30,char a31)
{
  if (a31 < 0) {
    operator delete(__p);
  }
  std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100]((void *)(v31 + 772744));
  std::__function::__value_func<void ()(BOOL)>::~__value_func[abi:ne180100](v33);
  std::__function::__value_func<void ()(BOOL)>::~__value_func[abi:ne180100](a23);
  std::__function::__value_func<void ()(Scandium::AbortReason)>::~__value_func[abi:ne180100](a24);
  std::__function::__value_func<void ()(Scandium::ScandiumPPG::SpO2Result)>::~__value_func[abi:ne180100](a9);
  Scandium::ScandiumPPG::scandium_channel_combination_t::~scandium_channel_combination_t(a10);
  Scandium::ScandiumPPG::scandium_quality_metric_t::~scandium_quality_metric_t(a11);
  Scandium::scandium_mvmt_detection_t::~scandium_mvmt_detection_t(a19);
  Scandium::ScandiumPPG::scandium_spo2_t::~scandium_spo2_t(a12);
  Scandium::ScandiumPPG::scandium_calibration_t::reset(a13);
  Scandium::ScandiumPPG::scandium_signal_conditioning_t::~scandium_signal_conditioning_t(a14);
  for (uint64_t i = 0; i != -1024; i -= 128)
    Scandium::ScandiumPPG::scandium_bga_t::~scandium_bga_t((Scandium::ScandiumPPG::scandium_bga_t *)(v31 + 770488 + i));
  for (uint64_t j = 0; j != -2048; j -= 128)
    Scandium::ScandiumPPG::scandium_bga_t::~scandium_bga_t((Scandium::ScandiumPPG::scandium_bga_t *)(v31 + 769464 + j));
  for (uint64_t k = 0; k != -2048; k -= 128)
    Scandium::ScandiumPPG::scandium_bga_t::~scandium_bga_t((Scandium::ScandiumPPG::scandium_bga_t *)(v31 + 767416 + k));
  Scandium::ScandiumPPG::scandium_beat_detection_t::~scandium_beat_detection_t(a15);
  int v39 = *(void **)(v32 + 96);
  if (v39)
  {
    *(void *)(v32 + 10std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = v39;
    operator delete(v39);
  }
  int v40 = *(void **)(v32 + 72);
  if (v40)
  {
    *(void *)(v32 + 8std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_processor_t>::reset[abi:ne180100](this, 0) = v40;
    operator delete(v40);
  }
  long long v41 = *(void **)(v32 + 48);
  if (v41)
  {
    *(void *)(v32 + 56) = v41;
    operator delete(v41);
  }
  int v42 = *(void **)(v32 + 24);
  if (v42)
  {
    *(void *)(v32 + 32) = v42;
    operator delete(v42);
  }
  uint64_t v43 = *(void **)v32;
  if (*(void *)v32)
  {
    *(void *)(v32 + 8) = v43;
    operator delete(v43);
  }
  uint64_t v44 = *(void **)a25;
  if (*(void *)a25)
  {
    *(void *)(a25 + 8) = v44;
    operator delete(v44);
  }
  uint64_t v45 = *(void **)(a16 + 24);
  if (v45)
  {
    *(void *)(a16 + 32) = v45;
    operator delete(v45);
  }
  int v46 = *(void **)a16;
  if (*(void *)a16)
  {
    *(void *)(a16 + 8) = v46;
    operator delete(v46);
  }
  float v47 = v34 + 96;
  uint64_t v48 = -384;
  while (1)
  {
    float v49 = (void *)*(v47 - 1);
    if (v49)
    {
      *float v47 = v49;
      operator delete(v49);
    }
    v47 -= 3;
    v48 += 24;
    if (!v48)
    {
      int v50 = v34 + 48;
      uint64_t v51 = -384;
      while (1)
      {
        uint64_t v52 = (void *)*(v50 - 1);
        if (v52)
        {
          *int v50 = v52;
          operator delete(v52);
        }
        v50 -= 3;
        v51 += 24;
        if (!v51)
        {
          uint64_t v53 = -192;
          while (1)
          {
            long long v54 = (void *)*(v34 - 1);
            if (v54)
            {
              *uint64_t v34 = v54;
              operator delete(v54);
            }
            v34 -= 3;
            v53 += 24;
            if (!v53)
            {
              std::string v55 = *(void **)(v31 + 96);
              if (v55)
              {
                *(void *)(v31 + 10std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = v55;
                operator delete(v55);
              }
              float v56 = *(void **)(v31 + 72);
              if (v56)
              {
                *(void *)(v31 + 8std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_processor_t>::reset[abi:ne180100](this, 0) = v56;
                operator delete(v56);
              }
              float v57 = *(void **)(v31 + 48);
              if (v57)
              {
                *(void *)(v31 + 56) = v57;
                operator delete(v57);
              }
              __int16 v58 = *(void **)(v31 + 24);
              if (v58)
              {
                *(void *)(v31 + 32) = v58;
                operator delete(v58);
              }
              int v59 = *(void **)v31;
              if (*(void *)v31)
              {
                *(void *)(v31 + 8) = v59;
                operator delete(v59);
              }
              _Unwind_Resume(a1);
            }
          }
        }
      }
    }
  }
}

void Scandium::ScandiumPPG::scandium_spo2_processor_t::~scandium_spo2_processor_t(id **this)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  log = Scandium::algs_get_log((Scandium *)this);
  uint64_t v3 = (void **)(this + 79061);
  unint64_t v4 = (void **)(this + 78227);
  unint64_t v5 = (void **)(this + 77915);
  int v6 = this + 76854;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = *((_DWORD *)this + 193136);
    v32[0] = 67109120;
    v32[1] = v7;
    _os_log_impl(&dword_25BA34000, log, OS_LOG_TYPE_DEFAULT, "scandium process packet counts: %d", (uint8_t *)v32, 8u);
  }
  std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 96593);
  std::__function::__value_func<void ()(BOOL)>::~__value_func[abi:ne180100](this + 96589);
  std::__function::__value_func<void ()(BOOL)>::~__value_func[abi:ne180100](this + 96585);
  std::__function::__value_func<void ()(Scandium::AbortReason)>::~__value_func[abi:ne180100](this + 96581);
  std::__function::__value_func<void ()(Scandium::ScandiumPPG::SpO2Result)>::~__value_func[abi:ne180100](this + 96577);
  Scandium::ScandiumPPG::scandium_channel_combination_t::~scandium_channel_combination_t((Scandium::ScandiumPPG::scandium_channel_combination_t *)(this + 96432));
  Scandium::ScandiumPPG::scandium_quality_metric_t::~scandium_quality_metric_t((Scandium::ScandiumPPG::scandium_quality_metric_t *)(this + 96376));
  Scandium::scandium_mvmt_detection_t::~scandium_mvmt_detection_t((Scandium::scandium_mvmt_detection_t *)(this + 96355));
  Scandium::ScandiumPPG::scandium_spo2_t::~scandium_spo2_t(this + 96350);
  Scandium::ScandiumPPG::scandium_calibration_t::reset((Scandium::ScandiumPPG::scandium_calibration_t *)(this + 96349));
  Scandium::ScandiumPPG::scandium_signal_conditioning_t::~scandium_signal_conditioning_t((Scandium::ScandiumPPG::scandium_signal_conditioning_t *)(this + 96327));
  for (uint64_t i = 0; i != -128; i -= 16)
    Scandium::ScandiumPPG::scandium_bga_t::~scandium_bga_t((Scandium::ScandiumPPG::scandium_bga_t *)&this[i + 96311]);
  for (uint64_t j = 0; j != -256; j -= 16)
    Scandium::ScandiumPPG::scandium_bga_t::~scandium_bga_t((Scandium::ScandiumPPG::scandium_bga_t *)&this[j + 96183]);
  for (uint64_t k = 0; k != -256; k -= 16)
    Scandium::ScandiumPPG::scandium_bga_t::~scandium_bga_t((Scandium::ScandiumPPG::scandium_bga_t *)&this[k + 95927]);
  Scandium::ScandiumPPG::scandium_beat_detection_t::~scandium_beat_detection_t((Scandium::ScandiumPPG::scandium_beat_detection_t *)(this + 79082));
  float v11 = this[79073];
  if (v11)
  {
    this[79074] = v11;
    operator delete(v11);
  }
  uint64_t v12 = this[79070];
  if (v12)
  {
    this[79071] = v12;
    operator delete(v12);
  }
  uint64_t v13 = this[79067];
  if (v13)
  {
    this[79068] = v13;
    operator delete(v13);
  }
  uint64_t v14 = this[79064];
  if (v14)
  {
    this[79065] = v14;
    operator delete(v14);
  }
  uint64_t v15 = (id *)*v3;
  if (*v3)
  {
    this[79062] = v15;
    operator delete(v15);
  }
  long long v16 = (id *)*v4;
  if (*v4)
  {
    this[78228] = v16;
    operator delete(v16);
  }
  long long v17 = this[77918];
  if (v17)
  {
    this[77919] = v17;
    operator delete(v17);
  }
  long long v18 = (id *)*v5;
  if (*v5)
  {
    this[77916] = v18;
    operator delete(v18);
  }
  long long v19 = this + 76950;
  uint64_t v20 = -384;
  do
  {
    long long v21 = (void *)*(v19 - 1);
    if (v21)
    {
      *long long v19 = v21;
      operator delete(v21);
    }
    v19 -= 3;
    v20 += 24;
  }
  while (v20);
  uint64_t v22 = this + 76902;
  uint64_t v23 = -384;
  do
  {
    float v24 = (void *)*(v22 - 1);
    if (v24)
    {
      *uint64_t v22 = v24;
      operator delete(v24);
    }
    v22 -= 3;
    v23 += 24;
  }
  while (v23);
  uint64_t v25 = -192;
  do
  {
    double v26 = (void *)*(v6 - 1);
    if (v26)
    {
      void *v6 = v26;
      operator delete(v26);
    }
    v6 -= 3;
    v25 += 24;
  }
  while (v25);
  uint64_t v27 = this[12];
  if (v27)
  {
    this[13] = v27;
    operator delete(v27);
  }
  uint64_t v28 = this[9];
  if (v28)
  {
    this[10] = v28;
    operator delete(v28);
  }
  uint64_t v29 = this[6];
  if (v29)
  {
    this[7] = v29;
    operator delete(v29);
  }
  uint64_t v30 = this[3];
  if (v30)
  {
    this[4] = v30;
    operator delete(v30);
  }
  uint64_t v31 = *this;
  if (*this)
  {
    this[1] = v31;
    operator delete(v31);
  }
}

void sub_25BA50038(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  __clang_call_terminate(a1);
}

float Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_median_hr(int a1, const float *a2, stats *this)
{
  if (a2 == 3) {
    return stats::median(this, a2);
  }
  if (a2 == 2) {
    return stats::mean(this, a2);
  }
  float result = 0.0;
  if (a2 == 1) {
    return *(float *)this->cp_time;
  }
  return result;
}

float Scandium::ScandiumPPG::scandium_spo2_processor_t::median_hr_allpaths(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = 0;
  uint64_t v4 = 0;
  std::string __p = 0;
  long long v18 = 0;
  long long v19 = 0;
  do
  {
    unint64_t v5 = (int *)(a2 + 112 * v4 + 96);
    if (v3 >= v19)
    {
      int v7 = __p;
      uint64_t v8 = (v3 - (char *)__p) >> 2;
      unint64_t v9 = v8 + 1;
      if ((unint64_t)(v8 + 1) >> 62) {
        std::vector<float>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v10 = v19 - (char *)__p;
      if ((v19 - (char *)__p) >> 1 > v9) {
        unint64_t v9 = v10 >> 1;
      }
      if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v11 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v11 = v9;
      }
      if (v11)
      {
        uint64_t v12 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v19, v11);
        int v7 = __p;
        uint64_t v3 = v18;
      }
      else
      {
        uint64_t v12 = 0;
      }
      uint64_t v13 = (stats *)&v12[4 * v8];
      v13->cp_time[0] = *v5;
      int v6 = &v13->cp_time[1];
      while (v3 != (char *)v7)
      {
        int v14 = *((_DWORD *)v3 - 1);
        v3 -= 4;
        v13[-1].if_opackets = v14;
        uint64_t v13 = (stats *)((char *)v13 - 4);
      }
      std::string __p = v13;
      long long v19 = &v12[4 * v11];
      if (v7) {
        operator delete(v7);
      }
    }
    else
    {
      *(_DWORD *)uint64_t v3 = *v5;
      int v6 = (int *)(v3 + 4);
    }
    long long v18 = (char *)v6;
    ++v4;
    uint64_t v3 = (char *)v6;
  }
  while (v4 != 16);
  float v15 = stats::median(__p, (const float *)0x10);
  if (__p) {
    operator delete(__p);
  }
  return v15;
}

void sub_25BA501D0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

BOOL Scandium::ScandiumPPG::scandium_spo2_processor_t::copy_to_bga_window(Scandium::ScandiumPPG::scandium_spo2_processor_t *this, int a2, int a3)
{
  unint64_t v5 = (char *)this + 772524;
  int v6 = 320 * a2;
  int v7 = 320 * a2 + 960;
  if (v7 >= a3) {
    int v8 = a3;
  }
  else {
    int v8 = 320 * a2 + 960;
  }
  unint64_t v9 = (char *)this + 4 * v6;
  if (v8 > 320 * a2)
  {
    uint64_t v10 = (unsigned int *)(v9 + 625840);
    int v11 = v8 - v6;
    do
    {
      unsigned int v12 = *v10++;
      Scandium::flag_to_abort_reason(v12, (void *)this + 96566);
      --v11;
    }
    while (v11);
  }
  BOOL v13 = (*((_WORD *)v5 + 2) & 0x7FF) != 0;
  if (v7 <= a3)
  {
    *unint64_t v5 = 1;
    uint64_t v14 = v6;
    float v15 = v9 + 252;
    uint64_t v16 = -30720;
    do
    {
      memmove((char *)this + v16 + 414972, v15, 0xF00uLL);
      v15 += 6400;
      v16 += 3840;
    }
    while (v16);
    uint64_t v17 = 0;
    long long v18 = (char *)this + 4 * v14 + 51452;
    do
    {
      memmove((char *)this + v17 + 414972, v18, 0xF00uLL);
      v17 += 3840;
      v18 += 6400;
    }
    while (v17 != 61440);
    uint64_t v19 = 0;
    uint64_t v20 = (char *)this + 4 * v14 + 153852;
    do
    {
      memmove((char *)this + v19 + 476412, v20, 0xF00uLL);
      v19 += 3840;
      v20 += 6400;
    }
    while (v19 != 61440);
    long long v21 = (char *)this + 4 * v14 + 256252;
    uint64_t v22 = -15360;
    do
    {
      memmove((char *)this + v22 + 553212, v21, 0xF00uLL);
      v21 += 6400;
      v22 += 3840;
    }
    while (v22);
    uint64_t v23 = (char *)this + 4 * v14 + 281852;
    uint64_t v24 = -15360;
    do
    {
      memmove((char *)this + v24 + 568572, v23, 0xF00uLL);
      v23 += 6400;
      v24 += 3840;
    }
    while (v24);
    uint64_t v25 = (char *)this + 4 * v14 + 307452;
    uint64_t v26 = -11520;
    do
    {
      memmove((char *)this + v26 + 580092, v25, 0xF00uLL);
      v25 += 6400;
      v26 += 3840;
    }
    while (v26);
    uint64_t v27 = (char *)this + 4 * v14 + 352252;
    uint64_t v28 = -15360;
    do
    {
      memmove((char *)this + v28 + 610812, v27, 0xF00uLL);
      v27 += 6400;
      v28 += 3840;
    }
    while (v28);
    uint64_t v29 = (char *)this + 4 * v14 + 326652;
    uint64_t v30 = -15360;
    do
    {
      memmove((char *)this + v30 + 595452, v29, 0xF00uLL);
      v29 += 6400;
      v30 += 3840;
    }
    while (v30);
    memmove((char *)this + 610812, (char *)this + 4 * v14 + 377852, 0xF00uLL);
  }
  else
  {
    *unint64_t v5 = 0;
    return 1;
  }
  return v13;
}

void Scandium::ScandiumPPG::scandium_spo2_processor_t::invoke_abort(Scandium::ScandiumPPG::scandium_spo2_processor_t *this)
{
  uint64_t v1 = *((void *)this + 96571);
  if (v1)
  {
    unsigned __int8 v2 = 0;
  }
  else if ((v1 & 2) != 0)
  {
    unsigned __int8 v2 = 1;
  }
  else if ((v1 & 4) != 0)
  {
    unsigned __int8 v2 = 2;
  }
  else if ((v1 & 0x20) != 0)
  {
    unsigned __int8 v2 = 5;
  }
  else if ((v1 & 0x200) != 0)
  {
    unsigned __int8 v2 = 9;
  }
  else if ((v1 & 0x40) != 0)
  {
    unsigned __int8 v2 = 6;
  }
  else if ((v1 & 0x400) != 0)
  {
    unsigned __int8 v2 = 10;
  }
  else if ((v1 & 0x80) != 0)
  {
    unsigned __int8 v2 = 7;
  }
  else
  {
    unsigned __int8 v2 = 8;
  }
  Scandium::ScandiumPPG::scandium_spo2_processor_t::abort_handler_proxy((unsigned __int8 *)this, v2);
}

void Scandium::ScandiumPPG::scandium_spo2_processor_t::abort_handler_proxy(unsigned __int8 *a1, int a2)
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  uint64_t v4 = (int *)(a1 + 772536);
  switch(a2)
  {
    case 0:
      log = Scandium::algs_get_log((Scandium *)a1);
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        int v6 = v4[2];
        *(_DWORD *)buf = 67109120;
        int v36 = v6;
        int v7 = "scandium abort handler pkt %d: thermistor_broken";
        goto LABEL_24;
      }
      break;
    case 1:
      log = Scandium::algs_get_log((Scandium *)a1);
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = v4[2];
        *(_DWORD *)buf = 67109120;
        int v36 = v13;
        int v7 = "scandium abort handler pkt %d: motion";
        goto LABEL_24;
      }
      break;
    case 2:
      log = Scandium::algs_get_log((Scandium *)a1);
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = v4[2];
        *(_DWORD *)buf = 67109120;
        int v36 = v10;
        int v7 = "scandium abort handler pkt %d: posture";
        goto LABEL_24;
      }
      break;
    case 3:
      log = Scandium::algs_get_log((Scandium *)a1);
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = v4[2];
        *(_DWORD *)buf = 67109120;
        int v36 = v11;
        int v7 = "scandium abort handler pkt %d: low HR";
        goto LABEL_24;
      }
      break;
    case 4:
      log = Scandium::algs_get_log((Scandium *)a1);
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = v4[2];
        *(_DWORD *)buf = 67109120;
        int v36 = v8;
        int v7 = "scandium abort handler pkt %d: high HR";
        goto LABEL_24;
      }
      break;
    case 5:
      log = Scandium::algs_get_log((Scandium *)a1);
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = v4[2];
        *(_DWORD *)buf = 67109120;
        int v36 = v14;
        int v7 = "scandium abort handler pkt %d: poor_signal";
        goto LABEL_24;
      }
      break;
    case 6:
      log = Scandium::algs_get_log((Scandium *)a1);
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = v4[2];
        *(_DWORD *)buf = 67109120;
        int v36 = v15;
        int v7 = "scandium abort handler pkt %d: samples_dropped";
        goto LABEL_24;
      }
      break;
    case 7:
      log = Scandium::algs_get_log((Scandium *)a1);
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = v4[2];
        *(_DWORD *)buf = 67109120;
        int v36 = v12;
        int v7 = "scandium abort handler pkt %d: hardware_recovery";
        goto LABEL_24;
      }
      break;
    case 8:
      log = Scandium::algs_get_log((Scandium *)a1);
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = v4[2];
        *(_DWORD *)buf = 67109120;
        int v36 = v17;
        int v7 = "scandium abort handler pkt %d: err_failed";
        goto LABEL_24;
      }
      break;
    case 9:
      log = Scandium::algs_get_log((Scandium *)a1);
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = v4[2];
        *(_DWORD *)buf = 67109120;
        int v36 = v9;
        int v7 = "scandium abort handler pkt %d: accel_poor_signal";
        goto LABEL_24;
      }
      break;
    case 10:
      log = Scandium::algs_get_log((Scandium *)a1);
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = v4[2];
        *(_DWORD *)buf = 67109120;
        int v36 = v16;
        int v7 = "scandium abort handler pkt %d: excessive_invalid_samples";
LABEL_24:
        long long v18 = log;
        uint32_t v19 = 8;
        goto LABEL_25;
      }
      break;
    default:
      uint64_t v23 = Scandium::algs_get_log((Scandium *)a1);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        int v24 = v4[2];
        *(_DWORD *)buf = 67109376;
        int v36 = v24;
        __int16 v37 = 1024;
        int v38 = a2;
        int v7 = "scandium abort handler pkt %d: %d";
        long long v18 = v23;
        uint32_t v19 = 14;
LABEL_25:
        _os_log_impl(&dword_25BA34000, v18, OS_LOG_TYPE_DEFAULT, v7, buf, v19);
      }
      break;
  }
  Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics((Scandium::ScandiumPPG::scandium_spo2_processor_t *)a1);
  if (*((void *)v4 + 29))
  {
    std::string::basic_string[abi:ne180100]<0>(v33, "abort");
    std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::pair[abi:ne180100]<char const(&)[13],char const(&)[7],0>((uint64_t)buf, "algs_version", "11.1.4");
    std::string::basic_string[abi:ne180100]<0>(v39, "algs_mode");
    int v40 = a1[770698];
    int v41 = 1;
    unint64_t v20 = *v4;
    v29[1] = 0;
    uint64_t v30 = 0;
    v29[0] = 0;
    std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(v29, a1 + 623296, (uint64_t)&a1[4 * v20 + 623296], v20);
    std::string::basic_string[abi:ne180100]<0>(v42, "window_spo2");
    long long v43 = *(_OWORD *)v29;
    uint64_t v44 = v30;
    v29[1] = 0;
    uint64_t v30 = 0;
    v29[0] = 0;
    int v45 = 3;
    int v46 = 6;
    v27[0] = 0;
    v27[1] = 0;
    uint64_t v28 = 0;
    std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(v27, a1 + 623308, (uint64_t)(a1 + 623320), 3uLL);
    std::string::basic_string[abi:ne180100]<0>(v47, "window_spo2_no_conf_gate");
    long long v48 = *(_OWORD *)v27;
    uint64_t v49 = v28;
    v27[1] = 0;
    uint64_t v28 = 0;
    v27[0] = 0;
    int v50 = 3;
    int v51 = 6;
    __p[0] = 0;
    __p[1] = 0;
    uint64_t v26 = 0;
    std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(__p, a1 + 623368, (uint64_t)(a1 + 623380), 3uLL);
    std::string::basic_string[abi:ne180100]<0>(v52, "window_hr");
    long long v53 = *(_OWORD *)__p;
    uint64_t v54 = v26;
    __p[1] = 0;
    uint64_t v26 = 0;
    __p[0] = 0;
    int v55 = 3;
    int v56 = 6;
    std::string::basic_string[abi:ne180100]<0>(v57, "abort_reason");
    int v58 = a2;
    int v59 = 1;
    std::string::basic_string[abi:ne180100]<0>(v60, "packet_idx");
    int v61 = v4[2];
    int v62 = 1;
    std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::unordered_map((uint64_t)v32, buf, 7);
    uint64_t v21 = *((void *)v4 + 29);
    if (!v21) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    (*(void (**)(uint64_t, void **, unsigned char *))(*(void *)v21 + 48))(v21, v33, v32);
    std::__hash_table<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>>>::~__hash_table((uint64_t)v32);
    uint64_t v22 = 504;
    do
    {
      std::__variant_detail::__dtor<std::__variant_detail::__traits<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v32[v22 + 24]);
      if ((char)v32[v22 + 15] < 0) {
        operator delete(*(void **)&v31[v22]);
      }
      v22 -= 72;
    }
    while (v22);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    if (v27[0])
    {
      v27[1] = v27[0];
      operator delete(v27[0]);
    }
    if (v29[0])
    {
      v29[1] = v29[0];
      operator delete(v29[0]);
    }
    if (v34 < 0) {
      operator delete(v33[0]);
    }
    Scandium::ScandiumPPG::scandium_spo2_processor_t::log_core_analytics((Scandium::ScandiumPPG::scandium_spo2_processor_t *)a1);
  }
  if (*((void *)v4 + 17)) {
    std::function<void ()(Scandium::AbortReason)>::operator()((uint64_t)(a1 + 772648), a2);
  }
}

void sub_25BA50B90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26,uint64_t a27,int a28,__int16 a29,char a30,char a31,char a32)
{
  for (uint64_t i = 432; i != -72; i -= 72)
    std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::~pair((uint64_t)(&a32 + i));
  if (__p) {
    operator delete(__p);
  }
  if (a13) {
    operator delete(a13);
  }
  if (a17) {
    operator delete(a17);
  }
  if (a31 < 0) {
    operator delete(a26);
  }
  _Unwind_Resume(a1);
}

void Scandium::ScandiumPPG::scandium_spo2_processor_t::log_start_packet(uint64_t a1, unsigned __int8 *a2)
{
  uint64_t v94 = *MEMORY[0x263EF8340];
  unsigned __int8 v2 = (void *)(a1 + 772768);
  if (*(void *)(a1 + 772768))
  {
    std::string::basic_string[abi:ne180100]<0>(v22, "start_packet");
    std::string::basic_string[abi:ne180100]<0>(v24, "frame_type");
    int v25 = *a2;
    int v26 = 1;
    std::string::basic_string[abi:ne180100]<0>(v27, "frame_index");
    int v28 = *(unsigned __int16 *)(a2 + 1);
    int v29 = 1;
    uint64_t v4 = *(void *)(a2 + 3);
    std::string::basic_string[abi:ne180100]<0>(v30, "rtp_timestamp");
    void v30[4] = v4;
    int v31 = 2;
    std::string::basic_string[abi:ne180100]<0>(v32, "num_of_samples");
    int v33 = *(unsigned __int16 *)(a2 + 11);
    int v34 = 1;
    std::string::basic_string[abi:ne180100]<0>(v35, "sc_algs_mode");
    int v36 = a2[13];
    int v37 = 1;
    std::string::basic_string[abi:ne180100]<0>(v38, "cookie");
    int v39 = a2[14];
    int v40 = 1;
    v18[0] = 0;
    v18[1] = 0;
    uint64_t v19 = 0;
    std::vector<int>::__init_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>((char *)v18, a2 + 15, a2 + 19, 4uLL);
    std::string::basic_string[abi:ne180100]<0>(v41, "blank_tia_gains");
    long long v42 = *(_OWORD *)v18;
    uint64_t v43 = v19;
    v18[1] = 0;
    uint64_t v19 = 0;
    v18[0] = 0;
    int v44 = 1;
    int v45 = 6;
    v16[0] = 0;
    v16[1] = 0;
    uint64_t v17 = 0;
    std::vector<int>::__init_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>((char *)v16, a2 + 19, a2 + 27, 8uLL);
    std::string::basic_string[abi:ne180100]<0>(v46, "green_tia_gains");
    long long v47 = *(_OWORD *)v16;
    uint64_t v48 = v17;
    v16[1] = 0;
    uint64_t v17 = 0;
    v16[0] = 0;
    int v49 = 1;
    int v50 = 6;
    v14[0] = 0;
    v14[1] = 0;
    uint64_t v15 = 0;
    std::vector<int>::__init_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>((char *)v14, a2 + 27, a2 + 43, 0x10uLL);
    std::string::basic_string[abi:ne180100]<0>(v51, "red_tia_gains");
    long long v52 = *(_OWORD *)v14;
    uint64_t v53 = v15;
    v14[1] = 0;
    uint64_t v15 = 0;
    v14[0] = 0;
    int v54 = 1;
    int v55 = 6;
    v12[0] = 0;
    v12[1] = 0;
    uint64_t v13 = 0;
    std::vector<int>::__init_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>((char *)v12, a2 + 43, a2 + 59, 0x10uLL);
    std::string::basic_string[abi:ne180100]<0>(v56, "ir_tia_gains");
    long long v57 = *(_OWORD *)v12;
    uint64_t v58 = v13;
    v12[1] = 0;
    uint64_t v13 = 0;
    v12[0] = 0;
    int v59 = 1;
    int v60 = 6;
    v10[0] = 0;
    v10[1] = 0;
    uint64_t v11 = 0;
    std::vector<float>::__init_with_size[abi:ne180100]<float const*,float const*>(v10, a2 + 59, (uint64_t)(a2 + 75), 4uLL);
    std::string::basic_string[abi:ne180100]<0>(v61, "green_iled");
    long long v62 = *(_OWORD *)v10;
    uint64_t v63 = v11;
    v10[1] = 0;
    uint64_t v11 = 0;
    v10[0] = 0;
    int v64 = 3;
    int v65 = 6;
    v8[0] = 0;
    v8[1] = 0;
    uint64_t v9 = 0;
    std::vector<float>::__init_with_size[abi:ne180100]<float const*,float const*>(v8, a2 + 75, (uint64_t)(a2 + 91), 4uLL);
    std::string::basic_string[abi:ne180100]<0>(v66, "red_iled");
    long long v67 = *(_OWORD *)v8;
    uint64_t v68 = v9;
    v8[1] = 0;
    uint64_t v9 = 0;
    v8[0] = 0;
    int v69 = 3;
    int v70 = 6;
    __p[0] = 0;
    __p[1] = 0;
    uint64_t v7 = 0;
    std::vector<float>::__init_with_size[abi:ne180100]<float const*,float const*>(__p, a2 + 91, (uint64_t)(a2 + 107), 4uLL);
    std::string::basic_string[abi:ne180100]<0>(v71, "ir_iled");
    long long v72 = *(_OWORD *)__p;
    uint64_t v73 = v7;
    __p[1] = 0;
    uint64_t v7 = 0;
    __p[0] = 0;
    int v74 = 3;
    int v75 = 6;
    std::string::basic_string[abi:ne180100]<0>(v76, "hfw");
    int v77 = a2[107];
    int v78 = 1;
    std::string::basic_string[abi:ne180100]<0>(v79, "win_len");
    int v80 = *((unsigned __int16 *)a2 + 54);
    int v81 = 1;
    std::string::basic_string[abi:ne180100]<0>(v82, "agc_opc_duration_ms");
    int v83 = *((unsigned __int16 *)a2 + 55);
    int v84 = 1;
    std::string::basic_string[abi:ne180100]<0>(v85, "agc_opc_green_fs_enum");
    int v86 = a2[112];
    int v87 = 1;
    std::string::basic_string[abi:ne180100]<0>(v88, "agc_opc_num_retries");
    int v89 = a2[113];
    int v90 = 1;
    std::string::basic_string[abi:ne180100]<0>(v91, "agc_opc_num_converged");
    int v92 = a2[114];
    int v93 = 1;
    std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::unordered_map((uint64_t)v21, (unsigned __int8 *)v24, 19);
    if (!*v2) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    (*(void (**)(void, void **, unsigned char *))(*(void *)*v2 + 48))(*v2, v22, v21);
    std::__hash_table<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>>>::~__hash_table((uint64_t)v21);
    uint64_t v5 = 1368;
    do
    {
      std::__variant_detail::__dtor<std::__variant_detail::__traits<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v21[v5 + 24]);
      if ((char)v21[v5 + 15] < 0) {
        operator delete(*(void **)&v20[v5]);
      }
      v5 -= 72;
    }
    while (v5);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    if (v8[0])
    {
      v8[1] = v8[0];
      operator delete(v8[0]);
    }
    if (v10[0])
    {
      v10[1] = v10[0];
      operator delete(v10[0]);
    }
    if (v12[0])
    {
      v12[1] = v12[0];
      operator delete(v12[0]);
    }
    if (v14[0])
    {
      v14[1] = v14[0];
      operator delete(v14[0]);
    }
    if (v16[0])
    {
      v16[1] = v16[0];
      operator delete(v16[0]);
    }
    if (v18[0])
    {
      v18[1] = v18[0];
      operator delete(v18[0]);
    }
    if (v23 < 0) {
      operator delete(v22[0]);
    }
  }
}

void sub_25BA51290(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25,uint64_t a26,uint64_t a27,uint64_t a28,void *a29,uint64_t a30,uint64_t a31,uint64_t a32,void *a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,void *a42,uint64_t a43,int a44,__int16 a45,char a46,char a47,char a48)
{
  for (uint64_t i = 1296; i != -72; i -= 72)
    std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::~pair((uint64_t)(&a48 + i));
  if (__p) {
    operator delete(__p);
  }
  if (a13) {
    operator delete(a13);
  }
  if (a17) {
    operator delete(a17);
  }
  if (a21) {
    operator delete(a21);
  }
  if (a25) {
    operator delete(a25);
  }
  if (a29) {
    operator delete(a29);
  }
  if (a33) {
    operator delete(a33);
  }
  if (a47 < 0) {
    operator delete(a42);
  }
  _Unwind_Resume(a1);
}

uint64_t Scandium::ScandiumPPG::scandium_spo2_processor_t::log_input_signal(uint64_t this)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v1 = (void *)(this + 772768);
  if (*(void *)(this + 772768))
  {
    uint64_t v2 = this;
    memset(v19, 0, sizeof(v19));
    int v20 = 1065353216;
    uint64_t v17 = 115;
    uint64_t v18 = 0x900000000000000;
    int v16 = *(void **)"green_dcs";
    std::accumulate[abi:ne180100]<std::array<float,1600ul> *,int,Scandium::ScandiumPPG::scandium_spo2_processor_t::log_input_signal(void)::$_0>((char *)(this + 252), (char *)(this + 51452), (uint64_t)v19, (const void **)&v16);
    if (SHIBYTE(v18) < 0)
    {
      uint64_t v17 = 7;
      uint64_t v3 = (char *)v16;
    }
    else
    {
      HIBYTE(v18) = 7;
      uint64_t v3 = (char *)&v16;
    }
    strcpy(v3, "red_dcs");
    std::accumulate[abi:ne180100]<std::array<float,1600ul> *,int,Scandium::ScandiumPPG::scandium_spo2_processor_t::log_input_signal(void)::$_0>((char *)(v2 + 51452), (char *)(v2 + 153852), (uint64_t)v19, (const void **)&v16);
    if (SHIBYTE(v18) < 0)
    {
      uint64_t v17 = 6;
      uint64_t v4 = (char *)v16;
    }
    else
    {
      HIBYTE(v18) = 6;
      uint64_t v4 = (char *)&v16;
    }
    strcpy(v4, "ir_dcs");
    std::accumulate[abi:ne180100]<std::array<float,1600ul> *,int,Scandium::ScandiumPPG::scandium_spo2_processor_t::log_input_signal(void)::$_0>((char *)(v2 + 153852), (char *)(v2 + 256252), (uint64_t)v19, (const void **)&v16);
    if (SHIBYTE(v18) < 0)
    {
      uint64_t v17 = 9;
      uint64_t v5 = (char *)v16;
    }
    else
    {
      HIBYTE(v18) = 9;
      uint64_t v5 = (char *)&v16;
    }
    strcpy(v5, "blank_dcs");
    std::accumulate[abi:ne180100]<std::array<float,1600ul> *,int,Scandium::ScandiumPPG::scandium_spo2_processor_t::log_input_signal(void)::$_0>((char *)(v2 + 256252), (char *)(v2 + 281852), (uint64_t)v19, (const void **)&v16);
    if (SHIBYTE(v18) < 0)
    {
      uint64_t v17 = 11;
      int v6 = (char *)v16;
    }
    else
    {
      HIBYTE(v18) = 11;
      int v6 = (char *)&v16;
    }
    strcpy(v6, "blank_light");
    std::accumulate[abi:ne180100]<std::array<float,1600ul> *,int,Scandium::ScandiumPPG::scandium_spo2_processor_t::log_input_signal(void)::$_0>((char *)(v2 + 281852), (char *)(v2 + 307452), (uint64_t)v19, (const void **)&v16);
    if (SHIBYTE(v18) < 0)
    {
      uint64_t v17 = 5;
      uint64_t v7 = (char *)v16;
    }
    else
    {
      HIBYTE(v18) = 5;
      uint64_t v7 = (char *)&v16;
    }
    strcpy(v7, "accel");
    std::accumulate[abi:ne180100]<std::array<float,1600ul> *,int,Scandium::ScandiumPPG::scandium_spo2_processor_t::log_input_signal(void)::$_0>((char *)(v2 + 307452), (char *)(v2 + 326652), (uint64_t)v19, (const void **)&v16);
    if (SHIBYTE(v18) < 0)
    {
      uint64_t v17 = 13;
      int v8 = (char *)v16;
    }
    else
    {
      HIBYTE(v18) = 13;
      int v8 = (char *)&v16;
    }
    strcpy(v8, "ir_wavelength");
    std::accumulate[abi:ne180100]<std::array<float,1600ul> *,int,Scandium::ScandiumPPG::scandium_spo2_processor_t::log_input_signal(void)::$_0>((char *)(v2 + 326652), (char *)(v2 + 352252), (uint64_t)v19, (const void **)&v16);
    if (SHIBYTE(v18) < 0)
    {
      uint64_t v17 = 14;
      uint64_t v9 = (char *)v16;
    }
    else
    {
      HIBYTE(v18) = 14;
      uint64_t v9 = (char *)&v16;
    }
    strcpy(v9, "red_wavelength");
    std::accumulate[abi:ne180100]<std::array<float,1600ul> *,int,Scandium::ScandiumPPG::scandium_spo2_processor_t::log_input_signal(void)::$_0>((char *)(v2 + 352252), (char *)(v2 + 377852), (uint64_t)v19, (const void **)&v16);
    v14[0] = 0;
    v14[1] = 0;
    uint64_t v15 = 0;
    std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(v14, (const void *)(v2 + 377852), v2 + 384252, 0x640uLL);
    std::string::basic_string[abi:ne180100]<0>(v21, "temperature");
    long long v23 = *(_OWORD *)v14;
    uint64_t v24 = v15;
    v14[1] = 0;
    uint64_t v15 = 0;
    v14[0] = 0;
    int v25 = 3;
    int v26 = 6;
    __p[0] = 0;
    __p[1] = 0;
    uint64_t v13 = 0;
    std::vector<int>::__init_with_size[abi:ne180100]<unsigned int *,unsigned int *>((char *)__p, (int *)(v2 + 625840), (int *)(v2 + 632240), 0x640uLL);
    std::string::basic_string[abi:ne180100]<0>(v27, "failure_flags");
    uint64_t v10 = 0;
    long long v28 = *(_OWORD *)__p;
    uint64_t v29 = v13;
    __p[1] = 0;
    uint64_t v13 = 0;
    __p[0] = 0;
    int v30 = 1;
    int v31 = 6;
    do
    {
      std::__hash_table<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&>((uint64_t)v19, (unsigned __int8 *)&v21[v10], (long long *)&v21[v10]);
      v10 += 9;
    }
    while (v10 != 18);
    for (uint64_t i = 0; i != -18; i -= 9)
    {
      std::__variant_detail::__dtor<std::__variant_detail::__traits<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v28 + i * 8);
      if (SHIBYTE(v27[i + 2]) < 0) {
        operator delete((void *)v27[i]);
      }
    }
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    if (v14[0])
    {
      v14[1] = v14[0];
      operator delete(v14[0]);
    }
    std::string::basic_string[abi:ne180100]<0>(v21, "input_buffer");
    if (!*v1) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    (*(void (**)(void, void **, _OWORD *))(*(void *)*v1 + 48))(*v1, v21, v19);
    if (v22 < 0) {
      operator delete(v21[0]);
    }
    if (SHIBYTE(v18) < 0) {
      operator delete(v16);
    }
    return std::__hash_table<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>>>::~__hash_table((uint64_t)v19);
  }
  return this;
}

void sub_25BA518E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27,uint64_t a28,int a29,__int16 a30,char a31,char a32)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  std::__hash_table<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>>>::~__hash_table((uint64_t)&a22);
  _Unwind_Resume(a1);
}

void std::accumulate[abi:ne180100]<std::array<float,1600ul> *,int,Scandium::ScandiumPPG::scandium_spo2_processor_t::log_input_signal(void)::$_0>(char *a1, char *a2, uint64_t a3, const void **a4)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (a1 != a2)
  {
    uint64_t v7 = a1;
    int v8 = 0;
    do
    {
      if (*((char *)a4 + 23) >= 0) {
        size_t v9 = *((unsigned __int8 *)a4 + 23);
      }
      else {
        size_t v9 = (size_t)a4[1];
      }
      std::string::basic_string[abi:ne180100]((uint64_t)&v21, v9 + 1);
      if ((v21.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        uint64_t v10 = &v21;
      }
      else {
        uint64_t v10 = (std::string *)v21.__r_.__value_.__r.__words[0];
      }
      if (v9)
      {
        if (*((char *)a4 + 23) >= 0) {
          uint64_t v11 = a4;
        }
        else {
          uint64_t v11 = *a4;
        }
        memmove(v10, v11, v9);
      }
      *(_WORD *)((char *)&v10->__r_.__value_.__l.__data_ + v9) = 95;
      std::to_string(&v20, v8);
      if ((v20.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        int v12 = &v20;
      }
      else {
        int v12 = (std::string *)v20.__r_.__value_.__r.__words[0];
      }
      if ((v20.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type size = HIBYTE(v20.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type size = v20.__r_.__value_.__l.__size_;
      }
      int v14 = std::string::append(&v21, (const std::string::value_type *)v12, size);
      uint64_t v15 = (void *)v14->__r_.__value_.__r.__words[0];
      v22[0] = v14->__r_.__value_.__l.__size_;
      *(void *)((char *)v22 + 7) = *(std::string::size_type *)((char *)&v14->__r_.__value_.__r.__words[1] + 7);
      char v16 = HIBYTE(v14->__r_.__value_.__r.__words[2]);
      v14->__r_.__value_.__l.__size_ = 0;
      v14->__r_.__value_.__r.__words[2] = 0;
      v14->__r_.__value_.__r.__words[0] = 0;
      uint64_t v17 = v7 + 6400;
      v18[0] = 0;
      v18[1] = 0;
      uint64_t v19 = 0;
      std::vector<float>::__init_with_size[abi:ne180100]<float const*,float const*>(v18, v7, (uint64_t)(v7 + 6400), 0x640uLL);
      std::string __p = v15;
      *(void *)uint64_t v24 = v22[0];
      *(void *)&v24[7] = *(void *)((char *)v22 + 7);
      char v25 = v16;
      long long v26 = *(_OWORD *)v18;
      uint64_t v27 = v19;
      v18[0] = 0;
      v18[1] = 0;
      uint64_t v19 = 0;
      int v28 = 3;
      int v29 = 6;
      std::__hash_table<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&>(a3, (unsigned __int8 *)&__p, (long long *)&__p);
      std::__variant_detail::__dtor<std::__variant_detail::__traits<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v26);
      if (v25 < 0) {
        operator delete(__p);
      }
      if (v18[0])
      {
        v18[1] = v18[0];
        operator delete(v18[0]);
      }
      if (SHIBYTE(v20.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v20.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v21.__r_.__value_.__l.__data_);
      }
      ++v8;
      v7 += 6400;
    }
    while (v17 != a2);
  }
}

void sub_25BA51BD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,uint64_t a25,void *__p,uint64_t a27,int a28,__int16 a29,char a30,char a31)
{
  std::__variant_detail::__dtor<std::__variant_detail::__traits<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>,(std::__variant_detail::_Trait)1>::~__dtor(v31);
  if (a31 < 0) {
    operator delete(__p);
  }
  if (a9) {
    operator delete(a9);
  }
  if (a17 < 0) {
    operator delete(a12);
  }
  if (a23 < 0) {
    operator delete(a18);
  }
  _Unwind_Resume(a1);
}

void Scandium::ScandiumPPG::scandium_spo2_processor_t::compute_mvmt_posture_bailout(Scandium::ScandiumPPG::scandium_spo2_processor_t *this)
{
  uint64_t v1 = (_DWORD *)off_2709333F0(this);
  uint64_t v2 = v1 + 193128;
  signed int v3 = v1[193136];
  if (!(v3 % v1[193144]) && v1[193146] <= v3)
  {
    if (v3 >= 0x641) {
      Scandium::ScandiumPPG::scandium_spo2_processor_t::compute_mvmt_posture_bailout();
    }
    uint64_t v4 = (float *)v1;
    uint64_t v5 = v1 + 192746;
    int v28 = (char *)v1 + 770698;
    int v6 = (const float *)(int)v1[193145];
    uint64_t v7 = (char *)&v1[v3 - v6 + 76863];
    uint64_t v8 = -11520;
    do
    {
      if (v6) {
        memcpy(&v31[v8 + 11520], v7, 4 * (void)v6);
      }
      v7 += 6400;
      v8 += 3840;
    }
    while (v8);
    Scandium::scandium_mvmt_detection_t::process((uint64_t)(v4 + 192710), (uint64_t)v31, 0, v6);
    if (*v2 == 1)
    {
      *((unsigned char *)v2 + 52) |= v28[175];
      *((unsigned char *)v2 + 53) |= v28[174];
    }
    std::string __p = 0;
    v30[0] = 0;
    v30[1] = 0;
    std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&__p, *(const void **)v5, *((void *)v5 + 1), (uint64_t)(*((void *)v5 + 1) - *(void *)v5) >> 2);
    uint64_t v10 = (float *)__p;
    if ((void *)v30[0] != __p)
    {
      if (*v28 == 1)
      {
        uint64_t v11 = (float *)((char *)__p + 4);
        if ((char *)__p + 4 != (void *)v30[0])
        {
          float v12 = *(float *)__p;
          uint64_t v13 = (float *)((char *)__p + 4);
          do
          {
            float v14 = *v13++;
            float v15 = v14;
            if (v12 < v14)
            {
              float v12 = v15;
              uint64_t v10 = v11;
            }
            uint64_t v11 = v13;
          }
          while (v13 != (float *)v30[0]);
        }
        Scandium::fill_valid(v4 + 193038, v9, *v10);
        uint64_t v17 = (float *)__p;
        uint64_t v18 = (float *)((char *)__p + 4);
        if (__p != (void *)v30[0] && v18 != (float *)v30[0])
        {
          float v20 = *(float *)__p;
          std::string v21 = (float *)((char *)__p + 4);
          do
          {
            float v22 = *v21++;
            float v23 = v22;
            if (v22 < v20)
            {
              float v20 = v23;
              uint64_t v17 = v18;
            }
            uint64_t v18 = v21;
          }
          while (v21 != (float *)v30[0]);
        }
        Scandium::fill_valid(v4 + 193037, v16, *v17);
        float v24 = Scandium::sort_median((Scandium *)__p, (const float *)((v30[0] - (void)__p) >> 2));
        long long v26 = Scandium::fill_valid(v4 + 193039, v25, v24);
        log = Scandium::algs_get_log((Scandium *)v26);
        if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
          Scandium::ScandiumPPG::scandium_spo2_processor_t::compute_mvmt_posture_bailout(v30, log);
        }
      }
      uint64_t v10 = (float *)__p;
    }
    if (v10)
    {
      v30[0] = v10;
      operator delete(v10);
    }
  }
}

void sub_25BA51EA0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

double Scandium::ScandiumPPG::scandium_spo2_processor_t::compute_dropped_samples_metrics(Scandium::ScandiumPPG::scandium_spo2_processor_t *this)
{
  uint64_t v1 = 0;
  int v2 = 0;
  int v3 = 0;
  uint64_t v11 = (int *)((char *)this + 772544);
  float v12 = (char *)this + 770698;
  uint64_t v4 = (char *)this + 632608;
  uint64_t v5 = (char *)this + 625840;
  uint64_t v10 = (char *)this + 632608;
  do
  {
    unsigned int v6 = 0;
    switch((int)v1)
    {
      case 0:
        unsigned int v6 = 0;
        int v3 = *v11;
        break;
      case 1:
        goto LABEL_6;
      case 2:
        unsigned int v6 = 320;
        goto LABEL_6;
      case 3:
        unsigned int v6 = 640;
LABEL_6:
        if (*v12 == 1)
        {
          int v3 = 0;
          unsigned int v6 = 0;
        }
        else if (((*v11 - v6) & ~((int)(*v11 - v6) >> 31)) >= 0x3C0)
        {
          int v3 = 960;
        }
        else
        {
          int v3 = (*v11 - v6) & ~((int)(*v11 - v6) >> 31);
        }
        break;
      default:
        break;
    }
    uint64_t v7 = 0;
    uint64_t v8 = (uint64_t)v4;
    do
    {
      if (v7 <= 2) {
        int v2 = dword_25BA639B4[v7];
      }
      Scandium::ScandiumPPG::scandium_spo2_processor_t::compute_dropped_samples_metrics_for_window_and_type((uint64_t)this, v8, (int *)&v5[4 * v6], v3, v2);
      ++v7;
      v8 += 4;
    }
    while (v7 != 3);
    ++v1;
    v4 += 12;
  }
  while (v1 != 4);
  double result = *(double *)v10;
  *(void *)(v12 + 151std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_processor_t>::reset[abi:ne180100](this, 0) = *(void *)v10;
  *((_WORD *)v12 + 765) = *((_WORD *)v10 + 4);
  *((_WORD *)v12 + 759) = *((_WORD *)v10 + 6);
  *((_WORD *)v12 + 76std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_processor_t>::reset[abi:ne180100](this, 0) = *((_WORD *)v10 + 8);
  *((_WORD *)v12 + 761) = *((_WORD *)v10 + 12);
  *((_WORD *)v12 + 762) = *((_WORD *)v10 + 14);
  *((_WORD *)v12 + 763) = *((_WORD *)v10 + 18);
  *((_WORD *)v12 + 76std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = *((_WORD *)v10 + 20);
  return result;
}

void Scandium::ScandiumPPG::scandium_spo2_processor_t::compute_ppg(Scandium::ScandiumPPG::scandium_spo2_processor_t *this)
{
  uint64_t v1 = 632240;
  uint64_t v2 = 614848;
  uint64_t v3 = 414972;
  uint64_t __A = (float *)((char *)this + 615616);
  __C = (float *)((char *)this + 619456);
  uint64_t v31 = (uint64_t *)((char *)this + 770616);
  char v25 = (char *)this + 614656;
  long long v26 = (char *)this + 384252;
  bzero((char *)this + 615616, 0x1E00uLL);
  int v30 = 0;
  uint64_t v4 = 0;
  uint64_t v5 = 476412;
  uint64_t v6 = 615232;
  uint64_t v7 = 632304;
  uint64_t v8 = 632368;
  int v35 = -1;
  uint64_t v9 = 770712;
  do
  {
    uint64_t v10 = 0;
    uint64_t v21 = v4;
    uint64_t v22 = v3;
    int v29 = (char *)&Scandium::ScandiumPPG::path_array + 4 * byte_25BA64CBC[v4];
    uint64_t v17 = v8;
    uint64_t v18 = v7;
    uint64_t v36 = v8;
    uint64_t v11 = v7;
    uint64_t v23 = v2;
    uint64_t v24 = v1;
    uint64_t v19 = v6;
    uint64_t v20 = v5;
    uint64_t v16 = v9;
    do
    {
      uint64_t v37 = v3;
      int v34 = v29[byte_25BA64CBC[v10]];
      char v12 = *((unsigned char *)this + v9 + 16);
      uint64_t v33 = v35 + 1;
      float __B = (char *)this + v1;
      int v51 = (char *)this + v6;
      v46[0] = 0;
      v46[1] = v30 + v10;
      long long v47 = (char *)this + v5;
      int v48 = 960;
      char v49 = v12;
      Scandium::ScandiumPPG::scandium_signal_conditioning_t::process(v31, (uint64_t)v46, (uint64_t)&__B);
      vDSP_vadd(__C, 1, *(const float **)((char *)this + v6), 1, __C, 1, 0x3C0uLL);
      char v13 = *((unsigned char *)this + v9);
      float __B = (char *)this + v11;
      int v51 = (char *)this + v2;
      v42[0] = 1;
      v42[1] = v30 + v10;
      uint64_t v43 = (char *)this + v3;
      int v44 = 960;
      char v45 = v13;
      Scandium::ScandiumPPG::scandium_signal_conditioning_t::process(v31, (uint64_t)v42, (uint64_t)&__B);
      if (v34 == 2) {
        int v14 = v35;
      }
      else {
        int v14 = v35 + 1;
      }
      int v35 = v14;
      if (v34 != 2)
      {
        char v15 = *((unsigned char *)this + v33 + 770704);
        float __B = (char *)this + v36;
        int v51 = &v25[24 * v33];
        v38[0] = 2;
        v38[1] = v30 + v10;
        int v39 = &v26[3840 * v33];
        int v40 = 960;
        char v41 = v15;
        Scandium::ScandiumPPG::scandium_signal_conditioning_t::process(v31, (uint64_t)v38, (uint64_t)&__B);
        vDSP_vadd(__A, 1, (const float *)&v26[3840 * v33], 1, __A, 1, 0x3C0uLL);
      }
      ++v10;
      v5 += 3840;
      v6 += 24;
      v1 += 4;
      v2 += 24;
      v11 += 4;
      v36 += 4;
      ++v9;
      uint64_t v3 = v37 + 3840;
    }
    while (v10 != 4);
    uint64_t v4 = v21 + 1;
    uint64_t v9 = v16 + 4;
    uint64_t v5 = v20 + 15360;
    uint64_t v6 = v19 + 96;
    uint64_t v1 = v24 + 16;
    uint64_t v3 = v22 + 15360;
    uint64_t v2 = v23 + 96;
    uint64_t v7 = v18 + 16;
    uint64_t v8 = v17 + 16;
    v30 += 4;
  }
  while (v21 != 3);
  LODWORD(__B) = 1090519040;
  vDSP_vsdiv(__A, 1, (const float *)&__B, __A, 1, 0x3C0uLL);
  LODWORD(__B) = 1098907648;
  vDSP_vsdiv(__C, 1, (const float *)&__B, __C, 1, 0x3C0uLL);
}

void Scandium::ScandiumPPG::scandium_spo2_processor_t::compute_window_mvmt_posture(uint64_t a1, uint64_t a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  void v13[3] = 0;
  v12[3] = 0;
  Scandium::scandium_mvmt_detection_t::scandium_mvmt_detection_t(v14, v13, v12);
  std::__function::__value_func<void ()(BOOL)>::~__value_func[abi:ne180100](v12);
  std::__function::__value_func<void ()(BOOL)>::~__value_func[abi:ne180100](v13);
  if (*(_DWORD *)(a1 + 772512) == 2) {
    float v4 = 3.4028e38;
  }
  else {
    float v4 = *(float *)(a1 + 772604);
  }
  int v5 = 0;
  int v6 = 0;
  unsigned int v7 = -160;
  do
  {
    Scandium::scandium_mvmt_detection_t::processMvmt(v14, a2, v7 + 160, (const float *)0xA0, *(float *)(a1 + 772592));
    Scandium::scandium_mvmt_detection_t::processPosture(v14, a2, v7 + 160, (const float *)0xA0, *(float *)(a1 + 772608), v4);
    v5 += v14[0].u8[0];
    v6 += v15;
    v7 += 160;
  }
  while (v7 < 0x320);
  BOOL v8 = *(_DWORD *)(a1 + 772512) != 2 || *(float *)(a1 + 772596) >= (float)v5;
  *(unsigned char *)(a1 + 772521) = v8;
  *(unsigned char *)(a1 + 77252std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_processor_t>::reset[abi:ne180100](this, 0) = *(float *)(a1 + 772600) >= (float)v6;
  float v9 = stats::mean((stats *)a2, (const float *)0x3C0);
  float v10 = stats::mean((stats *)(a2 + 7680), (const float *)0x3C0);
  float v11 = *(float *)(a1 + 772604);
  *(unsigned char *)(a1 + 772523) = fabsf(v9) >= *(float *)(a1 + 772608);
  *(unsigned char *)(a1 + 772522) = v10 >= v11;
  Scandium::scandium_mvmt_detection_t::~scandium_mvmt_detection_t((Scandium::scandium_mvmt_detection_t *)v14);
}

void sub_25BA52574(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  Scandium::scandium_mvmt_detection_t::~scandium_mvmt_detection_t((Scandium::scandium_mvmt_detection_t *)va);
  _Unwind_Resume(a1);
}

void Scandium::ScandiumPPG::scandium_spo2_processor_t::compute_bga(Scandium::ScandiumPPG::scandium_spo2_processor_t *this, Scandium::ScandiumPPG::beats_t *a2)
{
  memset(&v103, 0, sizeof(v103));
  *(double *)&long long v3 = Scandium::ScandiumPPG::BGA_t::reset((Scandium::ScandiumPPG::BGA_t *)v97);
  uint64_t v4 = 0;
  uint64_t v73 = this;
  int v74 = (uint64_t *)((char *)this + 625816);
  char v49 = (int *)((char *)this + 772536);
  int v50 = (float *)((char *)this + 623456);
  uint64_t v5 = 765496;
  uint64_t v6 = 623384;
  uint64_t v7 = 614848;
  uint64_t v63 = 0;
  int v64 = (char *)this + 614656;
  int v51 = (char *)this + 595452;
  long long v52 = (char *)this + 580092;
  uint64_t v8 = 615232;
  uint64_t v9 = 615240;
  uint64_t v10 = 625176;
  uint64_t v11 = 767544;
  int v12 = -1;
  do
  {
    uint64_t v13 = 0;
    int v65 = (char *)&Scandium::ScandiumPPG::path_array + 4 * byte_25BA64CBC[v4];
    uint64_t v59 = v5;
    uint64_t v60 = v4;
    uint64_t v62 = (uint64_t)&v52[3840 * v4];
    uint64_t v61 = (uint64_t)&v51[3840 * v4];
    uint64_t v54 = v10;
    uint64_t v55 = v9;
    uint64_t v57 = v7;
    uint64_t v58 = v6;
    uint64_t v14 = v6;
    uint64_t v56 = v8;
    uint64_t v53 = v11;
    do
    {
      uint64_t v15 = byte_25BA64CBC[v13];
      v74[1] = *v74;
      int v72 = v65[v15];
      uint64_t v69 = v12 + 1;
      if (v72 != 2) {
        ++v12;
      }
      int v71 = v12;
      if (*(void *)((char *)v73 + v9) - *(void *)((char *)v73 + v9 - 8) <= 8uLL)
      {
        *(double *)&long long v3 = Scandium::ScandiumPPG::BGA_t::reset((Scandium::ScandiumPPG::scandium_spo2_processor_t *)((char *)v73 + v14));
      }
      else
      {
        uint64_t v16 = (char *)v73 + v5;
        Scandium::ScandiumPPG::scandium_bga_t::compute_bga_measures(a2, 960, (uint64_t)&v95, *(int32x2_t *)&v3);
        long long v101 = v95;
        unint64_t v17 = (int)v96;
        int v102 = v96;
        *(void *)&long long v100 = *((void *)&v95 + 1);
        long long v95 = 0uLL;
        int64_t v96 = 0;
        v75.__r_.__value_.__s.__data_[0] = 1;
        std::vector<BOOL>::assign((uint64_t)&v95, v17, &v75);
        long long v93 = v101;
        int v94 = v102;
        long long v67 = (uint64_t *)((char *)v73 + v8);
        Scandium::ScandiumPPG::scandium_bga_t::compute_ppg_snips((Scandium::ScandiumPPG::scandium_spo2_processor_t *)((char *)v73 + v5), (Scandium::ScandiumPPG::scandium_spo2_processor_t *)((char *)v73 + v8), (uint64_t)a2, (int *)&v93, (uint64_t)v97, (uint64_t *)&v95, 0);
        long long v91 = v101;
        int v92 = v102;
        uint64_t v68 = (char *)v73 + v11;
        uint64_t v66 = (uint64_t *)((char *)v73 + v7);
        Scandium::ScandiumPPG::scandium_bga_t::compute_ppg_snips((Scandium::ScandiumPPG::scandium_spo2_processor_t *)((char *)v73 + v11), (Scandium::ScandiumPPG::scandium_spo2_processor_t *)((char *)v73 + v7), (uint64_t)a2, (int *)&v91, (uint64_t)v97, (uint64_t *)&v95, 1);
        if (v72 != 2)
        {
          long long v89 = v101;
          int v90 = v102;
          Scandium::ScandiumPPG::scandium_bga_t::compute_ppg_snips((void *)v73 + 16 * v69 + 96199, &v64[24 * v69], (uint64_t)a2, (int *)&v89, (uint64_t)v97, (uint64_t *)&v95, 2);
        }
        uint64_t v18 = std::vector<BOOL>::vector(__p, (uint64_t)&v95);
        Scandium::ScandiumPPG::scandium_spo2_processor_t::compute_good_snips((uint64_t)v18, (uint64_t)v74, (uint64_t)&v101, __p, (uint64_t)v97);
        if (__p[0]) {
          operator delete(__p[0]);
        }
        if (v74[1] != *v74)
        {
          long long v86 = v101;
          int v87 = v102;
          Scandium::ScandiumPPG::scandium_bga_t::compile_bga_metrics((uint64_t)v16, v67, v74, (unsigned int *)&v86, (uint64_t)v97, 0);
          long long v84 = v101;
          int v85 = v102;
          Scandium::ScandiumPPG::scandium_bga_t::compile_bga_metrics((uint64_t)v68, v66, v74, (unsigned int *)&v84, (uint64_t)v97, 1);
          Scandium::ScandiumPPG::scandium_bga_t::compute_wavelength(v16, v63 + v13, v62, v74, (unsigned int *)&v101, (uint64_t)v97, 0);
          Scandium::ScandiumPPG::scandium_bga_t::compute_wavelength(v68, v63 + v13, v61, v74, (unsigned int *)&v101, (uint64_t)v97, 1);
          if (v72 != 2)
          {
            long long v82 = v101;
            int v83 = v102;
            Scandium::ScandiumPPG::scandium_bga_t::compile_bga_metrics((uint64_t)v73 + 128 * (uint64_t)(int)v69 + 769592, (uint64_t *)&v64[24 * (int)v69], v74, (unsigned int *)&v82, (uint64_t)v97, 2);
          }
          long long v80 = v101;
          int v81 = v102;
          Scandium::ScandiumPPG::scandium_bga_t::compute_snip_corr((uint64_t)v16, v67, v74, (unsigned int *)&v80, (float *)v97, 0);
          long long v78 = v101;
          int v79 = v102;
          Scandium::ScandiumPPG::scandium_bga_t::compute_snip_corr((uint64_t)v68, v66, v74, (unsigned int *)&v78, (float *)v97, 1);
          if (v72 != 2)
          {
            long long v76 = v101;
            int v77 = v102;
            Scandium::ScandiumPPG::scandium_bga_t::compute_snip_corr((uint64_t)v73 + 128 * (uint64_t)(int)v69 + 769592, &v64[24 * (int)v69], v74, (unsigned int *)&v76, (float *)v97, 2);
          }
          uint64_t v19 = (const float *)v101;
          float v20 = stats::pearsonr(**(stats ***)&v97[0], **((stats ***)&v97[0] + 1), (const float *)v101);
          *((void *)&v99 + 1) = __PAIR64__(COERCE_UNSIGNED_INT(Scandium::ScandiumPPG::scandium_spo2_processor_t::compute_bga_openness(v21, **(stats ***)&v97[0], **((stats ***)&v97[0] + 1), v19)), LODWORD(v20));
        }
        uint64_t v22 = (_OWORD *)((char *)v73 + v14);
        long long v23 = v99;
        v22[4] = v98;
        v22[5] = v23;
        v22[6] = v100;
        long long v24 = v97[1];
        *uint64_t v22 = v97[0];
        v22[1] = v24;
        long long v3 = v97[3];
        void v22[2] = v97[2];
        v22[3] = v3;
        LODWORD(v3) = HIDWORD(v98);
        *(_DWORD *)((char *)v73 + v1std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_processor_t>::reset[abi:ne180100](this, 0) = HIDWORD(v98);
        if ((void)v95) {
          operator delete((void *)v95);
        }
      }
      ++v13;
      v5 += 128;
      v11 += 128;
      v8 += 24;
      v7 += 24;
      v14 += 112;
      v10 += 40;
      v9 += 24;
      int v12 = v71;
    }
    while (v13 != 4);
    uint64_t v4 = v60 + 1;
    uint64_t v5 = v59 + 512;
    uint64_t v11 = v53 + 512;
    uint64_t v8 = v56 + 96;
    uint64_t v7 = v57 + 96;
    uint64_t v6 = v58 + 448;
    uint64_t v10 = v54 + 160;
    uint64_t v9 = v55 + 96;
    v63 += 4;
  }
  while (v60 != 3);
  char v25 = (char *)v73 + 632464;
  long long v26 = v50;
  uint64_t v27 = *v49;
  int v28 = (char *)v73 + 632476;
  float v29 = *((float *)v73 + v27 + 158116);
  float v30 = *((float *)v73 + v27 + 158119);
  uint64_t v31 = 16;
  do
  {
    float v29 = *(v26 - 1) + v29;
    *(float *)&v25[4 * v27] = v29;
    float v32 = *v26;
    v26 += 28;
    float v30 = v32 + v30;
    *(float *)&v28[4 * v27] = v30;
    --v31;
  }
  while (v31);
  *(float *)&v25[4 * v27] = v29 * 0.0625;
  *(float *)&v28[4 * v27] = v30 * 0.0625;
  std::string::resize(&v103, 0, 0);
  if (SHIBYTE(v103.__r_.__value_.__r.__words[2]) < 0)
  {
    v103.__r_.__value_.__l.__size_ = 20;
    uint64_t v33 = (std::string *)v103.__r_.__value_.__r.__words[0];
  }
  else
  {
    *((unsigned char *)&v103.__r_.__value_.__s + 23) = 20;
    uint64_t v33 = &v103;
  }
  uint64_t v34 = 0;
  strcpy((char *)v33, "scandium median HR: ");
  do
  {
    std::to_string(&v75, *(float *)((char *)v73 + v34 + 623480));
    int v35 = std::string::append(&v75, " ", 1uLL);
    long long v36 = *(_OWORD *)&v35->__r_.__value_.__l.__data_;
    int64_t v96 = v35->__r_.__value_.__r.__words[2];
    long long v95 = v36;
    v35->__r_.__value_.__l.__size_ = 0;
    v35->__r_.__value_.__r.__words[2] = 0;
    v35->__r_.__value_.__r.__words[0] = 0;
    if (v96 >= 0) {
      uint64_t v37 = (const std::string::value_type *)&v95;
    }
    else {
      uint64_t v37 = (const std::string::value_type *)v95;
    }
    if (v96 >= 0) {
      std::string::size_type v38 = HIBYTE(v96);
    }
    else {
      std::string::size_type v38 = *((void *)&v95 + 1);
    }
    int v39 = std::string::append(&v103, v37, v38);
    if (SHIBYTE(v96) < 0) {
      operator delete((void *)v95);
    }
    if (SHIBYTE(v75.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v75.__r_.__value_.__l.__data_);
    }
    v34 += 112;
  }
  while (v34 != 1792);
  log = Scandium::algs_get_log((Scandium *)v39);
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
    Scandium::ScandiumPPG::scandium_spo2_processor_t::compute_bga();
  }
  std::string::resize(&v103, 0, 0);
  if (SHIBYTE(v103.__r_.__value_.__r.__words[2]) < 0)
  {
    v103.__r_.__value_.__l.__size_ = 18;
    char v41 = (std::string *)v103.__r_.__value_.__r.__words[0];
  }
  else
  {
    *((unsigned char *)&v103.__r_.__value_.__s + 23) = 18;
    char v41 = &v103;
  }
  uint64_t v42 = 0;
  strcpy((char *)v41, "scandium mean HR: ");
  do
  {
    std::to_string(&v75, *(float *)((char *)v73 + v42 + 623484));
    uint64_t v43 = std::string::append(&v75, " ", 1uLL);
    long long v44 = *(_OWORD *)&v43->__r_.__value_.__l.__data_;
    int64_t v96 = v43->__r_.__value_.__r.__words[2];
    long long v95 = v44;
    v43->__r_.__value_.__l.__size_ = 0;
    v43->__r_.__value_.__r.__words[2] = 0;
    v43->__r_.__value_.__r.__words[0] = 0;
    if (v96 >= 0) {
      char v45 = (const std::string::value_type *)&v95;
    }
    else {
      char v45 = (const std::string::value_type *)v95;
    }
    if (v96 >= 0) {
      std::string::size_type v46 = HIBYTE(v96);
    }
    else {
      std::string::size_type v46 = *((void *)&v95 + 1);
    }
    long long v47 = std::string::append(&v103, v45, v46);
    if (SHIBYTE(v96) < 0) {
      operator delete((void *)v95);
    }
    if (SHIBYTE(v75.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v75.__r_.__value_.__l.__data_);
    }
    v42 += 112;
  }
  while (v42 != 1792);
  int v48 = Scandium::algs_get_log((Scandium *)v47);
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG)) {
    Scandium::ScandiumPPG::scandium_spo2_processor_t::compute_bga();
  }
  if (SHIBYTE(v103.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v103.__r_.__value_.__l.__data_);
  }
}

void sub_25BA52DEC(_Unwind_Exception *a1)
{
  if (*(char *)(v1 - 113) < 0) {
    operator delete(*(void **)(v1 - 136));
  }
  _Unwind_Resume(a1);
}

void Scandium::ScandiumPPG::scandium_spo2_processor_t::compute_spo2(Scandium::ScandiumPPG::scandium_spo2_processor_t *this)
{
  uint64_t v2 = 0;
  uint64_t v3 = 623452;
  uint64_t v4 = 614848;
  memset(&v47, 0, sizeof(v47));
  int v35 = (char *)this + 770792;
  int v36 = 0;
  uint64_t v34 = (char *)this + 770800;
  uint64_t v5 = 615232;
  uint64_t v6 = 625192;
  uint64_t v7 = 625196;
  uint64_t v8 = (float *)&v46;
  do
  {
    uint64_t v9 = 0;
    uint64_t v32 = v3;
    uint64_t v33 = v2;
    int v10 = byte_25BA64CBC[v2];
    uint64_t v28 = v7;
    uint64_t v29 = v6;
    uint64_t v30 = v5;
    uint64_t v31 = v4;
    uint64_t v27 = v8;
    do
    {
      Scandium::ScandiumPPG::scandium_calibration_t::process(*(float *)((char *)this + v3 + 4), *(float *)((char *)this + v3), (uint64_t)v35, v10, byte_25BA64CBC[v9], v8);
      uint64_t v43 = *(void *)v8;
      int v44 = *((_DWORD *)v8 + 2);
      __p[0] = (char *)this + v7;
      __p[1] = (char *)this + v6;
      v40[0] = v36 + v9;
      v40[1] = 0;
      char v41 = (char *)this + v5;
      uint64_t v42 = (char *)this + v4;
      int v45 = 0;
      Scandium::ScandiumPPG::scandium_spo2_t::process((uint64_t)v34, v40, (uint64_t)__p);
      ++v9;
      v8 += 3;
      v5 += 24;
      v4 += 24;
      v3 += 112;
      v7 += 40;
      v6 += 40;
    }
    while (v9 != 4);
    uint64_t v2 = v33 + 1;
    uint64_t v8 = v27 + 12;
    uint64_t v5 = v30 + 96;
    uint64_t v4 = v31 + 96;
    uint64_t v3 = v32 + 448;
    uint64_t v7 = v28 + 160;
    uint64_t v6 = v29 + 160;
    v36 += 4;
  }
  while (v33 != 3);
  std::string::resize(&v47, 0, 0);
  if (SHIBYTE(v47.__r_.__value_.__r.__words[2]) < 0)
  {
    v47.__r_.__value_.__l.__size_ = 15;
    uint64_t v11 = (std::string *)v47.__r_.__value_.__r.__words[0];
  }
  else
  {
    *((unsigned char *)&v47.__r_.__value_.__s + 23) = 15;
    uint64_t v11 = &v47;
  }
  uint64_t v12 = 0;
  strcpy((char *)v11, "scandium spo2: ");
  do
  {
    std::to_string(&v37, *(float *)((char *)this + v12 + 625196));
    uint64_t v13 = std::string::append(&v37, " ", 1uLL);
    long long v14 = *(_OWORD *)&v13->__r_.__value_.__l.__data_;
    int64_t v39 = v13->__r_.__value_.__r.__words[2];
    *(_OWORD *)std::string __p = v14;
    v13->__r_.__value_.__l.__size_ = 0;
    v13->__r_.__value_.__r.__words[2] = 0;
    v13->__r_.__value_.__r.__words[0] = 0;
    if (v39 >= 0) {
      uint64_t v15 = __p;
    }
    else {
      uint64_t v15 = (void **)__p[0];
    }
    if (v39 >= 0) {
      std::string::size_type v16 = HIBYTE(v39);
    }
    else {
      std::string::size_type v16 = (std::string::size_type)__p[1];
    }
    unint64_t v17 = std::string::append(&v47, (const std::string::value_type *)v15, v16);
    if (SHIBYTE(v39) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v37.__r_.__value_.__l.__data_);
    }
    v12 += 40;
  }
  while (v12 != 640);
  log = Scandium::algs_get_log((Scandium *)v17);
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
    Scandium::ScandiumPPG::scandium_spo2_processor_t::compute_bga();
  }
  std::string::resize(&v47, 0, 0);
  if (SHIBYTE(v47.__r_.__value_.__r.__words[2]) < 0)
  {
    v47.__r_.__value_.__l.__size_ = 19;
    uint64_t v19 = (std::string *)v47.__r_.__value_.__r.__words[0];
  }
  else
  {
    *((unsigned char *)&v47.__r_.__value_.__s + 23) = 19;
    uint64_t v19 = &v47;
  }
  uint64_t v20 = 0;
  strcpy((char *)v19, "scandium raw conf: ");
  do
  {
    std::to_string(&v37, *(float *)((char *)this + v20 + 625192));
    uint64_t v21 = std::string::append(&v37, " ", 1uLL);
    long long v22 = *(_OWORD *)&v21->__r_.__value_.__l.__data_;
    int64_t v39 = v21->__r_.__value_.__r.__words[2];
    *(_OWORD *)std::string __p = v22;
    v21->__r_.__value_.__l.__size_ = 0;
    v21->__r_.__value_.__r.__words[2] = 0;
    v21->__r_.__value_.__r.__words[0] = 0;
    if (v39 >= 0) {
      long long v23 = __p;
    }
    else {
      long long v23 = (void **)__p[0];
    }
    if (v39 >= 0) {
      std::string::size_type v24 = HIBYTE(v39);
    }
    else {
      std::string::size_type v24 = (std::string::size_type)__p[1];
    }
    char v25 = std::string::append(&v47, (const std::string::value_type *)v23, v24);
    if (SHIBYTE(v39) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v37.__r_.__value_.__l.__data_);
    }
    v20 += 40;
  }
  while (v20 != 640);
  long long v26 = Scandium::algs_get_log((Scandium *)v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
    Scandium::ScandiumPPG::scandium_spo2_processor_t::compute_bga();
  }
  if (SHIBYTE(v47.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v47.__r_.__value_.__l.__data_);
  }
}

void sub_25BA53244(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25,void *__p,uint64_t a27,int a28,__int16 a29,char a30,char a31)
{
  if (*(char *)(v31 - 89) < 0) {
    operator delete(*(void **)(v31 - 112));
  }
  _Unwind_Resume(exception_object);
}

float *Scandium::ScandiumPPG::scandium_spo2_processor_t::compute_quality_metric(Scandium::ScandiumPPG::scandium_spo2_processor_t *this)
{
  uint64_t v1 = 0;
  uint64_t v176 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void **)((char *)this + 632488);
  v151[0] = 0;
  v151[1] = 0;
  uint64_t v3 = (char *)this + 632240;
  uint64_t v4 = (char *)this + 632304;
  v150[0] = 0;
  v150[1] = 0;
  v149[0] = 0;
  v149[1] = 0;
  v137 = (char *)this + 632368;
  v138 = (void *)((char *)this + 771008);
  do
  {
    uint64_t v5 = 0;
    uint64_t v6 = byte_25BA64CBC[v1];
    uint64_t v7 = (char *)&Scandium::ScandiumPPG::path_array[4 * v6];
    uint64_t v8 = 4 * v6;
    float v9 = *((float *)v151 + v1);
    float v10 = *((float *)v150 + v1);
    do
    {
      uint64_t v11 = byte_25BA64CBC[v5];
      int v12 = v7[v11];
      uint64_t v13 = v8 + v11;
      if (v12 != 2) {
        *((float *)v149 + v1) = *(float *)&v137[4 * v13] + *((float *)v149 + v1);
      }
      float v9 = *(float *)&v3[4 * v13] + v9;
      float v10 = *(float *)&v4[4 * v13] + v10;
      ++v5;
    }
    while (v5 != 4);
    *((float *)v151 + v1) = v9;
    *((float *)v150 + v1++) = v10;
  }
  while (v1 != 4);
  uint64_t v14 = 0;
  uint64_t v15 = (char *)this + 553212;
  std::string::size_type v16 = (char *)this + 537852;
  unint64_t v17 = (uint64_t *)((char *)this + 770616);
  v133 = (char *)this + 632448;
  v134 = (char *)this + 632432;
  do
  {
    std::string __p = 0;
    long long v148 = 0uLL;
    v144 = 0;
    v145 = 0;
    uint64_t v146 = 0;
    v142 = 0;
    long long v143 = 0uLL;
    std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v142, &v15[3840 * v14], (uint64_t)&v15[3840 * v14 + 3840], 0x3C0uLL);
    if (__p)
    {
      *(void *)&long long v148 = __p;
      operator delete(__p);
    }
    std::string __p = v142;
    long long v148 = v143;
    *(float *)&v134[4 * v14] = stats::mean(v142, (const float *)(((void)v143 - (void)v142) >> 2)) / 1000000.0;
    *(void *)&long long v148 = __p;
    v142 = 0;
    long long v143 = 0uLL;
    std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v142, &v16[3840 * v14], (uint64_t)&v16[3840 * v14 + 3840], 0x3C0uLL);
    if (__p)
    {
      *(void *)&long long v148 = __p;
      operator delete(__p);
    }
    uint64_t v18 = v142;
    std::string __p = v142;
    long long v148 = v143;
    uint64_t v19 = (stats *)v143;
    while (v18 != v19)
    {
      *(float *)v18->cp_time = *(float *)v18->cp_time / 1000000.0;
      uint64_t v18 = (stats *)((char *)v18 + 4);
    }
    Scandium::ScandiumPPG::scandium_signal_conditioning_t::compute_ac(v17, (uint64_t)&__p, (float **)&v144);
    *(float *)&v133[4 * v14] = stats::std((stats *)v144, (const float *)((unint64_t)(v145 - (unsigned char *)v144) >> 2), 1);
    if (v144)
    {
      v145 = v144;
      operator delete(v144);
    }
    if (__p)
    {
      *(void *)&long long v148 = __p;
      operator delete(__p);
    }
    ++v14;
  }
  while (v14 != 4);
  v130 = v4;
  uint64_t v20 = 0;
  int v21 = 0;
  uint64_t v136 = (char *)this + 625176;
  long long v22 = (char *)this + 623384;
  uint64_t v122 = (uint64_t)(v2 + 8);
  v126 = v2 + 6;
  float v127 = v2 + 3;
  uint64_t v123 = (uint64_t)(v2 + 5);
  uint64_t v124 = (uint64_t)(v2 + 2);
  v128 = v2 + 9;
  v129 = v2;
  uint64_t v125 = (uint64_t)(v2 + 11);
  long long v23 = v138;
  do
  {
    uint64_t v24 = 0;
    uint64_t v131 = byte_25BA64CBC[v20];
    uint64_t v132 = 4 * v20;
    do
    {
      uint64_t v25 = byte_25BA64CBC[v24];
      uint64_t v26 = v24 + v132;
      int v27 = Scandium::ScandiumPPG::path_array[4 * v131 + v25];
      uint64_t v28 = *(void *)&v22[112 * v24 + 112 * v132];
      if (v28)
      {
        uint64_t v29 = *(void *)&v22[112 * v26 + 16];
        if (v29)
        {
          Scandium::ScandiumPPG::scandium_spo2_t::compute_orthogonal_regression((uint64_t)this + 770800, v28, v29, (float *)&v136[40 * v26 + 24]);
          long long v23 = v138;
          long long v22 = (char *)this + 623384;
        }
      }
      char v160 = 0;
      __int16 v159 = 0;
      uint64_t v30 = &v22[112 * v26];
      uint64_t v31 = *(void *)(v30 + 76);
      unsigned int v32 = *((_DWORD *)v30 + 22);
      uint64_t v33 = &v136[40 * v26];
      unsigned int v34 = *((_DWORD *)v30 + 24);
      int v35 = *((_DWORD *)v33 + 5);
      int v36 = *((_DWORD *)v33 + 6);
      int v37 = *((_DWORD *)v30 + 14);
      int v38 = *(_DWORD *)&v3[4 * v26];
      int v39 = *(_DWORD *)&v130[4 * v26];
      int v40 = *(_DWORD *)&v137[4 * v26];
      int v41 = *((_DWORD *)v151 + v20);
      int v42 = *((_DWORD *)v150 + v20);
      int v43 = *((_DWORD *)v149 + v20);
      int v44 = *(_DWORD *)&v134[4 * v24];
      int v45 = *(_DWORD *)&v133[4 * v24];
      uint64_t v46 = *(void *)(v30 + 60);
      *(_OWORD *)&v175[3] = *(_OWORD *)((char *)this + 770728);
      long long v47 = *(_OWORD *)((char *)this + 770716);
      long long v174 = *(_OWORD *)((char *)this + 770700);
      *(_OWORD *)v175 = v47;
      unsigned int v140 = v32;
      uint64_t v141 = v31;
      uint64_t v152 = v31;
      unsigned int v153 = v32;
      int v154 = v35;
      unsigned int v139 = v34;
      unsigned int v155 = v34;
      int v157 = v36;
      char v158 = v27;
      char v161 = v131;
      char v162 = v25;
      __int16 v163 = 0;
      int v135 = v46;
      uint64_t v165 = v46;
      int v164 = v37;
      int v166 = v38;
      int v167 = v39;
      int v168 = v40;
      int v169 = v41;
      int v170 = v42;
      int v171 = v43;
      int v172 = v44;
      int v173 = v45;
      uint64_t v48 = *((void *)v30 + 13);
      uint64_t v156 = v48;
      long long v49 = *(_OWORD *)((char *)this + 770760);
      *(_OWORD *)&v175[7] = *(_OWORD *)((char *)this + 770744);
      *(_OWORD *)&v175[11] = v49;
      *(_OWORD *)&v175[15] = *(_OWORD *)((char *)this + 770776);
      Scandium::ScandiumPPG::scandium_quality_metric_t::process((uint64_t)v23, (uint64_t)&v152);
      long long v23 = v138;
      uint64_t v50 = *v138;
      if (v27 == 2) {
        unsigned int v51 = 0;
      }
      else {
        unsigned int v51 = (*v138 >> 1) & 1;
      }
      *(void *)&long long v52 = v141;
      *((void *)&v52 + 1) = __PAIR64__(v139, v140);
      v33[36] = (~*(_DWORD *)v138 & 0x7CLL) == 0;
      *(_OWORD *)uint64_t v33 = v52;
      *(void *)(v33 + 28) = v48;
      if (v50)
      {
        if (v27)
        {
          if (v27 == 1)
          {
            uint64_t v58 = (char *)v129[4];
            unint64_t v57 = (unint64_t)v129[5];
            if ((unint64_t)v58 >= v57)
            {
              uint64_t v59 = (char *)*v127;
              uint64_t v60 = (v58 - (unsigned char *)*v127) >> 2;
              unint64_t v61 = v60 + 1;
              if ((unint64_t)(v60 + 1) >> 62) {
                goto LABEL_121;
              }
              uint64_t v62 = v57 - (void)v59;
              if (v62 >> 1 > v61) {
                unint64_t v61 = v62 >> 1;
              }
              if ((unint64_t)v62 >= 0x7FFFFFFFFFFFFFFCLL) {
                unint64_t v63 = 0x3FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v63 = v61;
              }
              if (v63)
              {
                int v64 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v123, v63);
                uint64_t v59 = (char *)v129[3];
                uint64_t v58 = (char *)v129[4];
              }
              else
              {
                int v64 = 0;
              }
              int v71 = &v64[4 * v60];
              *(_DWORD *)int v71 = v37;
              int v72 = v71 + 4;
              while (v58 != v59)
              {
                int v73 = *((_DWORD *)v58 - 1);
                v58 -= 4;
                *((_DWORD *)v71 - 1) = v73;
                v71 -= 4;
              }
              v129[3] = v71;
              v129[4] = v72;
              v129[5] = &v64[4 * v63];
              if (v59) {
                operator delete(v59);
              }
              v129[4] = v72;
              long long v23 = v138;
            }
            else
            {
              *(_DWORD *)uint64_t v58 = v37;
              v129[4] = v58 + 4;
            }
          }
          else if (v27 == 2)
          {
            uint64_t v53 = v129;
            uint64_t v55 = (stats *)v129[1];
            unint64_t v54 = (unint64_t)v129[2];
            if ((unint64_t)v55 >= v54)
            {
              int v65 = (stats *)*v129;
              uint64_t v66 = ((char *)v55 - (unsigned char *)*v129) >> 2;
              unint64_t v67 = v66 + 1;
              if ((unint64_t)(v66 + 1) >> 62) {
                goto LABEL_121;
              }
              uint64_t v68 = v54 - (void)v65;
              if (v68 >> 1 > v67) {
                unint64_t v67 = v68 >> 1;
              }
              if ((unint64_t)v68 >= 0x7FFFFFFFFFFFFFFCLL) {
                unint64_t v69 = 0x3FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v69 = v67;
              }
              if (v69)
              {
                int v70 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v124, v69);
                uint64_t v53 = v129;
                int v65 = (stats *)*v129;
                uint64_t v55 = (stats *)v129[1];
              }
              else
              {
                int v70 = 0;
              }
              long long v86 = &v70[4 * v66];
              *(_DWORD *)long long v86 = v37;
              uint64_t v56 = (int *)(v86 + 4);
              while (v55 != v65)
              {
                int if_opackets = v55[-1].if_opackets;
                uint64_t v55 = (stats *)((char *)v55 - 4);
                *((_DWORD *)v86 - 1) = if_opackets;
                v86 -= 4;
              }
              *uint64_t v53 = v86;
              v53[1] = v56;
              v53[2] = &v70[4 * v69];
              if (v65) {
                operator delete(v65);
              }
              long long v23 = v138;
            }
            else
            {
              v55->cp_time[0] = v37;
              uint64_t v56 = &v55->cp_time[1];
            }
            v53[1] = v56;
            long long v89 = (char *)v53[7];
            unint64_t v88 = v53[8];
            if ((unint64_t)v89 >= v88)
            {
              long long v91 = (char *)*v126;
              uint64_t v92 = (v89 - (unsigned char *)*v126) >> 2;
              unint64_t v93 = v92 + 1;
              if ((unint64_t)(v92 + 1) >> 62) {
LABEL_121:
              }
                std::vector<float>::__throw_length_error[abi:ne180100]();
              uint64_t v94 = v88 - (void)v91;
              if (v94 >> 1 > v93) {
                unint64_t v93 = v94 >> 1;
              }
              if ((unint64_t)v94 >= 0x7FFFFFFFFFFFFFFCLL) {
                unint64_t v95 = 0x3FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v95 = v93;
              }
              if (v95)
              {
                int64_t v96 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v122, v95);
                uint64_t v53 = v129;
                long long v91 = (char *)v129[6];
                long long v89 = (char *)v129[7];
              }
              else
              {
                int64_t v96 = 0;
              }
              __int32 v97 = &v96[4 * v92];
              *(_DWORD *)__int32 v97 = v135;
              int v90 = v97 + 4;
              while (v89 != v91)
              {
                int v98 = *((_DWORD *)v89 - 1);
                v89 -= 4;
                *((_DWORD *)v97 - 1) = v98;
                v97 -= 4;
              }
              v53[6] = v97;
              v53[7] = v90;
              v53[8] = &v96[4 * v95];
              if (v91) {
                operator delete(v91);
              }
              long long v23 = v138;
            }
            else
            {
              *(_DWORD *)long long v89 = v135;
              int v90 = v89 + 4;
            }
            v53[7] = v90;
          }
        }
        else
        {
          int v74 = v129;
          long long v76 = (char *)v129[10];
          unint64_t v75 = (unint64_t)v129[11];
          if ((unint64_t)v76 >= v75)
          {
            long long v78 = (char *)*v128;
            uint64_t v79 = (v76 - (unsigned char *)*v128) >> 2;
            unint64_t v80 = v79 + 1;
            if ((unint64_t)(v79 + 1) >> 62) {
              goto LABEL_121;
            }
            uint64_t v81 = v75 - (void)v78;
            if (v81 >> 1 > v80) {
              unint64_t v80 = v81 >> 1;
            }
            if ((unint64_t)v81 >= 0x7FFFFFFFFFFFFFFCLL) {
              unint64_t v82 = 0x3FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v82 = v80;
            }
            if (v82)
            {
              int v83 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v125, v82);
              int v74 = v129;
              long long v78 = (char *)v129[9];
              long long v76 = (char *)v129[10];
            }
            else
            {
              int v83 = 0;
            }
            long long v84 = &v83[4 * v79];
            *(_DWORD *)long long v84 = v135;
            int v77 = v84 + 4;
            while (v76 != v78)
            {
              int v85 = *((_DWORD *)v76 - 1);
              v76 -= 4;
              *((_DWORD *)v84 - 1) = v85;
              v84 -= 4;
            }
            v74[9] = v84;
            v74[10] = v77;
            v74[11] = &v83[4 * v82];
            if (v78) {
              operator delete(v78);
            }
            long long v23 = v138;
          }
          else
          {
            *(_DWORD *)long long v76 = v135;
            int v77 = v76 + 4;
          }
          v74[10] = v77;
        }
      }
      v21 += v51;
      ++v24;
      long long v22 = (char *)this + 623384;
    }
    while (v24 != 4);
    ++v20;
  }
  while (v20 != 4);
  int v99 = v23[274];
  if (v99 <= v21) {
    int v99 = v21;
  }
  v23[274] = v99;
  int v100 = v23[275];
  if (v21 < v100) {
    int v100 = v21;
  }
  v23[275] = v100;
  if (v21 <= 0) {
    ++v23[283];
  }
  long long v101 = v129;
  int v102 = v129[1];
  if (*v129 != v102)
  {
    float v103 = stats::mean((stats *)*v129, (const float *)((unint64_t)(v102 - (unsigned char *)*v129) >> 2));
    Scandium::fill_valid((float *)this + 193045, v104, v103);
    long long v101 = v129;
  }
  unint64_t v105 = (stats *)v101[3];
  uint64_t v106 = (stats *)v101[4];
  if (v105 != v106)
  {
    float v107 = stats::mean(v105, (const float *)((unint64_t)((char *)v106 - (char *)v105) >> 2));
    Scandium::fill_valid((float *)this + 193046, v108, v107);
    long long v101 = v129;
  }
  uint64_t v109 = (stats *)v101[6];
  v110 = (stats *)v101[7];
  if (v109 != v110)
  {
    float v111 = stats::mean(v109, (const float *)((unint64_t)((char *)v110 - (char *)v109) >> 2));
    Scandium::fill_valid((float *)this + 193047, v112, v111);
    long long v101 = v129;
  }
  uint64_t v113 = (stats *)v101[9];
  uint64_t v114 = (stats *)v101[10];
  if (v113 != v114)
  {
    float v115 = stats::mean(v113, (const float *)((unint64_t)((char *)v114 - (char *)v113) >> 2));
    Scandium::fill_valid((float *)this + 193048, v116, v115);
    long long v101 = v129;
  }
  double result = (float *)v101[12];
  long long v118 = (float *)v101[13];
  if (result != v118)
  {
    float v119 = stats::mean((stats *)result, (const float *)((unint64_t)((char *)v118 - (char *)result) >> 2));
    return Scandium::fill_valid((float *)this + 193049, v120, v119);
  }
  return result;
}

void sub_25BA53C30(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,void *__p,uint64_t a46,uint64_t a47,void *a48,uint64_t a49)
{
  if (__p) {
    operator delete(__p);
  }
  if (a48) {
    operator delete(a48);
  }
  _Unwind_Resume(exception_object);
}

void Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_hw_fom_core_analytics(Scandium::ScandiumPPG::scandium_spo2_processor_t *this)
{
  uint64_t v2 = (char *)this + 770728;
  uint64_t v3 = (char *)this + 770744;
  uint64_t v124 = 0;
  uint64_t v125 = 0;
  uint64_t v126 = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&v124, (char *)this + 770728, (uint64_t)this + 770744, 0x10uLL);
  float median_of_path = Scandium::ScandiumPPG::get_median_of_path_type<unsigned char>((uint64_t *)&v124, 258, v4);
  Scandium::fill_valid((float *)this + 193111, v6, median_of_path);
  if (v124)
  {
    uint64_t v125 = v124;
    operator delete(v124);
  }
  uint64_t v124 = 0;
  uint64_t v125 = 0;
  uint64_t v126 = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&v124, v2, (uint64_t)v3, 0x10uLL);
  float v8 = Scandium::ScandiumPPG::get_median_of_path_type<unsigned char>((uint64_t *)&v124, 257, v7);
  Scandium::fill_valid((float *)this + 193112, v9, v8);
  if (v124)
  {
    uint64_t v125 = v124;
    operator delete(v124);
  }
  uint64_t v124 = 0;
  uint64_t v125 = 0;
  uint64_t v126 = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&v124, v2, (uint64_t)v3, 0x10uLL);
  float v11 = Scandium::ScandiumPPG::get_median_of_path_type<unsigned char>((uint64_t *)&v124, 256, v10);
  Scandium::fill_valid((float *)this + 193113, v12, v11);
  if (v124)
  {
    uint64_t v125 = v124;
    operator delete(v124);
  }
  uint64_t v124 = 0;
  uint64_t v125 = 0;
  uint64_t v126 = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&v124, (char *)this + 770712, (uint64_t)v2, 0x10uLL);
  float v14 = Scandium::ScandiumPPG::get_median_of_path_type<unsigned char>((uint64_t *)&v124, 258, v13);
  Scandium::fill_valid((float *)this + 193114, v15, v14);
  if (v124)
  {
    uint64_t v125 = v124;
    operator delete(v124);
  }
  uint64_t v124 = 0;
  uint64_t v125 = 0;
  uint64_t v126 = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&v124, (char *)this + 770712, (uint64_t)v2, 0x10uLL);
  float v17 = Scandium::ScandiumPPG::get_median_of_path_type<unsigned char>((uint64_t *)&v124, 257, v16);
  Scandium::fill_valid((float *)this + 193115, v18, v17);
  if (v124)
  {
    uint64_t v125 = v124;
    operator delete(v124);
  }
  uint64_t v124 = 0;
  uint64_t v125 = 0;
  uint64_t v126 = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&v124, (char *)this + 770712, (uint64_t)v2, 0x10uLL);
  float v20 = Scandium::ScandiumPPG::get_median_of_path_type<unsigned char>((uint64_t *)&v124, 256, v19);
  Scandium::fill_valid((float *)this + 193116, v21, v20);
  if (v124)
  {
    uint64_t v125 = v124;
    operator delete(v124);
  }
  uint64_t v124 = 0;
  uint64_t v125 = 0;
  uint64_t v126 = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&v124, (char *)this + 770704, (uint64_t)this + 770712, 8uLL);
  float v23 = Scandium::ScandiumPPG::get_median_of_path_type<unsigned char>((uint64_t *)&v124, 0, v22);
  Scandium::fill_valid((float *)this + 193117, v24, v23);
  if (v124)
  {
    uint64_t v125 = v124;
    operator delete(v124);
  }
  uint64_t v124 = 0;
  uint64_t v125 = 0;
  uint64_t v126 = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&v124, (char *)this + 770700, (uint64_t)this + 770704, 4uLL);
  float v26 = Scandium::ScandiumPPG::get_median_of_path_type<unsigned char>((uint64_t *)&v124, 0, v25);
  Scandium::fill_valid((float *)this + 193118, v27, v26);
  if (v124)
  {
    uint64_t v125 = v124;
    operator delete(v124);
  }
  uint64_t v124 = 0;
  uint64_t v125 = 0;
  uint64_t v126 = 0;
  std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v124, (char *)this + 770776, (uint64_t)this + 770792, 4uLL);
  uint64_t v28 = v124;
  float v29 = Scandium::sort_median((Scandium *)v124, (const float *)((unint64_t)(v125 - v124) >> 2));
  Scandium::fill_valid((float *)this + 193119, v30, v29);
  uint64_t v124 = 0;
  uint64_t v125 = 0;
  uint64_t v126 = 0;
  std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v124, (char *)this + 770760, (uint64_t)this + 770776, 4uLL);
  if (v28) {
    operator delete(v28);
  }
  uint64_t v31 = v124;
  float v32 = Scandium::sort_median((Scandium *)v124, (const float *)((unint64_t)(v125 - v124) >> 2));
  Scandium::fill_valid((float *)this + 193120, v33, v32);
  uint64_t v124 = 0;
  uint64_t v125 = 0;
  uint64_t v126 = 0;
  std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v124, v3, (uint64_t)this + 770760, 4uLL);
  if (v31) {
    operator delete(v31);
  }
  unsigned int v34 = v124;
  float v35 = Scandium::sort_median((Scandium *)v124, (const float *)((unint64_t)(v125 - v124) >> 2));
  Scandium::fill_valid((float *)this + 193121, v36, v35);
  int v37 = (float *)*((unsigned int *)this + 193136);
  if ((int)v37 >= 1)
  {
    LODWORD(v123[0]) = -1082130432;
    std::vector<float>::vector(&v124, 8uLL, v123);
    LODWORD(v122[0]) = -1082130432;
    std::vector<float>::vector(v123, 8uLL, v122);
    LODWORD(v121[0]) = -1082130432;
    std::vector<float>::vector(v122, 8uLL, v121);
    LODWORD(v120[0]) = -1082130432;
    std::vector<float>::vector(v121, 0x10uLL, v120);
    LODWORD(v119[0]) = -1082130432;
    std::vector<float>::vector(v120, 0x10uLL, v119);
    LODWORD(v118[0]) = -1082130432;
    std::vector<float>::vector(v119, 0x10uLL, v118);
    LODWORD(v117[0]) = -1082130432;
    std::vector<float>::vector(v118, 0x10uLL, v117);
    LODWORD(v116[0]) = -1082130432;
    std::vector<float>::vector(v117, 0x10uLL, v116);
    LODWORD(v115[0]) = -1082130432;
    std::vector<float>::vector(v116, 0x10uLL, v115);
    LODWORD(v114[0]) = -1082130432;
    std::vector<float>::vector(v115, 4uLL, v114);
    LODWORD(v113[0]) = -1082130432;
    std::vector<float>::vector(v114, 4uLL, v113);
    LODWORD(v112[0]) = -1082130432;
    std::vector<float>::vector(v113, 4uLL, v112);
    uint64_t v39 = 0;
    int v40 = (Scandium::ScandiumPPG::scandium_spo2_processor_t *)((char *)this + 153852);
    do
    {
      Scandium::ScandiumPPG::calc_ppg_ac_metrics(v40, v37, (float *)((char *)v118[0] + v39), (float *)((char *)v117[0] + v39), v38);
      float v41 = stats::mean((stats *)v40, v37);
      *(float *)((char *)v116[0] + v39) = v41;
      v39 += 4;
      int v40 = (Scandium::ScandiumPPG *)((char *)v40 + 6400);
    }
    while (v39 != 64);
    uint64_t v42 = 0;
    int v43 = (Scandium::ScandiumPPG::scandium_spo2_processor_t *)((char *)this + 51452);
    do
    {
      Scandium::ScandiumPPG::calc_ppg_ac_metrics(v43, v37, (float *)((char *)v121[0] + v42), (float *)((char *)v120[0] + v42), v38);
      float v44 = stats::mean((stats *)v43, v37);
      *(float *)((char *)v119[0] + v42) = v44;
      v42 += 4;
      int v43 = (Scandium::ScandiumPPG *)((char *)v43 + 6400);
    }
    while (v42 != 64);
    uint64_t v45 = 0;
    uint64_t v46 = (Scandium::ScandiumPPG::scandium_spo2_processor_t *)((char *)this + 252);
    do
    {
      Scandium::ScandiumPPG::calc_ppg_ac_metrics(v46, v37, (float *)&v124[v45], (float *)((char *)v123[0] + v45), v38);
      float v47 = stats::mean((stats *)v46, v37);
      *(float *)((char *)v122[0] + v45) = v47;
      v45 += 4;
      uint64_t v46 = (Scandium::ScandiumPPG *)((char *)v46 + 6400);
    }
    while (v45 != 32);
    uint64_t v48 = 0;
    long long v49 = (Scandium::ScandiumPPG::scandium_spo2_processor_t *)((char *)this + 256252);
    do
    {
      Scandium::ScandiumPPG::calc_ppg_ac_metrics(v49, v37, (float *)((char *)v115[0] + v48), (float *)((char *)v114[0] + v48), v38);
      float v50 = stats::mean((stats *)v49, v37);
      *(float *)((char *)v113[0] + v48) = v50;
      v48 += 4;
      long long v49 = (Scandium::ScandiumPPG *)((char *)v49 + 6400);
    }
    while (v48 != 16);
    float v51 = Scandium::ScandiumPPG::get_median_of_path_type<float>((uint64_t *)v118, 258);
    Scandium::fill_valid((float *)this + 193087, v52, v51);
    float v53 = Scandium::ScandiumPPG::get_median_of_path_type<float>((uint64_t *)v118, 257);
    Scandium::fill_valid((float *)this + 193088, v54, v53);
    float v55 = Scandium::ScandiumPPG::get_median_of_path_type<float>((uint64_t *)v118, 256);
    Scandium::fill_valid((float *)this + 193089, v56, v55);
    float v57 = Scandium::ScandiumPPG::get_median_of_path_type<float>((uint64_t *)v117, 258);
    Scandium::fill_valid((float *)this + 193095, v58, v57);
    float v59 = Scandium::ScandiumPPG::get_median_of_path_type<float>((uint64_t *)v117, 257);
    Scandium::fill_valid((float *)this + 193096, v60, v59);
    float v61 = Scandium::ScandiumPPG::get_median_of_path_type<float>((uint64_t *)v117, 256);
    Scandium::fill_valid((float *)this + 193097, v62, v61);
    float v63 = Scandium::ScandiumPPG::get_median_of_path_type<float>((uint64_t *)v116, 258);
    Scandium::fill_valid((float *)this + 193103, v64, v63);
    float v65 = Scandium::ScandiumPPG::get_median_of_path_type<float>((uint64_t *)v116, 257);
    Scandium::fill_valid((float *)this + 193104, v66, v65);
    float v67 = Scandium::ScandiumPPG::get_median_of_path_type<float>((uint64_t *)v116, 256);
    Scandium::fill_valid((float *)this + 193105, v68, v67);
    float v69 = Scandium::ScandiumPPG::get_median_of_path_type<float>((uint64_t *)v121, 258);
    Scandium::fill_valid((float *)this + 193090, v70, v69);
    float v71 = Scandium::ScandiumPPG::get_median_of_path_type<float>((uint64_t *)v121, 257);
    Scandium::fill_valid((float *)this + 193091, v72, v71);
    float v73 = Scandium::ScandiumPPG::get_median_of_path_type<float>((uint64_t *)v121, 256);
    Scandium::fill_valid((float *)this + 193092, v74, v73);
    float v75 = Scandium::ScandiumPPG::get_median_of_path_type<float>((uint64_t *)v120, 258);
    Scandium::fill_valid((float *)this + 193098, v76, v75);
    float v77 = Scandium::ScandiumPPG::get_median_of_path_type<float>((uint64_t *)v120, 257);
    Scandium::fill_valid((float *)this + 193099, v78, v77);
    float v79 = Scandium::ScandiumPPG::get_median_of_path_type<float>((uint64_t *)v120, 256);
    Scandium::fill_valid((float *)this + 193100, v80, v79);
    float v81 = Scandium::ScandiumPPG::get_median_of_path_type<float>((uint64_t *)v119, 258);
    Scandium::fill_valid((float *)this + 193106, v82, v81);
    float v83 = Scandium::ScandiumPPG::get_median_of_path_type<float>((uint64_t *)v119, 257);
    Scandium::fill_valid((float *)this + 193107, v84, v83);
    float v85 = Scandium::ScandiumPPG::get_median_of_path_type<float>((uint64_t *)v119, 256);
    Scandium::fill_valid((float *)this + 193108, v86, v85);
    float v87 = Scandium::ScandiumPPG::get_median_of_path_type<float>((uint64_t *)&v124, 0);
    Scandium::fill_valid((float *)this + 193093, v88, v87);
    float v89 = Scandium::ScandiumPPG::get_median_of_path_type<float>((uint64_t *)v123, 0);
    Scandium::fill_valid((float *)this + 193101, v90, v89);
    float v91 = Scandium::ScandiumPPG::get_median_of_path_type<float>((uint64_t *)v122, 0);
    Scandium::fill_valid((float *)this + 193109, v92, v91);
    float v93 = Scandium::ScandiumPPG::get_median_of_path_type<float>((uint64_t *)v115, 0);
    Scandium::fill_valid((float *)this + 193094, v94, v93);
    float v95 = Scandium::ScandiumPPG::get_median_of_path_type<float>((uint64_t *)v114, 0);
    Scandium::fill_valid((float *)this + 193102, v96, v95);
    float v97 = Scandium::ScandiumPPG::get_median_of_path_type<float>((uint64_t *)v113, 0);
    Scandium::fill_valid((float *)this + 193110, v98, v97);
    v112[0] = (char *)this + 307452;
    v112[1] = (char *)this + 313852;
    v112[2] = (char *)this + 320252;
    Scandium::ScandiumPPG::calc_session_mavs((Scandium::ScandiumPPG *)v112, (float **)v37, 3, (float **)&__p);
    int v99 = v111;
    if (v111 != __p)
    {
      float v100 = stats::min((stats *)__p, (const float *)((unint64_t)((unsigned char *)v111 - (unsigned char *)__p) >> 2));
      Scandium::fill_valid((float *)this + 193122, v101, v100);
      float v102 = stats::max((stats *)__p, (const float *)((unint64_t)((unsigned char *)v111 - (unsigned char *)__p) >> 2));
      Scandium::fill_valid((float *)this + 193123, v103, v102);
      float v104 = stats::mean((stats *)__p, (const float *)((unint64_t)((unsigned char *)v111 - (unsigned char *)__p) >> 2));
      Scandium::fill_valid((float *)this + 193124, v105, v104);
      float v106 = Scandium::sort_median((Scandium *)__p, (const float *)((unint64_t)((unsigned char *)v111 - (unsigned char *)__p) >> 2));
      Scandium::fill_valid((float *)this + 193125, v107, v106);
      float v108 = stats::std((stats *)__p, (const float *)((unint64_t)((unsigned char *)v111 - (unsigned char *)__p) >> 2), 0);
      Scandium::fill_valid((float *)this + 193126, v109, v108);
      int v99 = __p;
    }
    if (v99)
    {
      float v111 = v99;
      operator delete(v99);
    }
    if (v113[0])
    {
      v113[1] = v113[0];
      operator delete(v113[0]);
    }
    if (v114[0])
    {
      v114[1] = v114[0];
      operator delete(v114[0]);
    }
    if (v115[0])
    {
      v115[1] = v115[0];
      operator delete(v115[0]);
    }
    if (v116[0])
    {
      v116[1] = v116[0];
      operator delete(v116[0]);
    }
    if (v117[0])
    {
      v117[1] = v117[0];
      operator delete(v117[0]);
    }
    if (v118[0])
    {
      v118[1] = v118[0];
      operator delete(v118[0]);
    }
    if (v119[0])
    {
      v119[1] = v119[0];
      operator delete(v119[0]);
    }
    if (v120[0])
    {
      v120[1] = v120[0];
      operator delete(v120[0]);
    }
    if (v121[0])
    {
      v121[1] = v121[0];
      operator delete(v121[0]);
    }
    if (v122[0])
    {
      v122[1] = v122[0];
      operator delete(v122[0]);
    }
    if (v123[0])
    {
      v123[1] = v123[0];
      operator delete(v123[0]);
    }
    if (v124)
    {
      uint64_t v125 = v124;
      operator delete(v124);
    }
  }
  if (v34) {
    operator delete(v34);
  }
}

void sub_25BA54604(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, uint64_t a20,void *a21,uint64_t a22,uint64_t a23,void *a24,uint64_t a25,uint64_t a26,void *a27,uint64_t a28,uint64_t a29,void *a30,uint64_t a31,uint64_t a32,void *a33,uint64_t a34)
{
  if (__p) {
    operator delete(__p);
  }
  if (a18) {
    operator delete(a18);
  }
  if (a21) {
    operator delete(a21);
  }
  if (a24) {
    operator delete(a24);
  }
  if (a27) {
    operator delete(a27);
  }
  if (a30) {
    operator delete(a30);
  }
  if (a33) {
    operator delete(a33);
  }
  int v37 = *(void **)(v35 - 184);
  if (v37)
  {
    *(void *)(v35 - 176) = v37;
    operator delete(v37);
  }
  int v38 = *(void **)(v35 - 160);
  if (v38)
  {
    *(void *)(v35 - 152) = v38;
    operator delete(v38);
  }
  uint64_t v39 = *(void **)(v35 - 136);
  if (v39)
  {
    *(void *)(v35 - 128) = v39;
    operator delete(v39);
  }
  int v40 = *(void **)(v35 - 112);
  if (v40)
  {
    *(void *)(v35 - 10std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = v40;
    operator delete(v40);
  }
  float v41 = *(void **)(v35 - 88);
  if (v41)
  {
    *(void *)(v35 - 8std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_processor_t>::reset[abi:ne180100](this, 0) = v41;
    operator delete(v41);
  }
  if (v34) {
    operator delete(v34);
  }
  _Unwind_Resume(exception_object);
}

void Scandium::ScandiumPPG::scandium_spo2_processor_t::report_rslts(Scandium::ScandiumPPG::scandium_spo2_processor_t *this, float *a2)
{
  uint64_t v3 = (char *)this + 772528;
  float v4 = (float *)((char *)this + 623296);
  int v5 = *((unsigned __int8 *)this + 770698);
  if (v5 == 1)
  {
    uint64_t v6 = (float *)((char *)this + 632464);
    Scandium::fill_valid((float *)this + 193018, a2, *v4);
    Scandium::fill_valid((float *)this + 193022, v7, v4[3]);
    Scandium::fill_valid((float *)this + 193040, v8, *v6);
    Scandium::fill_valid((float *)this + 193041, v9, *((float *)this + 158119));
    float v10 = (float *)&Scandium::ScandiumPPG::MAX_SPO2_DISPLAY_VALUE;
    if (*v4 <= 100.0) {
      float v10 = v4;
    }
    if (*v4 < 60.0) {
      float v10 = (float *)&Scandium::ScandiumPPG::MIN_SPO2_DISPLAY_VALUE;
    }
    float v11 = *v10;
    int v12 = memcpy(__dst, (char *)this + 623384, 0x700uLL);
    float v13 = Scandium::ScandiumPPG::scandium_spo2_processor_t::median_hr_allpaths((uint64_t)v12, (uint64_t)__dst);
    goto LABEL_35;
  }
  double v15 = nan((const char *)&unk_25BA677EF);
  if (v5 != 2)
  {
    float v13 = v15;
    float v11 = v13;
LABEL_35:
    float v43 = v11;
    goto LABEL_36;
  }
  uint64_t v16 = *((unsigned int *)v3 + 2);
  if ((int)v16 < 1) {
    goto LABEL_14;
  }
  int v17 = 0;
  float v18 = 0.0;
  float v19 = v4;
  do
  {
    float v20 = *v19++;
    float v18 = v18 + v20;
    ++v17;
    --v16;
  }
  while (v16);
  if (v17) {
    float v21 = v18 / (float)v17;
  }
  else {
LABEL_14:
  }
    float v21 = NAN;
  Scandium::fill_valid((float *)this + 193018, v14, roundf(v21));
  uint64_t v23 = *((unsigned int *)v3 + 2);
  if ((int)v23 < 1) {
    goto LABEL_20;
  }
  int v24 = 0;
  float v25 = v4 + 3;
  float v26 = 0.0;
  do
  {
    float v27 = *v25++;
    float v26 = v26 + v27;
    ++v24;
    --v23;
  }
  while (v23);
  if (v24) {
    float v28 = v26 / (float)v24;
  }
  else {
LABEL_20:
  }
    float v28 = NAN;
  Scandium::fill_valid((float *)this + 193022, v22, v28);
  uint64_t v30 = *((unsigned int *)v3 + 2);
  float v45 = 0.0;
  float v31 = 0.0;
  float v32 = 0.0;
  if ((int)v30 >= 1)
  {
    vDSP_meanv_wrapper((uint64_t)this + 632464, 1, &v45, v30);
    float v32 = v45;
  }
  Scandium::fill_valid((float *)this + 193040, v29, v32);
  uint64_t v34 = *((unsigned int *)v3 + 2);
  float v45 = 0.0;
  if ((int)v34 >= 1)
  {
    vDSP_meanv_wrapper((uint64_t)this + 632476, 1, &v45, v34);
    float v31 = v45;
  }
  int v35 = Scandium::fill_valid((float *)this + 193041, v33, v31);
  int v36 = (const float *)*((unsigned int *)v3 + 2);
  if ((int)v36 < 1) {
    goto LABEL_30;
  }
  int v37 = 0;
  float v38 = 0.0;
  uint64_t v39 = *((unsigned int *)v3 + 2);
  do
  {
    float v40 = *v4++;
    float v38 = v38 + v40;
    ++v37;
    --v39;
  }
  while (v39);
  if (v37) {
    float v41 = v38 / (float)v37;
  }
  else {
LABEL_30:
  }
    float v41 = NAN;
  float v42 = roundf(v41);
  if (v42 <= 100.0) {
    float v11 = v42;
  }
  else {
    float v11 = 100.0;
  }
  float v13 = Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_median_hr(v35, v36, (stats *)((char *)this + 623368));
  float v43 = 60.0;
  if (v42 >= 60.0) {
    goto LABEL_35;
  }
LABEL_36:
  Scandium::ScandiumPPG::scandium_spo2_processor_t::result_handler_proxy((uint64_t)this, v43, v13);
}

void Scandium::ScandiumPPG::beats_t::~beats_t(Scandium::ScandiumPPG::beats_t *this)
{
  uint64_t v2 = (void *)*((void *)this + 4);
  if (v2)
  {
    *((void *)this + 5) = v2;
    operator delete(v2);
  }
  uint64_t v3 = *(void **)this;
  if (*(void *)this)
  {
    *((void *)this + 1) = v3;
    operator delete(v3);
  }
}

void Scandium::ScandiumPPG::scandium_spo2_processor_t::result_handler_proxy(uint64_t a1, float a2, float a3)
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  log = Scandium::algs_get_log((Scandium *)a1);
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    double v22 = a2;
    __int16 v23 = 2048;
    double v24 = a3;
    _os_log_impl(&dword_25BA34000, log, OS_LOG_TYPE_DEFAULT, "scandium report results: spo2: %.06f hr: %.06f", buf, 0x16u);
  }
  Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics((Scandium::ScandiumPPG::scandium_spo2_processor_t *)a1);
  if (*(void *)(a1 + 772768))
  {
    std::string::basic_string[abi:ne180100]<0>(v19, "report");
    std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::pair[abi:ne180100]<char const(&)[13],char const(&)[7],0>((uint64_t)buf, "algs_version", "11.1.4");
    std::string::basic_string[abi:ne180100]<0>(v25, "algs_mode");
    int v26 = *(unsigned __int8 *)(a1 + 770698);
    int v27 = 1;
    int v7 = *(_DWORD *)(a1 + 772516);
    std::string::basic_string[abi:ne180100]<0>(v28, "optical_gen");
    int v29 = v7;
    int v30 = 1;
    unint64_t v8 = *(int *)(a1 + 772536);
    v15[1] = 0;
    uint64_t v16 = 0;
    v15[0] = 0;
    std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(v15, (const void *)(a1 + 623296), a1 + 623296 + 4 * v8, v8);
    std::string::basic_string[abi:ne180100]<0>(v31, "window_spo2");
    long long v32 = *(_OWORD *)v15;
    uint64_t v33 = v16;
    v15[1] = 0;
    uint64_t v16 = 0;
    v15[0] = 0;
    int v34 = 3;
    int v35 = 6;
    v13[0] = 0;
    v13[1] = 0;
    uint64_t v14 = 0;
    std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(v13, (const void *)(a1 + 623308), a1 + 623320, 3uLL);
    std::string::basic_string[abi:ne180100]<0>(v36, "window_spo2_no_conf_gate");
    long long v37 = *(_OWORD *)v13;
    uint64_t v38 = v14;
    v13[1] = 0;
    uint64_t v14 = 0;
    v13[0] = 0;
    int v39 = 3;
    int v40 = 6;
    __p[0] = 0;
    __p[1] = 0;
    uint64_t v12 = 0;
    std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(__p, (const void *)(a1 + 623368), a1 + 623380, 3uLL);
    std::string::basic_string[abi:ne180100]<0>(v41, "window_hr");
    long long v42 = *(_OWORD *)__p;
    uint64_t v43 = v12;
    __p[1] = 0;
    uint64_t v12 = 0;
    __p[0] = 0;
    int v44 = 3;
    int v45 = 6;
    std::string::basic_string[abi:ne180100]<0>(v46, "result_spo2");
    float v47 = a2;
    int v48 = 3;
    std::string::basic_string[abi:ne180100]<0>(v49, "result_hr");
    float v50 = a3;
    int v51 = 3;
    std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::unordered_map((uint64_t)v18, buf, 8);
    uint64_t v9 = *(void *)(a1 + 772768);
    if (!v9) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    (*(void (**)(uint64_t, void **, unsigned char *))(*(void *)v9 + 48))(v9, v19, v18);
    std::__hash_table<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>>>::~__hash_table((uint64_t)v18);
    uint64_t v10 = 576;
    do
    {
      std::__variant_detail::__dtor<std::__variant_detail::__traits<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v18[v10 + 24]);
      if ((char)v18[v10 + 15] < 0) {
        operator delete(*(void **)&v17[v10]);
      }
      v10 -= 72;
    }
    while (v10);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    if (v13[0])
    {
      v13[1] = v13[0];
      operator delete(v13[0]);
    }
    if (v15[0])
    {
      v15[1] = v15[0];
      operator delete(v15[0]);
    }
    if (v20 < 0) {
      operator delete(v19[0]);
    }
    Scandium::ScandiumPPG::scandium_spo2_processor_t::log_core_analytics((Scandium::ScandiumPPG::scandium_spo2_processor_t *)a1);
  }
  if (*(void *)(a1 + 772640)) {
    std::function<void ()(Scandium::ScandiumPPG::SpO2Result)>::operator()(a1 + 772616, roundf(a2), roundf(a3));
  }
}

void sub_25BA54F5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26,uint64_t a27,int a28,__int16 a29,char a30,char a31,char a32)
{
  for (uint64_t i = 504; i != -72; i -= 72)
    std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::~pair((uint64_t)(&a32 + i));
  if (__p) {
    operator delete(__p);
  }
  if (a13) {
    operator delete(a13);
  }
  if (a17) {
    operator delete(a17);
  }
  if (a31 < 0) {
    operator delete(a26);
  }
  _Unwind_Resume(a1);
}

float Scandium::ScandiumPPG::scandium_spo2_processor_t::compute_bga_openness(Scandium::ScandiumPPG::scandium_spo2_processor_t *this, stats *a2, stats *a3, const float *a4)
{
  if (!a4) {
    return NAN;
  }
  uint64_t v6 = (float *)a2;
  uint64_t v24 = 0;
  float v7 = stats::mean(a2, a4);
  float v8 = stats::mean(a3, a4);
  vDSP_maxv_wrapper((uint64_t)v6, 1, (float *)&v24 + 1, (int)a4);
  vDSP_minv_wrapper((uint64_t)v6, 1, (float *)&v24, (int)a4);
  uint64_t v9 = v24;
  vDSP_maxv_wrapper((uint64_t)a3, 1, (float *)&v24 + 1, (int)a4);
  vDSP_minv_wrapper((uint64_t)a3, 1, (float *)&v24, (int)a4);
  float result = 0.0;
  float v11 = 0.0;
  float v12 = 0.0;
  float v13 = 0.0;
  if ((int)a4 >= 1)
  {
    uint64_t v14 = a4;
    float v13 = 0.0;
    float v12 = 0.0;
    do
    {
      float v15 = *v6++;
      float v16 = (float)(v15 - v7) / (float)(*((float *)&v9 + 1) - *(float *)&v9);
      float v17 = *(float *)a3->cp_time;
      a3 = (stats *)((char *)a3 + 4);
      float v18 = (float)(v17 - v8) / (float)(*((float *)&v24 + 1) - *(float *)&v24);
      float v11 = v11 + (float)(v16 * v16);
      float v12 = v12 + (float)(v16 * v18);
      float v13 = v13 + (float)(v18 * v18);
      --v14;
    }
    while (v14);
  }
  float v19 = v11 / (float)(int)a4;
  float v20 = v13 / (float)(int)a4;
  float v21 = sqrtf((float)((float)((float)(v12 / (float)(int)a4) * (float)(v12 / (float)(int)a4)) * 4.0)+ (float)((float)(v20 - v19) * (float)(v20 - v19)));
  float v22 = v19 + v20;
  float v23 = (float)(v22 - v21) * 0.5;
  if (v23 >= 0.0) {
    return sqrtf(v23 / (float)((float)(v22 + v21) * 0.5));
  }
  return result;
}

void Scandium::ScandiumPPG::scandium_spo2_processor_t::compute_good_snips(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  int v7 = *(_DWORD *)(a3 + 16);
  if (v7 >= 1)
  {
    for (unint64_t i = 0; (uint64_t)i < v7; ++i)
    {
      if ((*(void *)(*a4 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) >> i))
      {
        float v12 = *(_DWORD **)(a2 + 8);
        unint64_t v11 = *(void *)(a2 + 16);
        if ((unint64_t)v12 >= v11)
        {
          uint64_t v14 = *(_DWORD **)a2;
          uint64_t v15 = ((uint64_t)v12 - *(void *)a2) >> 2;
          unint64_t v16 = v15 + 1;
          if ((unint64_t)(v15 + 1) >> 62) {
            std::vector<float>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v17 = v11 - (void)v14;
          if (v17 >> 1 > v16) {
            unint64_t v16 = v17 >> 1;
          }
          if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v18 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v18 = v16;
          }
          if (v18)
          {
            float v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(a2 + 16, v18);
            uint64_t v14 = *(_DWORD **)a2;
            float v12 = *(_DWORD **)(a2 + 8);
          }
          else
          {
            float v19 = 0;
          }
          float v20 = &v19[4 * v15];
          *(_DWORD *)float v20 = i;
          float v13 = v20 + 4;
          while (v12 != v14)
          {
            int v21 = *--v12;
            *((_DWORD *)v20 - 1) = v21;
            v20 -= 4;
          }
          *(void *)a2 = v20;
          *(void *)(a2 + 8) = v13;
          *(void *)(a2 + 16) = &v19[4 * v18];
          if (v14) {
            operator delete(v14);
          }
        }
        else
        {
          *float v12 = i;
          float v13 = v12 + 1;
        }
        *(void *)(a2 + 8) = v13;
        int v7 = *(_DWORD *)(a3 + 16);
      }
    }
  }
  *(void *)(a5 + 48) = a2;
  *(_DWORD *)(a5 + 10std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = (*(void *)(a2 + 8) - *(void *)a2) >> 2;
}

void Scandium::ScandiumPPG::scandium_spo2_processor_t::compute_dropped_samples_metrics_for_window_and_type(uint64_t a1, uint64_t a2, int *a3, int a4, int a5)
{
  *(_DWORD *)a2 = 0;
  uint64_t v5 = (a4 - 1);
  if (a4 >= 1)
  {
    unsigned __int16 v6 = 0;
    int v7 = 0;
    BOOL v8 = 0;
    unsigned __int16 v9 = 0;
    for (uint64_t i = a4; i; --i)
    {
      int v11 = *a3++;
      BOOL v12 = (v11 & a5) != 0;
      if ((v11 & a5) != 0)
      {
        ++v9;
        *(_WORD *)a2 = ++v7;
        if (!v5) {
          goto LABEL_7;
        }
      }
      else if (v8)
      {
LABEL_7:
        if (v9 > v6)
        {
          *(_WORD *)(a2 + 2) = v9;
          unsigned __int16 v6 = v9;
        }
        unsigned __int16 v9 = 0;
      }
      --v5;
      BOOL v8 = v12;
    }
  }
}

void Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(Scandium::ScandiumPPG::scandium_spo2_processor_t *this)
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  if (*((void *)this + 1) != *(void *)this)
  {
    uint64_t v2 = (uint64_t *)((char *)this + 24);
    if (*((void *)this + 4) != *((void *)this + 3)
      && *((void *)this + 7) != *((void *)this + 6)
      && *((void *)this + 10) != *((void *)this + 9)
      && *((void *)this + 13) != *((void *)this + 12))
    {
      Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_1::operator()((uint64_t *)this, 1, 0, v66);
      Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_1::operator()((uint64_t *)this, 0, 0, v65);
      Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_1::operator()((uint64_t *)this, 2, 0, v64);
      memset(v63, 0, sizeof(v63));
      uint64_t v3 = (char *)*((void *)this + 9);
      float v4 = (char *)*((void *)this + 10);
      if (v3 != v4)
      {
        do
        {
          uint64_t v5 = v3 + 64;
          int v70 = 0;
          float v71 = 0;
          uint64_t v72 = 0;
          std::vector<float>::__init_with_size[abi:ne180100]<float const*,float const*>(&v70, v3, (uint64_t)(v3 + 64), 0x10uLL);
          std::vector<std::vector<float>>::push_back[abi:ne180100](v63, (uint64_t)&v70);
          if (v70)
          {
            float v71 = v70;
            operator delete(v70);
          }
          uint64_t v3 = v5;
        }
        while (v5 != v4);
      }
      Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_1::operator()((uint64_t *)this + 9, 1, 0, v62);
      Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_1::operator()((uint64_t *)this + 9, 0, 0, v61);
      Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_1::operator()((uint64_t *)this + 9, 2, 0, v60);
      memset(v59, 0, sizeof(v59));
      unsigned __int16 v6 = (char *)*((void *)this + 9);
      int v7 = (char *)*((void *)this + 10);
      if (v6 != v7)
      {
        do
        {
          BOOL v8 = v6 + 64;
          int v70 = 0;
          float v71 = 0;
          uint64_t v72 = 0;
          std::vector<float>::__init_with_size[abi:ne180100]<float const*,float const*>(&v70, v6, (uint64_t)(v6 + 64), 0x10uLL);
          std::vector<std::vector<float>>::push_back[abi:ne180100](v59, (uint64_t)&v70);
          if (v70)
          {
            float v71 = v70;
            operator delete(v70);
          }
          unsigned __int16 v6 = v8;
        }
        while (v8 != v7);
      }
      Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_1::operator()((uint64_t *)this + 6, 1, 0, v58);
      Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_1::operator()((uint64_t *)this + 6, 0, 0, v57);
      Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_1::operator()((uint64_t *)this + 6, 2, 0, v56);
      if (v64[1] == v64[0]) {
        std::vector<float>::__throw_out_of_range[abi:ne180100]();
      }
      if (v66[1] == v66[0]) {
        std::vector<float>::__throw_out_of_range[abi:ne180100]();
      }
      if (v65[1] == v65[0]) {
        std::vector<float>::__throw_out_of_range[abi:ne180100]();
      }
      uint64_t v10 = *(void *)v64[0];
      uint64_t v9 = *(void *)(v64[0] + 8);
      uint64_t v12 = *(void *)v66[0];
      uint64_t v11 = *(void *)(v66[0] + 8);
      uint64_t v14 = *(void *)v65[0];
      uint64_t v13 = *(void *)(v65[0] + 8);
      Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_1::operator()((uint64_t *)this + 12, 2, 1, v55);
      int v70 = (void **)&unk_2709338D8;
      float v71 = (void **)Scandium::sort_median;
      float v73 = &v70;
      float v67 = &unk_2709338D8;
      uint64_t v68 = Scandium::sort_median;
      float v69 = &v67;
      float v15 = Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_0::operator()(v55, (uint64_t)&v70, (uint64_t)&v67);
      Scandium::fill_valid((float *)this + 193070, v16, v15);
      std::__function::__value_func<float ()(float const*,int)>::~__value_func[abi:ne180100](&v67);
      uint64_t v17 = (void ***)std::__function::__value_func<float ()(float const*,int)>::~__value_func[abi:ne180100](&v70);
      int v70 = (void **)v55;
      std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](v17);
      float v69 = &v67;
      int v70 = (void **)&unk_2709338D8;
      float v71 = (void **)stats::min;
      float v73 = &v70;
      float v67 = &unk_2709338D8;
      uint64_t v68 = stats::min;
      float v18 = Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_0::operator()(v66, (uint64_t)&v70, (uint64_t)&v67);
      Scandium::fill_valid((float *)this + 193058, v19, v18);
      std::__function::__value_func<float ()(float const*,int)>::~__value_func[abi:ne180100](&v67);
      std::__function::__value_func<float ()(float const*,int)>::~__value_func[abi:ne180100](&v70);
      float v69 = &v67;
      int v70 = (void **)&unk_2709338D8;
      float v71 = (void **)stats::min;
      float v73 = &v70;
      float v67 = &unk_2709338D8;
      uint64_t v68 = stats::min;
      float v20 = Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_0::operator()(v65, (uint64_t)&v70, (uint64_t)&v67);
      Scandium::fill_valid((float *)this + 193059, v21, v20);
      std::__function::__value_func<float ()(float const*,int)>::~__value_func[abi:ne180100](&v67);
      std::__function::__value_func<float ()(float const*,int)>::~__value_func[abi:ne180100](&v70);
      float v69 = &v67;
      int v70 = (void **)&unk_2709338D8;
      float v71 = (void **)stats::min;
      float v73 = &v70;
      float v67 = &unk_2709338D8;
      uint64_t v68 = stats::min;
      float v22 = Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_0::operator()(v64, (uint64_t)&v70, (uint64_t)&v67);
      Scandium::fill_valid((float *)this + 193060, v23, v22);
      std::__function::__value_func<float ()(float const*,int)>::~__value_func[abi:ne180100](&v67);
      std::__function::__value_func<float ()(float const*,int)>::~__value_func[abi:ne180100](&v70);
      float v69 = &v67;
      int v70 = (void **)&unk_2709338D8;
      float v71 = (void **)Scandium::sort_median;
      float v73 = &v70;
      float v67 = &unk_2709338D8;
      uint64_t v68 = Scandium::sort_median;
      float v24 = Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_0::operator()(v66, (uint64_t)&v70, (uint64_t)&v67);
      Scandium::fill_valid((float *)this + 193061, v25, v24);
      std::__function::__value_func<float ()(float const*,int)>::~__value_func[abi:ne180100](&v67);
      std::__function::__value_func<float ()(float const*,int)>::~__value_func[abi:ne180100](&v70);
      float v69 = &v67;
      int v70 = (void **)&unk_2709338D8;
      float v71 = (void **)Scandium::sort_median;
      float v73 = &v70;
      float v67 = &unk_2709338D8;
      uint64_t v68 = Scandium::sort_median;
      float v26 = Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_0::operator()(v65, (uint64_t)&v70, (uint64_t)&v67);
      Scandium::fill_valid((float *)this + 193062, v27, v26);
      std::__function::__value_func<float ()(float const*,int)>::~__value_func[abi:ne180100](&v67);
      std::__function::__value_func<float ()(float const*,int)>::~__value_func[abi:ne180100](&v70);
      float v69 = &v67;
      int v70 = (void **)&unk_2709338D8;
      float v71 = (void **)Scandium::sort_median;
      float v73 = &v70;
      float v67 = &unk_2709338D8;
      uint64_t v68 = Scandium::sort_median;
      float v28 = Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_0::operator()(v64, (uint64_t)&v70, (uint64_t)&v67);
      Scandium::fill_valid((float *)this + 193063, v29, v28);
      std::__function::__value_func<float ()(float const*,int)>::~__value_func[abi:ne180100](&v67);
      std::__function::__value_func<float ()(float const*,int)>::~__value_func[abi:ne180100](&v70);
      float v69 = &v67;
      int v70 = (void **)&unk_2709338D8;
      float v71 = (void **)stats::max;
      float v73 = &v70;
      float v67 = &unk_2709338D8;
      uint64_t v68 = stats::max;
      float v30 = Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_0::operator()(v66, (uint64_t)&v70, (uint64_t)&v67);
      Scandium::fill_valid((float *)this + 193064, v31, v30);
      std::__function::__value_func<float ()(float const*,int)>::~__value_func[abi:ne180100](&v67);
      std::__function::__value_func<float ()(float const*,int)>::~__value_func[abi:ne180100](&v70);
      float v69 = &v67;
      int v70 = (void **)&unk_2709338D8;
      float v71 = (void **)stats::max;
      float v73 = &v70;
      float v67 = &unk_2709338D8;
      uint64_t v68 = stats::max;
      float v32 = Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_0::operator()(v65, (uint64_t)&v70, (uint64_t)&v67);
      Scandium::fill_valid((float *)this + 193065, v33, v32);
      std::__function::__value_func<float ()(float const*,int)>::~__value_func[abi:ne180100](&v67);
      std::__function::__value_func<float ()(float const*,int)>::~__value_func[abi:ne180100](&v70);
      float v69 = &v67;
      int v70 = (void **)&unk_2709338D8;
      float v71 = (void **)stats::max;
      float v73 = &v70;
      float v67 = &unk_2709338D8;
      uint64_t v68 = stats::max;
      float v34 = Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_0::operator()(v64, (uint64_t)&v70, (uint64_t)&v67);
      Scandium::fill_valid((float *)this + 193066, v35, v34);
      std::__function::__value_func<float ()(float const*,int)>::~__value_func[abi:ne180100](&v67);
      std::__function::__value_func<float ()(float const*,int)>::~__value_func[abi:ne180100](&v70);
      Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_1::operator()(v2, 1, 0, v55);
      float v69 = &v67;
      int v70 = (void **)&unk_2709338D8;
      float v71 = (void **)stats::mean;
      float v73 = &v70;
      float v67 = &unk_2709338D8;
      uint64_t v68 = stats::mean;
      float v36 = Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_0::operator()(v55, (uint64_t)&v70, (uint64_t)&v67);
      Scandium::fill_valid((float *)this + 193067, v37, v36);
      std::__function::__value_func<float ()(float const*,int)>::~__value_func[abi:ne180100](&v67);
      uint64_t v38 = (void ***)std::__function::__value_func<float ()(float const*,int)>::~__value_func[abi:ne180100](&v70);
      int v70 = (void **)v55;
      std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](v38);
      Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_1::operator()(v2, 0, 0, v55);
      float v69 = &v67;
      int v70 = (void **)&unk_2709338D8;
      float v71 = (void **)stats::mean;
      float v73 = &v70;
      float v67 = &unk_2709338D8;
      uint64_t v68 = stats::mean;
      float v39 = Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_0::operator()(v55, (uint64_t)&v70, (uint64_t)&v67);
      Scandium::fill_valid((float *)this + 193068, v40, v39);
      std::__function::__value_func<float ()(float const*,int)>::~__value_func[abi:ne180100](&v67);
      float v41 = (void ***)std::__function::__value_func<float ()(float const*,int)>::~__value_func[abi:ne180100](&v70);
      int v70 = (void **)v55;
      std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](v41);
      Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_1::operator()(v2, 2, 0, v55);
      float v69 = &v67;
      int v70 = (void **)&unk_2709338D8;
      float v71 = (void **)stats::mean;
      float v73 = &v70;
      float v67 = &unk_2709338D8;
      uint64_t v68 = stats::mean;
      float v42 = Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_0::operator()(v55, (uint64_t)&v70, (uint64_t)&v67);
      Scandium::fill_valid((float *)this + 193069, v43, v42);
      std::__function::__value_func<float ()(float const*,int)>::~__value_func[abi:ne180100](&v67);
      int v44 = (void ***)std::__function::__value_func<float ()(float const*,int)>::~__value_func[abi:ne180100](&v70);
      int v70 = (void **)v55;
      std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](v44);
      float v69 = &v67;
      int v70 = (void **)&unk_2709338D8;
      float v71 = (void **)stats::mean;
      float v73 = &v70;
      float v67 = &unk_2709338D8;
      uint64_t v68 = stats::max;
      *((_DWORD *)this + 193071) = llroundf(Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_0::operator()(v63, (uint64_t)&v70, (uint64_t)&v67)* 16.0);
      std::__function::__value_func<float ()(float const*,int)>::~__value_func[abi:ne180100](&v67);
      std::__function::__value_func<float ()(float const*,int)>::~__value_func[abi:ne180100](&v70);
      float v69 = &v67;
      int v70 = (void **)&unk_2709338D8;
      float v71 = (void **)stats::mean;
      float v73 = &v70;
      float v67 = &unk_2709338D8;
      uint64_t v68 = stats::min;
      *((_DWORD *)this + 193072) = llroundf(Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_0::operator()(v63, (uint64_t)&v70, (uint64_t)&v67)* 16.0);
      std::__function::__value_func<float ()(float const*,int)>::~__value_func[abi:ne180100](&v67);
      std::__function::__value_func<float ()(float const*,int)>::~__value_func[abi:ne180100](&v70);
      float v69 = &v67;
      int v70 = (void **)&unk_2709338D8;
      float v71 = (void **)stats::mean;
      float v73 = &v70;
      float v67 = &unk_2709338D8;
      uint64_t v68 = stats::max;
      float v45 = (float)(unint64_t)((v11 - v12) >> 2);
      *((_DWORD *)this + 193073) = llroundf(Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_0::operator()(v62, (uint64_t)&v70, (uint64_t)&v67)* v45);
      std::__function::__value_func<float ()(float const*,int)>::~__value_func[abi:ne180100](&v67);
      std::__function::__value_func<float ()(float const*,int)>::~__value_func[abi:ne180100](&v70);
      float v69 = &v67;
      int v70 = (void **)&unk_2709338D8;
      float v71 = (void **)stats::mean;
      float v73 = &v70;
      float v67 = &unk_2709338D8;
      uint64_t v68 = stats::min;
      *((_DWORD *)this + 19307std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = llroundf(Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_0::operator()(v62, (uint64_t)&v70, (uint64_t)&v67)* v45);
      std::__function::__value_func<float ()(float const*,int)>::~__value_func[abi:ne180100](&v67);
      std::__function::__value_func<float ()(float const*,int)>::~__value_func[abi:ne180100](&v70);
      float v69 = &v67;
      int v70 = (void **)&unk_2709338D8;
      float v71 = (void **)stats::mean;
      float v73 = &v70;
      float v67 = &unk_2709338D8;
      uint64_t v68 = stats::max;
      float v46 = (float)(unint64_t)((v13 - v14) >> 2);
      *((_DWORD *)this + 193075) = llroundf(Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_0::operator()(v61, (uint64_t)&v70, (uint64_t)&v67)* v46);
      std::__function::__value_func<float ()(float const*,int)>::~__value_func[abi:ne180100](&v67);
      std::__function::__value_func<float ()(float const*,int)>::~__value_func[abi:ne180100](&v70);
      float v69 = &v67;
      int v70 = (void **)&unk_2709338D8;
      float v71 = (void **)stats::mean;
      float v73 = &v70;
      float v67 = &unk_2709338D8;
      uint64_t v68 = stats::min;
      *((_DWORD *)this + 193076) = llroundf(Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_0::operator()(v61, (uint64_t)&v70, (uint64_t)&v67)* v46);
      std::__function::__value_func<float ()(float const*,int)>::~__value_func[abi:ne180100](&v67);
      std::__function::__value_func<float ()(float const*,int)>::~__value_func[abi:ne180100](&v70);
      float v69 = &v67;
      int v70 = (void **)&unk_2709338D8;
      float v71 = (void **)stats::mean;
      float v73 = &v70;
      float v67 = &unk_2709338D8;
      uint64_t v68 = stats::max;
      float v47 = (float)(unint64_t)((v9 - v10) >> 2);
      *((_DWORD *)this + 193077) = llroundf(Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_0::operator()(v60, (uint64_t)&v70, (uint64_t)&v67)* v47);
      std::__function::__value_func<float ()(float const*,int)>::~__value_func[abi:ne180100](&v67);
      std::__function::__value_func<float ()(float const*,int)>::~__value_func[abi:ne180100](&v70);
      float v69 = &v67;
      int v70 = (void **)&unk_2709338D8;
      float v71 = (void **)stats::mean;
      float v73 = &v70;
      float v67 = &unk_2709338D8;
      uint64_t v68 = stats::min;
      *((_DWORD *)this + 193078) = llroundf(Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_0::operator()(v60, (uint64_t)&v70, (uint64_t)&v67)* v47);
      std::__function::__value_func<float ()(float const*,int)>::~__value_func[abi:ne180100](&v67);
      std::__function::__value_func<float ()(float const*,int)>::~__value_func[abi:ne180100](&v70);
      float v69 = &v67;
      int v70 = (void **)&unk_2709338D8;
      float v71 = (void **)stats::mean;
      float v73 = &v70;
      float v67 = &unk_2709338D8;
      uint64_t v68 = stats::max;
      *((_DWORD *)this + 193079) = llroundf(Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_0::operator()(v59, (uint64_t)&v70, (uint64_t)&v67)* 16.0);
      std::__function::__value_func<float ()(float const*,int)>::~__value_func[abi:ne180100](&v67);
      std::__function::__value_func<float ()(float const*,int)>::~__value_func[abi:ne180100](&v70);
      float v69 = &v67;
      int v70 = (void **)&unk_2709338D8;
      float v71 = (void **)stats::mean;
      float v73 = &v70;
      float v67 = &unk_2709338D8;
      uint64_t v68 = stats::min;
      *((_DWORD *)this + 19308std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_processor_t>::reset[abi:ne180100](this, 0) = llroundf(Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_0::operator()(v59, (uint64_t)&v70, (uint64_t)&v67)* 16.0);
      std::__function::__value_func<float ()(float const*,int)>::~__value_func[abi:ne180100](&v67);
      std::__function::__value_func<float ()(float const*,int)>::~__value_func[abi:ne180100](&v70);
      float v69 = &v67;
      int v70 = (void **)&unk_2709338D8;
      float v71 = (void **)stats::mean;
      float v73 = &v70;
      float v67 = &unk_2709338D8;
      uint64_t v68 = stats::max;
      *((_DWORD *)this + 193081) = llroundf(Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_0::operator()(v58, (uint64_t)&v70, (uint64_t)&v67)* v45);
      std::__function::__value_func<float ()(float const*,int)>::~__value_func[abi:ne180100](&v67);
      std::__function::__value_func<float ()(float const*,int)>::~__value_func[abi:ne180100](&v70);
      float v69 = &v67;
      int v70 = (void **)&unk_2709338D8;
      float v71 = (void **)stats::mean;
      float v73 = &v70;
      float v67 = &unk_2709338D8;
      uint64_t v68 = stats::min;
      *((_DWORD *)this + 193082) = llroundf(Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_0::operator()(v58, (uint64_t)&v70, (uint64_t)&v67)* v45);
      std::__function::__value_func<float ()(float const*,int)>::~__value_func[abi:ne180100](&v67);
      std::__function::__value_func<float ()(float const*,int)>::~__value_func[abi:ne180100](&v70);
      float v69 = &v67;
      int v70 = (void **)&unk_2709338D8;
      float v71 = (void **)stats::mean;
      float v73 = &v70;
      float v67 = &unk_2709338D8;
      uint64_t v68 = stats::max;
      *((_DWORD *)this + 193083) = llroundf(Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_0::operator()(v57, (uint64_t)&v70, (uint64_t)&v67)* v46);
      std::__function::__value_func<float ()(float const*,int)>::~__value_func[abi:ne180100](&v67);
      std::__function::__value_func<float ()(float const*,int)>::~__value_func[abi:ne180100](&v70);
      float v69 = &v67;
      int v70 = (void **)&unk_2709338D8;
      float v71 = (void **)stats::mean;
      float v73 = &v70;
      float v67 = &unk_2709338D8;
      uint64_t v68 = stats::min;
      *((_DWORD *)this + 19308std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = llroundf(Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_0::operator()(v57, (uint64_t)&v70, (uint64_t)&v67)* v46);
      std::__function::__value_func<float ()(float const*,int)>::~__value_func[abi:ne180100](&v67);
      std::__function::__value_func<float ()(float const*,int)>::~__value_func[abi:ne180100](&v70);
      float v69 = &v67;
      int v70 = (void **)&unk_2709338D8;
      float v71 = (void **)stats::mean;
      float v73 = &v70;
      float v67 = &unk_2709338D8;
      uint64_t v68 = stats::max;
      *((_DWORD *)this + 193085) = llroundf(Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_0::operator()(v56, (uint64_t)&v70, (uint64_t)&v67)* v47);
      std::__function::__value_func<float ()(float const*,int)>::~__value_func[abi:ne180100](&v67);
      std::__function::__value_func<float ()(float const*,int)>::~__value_func[abi:ne180100](&v70);
      float v69 = &v67;
      int v70 = (void **)&unk_2709338D8;
      float v71 = (void **)stats::mean;
      float v73 = &v70;
      float v67 = &unk_2709338D8;
      uint64_t v68 = stats::min;
      *((_DWORD *)this + 193086) = llroundf(Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_0::operator()(v56, (uint64_t)&v70, (uint64_t)&v67)* v47);
      std::__function::__value_func<float ()(float const*,int)>::~__value_func[abi:ne180100](&v67);
      std::__function::__value_func<float ()(float const*,int)>::~__value_func[abi:ne180100](&v70);
      unint64_t v48 = *((void *)this + 77916) - *((void *)this + 77915);
      if (v48)
      {
        float v49 = Scandium::sort_median(*((Scandium **)this + 77915), (const float *)(v48 >> 2));
        Scandium::fill_valid((float *)this + 193050, v50, v49);
      }
      int v51 = (Scandium *)*((void *)this + 77918);
      unint64_t v52 = *((void *)this + 77919) - (void)v51;
      if (v52)
      {
        float v53 = Scandium::sort_median(v51, (const float *)(v52 >> 2));
        Scandium::fill_valid((float *)this + 193051, v54, v53);
      }
      int v70 = (void **)v56;
      std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v70);
      int v70 = (void **)v57;
      std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v70);
      int v70 = (void **)v58;
      std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v70);
      int v70 = (void **)v59;
      std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v70);
      int v70 = (void **)v60;
      std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v70);
      int v70 = (void **)v61;
      std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v70);
      int v70 = (void **)v62;
      std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v70);
      int v70 = (void **)v63;
      std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v70);
      int v70 = (void **)v64;
      std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v70);
      int v70 = (void **)v65;
      std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v70);
      int v70 = (void **)v66;
      std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v70);
    }
  }
}

void sub_25BA566D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,char a36,uint64_t a37,uint64_t a38,char a39)
{
  std::__function::__value_func<float ()(float const*,int)>::~__value_func[abi:ne180100]((void *)(v39 - 192));
  std::__function::__value_func<float ()(float const*,int)>::~__value_func[abi:ne180100]((void *)(v39 - 160));
  *(void *)(v39 - 16std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_processor_t>::reset[abi:ne180100](this, 0) = &a12;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)(v39 - 160));
  *(void *)(v39 - 16std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_processor_t>::reset[abi:ne180100](this, 0) = &a15;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)(v39 - 160));
  *(void *)(v39 - 16std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_processor_t>::reset[abi:ne180100](this, 0) = &a18;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)(v39 - 160));
  *(void *)(v39 - 16std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_processor_t>::reset[abi:ne180100](this, 0) = &a21;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)(v39 - 160));
  *(void *)(v39 - 16std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_processor_t>::reset[abi:ne180100](this, 0) = &a24;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)(v39 - 160));
  *(void *)(v39 - 16std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_processor_t>::reset[abi:ne180100](this, 0) = &a27;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)(v39 - 160));
  *(void *)(v39 - 16std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_processor_t>::reset[abi:ne180100](this, 0) = &a30;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)(v39 - 160));
  *(void *)(v39 - 16std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_processor_t>::reset[abi:ne180100](this, 0) = &a33;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)(v39 - 160));
  *(void *)(v39 - 16std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_processor_t>::reset[abi:ne180100](this, 0) = &a36;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)(v39 - 160));
  *(void *)(v39 - 16std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_processor_t>::reset[abi:ne180100](this, 0) = &a39;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)(v39 - 160));
  *(void *)(v39 - 16std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_processor_t>::reset[abi:ne180100](this, 0) = v39 - 216;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)(v39 - 160));
  _Unwind_Resume(a1);
}

void sub_25BA568C8()
{
  uint64_t v1 = *(void **)(v0 - 160);
  if (v1)
  {
    *(void *)(v0 - 152) = v1;
    operator delete(v1);
  }
  JUMPOUT(0x25BA56878);
}

void Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_1::operator()(uint64_t *a1@<X0>, int a2@<W1>, char a3@<W2>, uint64_t *a4@<X8>)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = 0;
  uint64_t v5 = *a1;
  uint64_t v22 = a1[1];
  if (*a1 == v22) {
    return;
  }
  do
  {
    BOOL v8 = 0;
    uint64_t v9 = 0;
    std::string __p = 0;
    float v24 = 0;
    float v25 = 0;
    do
    {
      int v10 = Scandium::ScandiumPPG::path_idx_to_type[v9];
      if (a3)
      {
        if (v10 == a2) {
          goto LABEL_24;
        }
      }
      else if (v10 != a2)
      {
        goto LABEL_24;
      }
      if (v8 >= v25)
      {
        uint64_t v12 = (char *)__p;
        uint64_t v13 = (v8 - (unsigned char *)__p) >> 2;
        unint64_t v14 = v13 + 1;
        if ((unint64_t)(v13 + 1) >> 62) {
          std::vector<float>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v15 = v25 - (unsigned char *)__p;
        if ((v25 - (unsigned char *)__p) >> 1 > v14) {
          unint64_t v14 = v15 >> 1;
        }
        if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v16 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v16 = v14;
        }
        if (v16)
        {
          uint64_t v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v25, v16);
          uint64_t v12 = (char *)__p;
          BOOL v8 = v24;
        }
        else
        {
          uint64_t v17 = 0;
        }
        float v18 = &v17[4 * v13];
        *(_DWORD *)float v18 = *(_DWORD *)(v5 + 4 * v9);
        uint64_t v11 = v18 + 4;
        while (v8 != v12)
        {
          int v19 = *((_DWORD *)v8 - 1);
          v8 -= 4;
          *((_DWORD *)v18 - 1) = v19;
          v18 -= 4;
        }
        std::string __p = v18;
        float v24 = v11;
        float v25 = &v17[4 * v16];
        if (v12) {
          operator delete(v12);
        }
      }
      else
      {
        *(_DWORD *)BOOL v8 = *(_DWORD *)(v5 + 4 * v9);
        uint64_t v11 = v8 + 4;
      }
      float v24 = v11;
      BOOL v8 = v11;
LABEL_24:
      ++v9;
    }
    while (v9 != 16);
    unint64_t v20 = a4[1];
    if (v20 >= a4[2])
    {
      uint64_t v21 = std::vector<std::vector<float>>::__push_back_slow_path<std::vector<float> const&>(a4, (uint64_t)&__p);
    }
    else
    {
      std::vector<std::vector<float>>::__construct_one_at_end[abi:ne180100]<std::vector<float> const&>((uint64_t)a4, (uint64_t)&__p);
      uint64_t v21 = v20 + 24;
    }
    a4[1] = v21;
    if (__p)
    {
      float v24 = (char *)__p;
      operator delete(__p);
    }
    v5 += 64;
  }
  while (v5 != v22);
}

void sub_25BA56A98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p)
  {
    a11 = (uint64_t)__p;
    operator delete(__p);
  }
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  _Unwind_Resume(a1);
}

float Scandium::ScandiumPPG::scandium_spo2_processor_t::calc_dl_core_analytics(void)::$_0::operator()(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  std::string __p = 0;
  float v25 = 0;
  float v26 = 0;
  uint64_t v4 = *a1;
  uint64_t v5 = a1[1];
  if (*a1 == v5)
  {
    unint64_t v20 = 0;
    uint64_t v19 = 0;
  }
  else
  {
    do
    {
      int v27 = 0;
      float v28 = 0;
      uint64_t v29 = 0;
      std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v27, *(const void **)v4, *(void *)(v4 + 8), (uint64_t)(*(void *)(v4 + 8) - *(void *)v4) >> 2);
      std::function<float ()(float const*,int)>::operator()(a2, (uint64_t)v27, (unint64_t)(v28 - (unsigned char *)v27) >> 2);
      int v8 = v7;
      uint64_t v9 = v25;
      if (v25 >= v26)
      {
        uint64_t v11 = __p;
        uint64_t v12 = (v25 - __p) >> 2;
        unint64_t v13 = v12 + 1;
        if ((unint64_t)(v12 + 1) >> 62) {
          std::vector<float>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v14 = v26 - __p;
        if ((v26 - __p) >> 1 > v13) {
          unint64_t v13 = v14 >> 1;
        }
        if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v15 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v15 = v13;
        }
        if (v15)
        {
          unint64_t v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v26, v15);
          uint64_t v11 = __p;
          uint64_t v9 = v25;
        }
        else
        {
          unint64_t v16 = 0;
        }
        uint64_t v17 = &v16[4 * v12];
        *(_DWORD *)uint64_t v17 = v8;
        int v10 = v17 + 4;
        while (v9 != v11)
        {
          int v18 = *((_DWORD *)v9 - 1);
          v9 -= 4;
          *((_DWORD *)v17 - 1) = v18;
          v17 -= 4;
        }
        std::string __p = v17;
        float v26 = &v16[4 * v15];
        if (v11) {
          operator delete(v11);
        }
      }
      else
      {
        *(_DWORD *)float v25 = v7;
        int v10 = v25 + 4;
      }
      float v25 = v10;
      if (v27)
      {
        float v28 = v27;
        operator delete(v27);
      }
      v4 += 24;
    }
    while (v4 != v5);
    uint64_t v19 = (uint64_t)__p;
    unint64_t v20 = v10;
  }
  std::function<float ()(float const*,int)>::operator()(a3, v19, (unint64_t)&v20[-v19] >> 2);
  float v22 = v21;
  if (__p) {
    operator delete(__p);
  }
  return v22;
}

void sub_25BA56C68(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, void *a12, uint64_t a13)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

float Scandium::ScandiumPPG::get_median_of_path_type<unsigned char>(uint64_t *a1, __int16 a2, float a3)
{
  std::string __p = 0;
  float v34 = 0;
  int v35 = 0;
  if ((a2 & 0xFF00) != 0)
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
    int v6 = a2;
    do
    {
      uint64_t v7 = 0;
      uint64_t v8 = 4 * v5;
      do
      {
        if (Scandium::ScandiumPPG::path_array[4 * v5 + v7] == v6)
        {
          if (a1[1] - *a1 <= (unint64_t)(v7 + v8)) {
            std::vector<float>::__throw_out_of_range[abi:ne180100]();
          }
          LOBYTE(a3) = *(unsigned char *)(*a1 + v7 + v8);
          float v9 = (float)LODWORD(a3);
          if (v4 >= (float *)v35)
          {
            uint64_t v11 = (float *)__p;
            uint64_t v12 = ((char *)v4 - (char *)__p) >> 2;
            unint64_t v13 = v12 + 1;
            if ((unint64_t)(v12 + 1) >> 62) {
              std::vector<float>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v14 = v35 - (char *)__p;
            if ((v35 - (char *)__p) >> 1 > v13) {
              unint64_t v13 = v14 >> 1;
            }
            if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFFCLL) {
              unint64_t v15 = 0x3FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v15 = v13;
            }
            if (v15)
            {
              unint64_t v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v35, v15);
              uint64_t v11 = (float *)__p;
              uint64_t v4 = v34;
            }
            else
            {
              unint64_t v16 = 0;
            }
            uint64_t v17 = (float *)&v16[4 * v12];
            float *v17 = v9;
            int v10 = v17 + 1;
            while (v4 != v11)
            {
              float v18 = *--v4;
              a3 = v18;
              *--uint64_t v17 = v18;
            }
            std::string __p = (Scandium *)v17;
            int v35 = &v16[4 * v15];
            if (v11) {
              operator delete(v11);
            }
          }
          else
          {
            *uint64_t v4 = v9;
            int v10 = v4 + 1;
          }
          float v34 = v10;
          uint64_t v4 = v10;
        }
        ++v7;
      }
      while (v7 != 4);
      ++v5;
    }
    while (v5 != 4);
  }
  else
  {
    uint64_t v19 = *a1;
    if (a1[1] == *a1)
    {
      uint64_t v4 = 0;
    }
    else
    {
      unint64_t v20 = 0;
      unint64_t v21 = 0;
      do
      {
        LOBYTE(a3) = *(unsigned char *)(v19 + v21);
        float v22 = (float)LODWORD(a3);
        if (v20 >= (float *)v35)
        {
          float v23 = (float *)__p;
          uint64_t v24 = ((char *)v20 - (char *)__p) >> 2;
          unint64_t v25 = v24 + 1;
          if ((unint64_t)(v24 + 1) >> 62) {
            std::vector<float>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v26 = v35 - (char *)__p;
          if ((v35 - (char *)__p) >> 1 > v25) {
            unint64_t v25 = v26 >> 1;
          }
          if ((unint64_t)v26 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v27 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v27 = v25;
          }
          if (v27)
          {
            float v28 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v35, v27);
            float v23 = (float *)__p;
            unint64_t v20 = v34;
          }
          else
          {
            float v28 = 0;
          }
          uint64_t v29 = (float *)&v28[4 * v24];
          *uint64_t v29 = v22;
          uint64_t v4 = v29 + 1;
          while (v20 != v23)
          {
            float v30 = *--v20;
            a3 = v30;
            *--uint64_t v29 = v30;
          }
          std::string __p = (Scandium *)v29;
          int v35 = &v28[4 * v27];
          if (v23) {
            operator delete(v23);
          }
        }
        else
        {
          *unint64_t v20 = v22;
          uint64_t v4 = v20 + 1;
        }
        float v34 = v4;
        ++v21;
        uint64_t v19 = *a1;
        unint64_t v20 = v4;
      }
      while (a1[1] - *a1 > v21);
    }
  }
  float v31 = Scandium::sort_median(__p, (const float *)((unint64_t)((char *)v4 - (char *)__p) >> 2));
  if (__p) {
    operator delete(__p);
  }
  return v31;
}

void sub_25BA56F4C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

float Scandium::ScandiumPPG::get_median_of_path_type<float>(uint64_t *a1, __int16 a2)
{
  std::string __p = 0;
  uint64_t v33 = 0;
  float v34 = 0;
  if ((a2 & 0xFF00) != 0)
  {
    uint64_t v3 = 0;
    uint64_t v4 = 0;
    int v5 = a2;
    do
    {
      uint64_t v6 = 0;
      uint64_t v7 = 4 * v4;
      do
      {
        if (Scandium::ScandiumPPG::path_array[4 * v4 + v6] == v5)
        {
          if (v6 + v7 >= (unint64_t)((a1[1] - *a1) >> 2)) {
            std::vector<float>::__throw_out_of_range[abi:ne180100]();
          }
          int v8 = *(_DWORD *)(*a1 + 4 * (v6 + v7));
          if (v3 >= v34)
          {
            int v10 = __p;
            uint64_t v11 = (v3 - (char *)__p) >> 2;
            unint64_t v12 = v11 + 1;
            if ((unint64_t)(v11 + 1) >> 62) {
              std::vector<float>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v13 = v34 - (char *)__p;
            if ((v34 - (char *)__p) >> 1 > v12) {
              unint64_t v12 = v13 >> 1;
            }
            if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFFCLL) {
              unint64_t v14 = 0x3FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v14 = v12;
            }
            if (v14)
            {
              unint64_t v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v34, v14);
              int v10 = __p;
              uint64_t v3 = v33;
            }
            else
            {
              unint64_t v15 = 0;
            }
            unint64_t v16 = (Scandium *)&v15[4 * v11];
            *(_DWORD *)unint64_t v16 = v8;
            float v9 = (char *)v16 + 4;
            while (v3 != (char *)v10)
            {
              int v17 = *((_DWORD *)v3 - 1);
              v3 -= 4;
              *((_DWORD *)v16 - 1) = v17;
              unint64_t v16 = (Scandium *)((char *)v16 - 4);
            }
            std::string __p = v16;
            float v34 = &v15[4 * v14];
            if (v10) {
              operator delete(v10);
            }
          }
          else
          {
            *(_DWORD *)uint64_t v3 = v8;
            float v9 = v3 + 4;
          }
          uint64_t v33 = v9;
          uint64_t v3 = v9;
        }
        ++v6;
      }
      while (v6 != 4);
      ++v4;
    }
    while (v4 != 4);
  }
  else
  {
    uint64_t v18 = *a1;
    if (a1[1] == *a1)
    {
      uint64_t v3 = 0;
    }
    else
    {
      uint64_t v19 = 0;
      unint64_t v20 = 0;
      do
      {
        int v21 = *(_DWORD *)(v18 + 4 * v20);
        if (v19 >= (Scandium *)v34)
        {
          float v22 = __p;
          uint64_t v23 = (v19 - __p) >> 2;
          unint64_t v24 = v23 + 1;
          if ((unint64_t)(v23 + 1) >> 62) {
            std::vector<float>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v25 = v34 - (char *)__p;
          if ((v34 - (char *)__p) >> 1 > v24) {
            unint64_t v24 = v25 >> 1;
          }
          if ((unint64_t)v25 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v26 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v26 = v24;
          }
          if (v26)
          {
            unint64_t v27 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v34, v26);
            float v22 = __p;
            uint64_t v19 = (Scandium *)v33;
          }
          else
          {
            unint64_t v27 = 0;
          }
          float v28 = &v27[4 * v23];
          *(_DWORD *)float v28 = v21;
          uint64_t v3 = v28 + 4;
          while (v19 != v22)
          {
            int v29 = *((_DWORD *)v19 - 1);
            uint64_t v19 = (Scandium *)((char *)v19 - 4);
            *((_DWORD *)v28 - 1) = v29;
            v28 -= 4;
          }
          std::string __p = (Scandium *)v28;
          float v34 = &v27[4 * v26];
          if (v22) {
            operator delete(v22);
          }
        }
        else
        {
          *(_DWORD *)uint64_t v19 = v21;
          uint64_t v3 = (char *)v19 + 4;
        }
        uint64_t v33 = v3;
        ++v20;
        uint64_t v18 = *a1;
        uint64_t v19 = (Scandium *)v3;
      }
      while (v20 < (a1[1] - *a1) >> 2);
    }
  }
  float v30 = Scandium::sort_median(__p, (const float *)((unint64_t)(v3 - (char *)__p) >> 2));
  if (__p) {
    operator delete(__p);
  }
  return v30;
}

void sub_25BA57218(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void Scandium::ScandiumPPG::scandium_spo2_processor_t::log_core_analytics(Scandium::ScandiumPPG::scandium_spo2_processor_t *this)
{
  uint64_t v1 = off_2709333F0(this);
  uint64_t v361 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)(v1 + 772768);
  if (*(void *)(v1 + 772768))
  {
    uint64_t v3 = v1;
    std::string::basic_string[abi:ne180100]<0>(__p, "coreanalytics");
    std::string::basic_string[abi:ne180100]<0>(v8, "rawSpO2");
    int v9 = *(_DWORD *)(v3 + 772072);
    int v10 = 3;
    std::string::basic_string[abi:ne180100]<0>(v11, "rawSpO2_BGWin0");
    int v12 = *(_DWORD *)(v3 + 772076);
    int v13 = 3;
    std::string::basic_string[abi:ne180100]<0>(v14, "rawSpO2_BGWin1");
    int v15 = *(_DWORD *)(v3 + 772080);
    int v16 = 3;
    std::string::basic_string[abi:ne180100]<0>(v17, "rawSpO2_BGWin2");
    int v18 = *(_DWORD *)(v3 + 772084);
    int v19 = 3;
    std::string::basic_string[abi:ne180100]<0>(v20, "rawSpO2NoConfGate");
    int v21 = *(_DWORD *)(v3 + 772088);
    int v22 = 3;
    std::string::basic_string[abi:ne180100]<0>(v23, "rawSpO2NoConfGate_BGWin0");
    int v24 = *(_DWORD *)(v3 + 772092);
    int v25 = 3;
    std::string::basic_string[abi:ne180100]<0>(v26, "rawSpO2NoConfGate_BGWin1");
    int v27 = *(_DWORD *)(v3 + 772096);
    int v28 = 3;
    std::string::basic_string[abi:ne180100]<0>(v29, "rawSpO2NoConfGate_BGWin2");
    int v30 = *(_DWORD *)(v3 + 772100);
    int v31 = 3;
    std::string::basic_string[abi:ne180100]<0>(v32, "numChannelsPassingGIRPIRMax");
    int v33 = *(_DWORD *)(v3 + 772104);
    int v34 = 1;
    std::string::basic_string[abi:ne180100]<0>(v35, "numChannelsPassingGIRPIRMin");
    int v36 = *(_DWORD *)(v3 + 772108);
    int v37 = 1;
    std::string::basic_string[abi:ne180100]<0>(v38, "numValidChannelsMax");
    int v39 = *(_DWORD *)(v3 + 772112);
    int v40 = 1;
    std::string::basic_string[abi:ne180100]<0>(v41, "numValidChannelsMin");
    int v42 = *(_DWORD *)(v3 + 772116);
    int v43 = 1;
    std::string::basic_string[abi:ne180100]<0>(v44, "agc_opc_duration_ms");
    int v45 = *(unsigned __int16 *)(v3 + 772120);
    int v46 = 1;
    std::string::basic_string[abi:ne180100]<0>(v47, "agc_opc_green_fs_enum");
    int v48 = *(unsigned __int8 *)(v3 + 772122);
    int v49 = 1;
    std::string::basic_string[abi:ne180100]<0>(v50, "agc_opc_num_retries");
    int v51 = *(unsigned __int8 *)(v3 + 772123);
    int v52 = 1;
    std::string::basic_string[abi:ne180100]<0>(v53, "agc_opc_num_converged");
    int v54 = *(unsigned __int8 *)(v3 + 772124);
    int v55 = 1;
    std::string::basic_string[abi:ne180100]<0>(v56, "numSuccessfulWindows");
    int v57 = *(_DWORD *)(v3 + 772128);
    int v58 = 1;
    std::string::basic_string[abi:ne180100]<0>(v59, "sessionLen");
    int v60 = *(_DWORD *)(v3 + 772132);
    int v61 = 1;
    std::string::basic_string[abi:ne180100]<0>(v62, "bailoutIndex");
    int v63 = *(_DWORD *)(v3 + 772136);
    int v64 = 1;
    std::string::basic_string[abi:ne180100]<0>(v65, "numFailedWinAggGIRPIR");
    int v66 = *(_DWORD *)(v3 + 772140);
    int v67 = 1;
    std::string::basic_string[abi:ne180100]<0>(v68, "numFailedWinStd");
    int v69 = *(_DWORD *)(v3 + 772144);
    int v70 = 1;
    std::string::basic_string[abi:ne180100]<0>(v71, "min_mav");
    int v72 = *(_DWORD *)(v3 + 772148);
    int v73 = 3;
    std::string::basic_string[abi:ne180100]<0>(v74, "max_mav");
    int v75 = *(_DWORD *)(v3 + 772152);
    int v76 = 3;
    std::string::basic_string[abi:ne180100]<0>(v77, "median_mav");
    int v78 = *(_DWORD *)(v3 + 772156);
    int v79 = 3;
    std::string::basic_string[abi:ne180100]<0>(v80, "ir_wavelength");
    int v81 = *(_DWORD *)(v3 + 772160);
    int v82 = 3;
    std::string::basic_string[abi:ne180100]<0>(v83, "red_wavelength");
    int v84 = *(_DWORD *)(v3 + 772164);
    int v85 = 3;
    std::string::basic_string[abi:ne180100]<0>(v86, "mean_accelX");
    int v87 = *(_DWORD *)(v3 + 772168);
    int v88 = 3;
    std::string::basic_string[abi:ne180100]<0>(v89, "mean_accelY");
    int v90 = *(_DWORD *)(v3 + 772172);
    int v91 = 3;
    std::string::basic_string[abi:ne180100]<0>(v92, "mean_accelZ");
    int v93 = *(_DWORD *)(v3 + 772176);
    int v94 = 3;
    std::string::basic_string[abi:ne180100]<0>(v95, "mean_pi_ir_long");
    int v96 = *(_DWORD *)(v3 + 772180);
    int v97 = 3;
    std::string::basic_string[abi:ne180100]<0>(v98, "mean_pi_ir_short");
    int v99 = *(_DWORD *)(v3 + 772184);
    int v100 = 3;
    std::string::basic_string[abi:ne180100]<0>(v101, "mean_pi_red_long");
    int v102 = *(_DWORD *)(v3 + 772188);
    int v103 = 3;
    std::string::basic_string[abi:ne180100]<0>(v104, "mean_pi_red_short");
    int v105 = *(_DWORD *)(v3 + 772192);
    int v106 = 3;
    std::string::basic_string[abi:ne180100]<0>(v107, "mean_pi_green");
    int v108 = *(_DWORD *)(v3 + 772196);
    int v109 = 3;
    std::string::basic_string[abi:ne180100]<0>(v110, "medianGIRPIRShort");
    int v111 = *(_DWORD *)(v3 + 772280);
    int v112 = 3;
    std::string::basic_string[abi:ne180100]<0>(v113, "medianMeasurementConfidence");
    int v114 = *(_DWORD *)(v3 + 772200);
    int v115 = 3;
    std::string::basic_string[abi:ne180100]<0>(v116, "medianWeightedStdDev");
    int v117 = *(_DWORD *)(v3 + 772204);
    int v118 = 3;
    std::string::basic_string[abi:ne180100]<0>(v119, "dropped_sessWin_CPMSAll_total_len");
    int v120 = *(unsigned __int16 *)(v3 + 772208);
    int v121 = 1;
    std::string::basic_string[abi:ne180100]<0>(v122, "dropped_sessWin_CPMSAll_max_seg_len");
    int v123 = *(unsigned __int16 *)(v3 + 772210);
    int v124 = 1;
    std::string::basic_string[abi:ne180100]<0>(v125, "dropped_sessWin_Saturation_total_len");
    int v126 = *(unsigned __int16 *)(v3 + 772212);
    int v127 = 1;
    std::string::basic_string[abi:ne180100]<0>(v128, "dropped_sessWin_Saturation_max_seg_len");
    int v129 = *(unsigned __int16 *)(v3 + 772214);
    int v130 = 1;
    std::string::basic_string[abi:ne180100]<0>(v131, "dropped_BGWin0_CPMSAll_total_len");
    int v132 = *(unsigned __int16 *)(v3 + 772216);
    int v133 = 1;
    std::string::basic_string[abi:ne180100]<0>(v134, "dropped_BGWin0_Saturation_total_len");
    int v135 = *(unsigned __int16 *)(v3 + 772218);
    int v136 = 1;
    std::string::basic_string[abi:ne180100]<0>(v137, "dropped_BGWin1_CPMSAll_total_len");
    int v138 = *(unsigned __int16 *)(v3 + 772220);
    int v139 = 1;
    std::string::basic_string[abi:ne180100]<0>(v140, "dropped_BGWin1_Saturation_total_len");
    int v141 = *(unsigned __int16 *)(v3 + 772222);
    int v142 = 1;
    std::string::basic_string[abi:ne180100]<0>(v143, "dropped_BGWin2_CPMSAll_total_len");
    int v144 = *(unsigned __int16 *)(v3 + 772224);
    int v145 = 1;
    std::string::basic_string[abi:ne180100]<0>(v146, "dropped_BGWin2_Saturation_total_len");
    int v147 = *(unsigned __int16 *)(v3 + 772226);
    int v148 = 1;
    std::string::basic_string[abi:ne180100]<0>(v149, "dropped_sessWin_TX_DOWNAll_total_len");
    int v150 = *(unsigned __int16 *)(v3 + 772228);
    int v151 = 1;
    std::string::basic_string[abi:ne180100]<0>(v152, "minChannelConfidenceShortIR");
    int v153 = *(_DWORD *)(v3 + 772232);
    int v154 = 3;
    std::string::basic_string[abi:ne180100]<0>(v155, "minChannelConfidenceShortRed");
    int v156 = *(_DWORD *)(v3 + 772236);
    int v157 = 3;
    std::string::basic_string[abi:ne180100]<0>(v158, "minChannelConfidenceLong");
    int v159 = *(_DWORD *)(v3 + 772240);
    int v160 = 3;
    std::string::basic_string[abi:ne180100]<0>(v161, "medianChannelConfidenceShortIR");
    int v162 = *(_DWORD *)(v3 + 772244);
    int v163 = 3;
    std::string::basic_string[abi:ne180100]<0>(v164, "medianChannelConfidenceShortRed");
    int v165 = *(_DWORD *)(v3 + 772248);
    int v166 = 3;
    std::string::basic_string[abi:ne180100]<0>(v167, "medianChannelConfidenceLong");
    int v168 = *(_DWORD *)(v3 + 772252);
    int v169 = 3;
    std::string::basic_string[abi:ne180100]<0>(v170, "maxChannelConfidenceShortIR");
    int v171 = *(_DWORD *)(v3 + 772256);
    int v172 = 3;
    std::string::basic_string[abi:ne180100]<0>(v173, "maxChannelConfidenceShortRed");
    int v174 = *(_DWORD *)(v3 + 772260);
    int v175 = 3;
    std::string::basic_string[abi:ne180100]<0>(v176, "maxChannelConfidenceLong");
    int v177 = *(_DWORD *)(v3 + 772264);
    int v178 = 3;
    std::string::basic_string[abi:ne180100]<0>(v179, "meanSpO2ShortIR");
    int v180 = *(_DWORD *)(v3 + 772268);
    int v181 = 3;
    std::string::basic_string[abi:ne180100]<0>(v182, "meanSpO2ShortRed");
    int v183 = *(_DWORD *)(v3 + 772272);
    int v184 = 3;
    std::string::basic_string[abi:ne180100]<0>(v185, "meanSpO2Long");
    int v186 = *(_DWORD *)(v3 + 772276);
    int v187 = 3;
    std::string::basic_string[abi:ne180100]<0>(v188, "numHighConfidenceChannelsMax");
    int v189 = *(_DWORD *)(v3 + 772284);
    int v190 = 1;
    std::string::basic_string[abi:ne180100]<0>(v191, "numHighConfidenceChannelsMin");
    int v192 = *(_DWORD *)(v3 + 772288);
    int v193 = 1;
    std::string::basic_string[abi:ne180100]<0>(v194, "numHighConfidenceChannelsMaxShortIR");
    int v195 = *(_DWORD *)(v3 + 772292);
    int v196 = 1;
    std::string::basic_string[abi:ne180100]<0>(v197, "numHighConfidenceChannelsMinShortIR");
    int v198 = *(_DWORD *)(v3 + 772296);
    int v199 = 1;
    std::string::basic_string[abi:ne180100]<0>(v200, "numHighConfidenceChannelsMaxShortRed");
    int v201 = *(_DWORD *)(v3 + 772300);
    int v202 = 1;
    std::string::basic_string[abi:ne180100]<0>(v203, "numHighConfidenceChannelsMinShortRed");
    int v204 = *(_DWORD *)(v3 + 772304);
    int v205 = 1;
    std::string::basic_string[abi:ne180100]<0>(v206, "numHighConfidenceChannelsMaxLong");
    int v207 = *(_DWORD *)(v3 + 772308);
    int v208 = 1;
    std::string::basic_string[abi:ne180100]<0>(v209, "numHighConfidenceChannelsMinLong");
    int v210 = *(_DWORD *)(v3 + 772312);
    int v211 = 1;
    std::string::basic_string[abi:ne180100]<0>(v212, "numChannelsPassingSNRMax");
    int v213 = *(_DWORD *)(v3 + 772316);
    int v214 = 1;
    std::string::basic_string[abi:ne180100]<0>(v215, "numChannelsPassingSNRMin");
    int v216 = *(_DWORD *)(v3 + 772320);
    int v217 = 1;
    std::string::basic_string[abi:ne180100]<0>(v218, "numChannelsPassingSNRMaxShortIR");
    int v219 = *(_DWORD *)(v3 + 772324);
    int v220 = 1;
    std::string::basic_string[abi:ne180100]<0>(v221, "numChannelsPassingSNRMinShortIR");
    int v222 = *(_DWORD *)(v3 + 772328);
    int v223 = 1;
    std::string::basic_string[abi:ne180100]<0>(v224, "numChannelsPassingSNRMaxShortRed");
    int v225 = *(_DWORD *)(v3 + 772332);
    int v226 = 1;
    std::string::basic_string[abi:ne180100]<0>(v227, "numChannelsPassingSNRMinShortRed");
    int v228 = *(_DWORD *)(v3 + 772336);
    int v229 = 1;
    std::string::basic_string[abi:ne180100]<0>(v230, "numChannelsPassingSNRMaxLong");
    int v231 = *(_DWORD *)(v3 + 772340);
    int v232 = 1;
    std::string::basic_string[abi:ne180100]<0>(v233, "numChannelsPassingSNRMinLong");
    int v234 = *(_DWORD *)(v3 + 772344);
    int v235 = 1;
    std::string::basic_string[abi:ne180100]<0>(v236, "ppg_ac_pp_ir_long");
    v3 += 772348;
    int v237 = *(_DWORD *)v3;
    int v238 = 3;
    std::string::basic_string[abi:ne180100]<0>(v239, "ppg_ac_pp_ir_short_ir");
    int v240 = *(_DWORD *)(v3 + 4);
    int v241 = 3;
    std::string::basic_string[abi:ne180100]<0>(v242, "ppg_ac_pp_ir_short_red");
    int v243 = *(_DWORD *)(v3 + 8);
    int v244 = 3;
    std::string::basic_string[abi:ne180100]<0>(v245, "ppg_ac_std_ir_long");
    int v246 = *(_DWORD *)(v3 + 32);
    int v247 = 3;
    std::string::basic_string[abi:ne180100]<0>(v248, "ppg_ac_std_ir_short_ir");
    int v249 = *(_DWORD *)(v3 + 36);
    int v250 = 3;
    std::string::basic_string[abi:ne180100]<0>(v251, "ppg_ac_std_ir_short_red");
    int v252 = *(_DWORD *)(v3 + 40);
    int v253 = 3;
    std::string::basic_string[abi:ne180100]<0>(v254, "ppg_mean_ir_long");
    int v255 = *(_DWORD *)(v3 + 64);
    int v256 = 3;
    std::string::basic_string[abi:ne180100]<0>(v257, "ppg_mean_ir_short_ir");
    int v258 = *(_DWORD *)(v3 + 68);
    int v259 = 3;
    std::string::basic_string[abi:ne180100]<0>(v260, "ppg_mean_ir_short_red");
    int v261 = *(_DWORD *)(v3 + 72);
    int v262 = 3;
    std::string::basic_string[abi:ne180100]<0>(v263, "ppg_ac_pp_red_long");
    int v264 = *(_DWORD *)(v3 + 12);
    int v265 = 3;
    std::string::basic_string[abi:ne180100]<0>(v266, "ppg_ac_pp_red_short_ir");
    int v267 = *(_DWORD *)(v3 + 16);
    int v268 = 3;
    std::string::basic_string[abi:ne180100]<0>(v269, "ppg_ac_pp_red_short_red");
    int v270 = *(_DWORD *)(v3 + 20);
    int v271 = 3;
    std::string::basic_string[abi:ne180100]<0>(v272, "ppg_ac_std_red_long");
    int v273 = *(_DWORD *)(v3 + 44);
    int v274 = 3;
    std::string::basic_string[abi:ne180100]<0>(v275, "ppg_ac_std_red_short_ir");
    int v276 = *(_DWORD *)(v3 + 48);
    int v277 = 3;
    std::string::basic_string[abi:ne180100]<0>(v278, "ppg_ac_std_red_short_red");
    int v279 = *(_DWORD *)(v3 + 52);
    int v280 = 3;
    std::string::basic_string[abi:ne180100]<0>(v281, "ppg_mean_red_long");
    int v282 = *(_DWORD *)(v3 + 76);
    int v283 = 3;
    std::string::basic_string[abi:ne180100]<0>(v284, "ppg_mean_red_short_ir");
    int v285 = *(_DWORD *)(v3 + 80);
    int v286 = 3;
    std::string::basic_string[abi:ne180100]<0>(v287, "ppg_mean_red_short_red");
    int v288 = *(_DWORD *)(v3 + 84);
    int v289 = 3;
    std::string::basic_string[abi:ne180100]<0>(v290, "ppg_ac_pp_green");
    int v291 = *(_DWORD *)(v3 + 24);
    int v292 = 3;
    std::string::basic_string[abi:ne180100]<0>(v293, "ppg_ac_std_green");
    int v294 = *(_DWORD *)(v3 + 56);
    int v295 = 3;
    std::string::basic_string[abi:ne180100]<0>(v296, "ppg_mean_green");
    int v297 = *(_DWORD *)(v3 + 88);
    int v298 = 3;
    std::string::basic_string[abi:ne180100]<0>(v299, "ppg_ac_pp_blank");
    int v300 = *(_DWORD *)(v3 + 28);
    int v301 = 3;
    std::string::basic_string[abi:ne180100]<0>(v302, "ppg_ac_std_blank");
    int v303 = *(_DWORD *)(v3 + 60);
    int v304 = 3;
    std::string::basic_string[abi:ne180100]<0>(v305, "ppg_mean_blank");
    int v306 = *(_DWORD *)(v3 + 92);
    int v307 = 3;
    std::string::basic_string[abi:ne180100]<0>(v308, "tia_gain_ir_long");
    int v309 = *(_DWORD *)(v3 + 96);
    int v310 = 3;
    std::string::basic_string[abi:ne180100]<0>(v311, "tia_gain_ir_short_ir");
    int v312 = *(_DWORD *)(v3 + 100);
    int v313 = 3;
    std::string::basic_string[abi:ne180100]<0>(v314, "tia_gain_ir_short_red");
    int v315 = *(_DWORD *)(v3 + 104);
    int v316 = 3;
    std::string::basic_string[abi:ne180100]<0>(v317, "tia_gain_red_long");
    int v318 = *(_DWORD *)(v3 + 108);
    int v319 = 3;
    std::string::basic_string[abi:ne180100]<0>(v320, "tia_gain_red_short_ir");
    int v321 = *(_DWORD *)(v3 + 112);
    int v322 = 3;
    std::string::basic_string[abi:ne180100]<0>(v323, "tia_gain_red_short_red");
    int v324 = *(_DWORD *)(v3 + 116);
    int v325 = 3;
    std::string::basic_string[abi:ne180100]<0>(v326, "tia_gain_green");
    int v327 = *(_DWORD *)(v3 + 120);
    int v328 = 3;
    std::string::basic_string[abi:ne180100]<0>(v329, "tia_gain_blank");
    int v330 = *(_DWORD *)(v3 + 124);
    int v331 = 3;
    std::string::basic_string[abi:ne180100]<0>(v332, "iled_ir");
    int v333 = *(_DWORD *)(v3 + 128);
    int v334 = 3;
    std::string::basic_string[abi:ne180100]<0>(v335, "iled_red");
    int v336 = *(_DWORD *)(v3 + 132);
    int v337 = 3;
    std::string::basic_string[abi:ne180100]<0>(v338, "iled_green");
    int v339 = *(_DWORD *)(v3 + 136);
    int v340 = 3;
    std::string::basic_string[abi:ne180100]<0>(v341, "min_mav_1s");
    int v342 = *(_DWORD *)(v3 + 140);
    int v343 = 3;
    std::string::basic_string[abi:ne180100]<0>(v344, "max_mav_1s");
    int v345 = *(_DWORD *)(v3 + 144);
    int v346 = 3;
    std::string::basic_string[abi:ne180100]<0>(v347, "mean_mav_1s");
    int v348 = *(_DWORD *)(v3 + 148);
    int v349 = 3;
    std::string::basic_string[abi:ne180100]<0>(v350, "median_mav_1s");
    int v351 = *(_DWORD *)(v3 + 152);
    int v352 = 3;
    std::string::basic_string[abi:ne180100]<0>(v353, "std_mav_1s");
    int v354 = *(_DWORD *)(v3 + 156);
    int v355 = 3;
    std::string::basic_string[abi:ne180100]<0>(v356, "hfw");
    int v357 = *(unsigned __int8 *)(v3 + 160);
    int v358 = 1;
    std::string::basic_string[abi:ne180100]<0>(v359, "win_len");
    v360[0] = *(unsigned __int16 *)(v3 + 162);
    v360[8] = 1;
    std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::unordered_map((uint64_t)v5, (unsigned __int8 *)v8, 118);
    if (!*v2) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    (*(void (**)(void, void **, unsigned char *))(*(void *)*v2 + 48))(*v2, __p, v5);
    std::__hash_table<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>>>::~__hash_table((uint64_t)v5);
    for (unint64_t i = 0; i != -8496; i -= 72)
    {
      std::__variant_detail::__dtor<std::__variant_detail::__traits<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v360[i / 4]);
      if (SHIBYTE(v359[i / 8 + 2]) < 0) {
        operator delete((void *)v359[i / 8]);
      }
    }
    if (v7 < 0) {
      operator delete(__p[0]);
    }
  }
}

void sub_25BA58468(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,char a21)
{
  int v22 = &STACK[0x2130];
  uint64_t v23 = -8496;
  do
  {
    int v22 = (unint64_t *)(std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::~pair((uint64_t)v22)
                             - 72);
    v23 += 72;
  }
  while (v23);
  if (a20 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

uint64_t std::function<void ()(Scandium::ScandiumPPG::SpO2Result)>::operator()(uint64_t a1, float a2, float a3)
{
  *(float *)int v5 = a2;
  *(float *)&v5[1] = a3;
  uint64_t v3 = *(void *)(a1 + 24);
  if (!v3) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  return (*(uint64_t (**)(uint64_t, _DWORD *))(*(void *)v3 + 48))(v3, v5);
}

void Scandium::ScandiumPPG::scandium_spo2_processor_t::motion_status_handler_proxy(Scandium::ScandiumPPG::scandium_spo2_processor_t *this, int a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v4 = (char *)this + 772544;
  log = Scandium::algs_get_log(this);
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = *(_DWORD *)v4;
    v7[0] = 67109376;
    v7[1] = v6;
    __int16 v8 = 1024;
    int v9 = a2;
    _os_log_impl(&dword_25BA34000, log, OS_LOG_TYPE_DEFAULT, "scandium motion handler pkt %d: %d", (uint8_t *)v7, 0xEu);
  }
  if (*((void *)v4 + 20)) {
    std::function<void ()(BOOL)>::operator()((uint64_t)this + 772680, a2);
  }
}

void Scandium::ScandiumPPG::scandium_spo2_processor_t::posture_status_handler_proxy(Scandium::ScandiumPPG::scandium_spo2_processor_t *this, int a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v4 = (char *)this + 772544;
  log = Scandium::algs_get_log(this);
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = *(_DWORD *)v4;
    v7[0] = 67109376;
    v7[1] = v6;
    __int16 v8 = 1024;
    int v9 = a2;
    _os_log_impl(&dword_25BA34000, log, OS_LOG_TYPE_DEFAULT, "scandium posture handler pkt %d: %d", (uint8_t *)v7, 0xEu);
  }
  if (*((void *)v4 + 24)) {
    std::function<void ()(BOOL)>::operator()((uint64_t)this + 772712, a2);
  }
}

uint64_t std::__variant_detail::__visitation::__base::__dispatcher<0ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<overloaded<Scandium::ScandiumPPG::scandium_spo2_monitor_t::scandium_spo2_monitor_t(std::string const&,std::variant<Scandium::sc_sess_start_pkt_v3_t,Scandium::sc_sess_start_pkt_v4_t> const&,std::function<void ()(Scandium::ScandiumPPG::SpO2Result)>,std::function<void ()(Scandium::AbortReason)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL)::$_0,Scandium::ScandiumPPG::scandium_spo2_monitor_t::(std::string const&,std::variant<Scandium::sc_sess_start_pkt_v3_t,Scandium::sc_sess_start_pkt_v4_t> const&,std::function<void ()(Scandium::ScandiumPPG::SpO2Result)>,std::function<void ()(Scandium::AbortReason)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL)::$_1>> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,Scandium::sc_sess_start_pkt_v3_t,Scandium::sc_sess_start_pkt_v4_t> const&>(Scandium *a1)
{
  log = Scandium::algs_get_log(a1);
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_25BA34000, log, OS_LOG_TYPE_DEFAULT, "Scandium Algs using legacy packets.", v3, 2u);
  }
  return 1;
}

uint64_t std::__variant_detail::__visitation::__base::__dispatcher<1ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<overloaded<Scandium::ScandiumPPG::scandium_spo2_monitor_t::scandium_spo2_monitor_t(std::string const&,std::variant<Scandium::sc_sess_start_pkt_v3_t,Scandium::sc_sess_start_pkt_v4_t> const&,std::function<void ()(Scandium::ScandiumPPG::SpO2Result)>,std::function<void ()(Scandium::AbortReason)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL)::$_0,Scandium::ScandiumPPG::scandium_spo2_monitor_t::(std::string const&,std::variant<Scandium::sc_sess_start_pkt_v3_t,Scandium::sc_sess_start_pkt_v4_t> const&,std::function<void ()(Scandium::ScandiumPPG::SpO2Result)>,std::function<void ()(Scandium::AbortReason)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL)::$_1>> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,Scandium::sc_sess_start_pkt_v3_t,Scandium::sc_sess_start_pkt_v4_t> const&>(Scandium *a1)
{
  log = Scandium::algs_get_log(a1);
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_25BA34000, log, OS_LOG_TYPE_DEFAULT, "Scandium Algs using current packets.", v3, 2u);
  }
  return 0;
}

void Scandium::ScandiumPPG::scandium_beat_detection_t::~scandium_beat_detection_t(Scandium::ScandiumPPG::scandium_beat_detection_t *this)
{
  uint64_t v2 = (char *)this + 132688;
  std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100]((void *)this + 16601);
  uint64_t v3 = (void *)*((void *)v2 + 12);
  if (v3) {
    operator delete(v3);
  }
  uint64_t v4 = (void *)*((void *)v2 + 9);
  if (v4)
  {
    *((void *)v2 + 1std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_processor_t>::reset[abi:ne180100](this, 0) = v4;
    operator delete(v4);
  }
  int v5 = (void *)*((void *)v2 + 6);
  if (v5)
  {
    *((void *)v2 + 7) = v5;
    operator delete(v5);
  }
  int v6 = (void *)*((void *)v2 + 3);
  if (v6)
  {
    *((void *)v2 + std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = v6;
    operator delete(v6);
  }
  char v7 = *(void **)v2;
  if (*(void *)v2)
  {
    *((void *)v2 + 1) = v7;
    operator delete(v7);
  }
  __int16 v8 = (void *)*((void *)this + 15);
  if (v8)
  {
    *((void *)this + 16) = v8;
    operator delete(v8);
  }
  int v9 = (void *)*((void *)this + 11);
  if (v9)
  {
    *((void *)this + 12) = v9;
    operator delete(v9);
  }
}

char *std::vector<int>::__init_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>(char *result, unsigned __int8 *a2, unsigned __int8 *a3, unint64_t a4)
{
  if (a4)
  {
    int v6 = result;
    float result = std::vector<float>::__vallocate[abi:ne180100](result, a4);
    char v7 = (_DWORD *)*((void *)v6 + 1);
    while (a2 != a3)
    {
      int v8 = *a2++;
      *v7++ = v8;
    }
    *((void *)v6 + 1) = v7;
  }
  return result;
}

void sub_25BA588AC(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::string::basic_string[abi:ne180100](uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (a2 > 0x16)
  {
    uint64_t v4 = (a2 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a2 | 7) != 0x17) {
      uint64_t v4 = a2 | 7;
    }
    uint64_t v5 = v4 + 1;
    int v6 = operator new(v4 + 1);
    *(void *)(a1 + 8) = a2;
    *(void *)(a1 + 16) = v5 | 0x8000000000000000;
    *(void *)a1 = v6;
  }
  else
  {
    *(void *)(a1 + 8) = 0;
    *(void *)(a1 + 16) = 0;
    *(void *)a1 = 0;
    *(unsigned char *)(a1 + 23) = a2;
  }
  return a1;
}

char *std::vector<int>::__init_with_size[abi:ne180100]<unsigned int *,unsigned int *>(char *result, int *a2, int *a3, unint64_t a4)
{
  if (a4)
  {
    int v6 = result;
    float result = std::vector<float>::__vallocate[abi:ne180100](result, a4);
    char v7 = (_DWORD *)*((void *)v6 + 1);
    while (a2 != a3)
    {
      int v8 = *a2++;
      *v7++ = v8;
    }
    *((void *)v6 + 1) = v7;
  }
  return result;
}

void sub_25BA589A8(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<float>::__assign_with_size[abi:ne180100]<float *,float *>(char *result, char *__src, uint64_t a3, unint64_t a4)
{
  char v7 = result;
  uint64_t v8 = *((void *)result + 2);
  int v9 = *(char **)result;
  if (a4 > (v8 - *(void *)result) >> 2)
  {
    if (v9)
    {
      *((void *)result + 1) = v9;
      operator delete(v9);
      uint64_t v8 = 0;
      *char v7 = 0;
      v7[1] = 0;
      _DWORD v7[2] = 0;
    }
    if (a4 >> 62) {
      std::vector<float>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = v8 >> 1;
    if (v8 >> 1 <= a4) {
      uint64_t v10 = a4;
    }
    if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v11 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v11 = v10;
    }
    float result = std::vector<float>::__vallocate[abi:ne180100](v7, v11);
    int v13 = (char *)v7[1];
    int v12 = (void **)(v7 + 1);
    int v9 = v13;
LABEL_16:
    size_t v17 = a3 - (void)__src;
    if (v17)
    {
      int v18 = v9;
      int v19 = __src;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  int v12 = (void **)(result + 8);
  unint64_t v14 = (unsigned char *)*((void *)result + 1);
  unint64_t v15 = (v14 - v9) >> 2;
  if (v15 >= a4) {
    goto LABEL_16;
  }
  int v16 = &__src[4 * v15];
  if (v14 != v9)
  {
    float result = (char *)memmove(*(void **)result, __src, v14 - v9);
    int v9 = (char *)*v12;
  }
  size_t v17 = a3 - (void)v16;
  if (v17)
  {
    int v18 = v9;
    int v19 = v16;
LABEL_18:
    float result = (char *)memmove(v18, v19, v17);
  }
LABEL_19:
  *int v12 = &v9[v17];
  return result;
}

uint64_t std::__optional_destruct_base<Scandium::ScandiumPPG::channel_combination_param_t,false>::~__optional_destruct_base[abi:ne180100](uint64_t a1)
{
  if (*(unsigned char *)(a1 + 136))
  {
    std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::~__hash_table(a1 + 56);
    if (*(char *)(a1 + 23) < 0) {
      operator delete(*(void **)a1);
    }
  }
  return a1;
}

uint64_t std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::pair[abi:ne180100]<char const(&)[23],std::vector<int>&,0>(uint64_t a1, char *a2, uint64_t a3)
{
  uint64_t v5 = std::string::basic_string[abi:ne180100]<0>((void *)a1, a2);
  v5[4] = 0;
  v5[5] = 0;
  v5 += 4;
  _DWORD v5[2] = 0;
  std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(v5, *(const void **)a3, *(void *)(a3 + 8), (uint64_t)(*(void *)(a3 + 8) - *(void *)a3) >> 2);
  *(_DWORD *)(a1 + 56) = 1;
  *(_DWORD *)(a1 + 6std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = 6;
  return a1;
}

void sub_25BA58B68(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::pair<std::string const,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>>::pair[abi:ne180100]<char const(&)[24],std::vector<int>&,0>(uint64_t a1, char *a2, uint64_t a3)
{
  uint64_t v5 = std::string::basic_string[abi:ne180100]<0>((void *)a1, a2);
  v5[4] = 0;
  v5[5] = 0;
  v5 += 4;
  _DWORD v5[2] = 0;
  std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(v5, *(const void **)a3, *(void *)(a3 + 8), (uint64_t)(*(void *)(a3 + 8) - *(void *)a3) >> 2);
  *(_DWORD *)(a1 + 56) = 1;
  *(_DWORD *)(a1 + 6std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = 6;
  return a1;
}

void sub_25BA58BD8(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void *std::vector<std::vector<float>>::__construct_one_at_end[abi:ne180100]<std::vector<float> const&>(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a1 + 8);
  *uint64_t v3 = 0;
  v3[1] = 0;
  v3[2] = 0;
  float result = std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(v3, *(const void **)a2, *(void *)(a2 + 8), (uint64_t)(*(void *)(a2 + 8) - *(void *)a2) >> 2);
  *(void *)(a1 + 8) = v3 + 3;
  return result;
}

void sub_25BA58C40(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t std::vector<std::vector<float>>::__push_back_slow_path<std::vector<float> const&>(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL) {
    std::vector<float>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x555555555555555) {
    unint64_t v9 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v9 = v5;
  }
  size_t v17 = a1 + 2;
  if (v9) {
    uint64_t v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(v7, v9);
  }
  else {
    uint64_t v10 = 0;
  }
  unint64_t v11 = &v10[24 * v4];
  v14[0] = v10;
  v14[1] = v11;
  unint64_t v15 = v11;
  int v16 = &v10[24 * v9];
  *(void *)unint64_t v11 = 0;
  *((void *)v11 + 1) = 0;
  *((void *)v11 + 2) = 0;
  std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(v11, *(const void **)a2, *(void *)(a2 + 8), (uint64_t)(*(void *)(a2 + 8) - *(void *)a2) >> 2);
  v15 += 24;
  std::vector<std::vector<float>>::__swap_out_circular_buffer(a1, v14);
  uint64_t v12 = a1[1];
  std::__split_buffer<std::vector<float>>::~__split_buffer((uint64_t)v14);
  return v12;
}

void sub_25BA58D4C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<std::vector<float>>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::vector<std::vector<float>>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::vector<float>>,std::reverse_iterator<std::vector<float>*>,std::reverse_iterator<std::vector<float>*>,std::reverse_iterator<std::vector<float>*>>((uint64_t)(a1 + 2), a1[1], (void *)a1[1], *a1, (void *)*a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::vector<float>>,std::reverse_iterator<std::vector<float>*>,std::reverse_iterator<std::vector<float>*>,std::reverse_iterator<std::vector<float>*>>(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v14 = a6;
  *((void *)&v14 + 1) = a7;
  long long v13 = v14;
  v11[0] = a1;
  v11[1] = &v13;
  v11[2] = &v14;
  if (a3 == a5)
  {
    uint64_t v9 = a6;
  }
  else
  {
    do
    {
      *(void *)(v7 - 2std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = 0;
      *(void *)(v7 - 16) = 0;
      *(void *)(v7 - 8) = 0;
      long long v8 = *(_OWORD *)(a3 - 3);
      a3 -= 3;
      *(_OWORD *)(v7 - 2std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = v8;
      *(void *)(v7 - 8) = a3[2];
      *a3 = 0;
      a3[1] = 0;
      a3[2] = 0;
      uint64_t v7 = *((void *)&v14 + 1) - 24;
      *((void *)&v14 + 1) -= 24;
    }
    while (a3 != a5);
    uint64_t v9 = v14;
  }
  char v12 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<float>>,std::reverse_iterator<std::vector<float>*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v11);
  return v9;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<float>>,std::reverse_iterator<std::vector<float>*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<float>>,std::reverse_iterator<std::vector<float>*>>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<float>>,std::reverse_iterator<std::vector<float>*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    uint64_t v3 = *(void **)v1;
    if (*(void *)v1)
    {
      *(void *)(v1 + 8) = v3;
      operator delete(v3);
    }
    v1 += 24;
  }
}

uint64_t std::__split_buffer<std::vector<float>>::~__split_buffer(uint64_t a1)
{
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void std::__split_buffer<std::vector<float>>::__destruct_at_end[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  while (v2 != a2)
  {
    uint64_t v5 = *(void **)(v2 - 24);
    *(void *)(a1 + 16) = v2 - 24;
    if (v5)
    {
      *(void *)(v2 - 16) = v5;
      operator delete(v5);
      uint64_t v2 = *(void *)(a1 + 16);
    }
    else
    {
      v2 -= 24;
    }
  }
}

uint64_t std::vector<std::vector<float>>::push_back[abi:ne180100](uint64_t *a1, uint64_t a2)
{
  unint64_t v6 = a1[2];
  uint64_t result = (uint64_t)(a1 + 2);
  unint64_t v5 = v6;
  uint64_t v7 = *(void **)(result - 8);
  if ((unint64_t)v7 >= v6)
  {
    unint64_t v9 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v7 - *a1) >> 3);
    unint64_t v10 = v9 + 1;
    if (v9 + 1 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<float>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v11 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v5 - *a1) >> 3);
    if (2 * v11 > v10) {
      unint64_t v10 = 2 * v11;
    }
    if (v11 >= 0x555555555555555) {
      unint64_t v12 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v12 = v10;
    }
    v16[4] = result;
    long long v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(result, v12);
    long long v14 = &v13[24 * v9];
    v16[0] = v13;
    v16[1] = v14;
    v16[3] = &v13[24 * v15];
    *((void *)v14 + 1) = 0;
    *((void *)v14 + 2) = 0;
    *(void *)long long v14 = 0;
    *(_OWORD *)long long v14 = *(_OWORD *)a2;
    *((void *)v14 + 2) = *(void *)(a2 + 16);
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
    *(void *)(a2 + 16) = 0;
    v16[2] = v14 + 24;
    std::vector<std::vector<float>>::__swap_out_circular_buffer(a1, v16);
    long long v8 = (void *)a1[1];
    uint64_t result = std::__split_buffer<std::vector<float>>::~__split_buffer((uint64_t)v16);
  }
  else
  {
    *uint64_t v7 = 0;
    v7[1] = 0;
    _DWORD v7[2] = 0;
    *(_OWORD *)uint64_t v7 = *(_OWORD *)a2;
    _DWORD v7[2] = *(void *)(a2 + 16);
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
    *(void *)(a2 + 16) = 0;
    long long v8 = v7 + 3;
    a1[1] = (uint64_t)(v7 + 3);
  }
  a1[1] = (uint64_t)v8;
  return result;
}

void sub_25BA590BC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<std::vector<float>>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::function<float ()(float const*,int)>::operator()(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v6 = a2;
  int v5 = a3;
  uint64_t v3 = *(void *)(a1 + 24);
  if (!v3) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t *, int *))(*(void *)v3 + 48))(v3, &v6, &v5);
}

void std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    std::vector<std::vector<float>>::__clear[abi:ne180100]((uint64_t *)v2);
    uint64_t v3 = **a1;
    operator delete(v3);
  }
}

void std::vector<std::vector<float>>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  if (v2 != *a1)
  {
    uint64_t v4 = a1[1];
    do
    {
      uint64_t v6 = *(void **)(v4 - 24);
      v4 -= 24;
      int v5 = v6;
      if (v6)
      {
        *(void *)(v2 - 16) = v5;
        operator delete(v5);
      }
      uint64_t v2 = v4;
    }
    while (v4 != v3);
  }
  a1[1] = v3;
}

void *std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(void *result, const void *a2, uint64_t a3, size_t __sz)
{
  if (__sz)
  {
    uint64_t v6 = result;
    uint64_t result = std::vector<unsigned char>::__vallocate[abi:ne180100](result, __sz);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      uint64_t result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_25BA59238(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<unsigned char>::__vallocate[abi:ne180100](void *a1, size_t __sz)
{
  if ((__sz & 0x8000000000000000) != 0) {
    std::vector<float>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)operator new(__sz);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[__sz];
  return result;
}

uint64_t std::unordered_map<Scandium::sc_optical_gen_e,std::string>::unordered_map(uint64_t a1, int *a2, uint64_t a3)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = 1065353216;
  if (a3)
  {
    uint64_t v5 = 32 * a3;
    do
    {
      std::__hash_table<std::__hash_value_type<Scandium::sc_optical_gen_e,std::string>,std::__unordered_map_hasher<Scandium::sc_optical_gen_e,std::__hash_value_type<Scandium::sc_optical_gen_e,std::string>,std::hash<Scandium::sc_optical_gen_e>,std::equal_to<Scandium::sc_optical_gen_e>,true>,std::__unordered_map_equal<Scandium::sc_optical_gen_e,std::__hash_value_type<Scandium::sc_optical_gen_e,std::string>,std::equal_to<Scandium::sc_optical_gen_e>,std::hash<Scandium::sc_optical_gen_e>,true>,std::allocator<std::__hash_value_type<Scandium::sc_optical_gen_e,std::string>>>::__emplace_unique_key_args<Scandium::sc_optical_gen_e,std::pair<Scandium::sc_optical_gen_e const,std::string> const&>(a1, a2, (uint64_t)a2);
      a2 += 8;
      v5 -= 32;
    }
    while (v5);
  }
  return a1;
}

void sub_25BA592FC(_Unwind_Exception *a1)
{
  std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::__unordered_map_hasher<Scandium::ScandiumPPG::channel_combination_ret_t,std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::hash<Scandium::ScandiumPPG::channel_combination_ret_t>,std::equal_to<Scandium::ScandiumPPG::channel_combination_ret_t>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::channel_combination_ret_t,std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,std::equal_to<Scandium::ScandiumPPG::channel_combination_ret_t>,std::hash<Scandium::ScandiumPPG::channel_combination_ret_t>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

uint64_t *std::__hash_table<std::__hash_value_type<Scandium::sc_optical_gen_e,std::string>,std::__unordered_map_hasher<Scandium::sc_optical_gen_e,std::__hash_value_type<Scandium::sc_optical_gen_e,std::string>,std::hash<Scandium::sc_optical_gen_e>,std::equal_to<Scandium::sc_optical_gen_e>,true>,std::__unordered_map_equal<Scandium::sc_optical_gen_e,std::__hash_value_type<Scandium::sc_optical_gen_e,std::string>,std::equal_to<Scandium::sc_optical_gen_e>,std::hash<Scandium::sc_optical_gen_e>,true>,std::allocator<std::__hash_value_type<Scandium::sc_optical_gen_e,std::string>>>::__emplace_unique_key_args<Scandium::sc_optical_gen_e,std::pair<Scandium::sc_optical_gen_e const,std::string> const&>(uint64_t a1, int *a2, uint64_t a3)
{
  unint64_t v5 = *a2;
  unint64_t v6 = *(void *)(a1 + 8);
  if (v6)
  {
    uint8x8_t v7 = (uint8x8_t)vcnt_s8((int8x8_t)v6);
    v7.i16[0] = vaddlv_u8(v7);
    if (v7.u32[0] > 1uLL)
    {
      unint64_t v3 = *a2;
      if (v6 <= v5) {
        unint64_t v3 = v5 % v6;
      }
    }
    else
    {
      unint64_t v3 = (v6 - 1) & v5;
    }
    size_t v8 = *(uint64_t ***)(*(void *)a1 + 8 * v3);
    if (v8)
    {
      for (uint64_t result = *v8; result; uint64_t result = (uint64_t *)*result)
      {
        unint64_t v10 = result[1];
        if (v10 == v5)
        {
          if (*((_DWORD *)result + 4) == v5) {
            return result;
          }
        }
        else
        {
          if (v7.u32[0] > 1uLL)
          {
            if (v10 >= v6) {
              v10 %= v6;
            }
          }
          else
          {
            v10 &= v6 - 1;
          }
          if (v10 != v3) {
            break;
          }
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<Scandium::sc_optical_gen_e,std::string>,std::__unordered_map_hasher<Scandium::sc_optical_gen_e,std::__hash_value_type<Scandium::sc_optical_gen_e,std::string>,std::hash<Scandium::sc_optical_gen_e>,std::equal_to<Scandium::sc_optical_gen_e>,true>,std::__unordered_map_equal<Scandium::sc_optical_gen_e,std::__hash_value_type<Scandium::sc_optical_gen_e,std::string>,std::equal_to<Scandium::sc_optical_gen_e>,std::hash<Scandium::sc_optical_gen_e>,true>,std::allocator<std::__hash_value_type<Scandium::sc_optical_gen_e,std::string>>>::__construct_node_hash<std::pair<Scandium::sc_optical_gen_e const,std::string> const&>(a1, *a2, a3, (uint64_t)v19);
  float v11 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v12 = *(float *)(a1 + 32);
  if (!v6 || (float)(v12 * (float)v6) < v11)
  {
    BOOL v13 = 1;
    if (v6 >= 3) {
      BOOL v13 = (v6 & (v6 - 1)) != 0;
    }
    unint64_t v14 = v13 | (2 * v6);
    unint64_t v15 = vcvtps_u32_f32(v11 / v12);
    if (v14 <= v15) {
      size_t v16 = v15;
    }
    else {
      size_t v16 = v14;
    }
    std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::__rehash<true>(a1, v16);
    unint64_t v6 = *(void *)(a1 + 8);
    if ((v6 & (v6 - 1)) != 0)
    {
      if (v6 <= v5) {
        unint64_t v3 = v5 % v6;
      }
      else {
        unint64_t v3 = v5;
      }
    }
    else
    {
      unint64_t v3 = (v6 - 1) & v5;
    }
  }
  size_t v17 = *(void **)(*(void *)a1 + 8 * v3);
  if (v17)
  {
    *(void *)v19[0] = *v17;
    void *v17 = v19[0];
  }
  else
  {
    *(void *)v19[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v19[0];
    *(void *)(*(void *)a1 + 8 * v3) = a1 + 16;
    if (*(void *)v19[0])
    {
      unint64_t v18 = *(void *)(*(void *)v19[0] + 8);
      if ((v6 & (v6 - 1)) != 0)
      {
        if (v18 >= v6) {
          v18 %= v6;
        }
      }
      else
      {
        v18 &= v6 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v18) = v19[0];
    }
  }
  uint64_t result = (uint64_t *)v19[0];
  ++*(void *)(a1 + 24);
  return result;
}

void sub_25BA59524(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **__p, uint64_t a11)
{
  if (__p) {
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,void *>>>::operator()[abi:ne180100]((uint64_t)&a11, __p);
  }
  _Unwind_Resume(exception_object);
}

void std::__hash_table<std::__hash_value_type<Scandium::sc_optical_gen_e,std::string>,std::__unordered_map_hasher<Scandium::sc_optical_gen_e,std::__hash_value_type<Scandium::sc_optical_gen_e,std::string>,std::hash<Scandium::sc_optical_gen_e>,std::equal_to<Scandium::sc_optical_gen_e>,true>,std::__unordered_map_equal<Scandium::sc_optical_gen_e,std::__hash_value_type<Scandium::sc_optical_gen_e,std::string>,std::equal_to<Scandium::sc_optical_gen_e>,std::hash<Scandium::sc_optical_gen_e>,true>,std::allocator<std::__hash_value_type<Scandium::sc_optical_gen_e,std::string>>>::__construct_node_hash<std::pair<Scandium::sc_optical_gen_e const,std::string> const&>(uint64_t a1@<X0>, std::string::size_type a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7 = a1 + 16;
  size_t v8 = (std::string *)operator new(0x30uLL);
  *(void *)a4 = v8;
  *(void *)(a4 + 8) = v7;
  *(unsigned char *)(a4 + 16) = 0;
  v8->__r_.__value_.__r.__words[0] = 0;
  v8->__r_.__value_.__l.__size_ = a2;
  LODWORD(v8->__r_.__value_.__r.__words[2]) = *(_DWORD *)a3;
  unint64_t v9 = v8 + 1;
  if (*(char *)(a3 + 31) < 0)
  {
    std::string::__init_copy_ctor_external(v9, *(const std::string::value_type **)(a3 + 8), *(void *)(a3 + 16));
  }
  else
  {
    *(_OWORD *)&v9->__r_.__value_.__l.__data_ = *(_OWORD *)(a3 + 8);
    v9->__r_.__value_.__r.__words[2] = *(void *)(a3 + 24);
  }
  *(unsigned char *)(a4 + 16) = 1;
}

void sub_25BA595E0(_Unwind_Exception *a1)
{
  *uint64_t v1 = 0;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<Scandium::ScandiumPPG::channel_combination_ret_t,std::string>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

uint64_t std::__function::__value_func<void ()(Scandium::ScandiumPPG::SpO2Result)>::__value_func[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(void *)(a1 + 2std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = a1;
      (*(void (**)(void, uint64_t))(**(void **)(a2 + 24) + 24))(*(void *)(a2 + 24), a1);
    }
    else
    {
      *(void *)(a1 + 2std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 16))(v3);
    }
  }
  else
  {
    *(void *)(a1 + 2std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = 0;
  }
  return a1;
}

void *std::__function::__value_func<void ()(Scandium::ScandiumPPG::SpO2Result)>::~__value_func[abi:ne180100](void *a1)
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

void std::__function::__func<Scandium::ScandiumPPG::scandium_spo2_processor_t::scandium_spo2_processor_t(Scandium::sc_optical_gen_e,Scandium::sc_sess_start_pkt_v4_t const&,std::function<void ()(Scandium::ScandiumPPG::SpO2Result)>,std::function<void ()(Scandium::AbortReason)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,BOOL)::$_0,std::allocator<Scandium::ScandiumPPG::scandium_spo2_processor_t::scandium_spo2_processor_t(Scandium::sc_optical_gen_e,Scandium::sc_sess_start_pkt_v4_t const&,std::function<void ()(Scandium::ScandiumPPG::SpO2Result)>,std::function<void ()(Scandium::AbortReason)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,BOOL)::$_0>,void ()(BOOL)>::~__func()
{
}

void *std::__function::__func<Scandium::ScandiumPPG::scandium_spo2_processor_t::scandium_spo2_processor_t(Scandium::sc_optical_gen_e,Scandium::sc_sess_start_pkt_v4_t const&,std::function<void ()(Scandium::ScandiumPPG::SpO2Result)>,std::function<void ()(Scandium::AbortReason)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,BOOL)::$_0,std::allocator<Scandium::ScandiumPPG::scandium_spo2_processor_t::scandium_spo2_processor_t(Scandium::sc_optical_gen_e,Scandium::sc_sess_start_pkt_v4_t const&,std::function<void ()(Scandium::ScandiumPPG::SpO2Result)>,std::function<void ()(Scandium::AbortReason)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,BOOL)::$_0>,void ()(BOOL)>::__clone(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *uint64_t result = &unk_2709337D8;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<Scandium::ScandiumPPG::scandium_spo2_processor_t::scandium_spo2_processor_t(Scandium::sc_optical_gen_e,Scandium::sc_sess_start_pkt_v4_t const&,std::function<void ()(Scandium::ScandiumPPG::SpO2Result)>,std::function<void ()(Scandium::AbortReason)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,BOOL)::$_0,std::allocator<Scandium::ScandiumPPG::scandium_spo2_processor_t::scandium_spo2_processor_t(Scandium::sc_optical_gen_e,Scandium::sc_sess_start_pkt_v4_t const&,std::function<void ()(Scandium::ScandiumPPG::SpO2Result)>,std::function<void ()(Scandium::AbortReason)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,BOOL)::$_0>,void ()(BOOL)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_2709337D8;
  a2[1] = v2;
  return result;
}

void std::__function::__func<Scandium::ScandiumPPG::scandium_spo2_processor_t::scandium_spo2_processor_t(Scandium::sc_optical_gen_e,Scandium::sc_sess_start_pkt_v4_t const&,std::function<void ()(Scandium::ScandiumPPG::SpO2Result)>,std::function<void ()(Scandium::AbortReason)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,BOOL)::$_0,std::allocator<Scandium::ScandiumPPG::scandium_spo2_processor_t::scandium_spo2_processor_t(Scandium::sc_optical_gen_e,Scandium::sc_sess_start_pkt_v4_t const&,std::function<void ()(Scandium::ScandiumPPG::SpO2Result)>,std::function<void ()(Scandium::AbortReason)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,BOOL)::$_0>,void ()(BOOL)>::operator()(uint64_t a1, unsigned __int8 *a2)
{
}

uint64_t std::__function::__func<Scandium::ScandiumPPG::scandium_spo2_processor_t::scandium_spo2_processor_t(Scandium::sc_optical_gen_e,Scandium::sc_sess_start_pkt_v4_t const&,std::function<void ()(Scandium::ScandiumPPG::SpO2Result)>,std::function<void ()(Scandium::AbortReason)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,BOOL)::$_0,std::allocator<Scandium::ScandiumPPG::scandium_spo2_processor_t::scandium_spo2_processor_t(Scandium::sc_optical_gen_e,Scandium::sc_sess_start_pkt_v4_t const&,std::function<void ()(Scandium::ScandiumPPG::SpO2Result)>,std::function<void ()(Scandium::AbortReason)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,BOOL)::$_0>,void ()(BOOL)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<Scandium::ScandiumPPG::scandium_spo2_processor_t::scandium_spo2_processor_t(Scandium::sc_optical_gen_e,Scandium::sc_sess_start_pkt_v4_t const&,std::function<void ()(Scandium::ScandiumPPG::SpO2Result)>,std::function<void ()(Scandium::AbortReason)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,BOOL)::$_0,std::allocator<Scandium::ScandiumPPG::scandium_spo2_processor_t::scandium_spo2_processor_t(Scandium::sc_optical_gen_e,Scandium::sc_sess_start_pkt_v4_t const&,std::function<void ()(Scandium::ScandiumPPG::SpO2Result)>,std::function<void ()(Scandium::AbortReason)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,BOOL)::$_0>,void ()(BOOL)>::target_type()
{
}

void std::__function::__func<Scandium::ScandiumPPG::scandium_spo2_processor_t::scandium_spo2_processor_t(Scandium::sc_optical_gen_e,Scandium::sc_sess_start_pkt_v4_t const&,std::function<void ()(Scandium::ScandiumPPG::SpO2Result)>,std::function<void ()(Scandium::AbortReason)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,BOOL)::$_1,std::allocator<Scandium::ScandiumPPG::scandium_spo2_processor_t::scandium_spo2_processor_t(Scandium::sc_optical_gen_e,Scandium::sc_sess_start_pkt_v4_t const&,std::function<void ()(Scandium::ScandiumPPG::SpO2Result)>,std::function<void ()(Scandium::AbortReason)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,BOOL)::$_1>,void ()(BOOL)>::~__func()
{
}

void *std::__function::__func<Scandium::ScandiumPPG::scandium_spo2_processor_t::scandium_spo2_processor_t(Scandium::sc_optical_gen_e,Scandium::sc_sess_start_pkt_v4_t const&,std::function<void ()(Scandium::ScandiumPPG::SpO2Result)>,std::function<void ()(Scandium::AbortReason)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,BOOL)::$_1,std::allocator<Scandium::ScandiumPPG::scandium_spo2_processor_t::scandium_spo2_processor_t(Scandium::sc_optical_gen_e,Scandium::sc_sess_start_pkt_v4_t const&,std::function<void ()(Scandium::ScandiumPPG::SpO2Result)>,std::function<void ()(Scandium::AbortReason)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,BOOL)::$_1>,void ()(BOOL)>::__clone(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *uint64_t result = &unk_270933858;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<Scandium::ScandiumPPG::scandium_spo2_processor_t::scandium_spo2_processor_t(Scandium::sc_optical_gen_e,Scandium::sc_sess_start_pkt_v4_t const&,std::function<void ()(Scandium::ScandiumPPG::SpO2Result)>,std::function<void ()(Scandium::AbortReason)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,BOOL)::$_1,std::allocator<Scandium::ScandiumPPG::scandium_spo2_processor_t::scandium_spo2_processor_t(Scandium::sc_optical_gen_e,Scandium::sc_sess_start_pkt_v4_t const&,std::function<void ()(Scandium::ScandiumPPG::SpO2Result)>,std::function<void ()(Scandium::AbortReason)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,BOOL)::$_1>,void ()(BOOL)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_270933858;
  a2[1] = v2;
  return result;
}

void std::__function::__func<Scandium::ScandiumPPG::scandium_spo2_processor_t::scandium_spo2_processor_t(Scandium::sc_optical_gen_e,Scandium::sc_sess_start_pkt_v4_t const&,std::function<void ()(Scandium::ScandiumPPG::SpO2Result)>,std::function<void ()(Scandium::AbortReason)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,BOOL)::$_1,std::allocator<Scandium::ScandiumPPG::scandium_spo2_processor_t::scandium_spo2_processor_t(Scandium::sc_optical_gen_e,Scandium::sc_sess_start_pkt_v4_t const&,std::function<void ()(Scandium::ScandiumPPG::SpO2Result)>,std::function<void ()(Scandium::AbortReason)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,BOOL)::$_1>,void ()(BOOL)>::operator()(uint64_t a1, unsigned __int8 *a2)
{
}

uint64_t std::__function::__func<Scandium::ScandiumPPG::scandium_spo2_processor_t::scandium_spo2_processor_t(Scandium::sc_optical_gen_e,Scandium::sc_sess_start_pkt_v4_t const&,std::function<void ()(Scandium::ScandiumPPG::SpO2Result)>,std::function<void ()(Scandium::AbortReason)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,BOOL)::$_1,std::allocator<Scandium::ScandiumPPG::scandium_spo2_processor_t::scandium_spo2_processor_t(Scandium::sc_optical_gen_e,Scandium::sc_sess_start_pkt_v4_t const&,std::function<void ()(Scandium::ScandiumPPG::SpO2Result)>,std::function<void ()(Scandium::AbortReason)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,BOOL)::$_1>,void ()(BOOL)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<Scandium::ScandiumPPG::scandium_spo2_processor_t::scandium_spo2_processor_t(Scandium::sc_optical_gen_e,Scandium::sc_sess_start_pkt_v4_t const&,std::function<void ()(Scandium::ScandiumPPG::SpO2Result)>,std::function<void ()(Scandium::AbortReason)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,BOOL)::$_1,std::allocator<Scandium::ScandiumPPG::scandium_spo2_processor_t::scandium_spo2_processor_t(Scandium::sc_optical_gen_e,Scandium::sc_sess_start_pkt_v4_t const&,std::function<void ()(Scandium::ScandiumPPG::SpO2Result)>,std::function<void ()(Scandium::AbortReason)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,BOOL)::$_1>,void ()(BOOL)>::target_type()
{
}

void std::__function::__func<float (*)(float const*,int),std::allocator<float (*)(float const*,int)>,float ()(float const*,int)>::~__func()
{
}

void *std::__function::__func<float (*)(float const*,int),std::allocator<float (*)(float const*,int)>,float ()(float const*,int)>::__clone(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *uint64_t result = &unk_2709338D8;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<float (*)(float const*,int),std::allocator<float (*)(float const*,int)>,float ()(float const*,int)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_2709338D8;
  a2[1] = v2;
  return result;
}

uint64_t std::__function::__func<float (*)(float const*,int),std::allocator<float (*)(float const*,int)>,float ()(float const*,int)>::operator()(uint64_t a1, void *a2, unsigned int *a3)
{
  return (*(uint64_t (**)(void, void))(a1 + 8))(*a2, *a3);
}

uint64_t std::__function::__func<float (*)(float const*,int),std::allocator<float (*)(float const*,int)>,float ()(float const*,int)>::target(uint64_t a1, uint64_t a2)
{
    return a1 + 8;
  else {
    return 0;
  }
}

void *std::__function::__func<float (*)(float const*,int),std::allocator<float (*)(float const*,int)>,float ()(float const*,int)>::target_type()
{
}

void *std::__function::__value_func<float ()(float const*,int)>::~__value_func[abi:ne180100](void *a1)
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

double Scandium::ScandiumPPG::BGA_t::reset(Scandium::ScandiumPPG::BGA_t *this)
{
  *((_DWORD *)this + 16) = 0;
  double result = 0.0;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  *(_OWORD *)((char *)this + 76) = 0u;
  *(_OWORD *)((char *)this + 92) = 0u;
  *((_DWORD *)this + 27) = 0;
  return result;
}

void *Scandium::ScandiumPPG::scandium_bga_t::scandium_bga_reset(void *this)
{
  this[1] = *this;
  this[4] = this[3];
  this[7] = this[6];
  this[10] = this[9];
  return this;
}

double Scandium::ScandiumPPG::scandium_bga_t::scandium_bga_t(Scandium::ScandiumPPG::scandium_bga_t *this)
{
  *((void *)this + 15) = 0;
  double result = 0.0;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = 0u;
  *((_OWORD *)this + 5) = 0u;
  return result;
}

void Scandium::ScandiumPPG::scandium_bga_t::~scandium_bga_t(Scandium::ScandiumPPG::scandium_bga_t *this)
{
  std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100]((void *)this + 12);
  uint64_t v2 = (void *)*((void *)this + 9);
  if (v2)
  {
    *((void *)this + 1std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_processor_t>::reset[abi:ne180100](this, 0) = v2;
    operator delete(v2);
  }
  uint64_t v3 = (void *)*((void *)this + 6);
  if (v3)
  {
    *((void *)this + 7) = v3;
    operator delete(v3);
  }
  uint64_t v4 = (void *)*((void *)this + 3);
  if (v4)
  {
    *((void *)this + std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = v4;
    operator delete(v4);
  }
  unint64_t v5 = *(void **)this;
  if (*(void *)this)
  {
    *((void *)this + 1) = v5;
    operator delete(v5);
  }
}

void Scandium::ScandiumPPG::scandium_bga_t::compute_bga_measures(Scandium::ScandiumPPG::beats_t *a1@<X1>, __int32 a2@<W2>, uint64_t a3@<X8>, int32x2_t a4@<D0>)
{
  *(void *)a3 = 0;
  *(void *)(a3 + 8) = 0;
  *(_DWORD *)(a3 + 16) = 0;
  a4.i32[0] = *((_DWORD *)a1 + 6);
  unint64_t v5 = (int *)*((void *)a1 + 4);
  unint64_t v6 = *((void *)a1 + 5) - (void)v5;
  int32x2_t v7 = vcvt_n_s32_f32(vdiv_f32((float32x2_t)0x4190000042700000, (float32x2_t)vdup_lane_s32(a4, 0)), 6uLL);
  *(int32x2_t *)a3 = v7;
  if ((int)(v6 >> 2) < 1)
  {
    int v8 = 0;
  }
  else
  {
    int v8 = 0;
    uint64_t v9 = (v6 >> 2);
    do
    {
      int v10 = *v5++;
      __int32 v11 = v7.i32[0] - v7.i32[1] + v10;
      if (v10 >= v7.i32[1] && v11 <= a2) {
        ++v8;
      }
      --v9;
    }
    while (v9);
  }
  *(_DWORD *)(a3 + 16) = v8;
  int v13 = *((_DWORD *)a1 + 7);
  *(_DWORD *)(a3 + 8) = a4.i32[0];
  *(_DWORD *)(a3 + 12) = v13;
}

void Scandium::ScandiumPPG::scandium_bga_t::compute_ppg_snips(void *a1, void *a2, uint64_t a3, int *a4, uint64_t a5, uint64_t *a6, int a7)
{
  uint64_t v11 = *(void *)(a3 + 40) - *(void *)(a3 + 32);
  std::vector<unsigned long>::vector(v59, (int)(v11 >> 2));
  if ((int)((unint64_t)v11 >> 2) >= 1)
  {
    uint64_t v12 = 0;
    int v13 = 0;
    uint64_t v14 = *(void *)(a3 + 32);
    unint64_t v15 = (void **)(a1 + 6);
    uint64_t v16 = ((unint64_t)v11 >> 2);
    do
    {
      int v17 = *(_DWORD *)(v14 + 4 * v12);
      int v18 = a4[1];
      int v19 = v17 - v18;
      if (v17 >= v18 && v19 + *a4 - 1 < (unint64_t)((uint64_t)(a2[1] - *a2) >> 2))
      {
        int v21 = (char *)a1[7];
        unint64_t v20 = a1[8];
        if ((unint64_t)v21 >= v20)
        {
          uint64_t v23 = (char *)*v15;
          uint64_t v24 = (v21 - (unsigned char *)*v15) >> 2;
          unint64_t v25 = v24 + 1;
          if ((unint64_t)(v24 + 1) >> 62) {
            std::vector<float>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v26 = v20 - (void)v23;
          if (v26 >> 1 > v25) {
            unint64_t v25 = v26 >> 1;
          }
          if ((unint64_t)v26 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v27 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v27 = v25;
          }
          if (v27)
          {
            int v28 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)(a1 + 8), v27);
            uint64_t v23 = (char *)a1[6];
            int v21 = (char *)a1[7];
          }
          else
          {
            int v28 = 0;
          }
          int v29 = &v28[4 * v24];
          *(_DWORD *)int v29 = v19;
          int v22 = v29 + 4;
          while (v21 != v23)
          {
            int v30 = *((_DWORD *)v21 - 1);
            v21 -= 4;
            *((_DWORD *)v29 - 1) = v30;
            v29 -= 4;
          }
          a1[6] = v29;
          a1[7] = v22;
          a1[8] = &v28[4 * v27];
          if (v23) {
            operator delete(v23);
          }
        }
        else
        {
          *(_DWORD *)int v21 = v19;
          int v22 = v21 + 4;
        }
        a1[7] = v22;
        int v13 = (float *)(v13 + 1);
      }
      ++v12;
    }
    while (v12 != v16);
    if ((int)v13 > 0)
    {
      std::string __p = 0;
      int v57 = 0;
      int v58 = 0;
      std::vector<float>::reserve(&__p, v13);
      uint64_t v31 = 0;
      uint64_t v55 = 0;
      do
      {
        vDSP_maxv_wrapper(*a2 + 4 * *((int *)*v15 + v31), 1, (float *)&v55, *a4);
        vDSP_minv_wrapper(*a2 + 4 * *((int *)*v15 + v31), 1, (float *)&v55 + 1, *a4);
        float v32 = *(float *)&v55 - *((float *)&v55 + 1);
        int v33 = v57;
        if (v57 >= v58)
        {
          int v35 = (float *)__p;
          uint64_t v36 = ((char *)v57 - (unsigned char *)__p) >> 2;
          unint64_t v37 = v36 + 1;
          if ((unint64_t)(v36 + 1) >> 62) {
            std::vector<float>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v38 = (char *)v58 - (unsigned char *)__p;
          if (((char *)v58 - (unsigned char *)__p) >> 1 > v37) {
            unint64_t v37 = v38 >> 1;
          }
          if ((unint64_t)v38 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v39 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v39 = v37;
          }
          if (v39)
          {
            int v40 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v58, v39);
            int v35 = (float *)__p;
            int v33 = v57;
          }
          else
          {
            int v40 = 0;
          }
          float v41 = (float *)&v40[4 * v36];
          *float v41 = v32;
          int v34 = v41 + 1;
          while (v33 != v35)
          {
            int v42 = *((_DWORD *)v33-- - 1);
            *((_DWORD *)v41-- - 1) = v42;
          }
          std::string __p = v41;
          int v57 = v34;
          int v58 = (float *)&v40[4 * v39];
          if (v35) {
            operator delete(v35);
          }
        }
        else
        {
          *int v57 = v32;
          int v34 = v33 + 1;
        }
        int v57 = v34;
        ++v31;
      }
      while (v31 != v13);
      float v43 = stats::std((stats *)__p, v13, 1);
      vDSP_Length v44 = 0;
      int v45 = (vDSP_Length *)v59[0];
      do
      {
        v45[v44] = v44;
        ++v44;
      }
      while (v13 != v44);
      stats::median_vdsp((stats *)__p, v45, (unint64_t *)v13);
      unint64_t v46 = 0;
      float v47 = (float *)__p;
      float v49 = v48 + (float)(v43 * 2.0);
      uint64_t v50 = *a6;
      do
      {
        if (v47[v46] > v49) {
          *(void *)(v50 + ((v46 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= ~(1 << v46);
        }
        ++v46;
      }
      while (v13 != v46);
      *(_DWORD *)(a5 + 108) = (a1[7] - a1[6]) >> 2;
      if (a7)
      {
        if (a7 == 1)
        {
          int v51 = (void ***)(a5 + 32);
        }
        else
        {
          if (a7 != 2) {
            goto LABEL_55;
          }
          int v51 = (void ***)(a5 + 40);
        }
      }
      else
      {
        int v51 = (void ***)(a5 + 24);
      }
      *int v51 = v15;
LABEL_55:
      if (__p)
      {
        int v57 = (float *)__p;
        operator delete(__p);
      }
    }
  }
  if (v59[0])
  {
    v59[1] = v59[0];
    operator delete(v59[0]);
  }
}

void sub_25BA59F5C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, uint64_t a17, void *a18, uint64_t a19)
{
  if (__p) {
    operator delete(__p);
  }
  if (a18) {
    operator delete(a18);
  }
  _Unwind_Resume(exception_object);
}

char *Scandium::ScandiumPPG::scandium_bga_t::compute_wavelength(char *result, uint64_t a2, uint64_t a3, uint64_t *a4, unsigned int *a5, uint64_t a6, int a7)
{
  uint64_t v9 = a4[1];
  unint64_t v10 = v9 - *a4;
  if (v9 == *a4)
  {
    float v30 = 0.0;
  }
  else
  {
    int v13 = result;
    unint64_t v14 = (int)*a5;
    uint64_t v15 = *a5;
    uint64_t v16 = (float **)(result + 72);
    int v31 = 0;
    double result = std::vector<float>::assign((char **)result + 9, v14, &v31);
    if ((int)(v10 >> 2) >= 1)
    {
      uint64_t v17 = 0;
      uint64_t v18 = *a4;
      uint64_t v19 = *((void *)v13 + 6);
      do
      {
        if ((int)v15 >= 1)
        {
          unint64_t v20 = (float *)(a3 + 4 * *(unsigned int *)(v19 + 4 * *(int *)(v18 + 4 * v17)));
          int v21 = *v16;
          uint64_t v22 = v15;
          do
          {
            float v23 = *v20++;
            *int v21 = v23 + *v21;
            ++v21;
            --v22;
          }
          while (v22);
        }
        ++v17;
      }
      while (v17 != (v10 >> 2));
    }
    if ((int)v15 < 1)
    {
      float v27 = 0.0;
    }
    else
    {
      uint64_t v24 = *v16;
      uint64_t v25 = v15;
      do
      {
        float *v24 = *v24 / (float)(int)(v10 >> 2);
        ++v24;
        --v25;
      }
      while (v25);
      uint64_t v26 = *v16;
      float v27 = 0.0;
      uint64_t v28 = v15;
      do
      {
        float v29 = *v26++;
        float v27 = v27 + v29;
        --v28;
      }
      while (v28);
    }
    float v30 = v27 / (float)(int)v15;
  }
  if (a7 == 1)
  {
    *(float *)(a6 + 72) = v30;
  }
  else if (!a7)
  {
    *(float *)(a6 + 68) = v30;
  }
  return result;
}

void Scandium::ScandiumPPG::scandium_bga_t::compile_bga_metrics(uint64_t a1, uint64_t *a2, uint64_t *a3, unsigned int *a4, uint64_t a5, int a6)
{
  uint64_t v10 = a3[1];
  unint64_t v11 = v10 - *a3;
  if (v10 == *a3)
  {
    float v28 = NAN;
    uint64_t v29 = a3[1];
  }
  else
  {
    unint64_t v14 = (int)*a4;
    int v30 = 0;
    std::vector<float>::assign((char **)a1, v14, &v30);
    uint64_t v15 = (const float *)*a4;
    if ((int)(v11 >> 2) >= 1)
    {
      uint64_t v16 = 0;
      uint64_t v17 = *a3;
      uint64_t v18 = *(void *)(a1 + 48);
      uint64_t v19 = *a2;
      do
      {
        if ((int)v15 >= 1)
        {
          unint64_t v20 = (float *)(v19 + 4 * *(unsigned int *)(v18 + 4 * *(int *)(v17 + 4 * v16)));
          int v21 = *(char **)a1;
          uint64_t v22 = v15;
          do
          {
            float v23 = *v20++;
            *(float *)int v21 = v23 + *(float *)v21;
            v21 += 4;
            uint64_t v22 = (const float *)((char *)v22 - 1);
          }
          while (v22);
        }
        ++v16;
      }
      while (v16 != (v11 >> 2));
    }
    uint64_t v24 = *(char **)a1;
    if ((int)v15 >= 1)
    {
      uint64_t v25 = v15;
      uint64_t v26 = *(char **)a1;
      do
      {
        *(float *)uint64_t v26 = *(float *)v26 / (float)(int)(v11 >> 2);
        v26 += 4;
        uint64_t v25 = (const float *)((char *)v25 - 1);
      }
      while (v25);
    }
    float v27 = stats::max((stats *)v24, v15);
    float v28 = v27 - stats::min(*(stats **)a1, (const float *)*a4);
    uint64_t v10 = *a3;
    uint64_t v29 = a3[1];
  }
  *(void *)(a5 + 48) = a3;
  *(_DWORD *)(a5 + 10std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = (unint64_t)(v29 - v10) >> 2;
  switch(a6)
  {
    case 2:
      *(void *)(a5 + 16) = a1;
      *(float *)(a5 + 6std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = v28;
      break;
    case 1:
      *(void *)(a5 + 8) = a1;
      *(float *)(a5 + 6std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_processor_t>::reset[abi:ne180100](this, 0) = v28;
      break;
    case 0:
      *(void *)a5 = a1;
      *(float *)(a5 + 56) = v28;
      break;
  }
}

void Scandium::ScandiumPPG::scandium_bga_t::compute_snip_corr(uint64_t a1, void *a2, void *a3, unsigned int *a4, float *a5, int a6)
{
  int v6 = a6;
  int32x2_t v7 = a5;
  uint64_t v8 = a3[1];
  uint64_t v9 = v8 - *a3;
  if (v8 == *a3)
  {
    float v32 = NAN;
  }
  else
  {
    unint64_t v14 = (const float **)(a1 + 24);
    unint64_t v35 = (int)(v9 >> 2);
    std::vector<float>::reserve((void **)(a1 + 24), v35);
    if ((int)((unint64_t)v9 >> 2) >= 1)
    {
      uint64_t v15 = 0;
      uint64_t v16 = ((unint64_t)v9 >> 2);
      do
      {
        float v17 = stats::pearsonr(*(stats **)a1, (stats *)(*a2 + 4 * *(int *)(*(void *)(a1 + 48) + 4 * *(int *)(*a3 + 4 * v15))), (const float *)*a4);
        float v18 = v17;
        unint64_t v20 = *(float **)(a1 + 32);
        unint64_t v19 = *(void *)(a1 + 40);
        if ((unint64_t)v20 >= v19)
        {
          uint64_t v22 = (float *)*v14;
          uint64_t v23 = v20 - *v14;
          unint64_t v24 = v23 + 1;
          if ((unint64_t)(v23 + 1) >> 62) {
            std::vector<float>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v25 = v19 - (void)v22;
          if (v25 >> 1 > v24) {
            unint64_t v24 = v25 >> 1;
          }
          if ((unint64_t)v25 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v26 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v26 = v24;
          }
          if (v26)
          {
            float v27 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(a1 + 40, v26);
            uint64_t v22 = *(float **)(a1 + 24);
            unint64_t v20 = *(float **)(a1 + 32);
          }
          else
          {
            float v27 = 0;
          }
          float v28 = (float *)&v27[4 * v23];
          *float v28 = v18;
          int v21 = v28 + 1;
          while (v20 != v22)
          {
            int v29 = *((_DWORD *)v20-- - 1);
            *((_DWORD *)v28-- - 1) = v29;
          }
          *(void *)(a1 + 2std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = v28;
          *(void *)(a1 + 32) = v21;
          *(void *)(a1 + 4std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_processor_t>::reset[abi:ne180100](this, 0) = &v27[4 * v26];
          if (v22) {
            operator delete(v22);
          }
        }
        else
        {
          *unint64_t v20 = v17;
          int v21 = v20 + 1;
        }
        *(void *)(a1 + 32) = v21;
        ++v15;
      }
      while (v15 != v16);
    }
    float v37 = 0.0;
    std::vector<float>::vector(__C, v35);
    int v30 = __C[0];
    vDSP_vsq(*v14, 1, __C[0], 1, v35);
    vDSP_meanv_wrapper((uint64_t)v30, 1, &v37, v35);
    float v31 = v37;
    int32x2_t v7 = a5;
    int v6 = a6;
    if (__C[0])
    {
      __C[1] = __C[0];
      operator delete(__C[0]);
    }
    float v32 = sqrtf(v31);
  }
  switch(v6)
  {
    case 2:
      v7[21] = v32;
      break;
    case 1:
      v7[20] = v32;
      break;
    case 0:
      v7[19] = v32;
      break;
  }
}

void sub_25BA5A490(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *std::vector<unsigned long>::vector(void *a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<long long>::__vallocate[abi:ne180100](a1, a2);
    uint64_t v4 = (char *)a1[1];
    bzero(v4, 8 * a2);
    a1[1] = &v4[8 * a2];
  }
  return a1;
}

void sub_25BA5A508(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t Scandium::scandium_mvmt_detection_t::scandium_mvmt_detection_t(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 2std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = 0;
  *(void *)(a1 + 36) = 0x3F3504F33A83126FLL;
  *(_DWORD *)(a1 + 4std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = 0;
  std::__function::__value_func<void ()(BOOL)>::__value_func[abi:ne180100](a1 + 48, a2);
  std::__function::__value_func<void ()(BOOL)>::__value_func[abi:ne180100](a1 + 80, a3);
  *(_OWORD *)(a1 + 152) = 0u;
  *(_OWORD *)(a1 + 136) = 0u;
  Scandium::scandium_mvmt_detection_t::reset((Scandium::scandium_mvmt_detection_t *)a1);
  return a1;
}

void sub_25BA5A598(_Unwind_Exception *a1)
{
  std::__function::__value_func<void ()(BOOL)>::~__value_func[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void Scandium::scandium_mvmt_detection_t::reset(Scandium::scandium_mvmt_detection_t *this)
{
  *(unsigned char *)this = 0;
  *((unsigned char *)this + 16) = 0;
  *((_WORD *)this + 16) = 0;
  uint64_t v2 = (char *)this + 8;
  int v3 = 0;
  std::__fill_n[abi:ne180100]<false,std::vector<BOOL>>((uint64_t)&v2, 8uLL);
  uint64_t v2 = (char *)this + 24;
  int v3 = 0;
  std::__fill_n[abi:ne180100]<false,std::vector<BOOL>>((uint64_t)&v2, 1uLL);
  *((void *)this + 19) = *((void *)this + 18);
}

void Scandium::scandium_mvmt_detection_t::~scandium_mvmt_detection_t(Scandium::scandium_mvmt_detection_t *this)
{
  uint64_t v2 = (void *)*((void *)this + 18);
  if (v2)
  {
    *((void *)this + 19) = v2;
    operator delete(v2);
  }
  std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100]((void *)this + 14);
  std::__function::__value_func<void ()(BOOL)>::~__value_func[abi:ne180100]((void *)this + 10);
  std::__function::__value_func<void ()(BOOL)>::~__value_func[abi:ne180100]((void *)this + 6);
}

int32x2_t Scandium::scandium_mvmt_detection_t::set_config(int32x2_t *a1, uint64_t a2)
{
  a1[4].i32[1] = *(_DWORD *)(a2 + 12);
  int32x2_t result = vrev64_s32(*(int32x2_t *)(a2 + 28));
  a1[5] = result;
  return result;
}

uint64_t Scandium::scandium_mvmt_detection_t::process(uint64_t a1, uint64_t a2, unsigned int a3, const float *a4)
{
  *(_WORD *)(a1 + 32) = 0;
  uint64_t result = 1;
  if (a4)
  {
    if (a4 + a3 <= 0x3C0)
    {
      Scandium::scandium_mvmt_detection_t::processMvmt((int8x8_t *)a1, a2, a3, a4, *(float *)(a1 + 36));
      Scandium::scandium_mvmt_detection_t::processPosture((int8x8_t *)a1, a2, a3, a4, *(float *)(a1 + 40), *(float *)(a1 + 44));
      return 0;
    }
  }
  return result;
}

uint64_t Scandium::scandium_mvmt_detection_t::processMvmt(int8x8_t *a1, uint64_t a2, unsigned int a3, const float *a4, float a5)
{
  uint64_t result = 1;
  if (a4 && a4 + a3 <= 0x3C0)
  {
    uint64_t v9 = (stats *)(a2 + 4 * a3);
    float v10 = 0.0;
    uint64_t v11 = 3;
    do
    {
      float v12 = stats::variance(v9, a4, 1);
      if (v10 < v12) {
        float v10 = v12;
      }
      uint64_t v9 = (stats *)((char *)v9 + 3840);
      --v11;
    }
    while (v11);
    int v13 = a1->u8[0];
    a1->i8[0] = v10 >= a5;
    unint64_t v14 = (float *)a1[19];
    unint64_t v15 = (unint64_t)a1[20];
    if ((unint64_t)v14 >= v15)
    {
      float v17 = (float *)a1[18];
      uint64_t v18 = v14 - v17;
      if ((unint64_t)(v18 + 1) >> 62) {
        std::vector<float>::__throw_length_error[abi:ne180100]();
      }
      unint64_t v19 = v15 - (void)v17;
      unint64_t v20 = (uint64_t)(v15 - (void)v17) >> 1;
      if (v20 <= v18 + 1) {
        unint64_t v20 = v18 + 1;
      }
      if (v19 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v21 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v21 = v20;
      }
      if (v21)
      {
        uint64_t v22 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&a1[20], v21);
        float v17 = (float *)a1[18];
        unint64_t v14 = (float *)a1[19];
      }
      else
      {
        uint64_t v22 = 0;
      }
      uint64_t v23 = (float *)&v22[4 * v18];
      unint64_t v24 = &v22[4 * v21];
      *uint64_t v23 = v10;
      uint64_t v16 = v23 + 1;
      while (v14 != v17)
      {
        int v25 = *((_DWORD *)v14-- - 1);
        *((_DWORD *)v23-- - 1) = v25;
      }
      a1[18] = (int8x8_t)v23;
      a1[19] = (int8x8_t)v16;
      a1[20] = (int8x8_t)v24;
      if (v17) {
        operator delete(v17);
      }
    }
    else
    {
      *unint64_t v14 = v10;
      uint64_t v16 = v14 + 1;
    }
    a1[19] = (int8x8_t)v16;
    unint64_t v26 = a1 + 1;
    if (a1->i8[0])
    {
      int8x8_t v28 = *v26;
      std::bitset<8ul>::operator<<=[abi:ne180100]((uint64_t)&v28, 1uLL);
      unint64_t v27 = *(void *)&v28 | 1;
    }
    else
    {
      int8x8_t v28 = *v26;
      std::bitset<8ul>::operator<<=[abi:ne180100]((uint64_t)&v28, 1uLL);
      unint64_t v27 = *(void *)&v28 & 0xFFFFFFFFFFFFFFFELL;
    }
    a1[1] = (int8x8_t)v27;
    if (v13 != a1->u8[0])
    {
      char v29 = 1;
      if ((unint64_t)std::__count[abi:ne180100]<std::_ClassicAlgPolicy,std::__bitset<1ul,8ul>,true,BOOL,std::__identity,0>(a1 + 1, 0, (uint64_t)&a1[1], 8u, &v29) <= 7)
      {
        if (a1[9]) {
          std::function<void ()(BOOL)>::operator()((uint64_t)&a1[6], a1->i8[0]);
        }
      }
    }
    char v29 = 1;
    if ((unint64_t)std::__count[abi:ne180100]<std::_ClassicAlgPolicy,std::__bitset<1ul,8ul>,true,BOOL,std::__identity,0>(a1 + 1, 0, (uint64_t)&a1[1], 8u, &v29) < 8)
    {
      return 0;
    }
    else
    {
      uint64_t result = 0;
      a1[4].i8[0] = 1;
    }
  }
  return result;
}

uint64_t Scandium::scandium_mvmt_detection_t::processPosture(int8x8_t *a1, uint64_t a2, unsigned int a3, const float *a4, float a5, float a6)
{
  uint64_t result = 1;
  if (a4 && a4 + a3 <= 0x3C0)
  {
    uint64_t v11 = a2 + 4 * a3;
    float v12 = stats::mean((stats *)v11, a4);
    float v13 = stats::mean((stats *)(v11 + 7680), a4);
    int v14 = a1[2].u8[0];
    BOOL v15 = fabsf(v12) > a5;
    if (v13 > a6) {
      BOOL v15 = 1;
    }
    a1[2].i8[0] = v15;
    int8x8_t v17 = a1[3];
    if (v15)
    {
      std::bitset<1ul>::operator<<=[abi:ne180100]((uint64_t)&v17, 1);
      unint64_t v16 = *(void *)&v17 | 1;
    }
    else
    {
      std::bitset<1ul>::operator<<=[abi:ne180100]((uint64_t)&v17, 1);
      unint64_t v16 = *(void *)&v17 & 0xFFFFFFFFFFFFFFFELL;
    }
    a1[3] = (int8x8_t)v16;
    if (v14 != a1[2].u8[0])
    {
      char v18 = 1;
      if (!std::__count[abi:ne180100]<std::_ClassicAlgPolicy,std::__bitset<1ul,8ul>,true,BOOL,std::__identity,0>(a1 + 3, 0, (uint64_t)&a1[3], 1u, &v18))
      {
        if (a1[13]) {
          std::function<void ()(BOOL)>::operator()((uint64_t)&a1[10], a1[2].i8[0]);
        }
      }
    }
    char v18 = 1;
    uint64_t result = std::__count[abi:ne180100]<std::_ClassicAlgPolicy,std::__bitset<1ul,8ul>,true,BOOL,std::__identity,0>(a1 + 3, 0, (uint64_t)&a1[3], 1u, &v18);
    if (result)
    {
      uint64_t result = 0;
      a1[4].i8[1] = 1;
    }
  }
  return result;
}

uint64_t std::bitset<8ul>::operator<<=[abi:ne180100](uint64_t a1, unint64_t a2)
{
  if (a2 >= 8) {
    unint64_t v3 = 8;
  }
  else {
    unint64_t v3 = a2;
  }
  if (v3)
  {
    uint64_t v10 = a1;
    int v11 = 0;
    uint64_t v8 = a1;
    int v9 = 8 - v3;
    uint64_t v6 = a1;
    int v7 = 8;
    std::__copy_backward_unaligned[abi:ne180100]<std::__bitset<1ul,8ul>,false>((unint64_t)&v10, (uint64_t)&v8, (uint64_t)&v6, (uint64_t)v5);
    uint64_t v16 = a1;
    int v17 = 0;
    std::__fill_n[abi:ne180100]<false,std::vector<BOOL>>((uint64_t)&v16, v3);
  }
  else
  {
    uint64_t v16 = a1;
    int v17 = 0;
    uint64_t v14 = a1;
    int v15 = 8;
    uint64_t v12 = a1;
    int v13 = 8;
    std::__copy_backward_aligned[abi:ne180100]<std::__bitset<1ul,8ul>,false>((unsigned int *)&v16, (uint64_t)&v14, (uint64_t)&v12, (uint64_t)v5);
  }
  return a1;
}

unsigned int *std::__copy_backward_aligned[abi:ne180100]<std::__bitset<1ul,8ul>,false>@<X0>(unsigned int *result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  unint64_t v6 = *(unsigned int *)(a2 + 8);
  uint64_t v7 = result[2];
  uint64_t v8 = v6 + 8 * (*(void *)a2 - *(void *)result) - v7;
  int v9 = *(unint64_t **)a3;
  if (v8 >= 1)
  {
    if (v6)
    {
      if (v8 >= v6) {
        uint64_t v11 = *(unsigned int *)(a2 + 8);
      }
      else {
        uint64_t v11 = v6 + 8 * (*(void *)a2 - *(void *)result) - v7;
      }
      v8 -= v11;
      unint64_t v12 = (-1 << (v6 - v11)) & (0xFFFFFFFFFFFFFFFFLL >> -(char)v6);
      *int v9 = *v9 & ~v12 | **(void **)a2 & v12;
      *(_DWORD *)(a3 + 8) = (*(_DWORD *)(a3 + 8) - (_BYTE)v11) & 0x3F;
    }
    if (v8 >= 0) {
      uint64_t v13 = v8;
    }
    else {
      uint64_t v13 = v8 + 63;
    }
    uint64_t v14 = v13 >> 6;
    *(void *)a3 = &v9[-(v13 >> 6)];
    int v15 = (const void *)(*(void *)a2 - 8 * (v13 >> 6));
    *(void *)a2 = v15;
    if ((unint64_t)(v8 + 63) >= 0x7F) {
      uint64_t result = (unsigned int *)memmove(*(void **)a3, v15, 8 * v14);
    }
    if (v8 - (v14 << 6) <= 0)
    {
      int v9 = *(unint64_t **)a3;
    }
    else
    {
      uint64_t v16 = *(void *)(*(void *)a2 - 8);
      *(void *)a2 -= 8;
      int v9 = (unint64_t *)(*(void *)a3 - 8);
      unint64_t v17 = *v9;
      *(void *)a3 = v9;
      *int v9 = v17 & ~(-1 << (((_BYTE)v14 << 6) - v8)) | v16 & (-1 << (((_BYTE)v14 << 6)
                                                                                       - v8));
      *(_DWORD *)(a3 + 8) = -(int)v8 & 0x3F;
    }
  }
  *(void *)a4 = v9;
  *(_DWORD *)(a4 + 8) = *(_DWORD *)(a3 + 8);
  return result;
}

unint64_t std::__copy_backward_unaligned[abi:ne180100]<std::__bitset<1ul,8ul>,false>@<X0>(unint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  unint64_t v4 = *(unsigned int *)(a2 + 8);
  uint64_t v5 = *(unsigned int *)(result + 8);
  uint64_t v6 = v4 + 8 * (*(void *)a2 - *(void *)result) - v5;
  if (v6 <= 0)
  {
    LODWORD(v9) = *(_DWORD *)(a3 + 8);
  }
  else
  {
    if (v4)
    {
      if (v6 >= v4) {
        uint64_t v7 = *(unsigned int *)(a2 + 8);
      }
      else {
        uint64_t v7 = v4 + 8 * (*(void *)a2 - *(void *)result) - v5;
      }
      v6 -= v7;
      unint64_t v8 = (-1 << (v4 - v7)) & (0xFFFFFFFFFFFFFFFFLL >> -(char)v4) & **(void **)a2;
      unint64_t v9 = *(unsigned int *)(a3 + 8);
      if (v7 >= v9) {
        uint64_t v10 = *(unsigned int *)(a3 + 8);
      }
      else {
        uint64_t v10 = v7;
      }
      if (v10)
      {
        unint64_t v11 = v8 >> (v4 - v9);
        BOOL v12 = v9 >= v4;
        int v14 = v9 - v4;
        BOOL v13 = v14 != 0 && v12;
        unint64_t v15 = v8 << v14;
        if (!v13) {
          unint64_t v15 = v11;
        }
        **(void **)a3 = **(void **)a3 & ~((-1 << (v9 - v10)) & (0xFFFFFFFFFFFFFFFFLL >> -(char)v9)) | v15;
        LODWORD(v9) = ((_BYTE)v9 - (_BYTE)v10) & 0x3F;
        *(_DWORD *)(a3 + 8) = v9;
        v7 -= v10;
      }
      if (v7 >= 1)
      {
        uint64_t v16 = (unint64_t *)(*(void *)a3 - 8);
        unint64_t v9 = *v16;
        *(void *)a3 = v16;
        *(_DWORD *)(a3 + 8) = -(int)v7 & 0x3F;
        uint64_t v17 = v9 & ~(-1 << -(char)v7);
        int v18 = *(_DWORD *)(a2 + 8) - v7 - v10;
        *(_DWORD *)(a2 + 8) = v18;
        LODWORD(v9) = *(_DWORD *)(a3 + 8);
        unint64_t *v16 = (v8 << (v9 - v18)) | v17;
      }
    }
    else
    {
      LODWORD(v9) = *(_DWORD *)(a3 + 8);
    }
    char v19 = 64 - v9;
    unint64_t v20 = 0xFFFFFFFFFFFFFFFFLL >> -(char)v9;
    if (v6 < 64)
    {
      uint64_t v24 = v6;
    }
    else
    {
      do
      {
        unint64_t v21 = *(void *)(*(void *)a2 - 8);
        *(void *)a2 -= 8;
        uint64_t v22 = *(unint64_t **)a3;
        uint64_t result = v21 >> v19;
        *uint64_t v22 = **(void **)a3 & ~v20 | (v21 >> v19);
        uint64_t v23 = *--v22;
        *(void *)a3 = v22;
        *uint64_t v22 = v23 & v20 | (v21 << v9);
        uint64_t v24 = v6 - 64;
        BOOL v13 = (unint64_t)v6 > 0x7F;
        v6 -= 64;
      }
      while (v13);
    }
    if (v24 >= 1)
    {
      uint64_t v25 = *(void *)(*(void *)a2 - 8);
      *(void *)a2 -= 8;
      unint64_t v26 = v25 & (-1 << -(char)v24);
      if (v24 >= (unint64_t)v9) {
        uint64_t v27 = v9;
      }
      else {
        uint64_t v27 = v24;
      }
      uint64_t v28 = (-1 << (v9 - v27)) & v20;
      char v29 = *(unint64_t **)a3;
      **(void **)a3 = **(void **)a3 & ~v28 | (v26 >> v19);
      LODWORD(v9) = ((_BYTE)v9 - (_BYTE)v27) & 0x3F;
      *(_DWORD *)(a3 + 8) = v9;
      if (v24 - v27 >= 1)
      {
        uint64_t v31 = *(v29 - 1);
        int v30 = v29 - 1;
        *(void *)a3 = v30;
        *(_DWORD *)(a3 + 8) = (v27 - v24) & 0x3F;
        *int v30 = v31 & ~(-1 << (v27 - v24)) | (v26 << (v24 + ((v27 - v24) & 0x3F)));
        LODWORD(v9) = (v27 - v24) & 0x3F;
      }
    }
  }
  *(void *)a4 = *(void *)a3;
  *(_DWORD *)(a4 + 8) = v9;
  return result;
}

uint64_t std::__count[abi:ne180100]<std::_ClassicAlgPolicy,std::__bitset<1ul,8ul>,true,BOOL,std::__identity,0>(int8x8_t *a1, unsigned int a2, uint64_t a3, unsigned int a4, unsigned char *a5)
{
  unint64_t v5 = a4 - (unint64_t)a2 + 8 * (a3 - (void)a1);
  if (*a5) {
    return std::__count_BOOL[abi:ne180100]<true,std::__bitset<1ul,8ul>,true>(a1, a2, v5);
  }
  else {
    return std::__count_BOOL[abi:ne180100]<false,std::__bitset<1ul,8ul>,true>((uint64_t *)a1, a2, v5);
  }
}

uint64_t std::__count_BOOL[abi:ne180100]<true,std::__bitset<1ul,8ul>,true>(int8x8_t *a1, unsigned int a2, unint64_t a3)
{
  uint64_t v3 = a2;
  if (a2)
  {
    if (64 - a2 >= a3) {
      unint64_t v4 = a3;
    }
    else {
      unint64_t v4 = 64 - a2;
    }
    uint64_t v5 = (uint64_t)*a1++;
    uint8x8_t v6 = (uint8x8_t)vcnt_s8((int8x8_t)((0xFFFFFFFFFFFFFFFFLL >> (64 - a2 - v4)) & (-1 << a2) & v5));
    v6.i16[0] = vaddlv_u8(v6);
    uint64_t v3 = v6.u32[0];
    a3 -= v4;
  }
  if (a3 >= 0x40)
  {
    do
    {
      int8x8_t v7 = *a1++;
      uint8x8_t v8 = (uint8x8_t)vcnt_s8(v7);
      v8.i16[0] = vaddlv_u8(v8);
      v3 += v8.u32[0];
      a3 -= 64;
    }
    while (a3 > 0x3F);
  }
  if (a3)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)(*(void *)a1 & (0xFFFFFFFFFFFFFFFFLL >> -(char)a3)));
    v9.i16[0] = vaddlv_u8(v9);
    v3 += v9.u32[0];
  }
  return v3;
}

uint64_t std::__count_BOOL[abi:ne180100]<false,std::__bitset<1ul,8ul>,true>(uint64_t *a1, unsigned int a2, unint64_t a3)
{
  uint64_t v3 = a2;
  if (a2)
  {
    if (64 - a2 >= a3) {
      unint64_t v4 = a3;
    }
    else {
      unint64_t v4 = 64 - a2;
    }
    uint64_t v5 = *a1++;
    uint8x8_t v6 = (uint8x8_t)vcnt_s8((int8x8_t)((0xFFFFFFFFFFFFFFFFLL >> (64 - a2 - v4)) & (-1 << a2) & ~v5));
    v6.i16[0] = vaddlv_u8(v6);
    uint64_t v3 = v6.u32[0];
    a3 -= v4;
  }
  if (a3 >= 0x40)
  {
    do
    {
      uint64_t v7 = *a1++;
      uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)~v7);
      v8.i16[0] = vaddlv_u8(v8);
      v3 += v8.u32[0];
      a3 -= 64;
    }
    while (a3 > 0x3F);
  }
  if (a3)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)((0xFFFFFFFFFFFFFFFFLL >> -(char)a3) & ~*a1));
    v9.i16[0] = vaddlv_u8(v9);
    v3 += v9.u32[0];
  }
  return v3;
}

uint64_t std::bitset<1ul>::operator<<=[abi:ne180100](uint64_t a1, uint64_t a2)
{
  unint64_t v3 = a2 != 0;
  if (a2)
  {
    uint64_t v10 = a1;
    int v11 = 0;
    uint64_t v8 = a1;
    BOOL v9 = a2 == 0;
    uint64_t v6 = a1;
    int v7 = 1;
    std::__copy_backward_unaligned[abi:ne180100]<std::__bitset<1ul,8ul>,false>((unint64_t)&v10, (uint64_t)&v8, (uint64_t)&v6, (uint64_t)v5);
    uint64_t v16 = a1;
    int v17 = 0;
    std::__fill_n[abi:ne180100]<false,std::vector<BOOL>>((uint64_t)&v16, v3);
  }
  else
  {
    uint64_t v16 = a1;
    int v17 = 0;
    uint64_t v14 = a1;
    int v15 = 1;
    uint64_t v12 = a1;
    int v13 = 1;
    std::__copy_backward_aligned[abi:ne180100]<std::__bitset<1ul,8ul>,false>((unsigned int *)&v16, (uint64_t)&v14, (uint64_t)&v12, (uint64_t)v5);
  }
  return a1;
}

uint64_t scandium::Processor::convert_algs_analytics@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(_OWORD *)(a3 + 24std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = 0u;
  *(_OWORD *)(a3 + 228) = 0u;
  *(_OWORD *)(a3 + 212) = 0u;
  *(_OWORD *)(a3 + 196) = 0u;
  *(_OWORD *)(a3 + 18std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_processor_t>::reset[abi:ne180100](this, 0) = 0u;
  *(_OWORD *)(a3 + 16std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = 0u;
  *(_OWORD *)(a3 + 148) = 0u;
  *(_OWORD *)(a3 + 132) = 0u;
  *(_OWORD *)(a3 + 116) = 0u;
  *(_OWORD *)(a3 + 10std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_processor_t>::reset[abi:ne180100](this, 0) = 0u;
  *(_OWORD *)(a3 + 8std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = 0u;
  *(_OWORD *)(a3 + 52) = 0u;
  *(_OWORD *)(a3 + 68) = 0u;
  *(_OWORD *)(a3 + 42std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_processor_t>::reset[abi:ne180100](this, 0) = 0u;
  *(_OWORD *)(a3 + 436) = 0u;
  *(_OWORD *)(a3 + 388) = 0u;
  *(_OWORD *)(a3 + 40std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = 0u;
  *(_OWORD *)(a3 + 356) = 0u;
  *(_OWORD *)(a3 + 372) = 0u;
  *(_OWORD *)(a3 + 32std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = 0u;
  *(_OWORD *)(a3 + 34std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_processor_t>::reset[abi:ne180100](this, 0) = 0u;
  *(_OWORD *)(a3 + 292) = 0u;
  *(_OWORD *)(a3 + 308) = 0u;
  *(_OWORD *)(a3 + 26std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_processor_t>::reset[abi:ne180100](this, 0) = 0u;
  *(_OWORD *)(a3 + 276) = 0u;
  long long v3 = *(_OWORD *)(result + 16);
  *(_OWORD *)a3 = *(_OWORD *)result;
  *(_OWORD *)(a3 + 16) = v3;
  *(_OWORD *)(a3 + 32) = *(_OWORD *)(result + 32);
  *(void *)(a3 + 56) = *(void *)(result + 56);
  *(void *)(a3 + 8std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_processor_t>::reset[abi:ne180100](this, 0) = *(void *)(result + 68);
  *(_OWORD *)(a3 + 88) = *(_OWORD *)(result + 76);
  LODWORD(v3) = *(_DWORD *)(result + 96);
  *(_DWORD *)(a3 + 10std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = *(_DWORD *)(result + 92);
  *(_DWORD *)(a3 + 112) = v3;
  long long v4 = *(_OWORD *)(result + 100);
  *((void *)&v4 + 1) = *(void *)(result + 196);
  *(_OWORD *)(a3 + 116) = v4;
  LODWORD(v3) = *(_DWORD *)(result + 208);
  *(_DWORD *)(a3 + 132) = *(_DWORD *)(result + 204);
  *(_OWORD *)(a3 + 136) = *(_OWORD *)(result + 108);
  *(_DWORD *)(a3 + 152) = *(_DWORD *)(result + 124);
  *(_OWORD *)(a3 + 156) = *(_OWORD *)(result + 136);
  *(_OWORD *)(a3 + 216) = *(_OWORD *)(result + 212);
  *(_OWORD *)(a3 + 232) = *(_OWORD *)(result + 228);
  long long v5 = *(_OWORD *)(result + 176);
  *(_OWORD *)(a3 + 248) = *(_OWORD *)(result + 160);
  *(_DWORD *)(a3 + 452) = 0;
  *(unsigned char *)(a3 + 108) = *(unsigned char *)(a2 + 14);
  *(_WORD *)(a3 + 48) = *(_WORD *)(result + 48);
  *(unsigned char *)(a3 + 5std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_processor_t>::reset[abi:ne180100](this, 0) = *(unsigned char *)(result + 50);
  *(_WORD *)(a3 + std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100]((void *)this + 51) = *(_WORD *)(result + 51);
  *(_DWORD *)(a3 + 6std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = *(_DWORD *)(result + 64);
  *(_WORD *)(a3 + 172) = *(_WORD *)(result + 152);
  *(_DWORD *)(a3 + 17std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = *(_DWORD *)(result + 154);
  *(unsigned char *)(a3 + 178) = *(unsigned char *)(result + 436);
  *(_WORD *)(a3 + 18std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_processor_t>::reset[abi:ne180100](this, 0) = *(_WORD *)(result + 438);
  int v6 = *(_DWORD *)(result + 268);
  int v7 = *(_DWORD *)(result + 248);
  *(_DWORD *)(a3 + 18std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = *(_DWORD *)(result + 244);
  *(_DWORD *)(a3 + 188) = v6;
  int v8 = *(_DWORD *)(result + 256);
  *(_DWORD *)(a3 + 192) = *(_DWORD *)(result + 252);
  *(_DWORD *)(a3 + 196) = *(_DWORD *)(result + 260);
  *(_DWORD *)(a3 + 20std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_processor_t>::reset[abi:ne180100](this, 0) = v7;
  *(_DWORD *)(a3 + 20std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = *(_DWORD *)(result + 272);
  *(_DWORD *)(a3 + 208) = v8;
  *(_DWORD *)(a3 + 212) = *(_DWORD *)(result + 264);
  *(_OWORD *)(a3 + 26std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = v5;
  *(_DWORD *)(a3 + 28std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_processor_t>::reset[abi:ne180100](this, 0) = *(_DWORD *)(result + 192);
  *(void *)(a3 + 28std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = *(void *)(result + 128);
  *(_DWORD *)(a3 + 292) = v3;
  long long v9 = *(_OWORD *)(result + 292);
  *(_OWORD *)(a3 + 296) = *(_OWORD *)(result + 276);
  *(_OWORD *)(a3 + 312) = v9;
  long long v10 = *(_OWORD *)(result + 324);
  *(_OWORD *)(a3 + 328) = *(_OWORD *)(result + 308);
  *(_OWORD *)(a3 + 34std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = v10;
  long long v11 = *(_OWORD *)(result + 356);
  *(_OWORD *)(a3 + 36std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_processor_t>::reset[abi:ne180100](this, 0) = *(_OWORD *)(result + 340);
  *(_OWORD *)(a3 + 376) = v11;
  long long v12 = *(_OWORD *)(result + 388);
  *(_OWORD *)(a3 + 392) = *(_OWORD *)(result + 372);
  *(_OWORD *)(a3 + 408) = v12;
  long long v13 = *(_OWORD *)(result + 420);
  *(_OWORD *)(a3 + 42std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = *(_OWORD *)(result + 404);
  *(_OWORD *)(a3 + 44std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_processor_t>::reset[abi:ne180100](this, 0) = v13;
  if (*(_WORD *)(a2 + 12))
  {
    double v14 = (double)*(uint64_t *)a2 * 0.0078125 / (double)*(unsigned __int16 *)(a2 + 12);
    if (!*(unsigned char *)(a3 + 76)) {
      *(unsigned char *)(a3 + 76) = 1;
    }
    float v15 = v14;
    *(float *)(a3 + 72) = v15;
  }
  *(_DWORD *)(a3 + 68) = *(_DWORD *)(a2 + 8);
  return result;
}

void scandium::Processor::Processor(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  *(void *)a1 = 0;
  uint64_t v7 = *(unsigned int *)(a2 + 116);
  if (v7 != -1)
  {
    *(void *)&long long v31 = v29;
    *(_WORD *)(a1 + 8) = ((uint64_t (*)(long long *))off_270933978[v7])(&v31);
    uint64_t v13 = *(unsigned int *)(a2 + 116);
    if (v13 != -1)
    {
      *(void *)&long long v31 = v29;
      *(unsigned char *)(a1 + 1std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_processor_t>::reset[abi:ne180100](this, 0) = ((uint64_t (*)(long long *, uint64_t))off_270933988[v13])(&v31, a2);
      *(void *)(a1 + 16) = 0;
      *(void *)(a1 + 23) = 0;
      if (*(_WORD *)(a1 + 8))
      {
        int v14 = *(_DWORD *)(a2 + 116);
        if (v14)
        {
          if (v14 != 1) {
            std::__throw_bad_variant_access[abi:ne180100]();
          }
          long long v15 = *(_OWORD *)(a2 + 80);
          void v29[4] = *(_OWORD *)(a2 + 64);
          v29[5] = v15;
          v30[0] = *(_OWORD *)(a2 + 96);
          *(_DWORD *)((char *)v30 + 15) = *(_DWORD *)(a2 + 111);
          long long v16 = *(_OWORD *)(a2 + 16);
          v29[0] = *(_OWORD *)a2;
          v29[1] = v16;
          long long v17 = *(_OWORD *)(a2 + 48);
          v29[2] = *(_OWORD *)(a2 + 32);
          v29[3] = v17;
        }
        else
        {
          long long v18 = *(_OWORD *)(a2 + 80);
          v30[6] = *(_OWORD *)(a2 + 64);
          v30[7] = v18;
          void v30[8] = *(_OWORD *)(a2 + 96);
          long long v19 = *(_OWORD *)(a2 + 16);
          void v30[2] = *(_OWORD *)a2;
          v30[3] = v19;
          long long v20 = *(_OWORD *)(a2 + 48);
          void v30[4] = *(_OWORD *)(a2 + 32);
          v30[5] = v20;
        }
        std::__function::__value_func<void ()(scandium::Result,scandium::Analytics const&)>::__value_func[abi:ne180100]((uint64_t)v27, a3);
        uint64_t v28 = a1;
        std::__function::__value_func<void ()(scandium::AbortReason,scandium::Analytics const&)>::__value_func[abi:ne180100]((uint64_t)v25, a4);
        uint64_t v26 = a1;
        std::__function::__value_func<void ()(BOOL)>::__value_func[abi:ne180100]((uint64_t)v23, a5);
        uint64_t v24 = a1;
        std::__function::__value_func<void ()(BOOL)>::__value_func[abi:ne180100]((uint64_t)v22, a6);
        v22[4] = a1;
        if (v14) {
          operator new();
        }
        operator new();
      }
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x26116E2B0](exception, "start packet indicated a zero-length session");
      __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
    }
    std::__throw_bad_variant_access[abi:ne180100]();
  }
  std::__throw_bad_variant_access[abi:ne180100]();
}

void sub_25BA5B8A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  std::__function::__value_func<void ()(BOOL)>::~__value_func[abi:ne180100](&a64);
  std::__function::__value_func<void ()(BOOL)>::~__value_func[abi:ne180100](&a59);
  std::__function::__value_func<void ()(BOOL)>::~__value_func[abi:ne180100](&STACK[0x200]);
  std::__function::__value_func<void ()(BOOL)>::~__value_func[abi:ne180100](&a68);
  std::__function::__value_func<void ()(Scandium::AbortReason)>::~__value_func[abi:ne180100](&STACK[0x248]);
  std::__function::__value_func<void ()(scandium::AbortReason,scandium::Analytics const&)>::~__value_func[abi:ne180100](&STACK[0x220]);
  std::__function::__value_func<void ()(Scandium::ScandiumPPG::SpO2Result)>::~__value_func[abi:ne180100]((void *)(v70 - 256));
  std::__function::__value_func<void ()(scandium::Result,scandium::Analytics const&)>::~__value_func[abi:ne180100](&STACK[0x268]);
  MEMORY[0x26116E390](v69, 0x20C4093837F09);
  std::__function::__value_func<void ()(BOOL)>::~__value_func[abi:ne180100](&a9);
  std::__function::__value_func<void ()(BOOL)>::~__value_func[abi:ne180100](&a14);
  std::__function::__value_func<void ()(scandium::AbortReason,scandium::Analytics const&)>::~__value_func[abi:ne180100](&a19);
  std::__function::__value_func<void ()(scandium::Result,scandium::Analytics const&)>::~__value_func[abi:ne180100](&a24);
  std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_monitor_t>::reset[abi:ne180100](v68, 0);
  _Unwind_Resume(a1);
}

void scandium::Processor::~Processor(id ****this)
{
}

{
  std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_monitor_t>::reset[abi:ne180100](this, 0);
}

void scandium::Processor::process(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 208);
  v9[12] = *(_OWORD *)(a2 + 192);
  v9[13] = v2;
  v10[0] = *(_OWORD *)(a2 + 224);
  *(void *)((char *)v10 + 15) = *(void *)(a2 + 239);
  long long v3 = *(_OWORD *)(a2 + 144);
  v9[8] = *(_OWORD *)(a2 + 128);
  v9[9] = v3;
  long long v4 = *(_OWORD *)(a2 + 176);
  v9[10] = *(_OWORD *)(a2 + 160);
  v9[11] = v4;
  long long v5 = *(_OWORD *)(a2 + 80);
  v9[4] = *(_OWORD *)(a2 + 64);
  v9[5] = v5;
  long long v6 = *(_OWORD *)(a2 + 112);
  v9[6] = *(_OWORD *)(a2 + 96);
  v9[7] = v6;
  long long v7 = *(_OWORD *)(a2 + 16);
  v9[0] = *(_OWORD *)a2;
  v9[1] = v7;
  long long v8 = *(_OWORD *)(a2 + 48);
  v9[2] = *(_OWORD *)(a2 + 32);
  void v9[3] = v8;
  ++*(_WORD *)(a1 + 28);
  *(void *)(a1 + 16) += *(int *)(a2 + 243);
  Scandium::ScandiumPPG::scandium_spo2_monitor_t::scandium_spo2_monitor_process(*(Scandium::ScandiumPPG::scandium_spo2_processor_t ***)a1, (uint64_t)v9);
}

uint64_t scandium::Processor::max_packet_count(scandium::Processor *this)
{
  return *((unsigned __int16 *)this + 4);
}

uint64_t scandium::Processor::background(scandium::Processor *this)
{
  return *((unsigned __int8 *)this + 10);
}

uint64_t std::__variant_detail::__visitation::__base::__dispatcher<0ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_0> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&>(uint64_t a1, uint64_t a2)
{
  return *(unsigned __int16 *)(a2 + 11);
}

uint64_t std::__variant_detail::__visitation::__base::__dispatcher<1ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_0> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&>(uint64_t a1, uint64_t a2)
{
  return *(unsigned __int16 *)(a2 + 11);
}

BOOL std::__variant_detail::__visitation::__base::__dispatcher<0ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_1> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&>(uint64_t a1, uint64_t a2)
{
  return *(unsigned char *)(a2 + 13) == 2;
}

BOOL std::__variant_detail::__visitation::__base::__dispatcher<1ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_1> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&>(uint64_t a1, uint64_t a2)
{
  return *(unsigned char *)(a2 + 13) == 2;
}

id ***std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_monitor_t>::reset[abi:ne180100](id ****a1, id ***a2)
{
  uint64_t result = *a1;
  *a1 = a2;
  if (result)
  {
    Scandium::ScandiumPPG::scandium_spo2_monitor_t::~scandium_spo2_monitor_t(result);
    JUMPOUT(0x26116E390);
  }
  return result;
}

uint64_t std::__function::__value_func<void ()(scandium::Result,scandium::Analytics const&)>::__value_func[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(void *)(a1 + 2std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = a1;
      (*(void (**)(void, uint64_t))(**(void **)(a2 + 24) + 24))(*(void *)(a2 + 24), a1);
    }
    else
    {
      *(void *)(a1 + 2std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 16))(v3);
    }
  }
  else
  {
    *(void *)(a1 + 2std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = 0;
  }
  return a1;
}

{
  void *v3;
  uint64_t v4;

  uint64_t v3 = (void *)(a2 + 24);
  long long v4 = *(void *)(a2 + 24);
  if (v4)
  {
    if (v4 == a2)
    {
      *(void *)(a1 + 2std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = a1;
      (*(void (**)(void, uint64_t))(*(void *)*v3 + 24))(*v3, a1);
      return a1;
    }
    *(void *)(a1 + 2std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = v4;
  }
  else
  {
    uint64_t v3 = (void *)(a1 + 24);
  }
  *uint64_t v3 = 0;
  return a1;
}

uint64_t std::__function::__value_func<void ()(scandium::AbortReason,scandium::Analytics const&)>::__value_func[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(void *)(a1 + 2std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = a1;
      (*(void (**)(void, uint64_t))(**(void **)(a2 + 24) + 24))(*(void *)(a2 + 24), a1);
    }
    else
    {
      *(void *)(a1 + 2std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 16))(v3);
    }
  }
  else
  {
    *(void *)(a1 + 2std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = 0;
  }
  return a1;
}

{
  void *v3;
  uint64_t v4;

  uint64_t v3 = (void *)(a2 + 24);
  long long v4 = *(void *)(a2 + 24);
  if (v4)
  {
    if (v4 == a2)
    {
      *(void *)(a1 + 2std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = a1;
      (*(void (**)(void, uint64_t))(*(void *)*v3 + 24))(*v3, a1);
      return a1;
    }
    *(void *)(a1 + 2std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = v4;
  }
  else
  {
    uint64_t v3 = (void *)(a1 + 24);
  }
  *uint64_t v3 = 0;
  return a1;
}

void *std::__function::__func<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_2,std::allocator<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_2>,void ()(Scandium::ScandiumPPG::SpO2Result)>::~__func(void *a1)
{
  *a1 = &unk_2709339A8;
  std::__function::__value_func<void ()(scandium::Result,scandium::Analytics const&)>::~__value_func[abi:ne180100](a1 + 1);
  return a1;
}

void std::__function::__func<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_2,std::allocator<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_2>,void ()(Scandium::ScandiumPPG::SpO2Result)>::~__func(void *a1)
{
  *a1 = &unk_2709339A8;
  std::__function::__value_func<void ()(scandium::Result,scandium::Analytics const&)>::~__value_func[abi:ne180100](a1 + 1);
  JUMPOUT(0x26116E390);
}

void *std::__function::__func<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_2,std::allocator<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_2>,void ()(Scandium::ScandiumPPG::SpO2Result)>::__clone(uint64_t a1)
{
  uint64_t v2 = a1 + 8;
  uint64_t v3 = operator new(0x30uLL);
  *uint64_t v3 = &unk_2709339A8;
  std::__function::__value_func<void ()(scandium::Result,scandium::Analytics const&)>::__value_func[abi:ne180100]((uint64_t)(v3 + 1), v2);
  v3[5] = *(void *)(a1 + 40);
  return v3;
}

void sub_25BA5BDA8(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t std::__function::__func<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_2,std::allocator<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_2>,void ()(Scandium::ScandiumPPG::SpO2Result)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_2709339A8;
  uint64_t result = std::__function::__value_func<void ()(scandium::Result,scandium::Analytics const&)>::__value_func[abi:ne180100]((uint64_t)(a2 + 1), a1 + 8);
  a2[5] = *(void *)(a1 + 40);
  return result;
}

void *std::__function::__func<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_2,std::allocator<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_2>,void ()(Scandium::ScandiumPPG::SpO2Result)>::destroy(uint64_t a1)
{
  return std::__function::__value_func<void ()(scandium::Result,scandium::Analytics const&)>::~__value_func[abi:ne180100]((void *)(a1 + 8));
}

void std::__function::__func<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_2,std::allocator<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_2>,void ()(Scandium::ScandiumPPG::SpO2Result)>::destroy_deallocate(void *a1)
{
  std::__function::__value_func<void ()(scandium::Result,scandium::Analytics const&)>::~__value_func[abi:ne180100](a1 + 1);
  operator delete(a1);
}

uint64_t std::__function::__func<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_2,std::allocator<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_2>,void ()(Scandium::ScandiumPPG::SpO2Result)>::operator()(uint64_t result, float *a2)
{
  if (*(void *)(result + 32))
  {
    uint64_t v2 = result + 8;
    float v3 = *a2;
    float v4 = a2[1];
    uint64_t v5 = *(void *)(result + 40);
    Scandium::ScandiumPPG::scandium_spo2_monitor_t::get_core_analytics(*(Scandium::ScandiumPPG::scandium_spo2_monitor_t **)v5, v46);
    *(unsigned char *)(v5 + 3std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_monitor_t>::reset[abi:ne180100](this, 0) = 1;
    *(_OWORD *)&v21[8] = 0u;
    *(_OWORD *)&v16[12] = 0u;
    *(_OWORD *)long long v15 = 0u;
    *(_DWORD *)&v12[1] = 0;
    v9[0] = v46[0];
    v9[1] = v46[1];
    v9[2] = v46[2];
    uint64_t v13 = v50;
    *(void *)&v15[12] = v52;
    *(_OWORD *)long long v16 = v53;
    *(_DWORD *)&v16[16] = v54;
    *(void *)&long long v6 = v56;
    *((void *)&v6 + 1) = v66;
    *(_DWORD *)&v16[24] = v55;
    long long v17 = v6;
    long long v19 = v57;
    int v18 = v67;
    int v20 = v58;
    *(_OWORD *)unint64_t v21 = v60;
    long long v31 = v69;
    v32[0] = v70;
    v32[1] = v63;
    v16[20] = 1;
    __int16 v10 = v47;
    char v11 = v48;
    *(_WORD *)long long v12 = v49;
    int v14 = v51;
    *(_WORD *)&v21[16] = v61;
    *(_DWORD *)&v21[18] = v62;
    v21[22] = v89;
    int v22 = v90;
    int v23 = v71;
    int v24 = v77;
    int v25 = v73;
    int v26 = v75;
    int v27 = v72;
    int v28 = v78;
    int v29 = v74;
    int v30 = v76;
    _DWORD v32[2] = v64;
    int v33 = v65;
    uint64_t v34 = v59;
    int v35 = v68;
    long long v36 = v79;
    long long v37 = v80;
    long long v38 = v81;
    long long v39 = v82;
    long long v40 = v83;
    long long v41 = v84;
    long long v42 = v85;
    long long v43 = v86;
    long long v44 = v87;
    long long v45 = v88;
    if (*(_WORD *)(v5 + 28))
    {
      double v7 = (double)*(uint64_t *)(v5 + 16) * 0.0078125 / (double)*(unsigned __int16 *)(v5 + 28);
      if (!v15[8]) {
        v15[8] = 1;
      }
      float v8 = v7;
      *(float *)&v15[4] = v8;
    }
    *(_DWORD *)long long v15 = *(_DWORD *)(v5 + 24);
    return std::function<void ()(scandium::Result,scandium::Analytics const&)>::operator()(v2, (uint64_t)v9, v3, v4);
  }
  return result;
}

uint64_t std::__function::__func<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_2,std::allocator<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_2>,void ()(Scandium::ScandiumPPG::SpO2Result)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_2,std::allocator<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_2>,void ()(Scandium::ScandiumPPG::SpO2Result)>::target_type()
{
}

uint64_t std::function<void ()(scandium::Result,scandium::Analytics const&)>::operator()(uint64_t a1, uint64_t a2, float a3, float a4)
{
  *(float *)long long v6 = a3;
  *(float *)&v6[1] = a4;
  uint64_t v4 = *(void *)(a1 + 24);
  if (!v4) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  return (*(uint64_t (**)(uint64_t, _DWORD *, uint64_t))(*(void *)v4 + 48))(v4, v6, a2);
}

void *std::__function::__func<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_3,std::allocator<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_3>,void ()(Scandium::AbortReason)>::~__func(void *a1)
{
  *a1 = &unk_270933A38;
  std::__function::__value_func<void ()(scandium::AbortReason,scandium::Analytics const&)>::~__value_func[abi:ne180100](a1 + 1);
  return a1;
}

void std::__function::__func<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_3,std::allocator<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_3>,void ()(Scandium::AbortReason)>::~__func(void *a1)
{
  *a1 = &unk_270933A38;
  std::__function::__value_func<void ()(scandium::AbortReason,scandium::Analytics const&)>::~__value_func[abi:ne180100](a1 + 1);
  JUMPOUT(0x26116E390);
}

void *std::__function::__func<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_3,std::allocator<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_3>,void ()(Scandium::AbortReason)>::__clone(uint64_t a1)
{
  uint64_t v2 = a1 + 8;
  float v3 = operator new(0x30uLL);
  *float v3 = &unk_270933A38;
  std::__function::__value_func<void ()(scandium::AbortReason,scandium::Analytics const&)>::__value_func[abi:ne180100]((uint64_t)(v3 + 1), v2);
  v3[5] = *(void *)(a1 + 40);
  return v3;
}

void sub_25BA5C2EC(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t std::__function::__func<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_3,std::allocator<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_3>,void ()(Scandium::AbortReason)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_270933A38;
  uint64_t result = std::__function::__value_func<void ()(scandium::AbortReason,scandium::Analytics const&)>::__value_func[abi:ne180100]((uint64_t)(a2 + 1), a1 + 8);
  a2[5] = *(void *)(a1 + 40);
  return result;
}

void *std::__function::__func<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_3,std::allocator<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_3>,void ()(Scandium::AbortReason)>::destroy(uint64_t a1)
{
  return std::__function::__value_func<void ()(scandium::AbortReason,scandium::Analytics const&)>::~__value_func[abi:ne180100]((void *)(a1 + 8));
}

void std::__function::__func<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_3,std::allocator<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_3>,void ()(Scandium::AbortReason)>::destroy_deallocate(void *a1)
{
  std::__function::__value_func<void ()(scandium::AbortReason,scandium::Analytics const&)>::~__value_func[abi:ne180100](a1 + 1);
  operator delete(a1);
}

uint64_t std::__function::__func<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_3,std::allocator<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_3>,void ()(Scandium::AbortReason)>::operator()(uint64_t result, char *a2)
{
  if (*(void *)(result + 32))
  {
    uint64_t v2 = result + 8;
    uint64_t v3 = *(void *)(result + 40);
    if (*a2 - 1 >= 0xA) {
      char v4 = 0;
    }
    else {
      char v4 = *a2;
    }
    Scandium::ScandiumPPG::scandium_spo2_monitor_t::get_core_analytics(*(Scandium::ScandiumPPG::scandium_spo2_monitor_t **)v3, &v5);
    *(unsigned char *)(v3 + 3std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_monitor_t>::reset[abi:ne180100](this, 0) = *(unsigned __int16 *)(v3 + 28) == *(unsigned __int16 *)(v3 + 8);
    return std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>::operator()(v2, v4);
  }
  return result;
}

uint64_t std::__function::__func<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_3,std::allocator<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_3>,void ()(Scandium::AbortReason)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_3,std::allocator<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_3>,void ()(Scandium::AbortReason)>::target_type()
{
}

uint64_t std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>::operator()(uint64_t a1, char a2)
{
  char v4 = a2;
  uint64_t v2 = *(void *)(a1 + 24);
  if (!v2) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  return (*(uint64_t (**)(uint64_t, char *))(*(void *)v2 + 48))(v2, &v4);
}

void *std::__function::__func<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_4,std::allocator<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_4>,void ()(BOOL)>::~__func(void *a1)
{
  *a1 = &unk_270933AC8;
  std::__function::__value_func<void ()(BOOL)>::~__value_func[abi:ne180100](a1 + 1);
  return a1;
}

void std::__function::__func<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_4,std::allocator<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_4>,void ()(BOOL)>::~__func(void *a1)
{
  *a1 = &unk_270933AC8;
  std::__function::__value_func<void ()(BOOL)>::~__value_func[abi:ne180100](a1 + 1);
  JUMPOUT(0x26116E390);
}

void *std::__function::__func<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_4,std::allocator<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_4>,void ()(BOOL)>::__clone(uint64_t a1)
{
  uint64_t v2 = a1 + 8;
  uint64_t v3 = operator new(0x30uLL);
  *uint64_t v3 = &unk_270933AC8;
  std::__function::__value_func<void ()(BOOL)>::__value_func[abi:ne180100]((uint64_t)(v3 + 1), v2);
  v3[5] = *(void *)(a1 + 40);
  return v3;
}

void sub_25BA5C838(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t std::__function::__func<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_4,std::allocator<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_4>,void ()(BOOL)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_270933AC8;
  uint64_t result = std::__function::__value_func<void ()(BOOL)>::__value_func[abi:ne180100]((uint64_t)(a2 + 1), a1 + 8);
  a2[5] = *(void *)(a1 + 40);
  return result;
}

void *std::__function::__func<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_4,std::allocator<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_4>,void ()(BOOL)>::destroy(uint64_t a1)
{
  return std::__function::__value_func<void ()(BOOL)>::~__value_func[abi:ne180100]((void *)(a1 + 8));
}

void std::__function::__func<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_4,std::allocator<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_4>,void ()(BOOL)>::destroy_deallocate(void *a1)
{
  std::__function::__value_func<void ()(BOOL)>::~__value_func[abi:ne180100](a1 + 1);
  operator delete(a1);
}

uint64_t std::__function::__func<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_4,std::allocator<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_4>,void ()(BOOL)>::operator()(uint64_t a1, unsigned char *a2)
{
  int v2 = *a2;
  if (*a2) {
    ++*(_WORD *)(*(void *)(a1 + 40) + 24);
  }
  return std::function<void ()(BOOL)>::operator()(a1 + 8, v2 != 0);
}

uint64_t std::__function::__func<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_4,std::allocator<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_4>,void ()(BOOL)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_4,std::allocator<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_4>,void ()(BOOL)>::target_type()
{
}

void *std::__function::__func<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_5,std::allocator<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_5>,void ()(BOOL)>::~__func(void *a1)
{
  *a1 = &unk_270933B48;
  std::__function::__value_func<void ()(BOOL)>::~__value_func[abi:ne180100](a1 + 1);
  return a1;
}

void std::__function::__func<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_5,std::allocator<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_5>,void ()(BOOL)>::~__func(void *a1)
{
  *a1 = &unk_270933B48;
  std::__function::__value_func<void ()(BOOL)>::~__value_func[abi:ne180100](a1 + 1);
  JUMPOUT(0x26116E390);
}

void *std::__function::__func<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_5,std::allocator<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_5>,void ()(BOOL)>::__clone(uint64_t a1)
{
  uint64_t v2 = a1 + 8;
  uint64_t v3 = operator new(0x30uLL);
  *uint64_t v3 = &unk_270933B48;
  std::__function::__value_func<void ()(BOOL)>::__value_func[abi:ne180100]((uint64_t)(v3 + 1), v2);
  v3[5] = *(void *)(a1 + 40);
  return v3;
}

void sub_25BA5CAE8(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t std::__function::__func<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_5,std::allocator<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_5>,void ()(BOOL)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_270933B48;
  uint64_t result = std::__function::__value_func<void ()(BOOL)>::__value_func[abi:ne180100]((uint64_t)(a2 + 1), a1 + 8);
  a2[5] = *(void *)(a1 + 40);
  return result;
}

void *std::__function::__func<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_5,std::allocator<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_5>,void ()(BOOL)>::destroy(uint64_t a1)
{
  return std::__function::__value_func<void ()(BOOL)>::~__value_func[abi:ne180100]((void *)(a1 + 8));
}

void std::__function::__func<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_5,std::allocator<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_5>,void ()(BOOL)>::destroy_deallocate(void *a1)
{
  std::__function::__value_func<void ()(BOOL)>::~__value_func[abi:ne180100](a1 + 1);
  operator delete(a1);
}

uint64_t std::__function::__func<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_5,std::allocator<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_5>,void ()(BOOL)>::operator()(uint64_t a1, unsigned char *a2)
{
  int v2 = *a2;
  if (*a2) {
    ++*(_WORD *)(*(void *)(a1 + 40) + 26);
  }
  return std::function<void ()(BOOL)>::operator()(a1 + 8, v2 != 0);
}

uint64_t std::__function::__func<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_5,std::allocator<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_5>,void ()(BOOL)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_5,std::allocator<scandium::Processor::Processor(std::variant<scandium::SessionStartPacketV3,scandium::SessionStartPacketV4> const&,std::function<void ()(scandium::Result,scandium::Analytics const&)>,std::function<void ()(scandium::AbortReason,scandium::Analytics const&)>,std::function<void ()(BOOL)>,std::function<void ()(BOOL)>,BOOL,std::string const&)::$_5>,void ()(BOOL)>::target_type()
{
}

uint64_t Scandium::ScandiumPPG::scandium_optical_fom_t::scandium_optical_fom_t(uint64_t a1, int a2, unsigned int a3, unsigned int a4)
{
  *(_OWORD *)(a1 + 2std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = 0u;
  *(_OWORD *)(a1 + 8) = 0u;
  *(_DWORD *)(a1 + 4std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_monitor_t>::reset[abi:ne180100](this, 0) = 1065353216;
  *(_OWORD *)(a1 + 12std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_monitor_t>::reset[abi:ne180100](this, 0) = 0u;
  *(_OWORD *)(a1 + 136) = 0u;
  *(_DWORD *)(a1 + 152) = 1065353216;
  *(_OWORD *)(a1 + 16std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_monitor_t>::reset[abi:ne180100](this, 0) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_DWORD *)(a1 + 192) = 1065353216;
  *(_OWORD *)(a1 + 20std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_monitor_t>::reset[abi:ne180100](this, 0) = 0u;
  *(_OWORD *)(a1 + 216) = 0u;
  *(_DWORD *)(a1 + 232) = 1065353216;
  *(_OWORD *)(a1 + 24std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_monitor_t>::reset[abi:ne180100](this, 0) = 0u;
  *(_OWORD *)(a1 + 256) = 0u;
  *(_DWORD *)(a1 + 272) = 1065353216;
  *(_OWORD *)(a1 + 28std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_monitor_t>::reset[abi:ne180100](this, 0) = 0u;
  *(_OWORD *)(a1 + 296) = 0u;
  *(_DWORD *)(a1 + 312) = 1065353216;
  *(_OWORD *)(a1 + 32std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_monitor_t>::reset[abi:ne180100](this, 0) = 0u;
  *(_OWORD *)(a1 + 336) = 0u;
  *(_DWORD *)(a1 + 352) = 1065353216;
  Scandium::ScandiumPPG::scandium_optical_fom_t::opt_gen_to_hw_fom((Scandium::ScandiumPPG::scandium_optical_fom_t *)a1, a2, a3, a4);
  *(void *)(a1 + 392) = 0;
  *(_OWORD *)(a1 + 36std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_monitor_t>::reset[abi:ne180100](this, 0) = 0u;
  *(_OWORD *)(a1 + 376) = 0u;
  return a1;
}

void sub_25BA5CC90(_Unwind_Exception *a1)
{
  Scandium::ScandiumPPG::scandium_optical_fom_t::hw_fom::~hw_fom(v1);
  _Unwind_Resume(a1);
}

uint64_t Scandium::ScandiumPPG::scandium_optical_fom_t::opt_gen_to_hw_fom(Scandium::ScandiumPPG::scandium_optical_fom_t *this, int a2, unsigned int a3, unsigned int a4)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  if (a2 == 3)
  {
    Scandium::ScandiumPPG::scandium_optical_fom_t::get_s10_params(this, a3, a4, (uint64_t)&v12);
    *(void *)this = v12;
    std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__move_assign((uint64_t)this + 8, v13);
    long long v9 = v17;
    *((_OWORD *)this + 5) = v16;
    *((_OWORD *)this + 6) = v9;
    *((void *)this + 1std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = v18;
    long long v10 = v15;
    *((_OWORD *)this + 3) = v14;
    *((_OWORD *)this + std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = v10;
    std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__move_assign((uint64_t)this + 120, v19);
    std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__move_assign((uint64_t)this + 160, v20);
    std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__move_assign((uint64_t)this + 200, v21);
    std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__move_assign((uint64_t)this + 240, v22);
    std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__move_assign((uint64_t)this + 280, v23);
    float v8 = (char *)this + 320;
  }
  else
  {
    if (a2 == 2)
    {
      uint64_t v12 = 0x3DCCCCCD00000000;
      long long v39 = xmmword_25BA64BD0;
      uint64_t v40 = 0x3F4CCCCD00000002;
      std::unordered_map<Scandium::ScandiumPPG::PathType,float>::unordered_map((uint64_t)v13, (unsigned __int8 *)&v39, 3);
      long long v14 = xmmword_25BA64EE0;
      long long v15 = xmmword_25BA64EF0;
      long long v16 = xmmword_25BA64F00;
      long long v17 = xmmword_25BA64F10;
      uint64_t v18 = 1065353216;
      long long v25 = xmmword_25BA64390;
      long long v26 = unk_25BA643A0;
      long long v27 = xmmword_25BA643B0;
      long long v28 = unk_25BA643C0;
      std::unordered_map<int,float>::unordered_map((uint64_t)v19, (int *)&v25, 8);
      long long v37 = xmmword_25BA64C28;
      uint64_t v38 = 0x313A3AD300000002;
      std::unordered_map<Scandium::ScandiumPPG::PathType,float>::unordered_map((uint64_t)v20, (unsigned __int8 *)&v37, 3);
      long long v35 = xmmword_25BA64C40;
      uint64_t v36 = 0x31335B9B00000002;
      std::unordered_map<Scandium::ScandiumPPG::PathType,float>::unordered_map((uint64_t)v21, (unsigned __int8 *)&v35, 3);
      long long v33 = xmmword_25BA64C58;
      uint64_t v34 = 0x428C000000000002;
      std::unordered_map<Scandium::ScandiumPPG::PathType,float>::unordered_map((uint64_t)v22, (unsigned __int8 *)&v33, 3);
      long long v31 = xmmword_25BA64C58;
      uint64_t v32 = 0x428C000000000002;
      std::unordered_map<Scandium::ScandiumPPG::PathType,float>::unordered_map((uint64_t)v23, (unsigned __int8 *)&v31, 3);
      long long v29 = xmmword_25BA64C70;
      uint64_t v30 = 0x3E4CCCCD00000002;
      std::unordered_map<Scandium::ScandiumPPG::PathType,float>::unordered_map((uint64_t)v24, (unsigned __int8 *)&v29, 3);
    }
    else
    {
      if (a2 != 1) {
        Scandium::ScandiumPPG::scandium_optical_fom_t::opt_gen_to_hw_fom();
      }
      uint64_t v12 = 0x3DCCCCCD00000000;
      long long v39 = xmmword_25BA64BD0;
      uint64_t v40 = 0x3F4CCCCD00000002;
      std::unordered_map<Scandium::ScandiumPPG::PathType,float>::unordered_map((uint64_t)v13, (unsigned __int8 *)&v39, 3);
      long long v14 = xmmword_25BA64F20;
      long long v15 = xmmword_25BA64F30;
      long long v16 = xmmword_25BA64F40;
      long long v17 = xmmword_25BA64F50;
      uint64_t v18 = 1065353216;
      long long v25 = xmmword_25BA64328;
      long long v26 = unk_25BA64338;
      long long v27 = xmmword_25BA64348;
      *(void *)&long long v28 = 0x3445FF7C00075300;
      std::unordered_map<int,float>::unordered_map((uint64_t)v19, (int *)&v25, 7);
      long long v37 = xmmword_25BA64360;
      uint64_t v38 = 0x3162C63700000002;
      std::unordered_map<Scandium::ScandiumPPG::PathType,float>::unordered_map((uint64_t)v20, (unsigned __int8 *)&v37, 3);
      long long v35 = xmmword_25BA64378;
      uint64_t v36 = 0x30A4ED3F00000002;
      std::unordered_map<Scandium::ScandiumPPG::PathType,float>::unordered_map((uint64_t)v21, (unsigned __int8 *)&v35, 3);
      long long v33 = xmmword_25BA64C58;
      uint64_t v34 = 0x428C000000000002;
      std::unordered_map<Scandium::ScandiumPPG::PathType,float>::unordered_map((uint64_t)v22, (unsigned __int8 *)&v33, 3);
      long long v31 = xmmword_25BA64C58;
      uint64_t v32 = 0x428C000000000002;
      std::unordered_map<Scandium::ScandiumPPG::PathType,float>::unordered_map((uint64_t)v23, (unsigned __int8 *)&v31, 3);
      long long v29 = xmmword_25BA64C70;
      uint64_t v30 = 0x3E4CCCCD00000002;
      std::unordered_map<Scandium::ScandiumPPG::PathType,float>::unordered_map((uint64_t)v24, (unsigned __int8 *)&v29, 3);
    }
    *(void *)this = v12;
    std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__move_assign((uint64_t)this + 8, v13);
    long long v6 = v17;
    *((_OWORD *)this + 5) = v16;
    *((_OWORD *)this + 6) = v6;
    *((void *)this + 1std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = v18;
    long long v7 = v15;
    *((_OWORD *)this + 3) = v14;
    *((_OWORD *)this + std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = v7;
    std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__move_assign((uint64_t)this + 120, v19);
    std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__move_assign((uint64_t)this + 160, v20);
    std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__move_assign((uint64_t)this + 200, v21);
    std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__move_assign((uint64_t)this + 240, v22);
    std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__move_assign((uint64_t)this + 280, v23);
    float v8 = (char *)this + 320;
  }
  std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__move_assign((uint64_t)v8, v24);
  std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::~__hash_table((uint64_t)v24);
  std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::~__hash_table((uint64_t)v23);
  std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::~__hash_table((uint64_t)v22);
  std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::~__hash_table((uint64_t)v21);
  std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::~__hash_table((uint64_t)v20);
  std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::~__hash_table((uint64_t)v19);
  uint64_t result = std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::~__hash_table((uint64_t)v13);
  *(_DWORD *)this = a2;
  return result;
}

void sub_25BA5D1B0(_Unwind_Exception *a1)
{
  std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::~__hash_table(v6);
  std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::~__hash_table(v5);
  std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::~__hash_table(v4);
  std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::~__hash_table(v3);
  std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::~__hash_table(v2);
  std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

void Scandium::ScandiumPPG::scandium_optical_fom_t::hw_fom::~hw_fom(Scandium::ScandiumPPG::scandium_optical_fom_t::hw_fom *this)
{
}

uint64_t Scandium::ScandiumPPG::scandium_optical_fom_t::get_s10_params@<X0>(Scandium::ScandiumPPG::scandium_optical_fom_t *this@<X0>, unsigned int a2@<W1>, unsigned int a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  log = Scandium::algs_get_log(this);
  BOOL v8 = os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT);
  if (a2 > 0x2E) {
    unsigned __int8 v9 = -1;
  }
  else {
    unsigned __int8 v9 = a2;
  }
  if (a2 <= 0x2E)
  {
    int v11 = v9;
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_25BA34000, log, OS_LOG_TYPE_DEFAULT, "Scandium using MDM noise estimation parameters", buf, 2u);
    }
    Scandium::ScandiumPPG::scandium_optical_fom_t::get_mdm_params((Scandium *)v8, v11, buf);
    if (!BYTE8(v28)) {
      __assert_rtn("get_s10_params", "scandium_optical_fom.cpp", 339, "cur_mdm_param.has_value()");
    }
    *(void *)a4 = 0x3DCCCCCD00000000;
    long long v24 = xmmword_25BA64BD0;
    uint64_t v25 = 0x3F4CCCCD00000002;
    std::unordered_map<Scandium::ScandiumPPG::PathType,float>::unordered_map(a4 + 8, (unsigned __int8 *)&v24, 3);
    double v12 = 128.0 / (double)a3;
    float v13 = v12 * 9980.0 * 0.19525;
    *(_OWORD *)(a4 + 4std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::~__hash_table((uint64_t)this + 8) = xmmword_25BA64F60;
    *(_DWORD *)(a4 + 6std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = 1067114824;
    *(float *)&double v12 = v12 * 8000.0 * 0.19525 * 2.46740127;
    *(_DWORD *)(a4 + 6std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::~__hash_table((uint64_t)this + 8) = LODWORD(v12);
    *(float *)(a4 + 72) = v13;
    *(void *)(a4 + 76) = 0x3F9AE148378637BDLL;
    *(_DWORD *)(a4 + 8std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = LODWORD(v12);
    *(float *)(a4 + 8std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::~__hash_table((uint64_t)this + 8) = v13;
    *(void *)(a4 + 92) = 0x3F9AE148378637BDLL;
    *(_DWORD *)(a4 + 10std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_monitor_t>::reset[abi:ne180100](this, 0) = LODWORD(v12);
    *(float *)(a4 + 10std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = v13;
    *(void *)(a4 + 10std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::~__hash_table((uint64_t)this + 8) = *(void *)buf;
    *(_DWORD *)(a4 + 116) = *(_DWORD *)&buf[8];
    std::unordered_map<int,float>::unordered_map(a4 + 120, (uint64_t)v27);
    long long v22 = xmmword_25BA64C28;
    uint64_t v23 = 0x313A3AD300000002;
    std::unordered_map<Scandium::ScandiumPPG::PathType,float>::unordered_map(a4 + 160, (unsigned __int8 *)&v22, 3);
    long long v20 = xmmword_25BA64C40;
    uint64_t v21 = 0x31335B9B00000002;
    std::unordered_map<Scandium::ScandiumPPG::PathType,float>::unordered_map(a4 + 200, (unsigned __int8 *)&v20, 3);
    long long v18 = xmmword_25BA64C58;
    uint64_t v19 = 0x428C000000000002;
    std::unordered_map<Scandium::ScandiumPPG::PathType,float>::unordered_map(a4 + 240, (unsigned __int8 *)&v18, 3);
    long long v16 = xmmword_25BA64C58;
    uint64_t v17 = 0x428C000000000002;
    std::unordered_map<Scandium::ScandiumPPG::PathType,float>::unordered_map(a4 + 280, (unsigned __int8 *)&v16, 3);
    long long v14 = xmmword_25BA64C70;
    uint64_t v15 = 0x3E4CCCCD00000002;
    uint64_t result = std::unordered_map<Scandium::ScandiumPPG::PathType,float>::unordered_map(a4 + 320, (unsigned __int8 *)&v14, 3);
    if (BYTE8(v28)) {
      return std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::~__hash_table((uint64_t)v27);
    }
  }
  else
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_25BA34000, log, OS_LOG_TYPE_DEFAULT, "Scandium using DCS noise estimation parameters", buf, 2u);
    }
    *(void *)a4 = 0x3DCCCCCD00000000;
    long long v24 = xmmword_25BA64BD0;
    uint64_t v25 = 0x3F4CCCCD00000002;
    std::unordered_map<Scandium::ScandiumPPG::PathType,float>::unordered_map(a4 + 8, (unsigned __int8 *)&v24, 3);
    *(_OWORD *)(a4 + 4std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::~__hash_table((uint64_t)this + 8) = xmmword_25BA64F60;
    *(_OWORD *)(a4 + 6std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = xmmword_25BA64F70;
    *(_OWORD *)(a4 + 8std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_monitor_t>::reset[abi:ne180100](this, 0) = xmmword_25BA64F70;
    *(_OWORD *)(a4 + 96) = xmmword_25BA64F80;
    *(void *)(a4 + 112) = 1065353216;
    *(_OWORD *)buf = xmmword_25BA64BE8;
    v27[0] = unk_25BA64BF8;
    v27[1] = xmmword_25BA64C08;
    long long v28 = unk_25BA64C18;
    std::unordered_map<int,float>::unordered_map(a4 + 120, (int *)buf, 8);
    long long v22 = xmmword_25BA64C28;
    uint64_t v23 = 0x313A3AD300000002;
    std::unordered_map<Scandium::ScandiumPPG::PathType,float>::unordered_map(a4 + 160, (unsigned __int8 *)&v22, 3);
    long long v20 = xmmword_25BA64C40;
    uint64_t v21 = 0x31335B9B00000002;
    std::unordered_map<Scandium::ScandiumPPG::PathType,float>::unordered_map(a4 + 200, (unsigned __int8 *)&v20, 3);
    long long v18 = xmmword_25BA64C58;
    uint64_t v19 = 0x428C000000000002;
    std::unordered_map<Scandium::ScandiumPPG::PathType,float>::unordered_map(a4 + 240, (unsigned __int8 *)&v18, 3);
    long long v16 = xmmword_25BA64C58;
    uint64_t v17 = 0x428C000000000002;
    std::unordered_map<Scandium::ScandiumPPG::PathType,float>::unordered_map(a4 + 280, (unsigned __int8 *)&v16, 3);
    long long v14 = xmmword_25BA64C70;
    uint64_t v15 = 0x3E4CCCCD00000002;
    return std::unordered_map<Scandium::ScandiumPPG::PathType,float>::unordered_map(a4 + 320, (unsigned __int8 *)&v14, 3);
  }
  return result;
}

void sub_25BA5D6E4(_Unwind_Exception *a1)
{
  std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::~__hash_table(v6);
  std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::~__hash_table(v5);
  std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::~__hash_table(v4);
  std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::~__hash_table(v3);
  std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::~__hash_table(v2);
  std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::~__hash_table(v1);
  if (*(unsigned char *)(v7 - 104)) {
    std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::~__hash_table(v7 - 144);
  }
  _Unwind_Resume(a1);
}

void Scandium::ScandiumPPG::scandium_optical_fom_t::get_mdm_params(Scandium *a1@<X0>, int a2@<W1>, unsigned char *a3@<X8>)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  *a3 = 0;
  a3[56] = 0;
  switch(a2)
  {
    case 9:
      uint64_t v6 = 0x3F7E7D5636A7C5ACLL;
      int v7 = 16;
      *(_OWORD *)buf = xmmword_25BA643D0;
      long long v10 = unk_25BA643E0;
      long long v11 = xmmword_25BA643F0;
      long long v12 = unk_25BA64400;
      std::unordered_map<int,float>::unordered_map((uint64_t)v8, (int *)buf, 8);
      std::optional<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params>::operator=[abi:ne180100]<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params,void>((uint64_t)a3, &v6);
      goto LABEL_36;
    case 12:
      uint64_t v6 = 0x3F7D4FDF36A7C5ACLL;
      int v7 = 21;
      *(_OWORD *)buf = xmmword_25BA64410;
      long long v10 = unk_25BA64420;
      long long v11 = xmmword_25BA64430;
      long long v12 = unk_25BA64440;
      std::unordered_map<int,float>::unordered_map((uint64_t)v8, (int *)buf, 8);
      std::optional<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params>::operator=[abi:ne180100]<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params,void>((uint64_t)a3, &v6);
      goto LABEL_36;
    case 14:
      uint64_t v6 = 0x3F7C84B636A7C5ACLL;
      int v7 = 24;
      *(_OWORD *)buf = xmmword_25BA64450;
      long long v10 = unk_25BA64460;
      long long v11 = xmmword_25BA64470;
      long long v12 = unk_25BA64480;
      std::unordered_map<int,float>::unordered_map((uint64_t)v8, (int *)buf, 8);
      std::optional<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params>::operator=[abi:ne180100]<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params,void>((uint64_t)a3, &v6);
      goto LABEL_36;
    case 16:
      uint64_t v6 = 0x3F7BC6A836A7C5ACLL;
      int v7 = 27;
      *(_OWORD *)buf = xmmword_25BA64490;
      long long v10 = unk_25BA644A0;
      long long v11 = xmmword_25BA644B0;
      long long v12 = unk_25BA644C0;
      std::unordered_map<int,float>::unordered_map((uint64_t)v8, (int *)buf, 8);
      std::optional<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params>::operator=[abi:ne180100]<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params,void>((uint64_t)a3, &v6);
      goto LABEL_36;
    case 18:
      uint64_t v6 = 0x3F7AC71136A7C5ACLL;
      int v7 = 30;
      *(_OWORD *)buf = xmmword_25BA644D0;
      long long v10 = unk_25BA644E0;
      long long v11 = xmmword_25BA644F0;
      long long v12 = unk_25BA64500;
      std::unordered_map<int,float>::unordered_map((uint64_t)v8, (int *)buf, 8);
      std::optional<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params>::operator=[abi:ne180100]<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params,void>((uint64_t)a3, &v6);
      goto LABEL_36;
    case 19:
      uint64_t v6 = 0x3F7A1CAC36A7C5ACLL;
      int v7 = 32;
      *(_OWORD *)buf = xmmword_25BA64510;
      long long v10 = unk_25BA64520;
      long long v11 = xmmword_25BA64530;
      long long v12 = unk_25BA64540;
      std::unordered_map<int,float>::unordered_map((uint64_t)v8, (int *)buf, 8);
      std::optional<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params>::operator=[abi:ne180100]<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params,void>((uint64_t)a3, &v6);
      goto LABEL_36;
    case 20:
      uint64_t v6 = 0x3F79518336A7C5ACLL;
      int v7 = 34;
      *(_OWORD *)buf = xmmword_25BA64550;
      long long v10 = unk_25BA64560;
      long long v11 = xmmword_25BA64570;
      long long v12 = unk_25BA64580;
      std::unordered_map<int,float>::unordered_map((uint64_t)v8, (int *)buf, 8);
      std::optional<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params>::operator=[abi:ne180100]<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params,void>((uint64_t)a3, &v6);
      goto LABEL_36;
    case 21:
      uint64_t v6 = 0x3F785F0736A7C5ACLL;
      int v7 = 37;
      *(_OWORD *)buf = xmmword_25BA64590;
      long long v10 = unk_25BA645A0;
      long long v11 = xmmword_25BA645B0;
      long long v12 = unk_25BA645C0;
      std::unordered_map<int,float>::unordered_map((uint64_t)v8, (int *)buf, 8);
      std::optional<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params>::operator=[abi:ne180100]<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params,void>((uint64_t)a3, &v6);
      goto LABEL_36;
    case 23:
      uint64_t v6 = 0x3F77319036A7C5ACLL;
      int v7 = 40;
      *(_OWORD *)buf = xmmword_25BA645D0;
      long long v10 = unk_25BA645E0;
      long long v11 = xmmword_25BA645F0;
      long long v12 = unk_25BA64600;
      std::unordered_map<int,float>::unordered_map((uint64_t)v8, (int *)buf, 8);
      std::optional<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params>::operator=[abi:ne180100]<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params,void>((uint64_t)a3, &v6);
      goto LABEL_36;
    case 24:
      uint64_t v6 = 0x3F75C91D36A7C5ACLL;
      int v7 = 43;
      *(_OWORD *)buf = xmmword_25BA64610;
      long long v10 = unk_25BA64620;
      long long v11 = xmmword_25BA64630;
      long long v12 = unk_25BA64640;
      std::unordered_map<int,float>::unordered_map((uint64_t)v8, (int *)buf, 8);
      std::optional<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params>::operator=[abi:ne180100]<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params,void>((uint64_t)a3, &v6);
      goto LABEL_36;
    case 25:
      uint64_t v6 = 0x3F73F7CF36A7C5ACLL;
      int v7 = 47;
      *(_OWORD *)buf = xmmword_25BA64650;
      long long v10 = unk_25BA64660;
      long long v11 = xmmword_25BA64670;
      long long v12 = unk_25BA64680;
      std::unordered_map<int,float>::unordered_map((uint64_t)v8, (int *)buf, 8);
      std::optional<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params>::operator=[abi:ne180100]<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params,void>((uint64_t)a3, &v6);
      goto LABEL_36;
    case 26:
      uint64_t v6 = 0x3F72EB1C36A7C5ACLL;
      int v7 = 49;
      *(_OWORD *)buf = xmmword_25BA64690;
      long long v10 = unk_25BA646A0;
      long long v11 = xmmword_25BA646B0;
      long long v12 = unk_25BA646C0;
      std::unordered_map<int,float>::unordered_map((uint64_t)v8, (int *)buf, 8);
      std::optional<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params>::operator=[abi:ne180100]<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params,void>((uint64_t)a3, &v6);
      goto LABEL_36;
    case 27:
      uint64_t v6 = 0x3F71A9FC36A7C5ACLL;
      int v7 = 52;
      *(_OWORD *)buf = xmmword_25BA646D0;
      long long v10 = unk_25BA646E0;
      long long v11 = xmmword_25BA646F0;
      long long v12 = unk_25BA64700;
      std::unordered_map<int,float>::unordered_map((uint64_t)v8, (int *)buf, 8);
      std::optional<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params>::operator=[abi:ne180100]<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params,void>((uint64_t)a3, &v6);
      goto LABEL_36;
    case 28:
      uint64_t v6 = 0x3F70418936A7C5ACLL;
      int v7 = 55;
      *(_OWORD *)buf = xmmword_25BA64710;
      long long v10 = unk_25BA64720;
      long long v11 = xmmword_25BA64730;
      long long v12 = unk_25BA64740;
      std::unordered_map<int,float>::unordered_map((uint64_t)v8, (int *)buf, 8);
      std::optional<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params>::operator=[abi:ne180100]<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params,void>((uint64_t)a3, &v6);
      goto LABEL_36;
    case 29:
      uint64_t v6 = 0x3F6EA4A936A7C5ACLL;
      int v7 = 58;
      *(_OWORD *)buf = xmmword_25BA64750;
      long long v10 = unk_25BA64760;
      long long v11 = xmmword_25BA64770;
      long long v12 = unk_25BA64780;
      std::unordered_map<int,float>::unordered_map((uint64_t)v8, (int *)buf, 8);
      std::optional<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params>::operator=[abi:ne180100]<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params,void>((uint64_t)a3, &v6);
      goto LABEL_36;
    case 30:
      uint64_t v6 = 0x3F6CC63F36A7C5ACLL;
      int v7 = 61;
      *(_OWORD *)buf = xmmword_25BA64790;
      long long v10 = unk_25BA647A0;
      long long v11 = xmmword_25BA647B0;
      long long v12 = unk_25BA647C0;
      std::unordered_map<int,float>::unordered_map((uint64_t)v8, (int *)buf, 8);
      std::optional<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params>::operator=[abi:ne180100]<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params,void>((uint64_t)a3, &v6);
      goto LABEL_36;
    case 31:
      uint64_t v6 = 0x3F6A92A336A7C5ACLL;
      int v7 = 65;
      *(_OWORD *)buf = xmmword_25BA647D0;
      long long v10 = unk_25BA647E0;
      long long v11 = xmmword_25BA647F0;
      long long v12 = unk_25BA64800;
      std::unordered_map<int,float>::unordered_map((uint64_t)v8, (int *)buf, 8);
      std::optional<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params>::operator=[abi:ne180100]<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params,void>((uint64_t)a3, &v6);
      goto LABEL_36;
    case 32:
      uint64_t v6 = 0x3F6809D536A7C5ACLL;
      int v7 = 69;
      *(_OWORD *)buf = xmmword_25BA64810;
      long long v10 = unk_25BA64820;
      long long v11 = xmmword_25BA64830;
      long long v12 = unk_25BA64840;
      std::unordered_map<int,float>::unordered_map((uint64_t)v8, (int *)buf, 8);
      std::optional<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params>::operator=[abi:ne180100]<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params,void>((uint64_t)a3, &v6);
      goto LABEL_36;
    case 33:
      uint64_t v6 = 0x3F669AD436A7C5ACLL;
      int v7 = 72;
      *(_OWORD *)buf = xmmword_25BA64850;
      long long v10 = unk_25BA64860;
      long long v11 = xmmword_25BA64870;
      long long v12 = unk_25BA64880;
      std::unordered_map<int,float>::unordered_map((uint64_t)v8, (int *)buf, 8);
      std::optional<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params>::operator=[abi:ne180100]<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params,void>((uint64_t)a3, &v6);
      goto LABEL_36;
    case 34:
      uint64_t v6 = 0x3F65048136A7C5ACLL;
      int v7 = 74;
      *(_OWORD *)buf = xmmword_25BA64890;
      long long v10 = unk_25BA648A0;
      long long v11 = xmmword_25BA648B0;
      long long v12 = unk_25BA648C0;
      std::unordered_map<int,float>::unordered_map((uint64_t)v8, (int *)buf, 8);
      std::optional<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params>::operator=[abi:ne180100]<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params,void>((uint64_t)a3, &v6);
      goto LABEL_36;
    case 35:
      uint64_t v6 = 0x3F6353F836A7C5ACLL;
      int v7 = 77;
      *(_OWORD *)buf = xmmword_25BA648D0;
      long long v10 = unk_25BA648E0;
      long long v11 = xmmword_25BA648F0;
      long long v12 = unk_25BA64900;
      std::unordered_map<int,float>::unordered_map((uint64_t)v8, (int *)buf, 8);
      std::optional<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params>::operator=[abi:ne180100]<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params,void>((uint64_t)a3, &v6);
      goto LABEL_36;
    case 36:
      uint64_t v6 = 0x3F61758E36A7C5ACLL;
      int v7 = 80;
      *(_OWORD *)buf = xmmword_25BA64910;
      long long v10 = unk_25BA64920;
      long long v11 = xmmword_25BA64930;
      long long v12 = unk_25BA64940;
      std::unordered_map<int,float>::unordered_map((uint64_t)v8, (int *)buf, 8);
      std::optional<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params>::operator=[abi:ne180100]<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params,void>((uint64_t)a3, &v6);
      goto LABEL_36;
    case 37:
      uint64_t v6 = 0x3F5F6FD236A7C5ACLL;
      int v7 = 83;
      *(_OWORD *)buf = xmmword_25BA64950;
      long long v10 = unk_25BA64960;
      long long v11 = xmmword_25BA64970;
      long long v12 = unk_25BA64980;
      std::unordered_map<int,float>::unordered_map((uint64_t)v8, (int *)buf, 8);
      std::optional<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params>::operator=[abi:ne180100]<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params,void>((uint64_t)a3, &v6);
      goto LABEL_36;
    case 38:
      uint64_t v6 = 0x3F5D2F1B36A7C5ACLL;
      int v7 = 87;
      *(_OWORD *)buf = xmmword_25BA64990;
      long long v10 = unk_25BA649A0;
      long long v11 = xmmword_25BA649B0;
      long long v12 = unk_25BA649C0;
      std::unordered_map<int,float>::unordered_map((uint64_t)v8, (int *)buf, 8);
      std::optional<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params>::operator=[abi:ne180100]<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params,void>((uint64_t)a3, &v6);
      goto LABEL_36;
    case 39:
      uint64_t v6 = 0x3F5AC08336A7C5ACLL;
      int v7 = 91;
      *(_OWORD *)buf = xmmword_25BA649D0;
      long long v10 = unk_25BA649E0;
      long long v11 = xmmword_25BA649F0;
      long long v12 = unk_25BA64A00;
      std::unordered_map<int,float>::unordered_map((uint64_t)v8, (int *)buf, 8);
      std::optional<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params>::operator=[abi:ne180100]<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params,void>((uint64_t)a3, &v6);
      goto LABEL_36;
    case 40:
      uint64_t v6 = 0x3F58106236A7C5ACLL;
      int v7 = 95;
      *(_OWORD *)buf = xmmword_25BA64A10;
      long long v10 = unk_25BA64A20;
      long long v11 = xmmword_25BA64A30;
      long long v12 = unk_25BA64A40;
      std::unordered_map<int,float>::unordered_map((uint64_t)v8, (int *)buf, 8);
      std::optional<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params>::operator=[abi:ne180100]<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params,void>((uint64_t)a3, &v6);
      goto LABEL_36;
    case 41:
      uint64_t v6 = 0x3F55119D36D613C8;
      int v7 = 99;
      *(_OWORD *)buf = xmmword_25BA64A50;
      long long v10 = unk_25BA64A60;
      long long v11 = xmmword_25BA64A70;
      long long v12 = unk_25BA64A80;
      std::unordered_map<int,float>::unordered_map((uint64_t)v8, (int *)buf, 8);
      std::optional<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params>::operator=[abi:ne180100]<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params,void>((uint64_t)a3, &v6);
      goto LABEL_36;
    case 42:
      uint64_t v6 = 0x3F51D14E36D613C8;
      int v7 = 104;
      *(_OWORD *)buf = xmmword_25BA64A90;
      long long v10 = unk_25BA64AA0;
      long long v11 = xmmword_25BA64AB0;
      long long v12 = unk_25BA64AC0;
      std::unordered_map<int,float>::unordered_map((uint64_t)v8, (int *)buf, 8);
      std::optional<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params>::operator=[abi:ne180100]<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params,void>((uint64_t)a3, &v6);
      goto LABEL_36;
    case 43:
      uint64_t v6 = 0x3F4E353F36D613C8;
      int v7 = 110;
      *(_OWORD *)buf = xmmword_25BA64AD0;
      long long v10 = unk_25BA64AE0;
      long long v11 = xmmword_25BA64AF0;
      long long v12 = unk_25BA64B00;
      std::unordered_map<int,float>::unordered_map((uint64_t)v8, (int *)buf, 8);
      std::optional<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params>::operator=[abi:ne180100]<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params,void>((uint64_t)a3, &v6);
      goto LABEL_36;
    case 44:
      uint64_t v6 = 0x3F4A29C736D613C8;
      int v7 = 116;
      *(_OWORD *)buf = xmmword_25BA64B10;
      long long v10 = unk_25BA64B20;
      long long v11 = xmmword_25BA64B30;
      long long v12 = unk_25BA64B40;
      std::unordered_map<int,float>::unordered_map((uint64_t)v8, (int *)buf, 8);
      std::optional<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params>::operator=[abi:ne180100]<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params,void>((uint64_t)a3, &v6);
      goto LABEL_36;
    case 45:
      uint64_t v6 = 0x3F45BC0236D613C8;
      int v7 = 123;
      *(_OWORD *)buf = xmmword_25BA64B50;
      long long v10 = unk_25BA64B60;
      long long v11 = xmmword_25BA64B70;
      long long v12 = unk_25BA64B80;
      std::unordered_map<int,float>::unordered_map((uint64_t)v8, (int *)buf, 8);
      std::optional<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params>::operator=[abi:ne180100]<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params,void>((uint64_t)a3, &v6);
      goto LABEL_36;
    case 46:
      uint64_t v6 = 0x3F40C49C36D613C8;
      int v7 = 131;
      *(_OWORD *)buf = xmmword_25BA64B90;
      long long v10 = unk_25BA64BA0;
      long long v11 = xmmword_25BA64BB0;
      long long v12 = unk_25BA64BC0;
      std::unordered_map<int,float>::unordered_map((uint64_t)v8, (int *)buf, 8);
      std::optional<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params>::operator=[abi:ne180100]<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params,void>((uint64_t)a3, &v6);
LABEL_36:
      std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::~__hash_table((uint64_t)v8);
      break;
    default:
      log = Scandium::algs_get_log(a1);
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = a2;
        _os_log_impl(&dword_25BA34000, log, OS_LOG_TYPE_DEFAULT, "Scandium unsupported hfw enum: %d", buf, 8u);
      }
      break;
  }
}

void sub_25BA5E334(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;
  std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::~__hash_table(v3);
  if (*(unsigned char *)(v1 + 56)) {
    std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::~__hash_table(v1 + 16);
  }
  _Unwind_Resume(a1);
}

uint64_t std::optional<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params>::operator=[abi:ne180100]<Scandium::ScandiumPPG::scandium_optical_fom_t::mdm_params,void>(uint64_t a1, uint64_t *a2)
{
  int v3 = *(unsigned __int8 *)(a1 + 56);
  int v4 = *((_DWORD *)a2 + 2);
  uint64_t v6 = *a2;
  uint64_t v5 = a2 + 2;
  *(void *)a1 = v6;
  *(_DWORD *)(a1 + std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::~__hash_table((uint64_t)this + 8) = v4;
  uint64_t v7 = a1 + 16;
  if (v3)
  {
    std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__move_assign(v7, v5);
  }
  else
  {
    std::__hash_table<std::__hash_value_type<int,float>,std::__unordered_map_hasher<int,std::__hash_value_type<int,float>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,float>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,float>>>::__hash_table(v7, v5);
    *(unsigned char *)(a1 + 56) = 1;
  }
  return a1;
}

void Scandium::ScandiumPPG::scandium_optical_fom_t::process(uint64_t a1, float *a2)
{
  uint64_t v4 = *(unsigned __int8 *)a2;
  uint64_t v5 = *((unsigned __int8 *)a2 + 1);
  uint64_t v6 = (Scandium::ScandiumPPG *)(v5 + 4 * v4);
  unsigned __int8 v7 = Scandium::ScandiumPPG::path_array[4 * v4 + v5];
  LOBYTE(vstd::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::~__hash_table((uint64_t)this + 8) = *((unsigned char *)a2 + (int)Scandium::ScandiumPPG::get_blank_path_idx(v6) + 48);
  unsigned int v9 = (int)(float)((float)v8 * 10000.0);
  float v10 = a2[10];
  float v11 = *(float *)(a1 + 100);
  float v12 = *(float *)(a1 + 104);
  unsigned int v57 = v9;
  uint64_t v13 = std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::find<int>((void *)(a1 + 120), (int *)&v57);
  if (!v13) {
    goto LABEL_5;
  }
  float v52 = v12;
  float v53 = v11;
  float v54 = v10;
  float v50 = *(float *)(a1 + 96);
  float v51 = *((float *)v13 + 5);
  float v48 = *(float *)(a1 + 108);
  float v49 = *(float *)(a1 + 92);
  int v14 = *(_DWORD *)a1;
  float v45 = a2[5];
  float v47 = *(float *)(a1 + 112);
  float v16 = *(float *)(a1 + 68);
  float v43 = *(float *)(a1 + 72);
  unsigned int v15 = LODWORD(v43);
  float v44 = a2[10];
  LOBYTE(v15) = *((unsigned char *)a2 + v6 + 60);
  float v17 = (float)v15 * 10000.0;
  int v56 = (int)v17;
  long long v18 = std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::find<int>((void *)(a1 + 120), &v56);
  if (!v18) {
    goto LABEL_5;
  }
  float v19 = *((float *)v18 + 5);
  float v21 = *(float *)(a1 + 60);
  float v20 = *(float *)(a1 + 64);
  float v22 = *(float *)(a1 + 108);
  float v23 = *(float *)(a1 + 112);
  int v24 = *(_DWORD *)a1;
  float v41 = a2[10];
  float v42 = a2[4];
  float v39 = *(float *)(a1 + 88);
  unsigned int v25 = LODWORD(v39);
  float v40 = *(float *)(a1 + 84);
  LOBYTE(v25) = *((unsigned char *)v6 + (void)a2 + 76);
  float v26 = (float)v25 * 10000.0;
  int v55 = (int)v26;
  long long v27 = std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::find<int>((void *)(a1 + 120), &v55);
  if (!v27) {
LABEL_5:
  }
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  long long v28 = v27;
  float v46 = Scandium::ScandiumPPG::scandium_optical_fom_t::compute_circuit_noise(v45, v44, v16, v43, v17, v19, v20, v21, (uint64_t)v27, v24, v22, v23);
  float v30 = Scandium::ScandiumPPG::scandium_optical_fom_t::compute_circuit_noise(0.0, v54, v53, v52, (float)v9, v51, v50, v49, v29, v14, v48, v47);
  float v32 = Scandium::ScandiumPPG::scandium_optical_fom_t::compute_circuit_noise(v42, v41, v40, v39, v26, *((float *)v28 + 5), *(float *)(a1 + 80), *(float *)(a1 + 76), v31, *(_DWORD *)a1, *(float *)(a1 + 108), *(float *)(a1 + 112));
  float v33 = sqrt(fmax(a2[11] * a2[11] - v30 * v30, 0.0));
  float v34 = a2[2];
  float v35 = a2[4];
  float v36 = a2[5];
  float v37 = (float)((float)(a2[1] / 2.8284) / 100.0) * v35;
  *(float *)(a1 + 36std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::~__hash_table((uint64_t)this + 8) = log2f(v37 / v33);
  float v38 = (float)((float)(v34 / 2.8284) / 100.0) * v36;
  *(float *)(a1 + 372) = log2f(v38 / v33);
  *(float *)(a1 + 36std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_monitor_t>::reset[abi:ne180100](this, 0) = log2f(v37 / sqrtf((float)(v32 * v32) + (float)(v33 * v33)));
  *(float *)(a1 + 36std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = log2f(v38 / sqrtf((float)(v46 * v46) + (float)(v33 * v33)));
  *(float *)(a1 + 376) = log2f(v37 / v32);
  *(float *)(a1 + 38std::unique_ptr<Scandium::ScandiumPPG::scandium_spo2_monitor_t>::reset[abi:ne180100](this, 0) = log2f(v38 / v46);
  Scandium::ScandiumPPG::scandium_optical_fom_t::compute_sxr(a1, v7, a2[*(unsigned __int8 *)a2 + 31], a2[*(unsigned __int8 *)a2 + 27], v35, v36);
  Scandium::ScandiumPPG::scandium_optical_fom_t::compute_sxr_ch(a1, v7, a2[7], a2[8], a2[4], a2[5]);
}

float Scandium::ScandiumPPG::scandium_optical_fom_t::compute_circuit_noise(float a1, float a2, float a3, float a4, float a5, float a6, float a7, float a8, uint64_t a9, int a10, float a11, float a12)
{
  double v18 = a6 * a6 / (a5 * a5 * (a7 * a7) * (a12 * a12)) + a2 * 3.20435327e-19;
  double v19 = a1;
  double v20 = a4;
  double v21 = a1 * 3.20435327e-19 * v20 + v18 * a3;
  if (a10 == 3) {
    double v21 = v21 + v19 * 0.000007 / 199.749844 * (v19 * 0.000007 / 199.749844) * v20;
  }
  return sqrt(v19 * 0.000005 * (v19 * 0.000005) + v19 * a11 * (v19 * a11) + (float)(a1 * a8) * (float)(a1 * a8) + v21);
}

float Scandium::ScandiumPPG::scandium_optical_fom_t::compute_sxr(uint64_t a1, unsigned __int8 a2, float a3, float a4, float a5, float a6)
{
  unsigned __int8 v41 = a2;
  float v11 = (void *)(a1 + 160);
  float v12 = std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::find<unsigned char>((void *)(a1 + 160), &v41);
  if (!v12) {
    goto LABEL_12;
  }
  float v13 = *((float *)v12 + 5);
  float v14 = *(float *)(a1 + 4);
  unsigned int v15 = std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::find<unsigned char>(v11, &v41);
  if (!v15) {
    goto LABEL_12;
  }
  float v40 = a3;
  float v16 = *((float *)v15 + 5);
  float v17 = std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::find<unsigned char>((void *)(a1 + 8), &v41);
  if (!v17) {
    goto LABEL_12;
  }
  float v18 = a5;
  float v38 = a4;
  float v39 = a6;
  float v19 = *((float *)v17 + 5);
  int v20 = *(_DWORD *)(a1 + 116);
  float v21 = *(float *)(a1 + 48);
  float v22 = std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::find<unsigned char>(v11, &v41);
  if (!v22) {
    goto LABEL_12;
  }
  float v23 = *((float *)v22 + 5);
  int v24 = std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::find<unsigned char>((void *)(a1 + 320), &v41);
  if (!v24) {
    goto LABEL_12;
  }
  *(float *)(a1 + 38std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = (float)((float)((float)(v13 * v14) + (float)((float)(v16 * v19) * (float)((float)v20 / v21)))
                               + (float)((float)((float)(v23 * *((float *)v24 + 5)) * v40) / *(float *)(a1 + 52)))
                       / v18;
  unsigned int v25 = std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::find<unsigned char>((void *)(a1 + 200), &v41);
  if (!v25) {
    goto LABEL_12;
  }
  float v26 = *((float *)v25 + 5);
  float v27 = *(float *)(a1 + 4);
  long long v28 = std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::find<unsigned char>((void *)(a1 + 200), &v41);
  if (!v28) {
    goto LABEL_12;
  }
  float v29 = *((float *)v28 + 5);
  float v30 = std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::find<unsigned char>((void *)(a1 + 8), &v41);
  if (!v30
    || (float v31 = *((float *)v30 + 5),
        int v32 = *(_DWORD *)(a1 + 116),
        float v33 = *(float *)(a1 + 48),
        (float v34 = std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::find<unsigned char>((void *)(a1 + 200), &v41)) == 0)|| (v35 = *((float *)v34 + 5), (v36 = std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::find<unsigned char>((void *)(a1 + 320), &v41)) == 0))
  {
LABEL_12:
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  float result = (float)((float)((float)(v26 * v27) + (float)((float)(v29 * v31) * (float)((float)v32 / v33)))
                 + (float)((float)((float)(v35 * *((float *)v36 + 5)) * v38) / *(float *)(a1 + 56)))
         / v39;
  *(float *)(a1 + 38std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::~__hash_table((uint64_t)this + 8) = result;
  return result;
}

float Scandium::ScandiumPPG::scandium_optical_fom_t::compute_sxr_ch(uint64_t a1, unsigned __int8 a2, float a3, float a4, float a5, float a6)
{
  unsigned __int8 v17 = a2;
  float v11 = std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::find<unsigned char>((void *)(a1 + 240), &v17);
  if (!v11
    || (double v12 = __exp10((float)(*((float *)v11 + 5) / -20.0)),
        (float v13 = std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::find<unsigned char>((void *)(a1 + 280), &v17)) == 0))
  {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  float v14 = v12 * (float)(a3 - a5);
  float v15 = __exp10((float)(*((float *)v13 + 5) / -20.0)) * (float)(a4 - a6);
  *(float *)(a1 + 392) = v14 / a5;
  float result = v15 / a6;
  *(float *)(a1 + 396) = result;
  return result;
}

void std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__move_assign(uint64_t a1, uint64_t *a2)
{
  std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::clear((void *)a1);
  uint64_t v4 = *a2;
  *a2 = 0;
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = v4;
  if (v5) {
    operator delete(v5);
  }
  uint64_t v8 = a2[2];
  unsigned __int8 v7 = a2 + 2;
  uint64_t v6 = v8;
  uint64_t v9 = *(v7 - 1);
  *(void *)(a1 + 16) = v8;
  *(void *)(a1 + std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::~__hash_table((uint64_t)this + 8) = v9;
  *(v7 - 1) = 0;
  uint64_t v10 = v7[1];
  *(void *)(a1 + 2std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = v10;
  *(_DWORD *)(a1 + 32) = *((_DWORD *)v7 + 4);
  if (v10)
  {
    unint64_t v11 = *(void *)(v6 + 8);
    unint64_t v12 = *(void *)(a1 + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v11 >= v12) {
        v11 %= v12;
      }
    }
    else
    {
      v11 &= v12 - 1;
    }
    *(void *)(*(void *)a1 + 8 * v11) = a1 + 16;
    *unsigned __int8 v7 = 0;
    v7[1] = 0;
  }
}

void *std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::clear(void *result)
{
  if (result[3])
  {
    uint64_t v1 = result;
    float result = (void *)result[2];
    if (result)
    {
      do
      {
        uint64_t v2 = (void *)*result;
        operator delete(result);
        float result = v2;
      }
      while (v2);
    }
    v1[2] = 0;
    uint64_t v3 = v1[1];
    if (v3)
    {
      for (uint64_t i = 0; i != v3; ++i)
        *(void *)(*v1 + 8 * i) = 0;
    }
    v1[3] = 0;
  }
  return result;
}

uint64_t std::__hash_table<std::__hash_value_type<int,float>,std::__unordered_map_hasher<int,std::__hash_value_type<int,float>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,float>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,float>>>::__hash_table(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a2 = 0;
  *(void *)float result = v2;
  *(void *)(result + std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::~__hash_table((uint64_t)this + 8) = a2[1];
  a2[1] = 0;
  uint64_t v5 = a2[2];
  uint64_t v3 = a2 + 2;
  uint64_t v4 = v5;
  *(void *)(result + 16) = v5;
  uint64_t v6 = v3[1];
  *(void *)(result + 2std::__function::__value_func<void ()(std::string const&,std::unordered_map<std::string,std::variant<BOOL,int,long long,float,double,std::string,std::variant<std::vector<BOOL>,std::vector<int>,std::vector<long long>,std::vector<float>,std::vector<double>,std::vector<std::string>>>> const&)>::~__value_func[abi:ne180100](this + 4) = v6;
  *(_DWORD *)(result + 32) = *((_DWORD *)v3 + 4);
  if (v6)
  {
    unint64_t v7 = *(void *)(v4 + 8);
    unint64_t v8 = *(void *)(result + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8) {
        v7 %= v8;
      }
    }
    else
    {
      v7 &= v8 - 1;
    }
    *(void *)(v2 + 8 * v7) = result + 16;
    *uint64_t v3 = 0;
    v3[1] = 0;
  }
  return result;
}

uint64_t std::unordered_map<Scandium::ScandiumPPG::PathType,float>::unordered_map(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = 1065353216;
  if (a3)
  {
    uint64_t v5 = 8 * a3;
    do
    {
      std::__hash_table<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::__unordered_map_hasher<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::hash<Scandium::ScandiumPPG::PathType>,std::equal_to<Scandium::ScandiumPPG::PathType>,true>,std::__unordered_map_equal<Scandium::ScandiumPPG::PathType,std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>,std::equal_to<Scandium::ScandiumPPG::PathType>,std::hash<Scandium::ScandiumPPG::PathType>,true>,std::allocator<std::__hash_value_type<Scandium::ScandiumPPG::PathType,float>>>::__emplace_unique_key_args<Scandium::ScandiumPPG::PathType,std::pair<Scandium::ScandiumPPG::PathType const,float> const&>(a1, a2, a2);
      a2 += 8;
      v5 -= 8;
    }
    while (v5);
  }
  return a1;
}

void sub_25BA5EDA4(_Unwind_Exception *a1)
{
  std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

uint64_t std::unordered_map<int,float>::unordered_map(uint64_t a1, int *a2, uint64_t a3)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = 1065353216;
  if (a3)
  {
    uint64_t v5 = 8 * a3;
    do
    {
      std::__hash_table<std::__hash_value_type<int,float>,std::__unordered_map_hasher<int,std::__hash_value_type<int,float>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,float>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,float>>>::__emplace_unique_key_args<int,std::pair<int const,float> const&>(a1, a2, a2);
      a2 += 2;
      v5 -= 8;
    }
    while (v5);
  }
  return a1;
}

void sub_25BA5EE1C(_Unwind_Exception *a1)
{
  std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

void *std::__hash_table<std::__hash_value_type<int,float>,std::__unordered_map_hasher<int,std::__hash_value_type<int,float>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,float>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,float>>>::__emplace_unique_key_args<int,std::pair<int const,float> const&>(uint64_t a1, int *a2, void *a3)
{
  unint64_t v6 = *a2;
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v3 = *a2;
      if (v7 <= v6) {
        unint64_t v3 = v6 % v7;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }
    uint64_t v9 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v9)
    {
      uint64_t v10 = *v9;
      if (*v9)
      {
        do
        {
          unint64_t v11 = v10[1];
          if (v11 == v6)
          {
            if (*((_DWORD *)v10 + 4) == v6) {
              return v10;
            }
          }
          else
          {
            if (v8.u32[0] > 1uLL)
            {
              if (v11 >= v7) {
                v11 %= v7;
              }
            }
            else
            {
              v11 &= v7 - 1;
            }
            if (v11 != v3) {
              break;
            }
          }
          uint64_t v10 = (void *)*v10;
        }
        while (v10);
      }
    }
  }
  uint64_t v10 = operator new(0x18uLL);
  *uint64_t v10 = 0;
  v10[1] = v6;
  _OWORD v10[2] = *a3;
  float v12 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    BOOL v14 = 1;
    if (v7 >= 3) {
      BOOL v14 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v15 = v14 | (2 * v7);
    unint64_t v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16) {
      size_t v17 = v16;
    }
    else {
      size_t v17 = v15;
    }
    std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::__rehash<true>(a1, v17);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= v6) {
        unint64_t v3 = v6 % v7;
      }
      else {
        unint64_t v3 = v6;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }
  }
  uint64_t v18 = *(void *)a1;
  float v19 = *(void **)(*(void *)a1 + 8 * v3);
  if (v19)
  {
    *uint64_t v10 = *v19;
LABEL_38:
    *float v19 = v10;
    goto LABEL_39;
  }
  *uint64_t v10 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v10;
  *(void *)(v18 + 8 * v3) = a1 + 16;
  if (*v10)
  {
    unint64_t v20 = *(void *)(*v10 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v20 >= v7) {
        v20 %= v7;
      }
    }
    else
    {
      v20 &= v7 - 1;
    }
    float v19 = (void *)(*(void *)a1 + 8 * v20);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return v10;
}

void sub_25BA5F038(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t std::unordered_map<int,float>::unordered_map(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::__rehash<true>(a1, *(void *)(a2 + 8));
  for (uint64_t i = *(int **)(a2 + 16); i; uint64_t i = *(int **)i)
    std::__hash_table<std::__hash_value_type<int,float>,std::__unordered_map_hasher<int,std::__hash_value_type<int,float>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,float>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,float>>>::__emplace_unique_key_args<int,std::pair<int const,float> const&>(a1, i + 4, (void *)i + 2);
  return a1;
}

void sub_25BA5F0AC(_Unwind_Exception *a1)
{
  std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

void __chkstk_darwin(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (___chkstk_darwin) {
    ___chkstk_darwin(a1, a2, a3, a4, a5, a6, a7, a8, a9);
  }
  else {
    __chkstk_darwin_probe(a1, a2, a3, a4, a5, a6, a7, a8, a9);
  }
}

void __chkstk_darwin_probe(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v10 = &a9;
  if (v9 >= 0x1000)
  {
    do
    {
      v10 -= 512;
      v9 -= 4096;
    }
    while (v9 > 0x1000);
  }
}

void ___chkstk_darwin(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void Scandium::sort_median()
{
}

{
  __assert_rtn("sort_median", "ScandiumUtils.cpp", 117, "x != NULL");
}

void stats::mean()
{
}

{
  __assert_rtn("mean", "stats.cpp", 19, "x != NULL");
}

void stats::variance()
{
}

{
  __assert_rtn("variance", "stats.cpp", 32, "x != NULL");
}

void stats::covariance()
{
}

{
  __assert_rtn("covariance", "stats.cpp", 55, "x != NULL");
}

{
  __assert_rtn("covariance", "stats.cpp", 56, "y != NULL");
}

{
  __assert_rtn("covariance", "stats.cpp", 53, "Ny == Nx");
}

void stats::std()
{
}

{
  __assert_rtn("std", "stats.cpp", 81, "x != NULL");
}

void stats::median()
{
}

{
  __assert_rtn("median", "stats.cpp", 205, "x != NULL");
}

void stats::max()
{
}

{
  __assert_rtn("max", "stats.cpp", 179, "x != NULL");
}

void stats::min()
{
}

{
  __assert_rtn("min", "stats.cpp", 192, "x != NULL");
}

void stats::median_vdsp()
{
}

{
  __assert_rtn("median_vdsp", "stats.cpp", 235, "x != NULL");
}

{
  __assert_rtn("median_vdsp", "stats.cpp", 236, "pI != NULL");
}

void stats::percentile()
{
}

{
  __assert_rtn("percentile", "stats.cpp", 412, "x != NULL");
}

{
  __assert_rtn("percentile", "stats.cpp", 413, "pI != NULL");
}

{
  __assert_rtn("percentile", "stats.cpp", 414, "ptile >= 0 && ptile <= 100");
}

void Scandium::ScandiumPPG::scandium_beat_detection_t::scandium_beat_detection_process()
{
  OUTLINED_FUNCTION_0_2(*MEMORY[0x263EF8340]);
  LODWORD(v3) = 136315138;
  HIDWORD(v3) = v0;
  OUTLINED_FUNCTION_1_0(&dword_25BA34000, v1, v2, "%s", v3);
}

void Scandium::ScandiumPPG::median_filt()
{
}

{
  __assert_rtn("median_filt", "scandium_beat_detection.cpp", 331, "x != NULL");
}

{
  __assert_rtn("median_filt", "scandium_beat_detection.cpp", 332, "y != NULL");
}

void Scandium::ScandiumPPG::scandium_spo2_processor_t::compute_mvmt_posture_bailout()
{
  __assert_rtn("compute_mvmt_posture_bailout", "scandium_spo2_processor.cpp", 1358, "startIdx >= 0 && startIdx + m_motion_posture_config.window_len <= NUM_BGAWIN_SAMPLES_BG");
}

double Scandium::ScandiumPPG::scandium_spo2_processor_t::compute_mvmt_posture_bailout(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  double v2 = *(float *)(*a1 - 4);
  int v4 = 134217984;
  double v5 = v2;
  _os_log_debug_impl(&dword_25BA34000, a2, OS_LOG_TYPE_DEBUG, "scandium mav: %f", (uint8_t *)&v4, 0xCu);
  return result;
}

void Scandium::ScandiumPPG::scandium_spo2_processor_t::compute_bga()
{
  OUTLINED_FUNCTION_0_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_25BA34000, v0, v1, "%s", v2);
}

void Scandium::ScandiumPPG::scandium_optical_fom_t::opt_gen_to_hw_fom()
{
}

void hid_service_copy_property_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_25BA34000, v0, OS_LOG_TYPE_DEBUG, "%s : key=%@", (uint8_t *)v1, 0x16u);
}

void hid_service_set_property_cold_1()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 136315650;
  OUTLINED_FUNCTION_0();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  _os_log_debug_impl(&dword_25BA34000, v2, OS_LOG_TYPE_DEBUG, "%s : key=%@ value=%@", (uint8_t *)v3, 0x20u);
}

void hid_service_copy_event_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  os_log_t v2 = "hid_service_copy_event";
  _os_log_debug_impl(&dword_25BA34000, log, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v1, 0xCu);
}

void hid_service_set_output_event_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  os_log_t v2 = "hid_service_set_output_event";
  _os_log_debug_impl(&dword_25BA34000, log, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v1, 0xCu);
}

void scandium::PacketDropDetector::handle_packet(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 138412546;
  uint64_t v3 = @"com.apple.hid.OxygenSaturation.PacketDrop";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl(&dword_25BA34000, a2, OS_LOG_TYPE_DEBUG, "sending a %@ event to CoreAnalytics: %@", (uint8_t *)&v2, 0x16u);
}

void scandium::PacketDropDetector::handle_packet(unsigned __int8 *a1, int a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = *a1;
  v4[0] = 67109376;
  v4[1] = a2;
  __int16 v5 = 1024;
  int v6 = v3;
  _os_log_fault_impl(&dword_25BA34000, log, OS_LOG_TYPE_FAULT, "detected %u dropped packets for input report 0x%02x", (uint8_t *)v4, 0xEu);
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x270F18A38]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

CFUUIDRef CFUUIDCreateFromUUIDBytes(CFAllocatorRef alloc, CFUUIDBytes bytes)
{
  return (CFUUIDRef)MEMORY[0x270EE5480](alloc, *(void *)&bytes.byte0, *(void *)&bytes.byte8);
}

CFUUIDRef CFUUIDGetConstantUUIDWithBytes(CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return (CFUUIDRef)MEMORY[0x270EE5498](alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6);
}

void IOHIDDeviceActivate(IOHIDDeviceRef device)
{
}

IOHIDDeviceRef IOHIDDeviceCreate(CFAllocatorRef allocator, io_service_t service)
{
  return (IOHIDDeviceRef)MEMORY[0x270EF4070](allocator, *(void *)&service);
}

CFTypeRef IOHIDDeviceGetProperty(IOHIDDeviceRef device, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x270EF4078](device, key);
}

IOReturn IOHIDDeviceGetReport(IOHIDDeviceRef device, IOHIDReportType reportType, CFIndex reportID, uint8_t *report, CFIndex *pReportLength)
{
  return MEMORY[0x270EF4080](device, *(void *)&reportType, reportID, report, pReportLength);
}

IOReturn IOHIDDeviceOpen(IOHIDDeviceRef device, IOOptionBits options)
{
  return MEMORY[0x270EF40A0](device, *(void *)&options);
}

void IOHIDDeviceRegisterInputReportCallback(IOHIDDeviceRef device, uint8_t *report, CFIndex reportLength, IOHIDReportCallback callback, void *context)
{
}

void IOHIDDeviceSetDispatchQueue(IOHIDDeviceRef device, dispatch_queue_t queue)
{
}

IOReturn IOHIDDeviceSetReport(IOHIDDeviceRef device, IOHIDReportType reportType, CFIndex reportID, const uint8_t *report, CFIndex reportLength)
{
  return MEMORY[0x270EF40F0](device, *(void *)&reportType, reportID, report, reportLength);
}

CFSetRef IOHIDManagerCopyDevices(IOHIDManagerRef manager)
{
  return (CFSetRef)MEMORY[0x270EF4530](manager);
}

IOHIDManagerRef IOHIDManagerCreate(CFAllocatorRef allocator, IOOptionBits options)
{
  return (IOHIDManagerRef)MEMORY[0x270EF4540](allocator, *(void *)&options);
}

void IOHIDManagerSetDeviceMatching(IOHIDManagerRef manager, CFDictionaryRef matching)
{
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

IOReturn IOPMAssertionCreateWithDescription(CFStringRef AssertionType, CFStringRef Name, CFStringRef Details, CFStringRef HumanReadableReason, CFStringRef LocalizationBundlePath, CFTimeInterval Timeout, CFStringRef TimeoutAction, IOPMAssertionID *AssertionID)
{
  return MEMORY[0x270EF4838](AssertionType, Name, Details, HumanReadableReason, LocalizationBundlePath, TimeoutAction, AssertionID, Timeout);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return MEMORY[0x270EF4868](*(void *)&AssertionID);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return MEMORY[0x270EF4A18](*(void *)&entry, plane, parent);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x270F983B0](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x270F98458](__n);
}

void std::string::__grow_by_and_replace(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add, const std::string::value_type *__p_new_stuff)
{
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984A0](this, __s, __n);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x270F98560](this, __str);
}

uint64_t std::__sort<std::__less<float,float> &,float *>()
{
  return MEMORY[0x270F98BE0]();
}

std::chrono::steady_clock::time_point std::chrono::steady_clock::now(void)
{
  return (std::chrono::steady_clock::time_point)MEMORY[0x270F98C18]();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, float __val)
{
  return (std::string *)MEMORY[0x270F98E00](retstr, __val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x270F98E08](retstr, *(void *)&__val);
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

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
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

void __cxa_rethrow(void)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

double __exp10(double a1)
{
  MEMORY[0x270ED7DC8](a1);
  return result;
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

long double exp(long double __x)
{
  MEMORY[0x270ED9858](__x);
  return result;
}

float expf(float a1)
{
  MEMORY[0x270ED9870](a1);
  return result;
}

void free(void *a1)
{
}

float log2f(float a1)
{
  MEMORY[0x270EDA0E0](a1);
  return result;
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x270EDA458](__s, *(void *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

double nan(const char *a1)
{
  MEMORY[0x270EDA600](a1);
  return result;
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

void objc_moveWeak(id *to, id *from)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x270EDB7D8](a1, a2, a3, a4, a5);
}

void vDSP_conv(const float *__A, vDSP_Stride __IA, const float *__F, vDSP_Stride __IF, float *__C, vDSP_Stride __IC, vDSP_Length __N, vDSP_Length __P)
{
}

void vDSP_dotpr(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Length __N)
{
}

void vDSP_maxv(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
}

void vDSP_maxvi(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length *__I, vDSP_Length __N)
{
}

void vDSP_meanv(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
}

void vDSP_minv(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
}

void vDSP_minvi(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length *__I, vDSP_Length __N)
{
}

void vDSP_mmov(const float *__A, float *__C, vDSP_Length __M, vDSP_Length __N, vDSP_Length __TA, vDSP_Length __TC)
{
}

void vDSP_svesq(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
}

void vDSP_vadd(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vclr(float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vgen(const float *__A, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsdiv(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsorti(const float *__C, vDSP_Length *__I, vDSP_Length *__Temporary, vDSP_Length __N, int __Order)
{
}

void vDSP_vsq(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsub(const float *__B, vDSP_Stride __IB, const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}