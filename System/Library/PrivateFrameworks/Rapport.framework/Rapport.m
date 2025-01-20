void sub_1B38EBA4C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B38EDC8C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B38EDFF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1B38EE19C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id RPNSOperatingSystemVersionToString(uint64_t *a1)
{
  if (*a1 < 1)
  {
    id v1 = 0;
  }
  else
  {
    NSAppendPrintF();
    id v1 = 0;
  }
  return v1;
}

BOOL shouldPrintSensitiveData()
{
  if (shouldPrintSensitiveData_onceToken != -1) {
    dispatch_once(&shouldPrintSensitiveData_onceToken, &__block_literal_global_282);
  }
  return (shouldPrintSensitiveData_sensitive & 1) == 0;
}

uint64_t formatSensitiveData(uint64_t a1, int a2)
{
  v3 = [MEMORY[0x1E4F28E78] stringWithCString:a1 encoding:4];
  v4 = v3;
  if (a2) {
    v5 = @"'%@'";
  }
  else {
    v5 = @"'%~@'";
  }
  [v3 appendString:v5];
  id v6 = v4;
  uint64_t v7 = [v6 UTF8String];

  return v7;
}

Class initSFService()
{
  if (SharingLibrary_sOnce != -1) {
    dispatch_once(&SharingLibrary_sOnce, &__block_literal_global);
  }
  Class result = objc_getClass("SFService");
  classSFService = (uint64_t)result;
  getSFServiceClass = (uint64_t (*)())SFServiceFunction;
  return result;
}

id SFServiceFunction()
{
  return (id)classSFService;
}

void *__SharingLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/Sharing.framework/Sharing", 2);
  SharingLibrary_sLib = (uint64_t)result;
  return result;
}

void sub_1B38F69CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Block_object_dispose((const void *)(v11 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1B38F6E38(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

nw_protocol_definition_t nwrapport_copy_protocol_definition()
{
  nw_protocol_definition_t definition = nw_framer_create_definition("rapport-client-peer", 0, &__block_literal_global_47);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_1B38EA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "registering rapport peer protocol", v2, 2u);
  }
  return definition;
}

uint64_t __nwrapport_copy_protocol_definition_block_invoke(uint64_t a1, void *a2)
{
  v2 = a2;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  char v14 = 0;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3010000000;
  v12[4] = 0;
  v12[5] = 0;
  v12[3] = "";
  nw_framer_message_t v3 = nw_framer_message_create(v2);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __nwrapport_copy_protocol_definition_block_invoke_2;
  v7[3] = &unk_1E605B928;
  v10 = v13;
  uint64_t v11 = v12;
  v4 = v2;
  v8 = v4;
  v5 = v3;
  v9 = v5;
  nw_framer_set_input_handler(v4, v7);
  nw_framer_set_output_handler(v4, &__block_literal_global_55);
  nw_framer_set_stop_handler(v4, &__block_literal_global_59);
  nw_framer_set_cleanup_handler(v4, &__block_literal_global_62);

  _Block_object_dispose(v12, 8);
  _Block_object_dispose(v13, 8);

  return 2;
}

void sub_1B38F7324(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t __nwrapport_copy_protocol_definition_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  nw_framer_message_t v3 = a2;
  uint64_t v4 = a1 + 56;
  uint64_t v5 = *(void *)(a1 + 48);
  BOOL v6 = *(unsigned char *)(*(void *)(v5 + 8) + 24) == 0;
  uint64_t v7 = 16;
  v8 = MEMORY[0x1E4F14500];
  unint64_t v9 = 0x1EB47A000uLL;
  do
  {
    if (!v6) {
      break;
    }
    parse[0] = MEMORY[0x1E4F143A8];
    parse[1] = 3221225472;
    parse[2] = __nwrapport_copy_protocol_definition_block_invoke_3;
    parse[3] = &unk_1E605B900;
    parse[5] = v5;
    parse[6] = 16;
    parse[4] = *(void *)v4;
    if (!nw_framer_parse_input(v3, 0x10uLL, 0x10uLL, 0, parse)) {
      goto LABEL_31;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = [(id)(v9 + 3184) controlCodeToString:*(unsigned __int8 *)(*(void *)(*(void *)v4 + 8) + 32)];
      int v11 = *(unsigned __int8 *)(*(void *)(*(void *)v4 + 8) + 33);
      v12 = strerror(v11);
      uint64_t v13 = *(void *)(*(void *)(*(void *)v4 + 8) + 40);
      *(_DWORD *)buf = 136315906;
      uint64_t v23 = v10;
      unint64_t v9 = 0x1EB47A000;
      __int16 v24 = 1024;
      int v25 = v11;
      __int16 v26 = 2080;
      v27 = v12;
      __int16 v28 = 2048;
      uint64_t v29 = v13;
      _os_log_debug_impl(&dword_1B38EA000, v8, OS_LOG_TYPE_DEBUG, "Client RX framer msg header={%s error: %d (%s), length: %zu}", buf, 0x26u);
    }
    uint64_t v5 = *(void *)(a1 + 48);
    BOOL v6 = 1;
  }
  while (!*(unsigned char *)(*(void *)(v5 + 8) + 24));
  char v14 = (void *)nw_framer_connection_state_copy_object_value();
  BOOL v15 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
  if (v14)
  {
    if (v15) {
      __nwrapport_copy_protocol_definition_block_invoke_2_cold_6(a1 + 56);
    }
    uint64_t v16 = *(void *)(*(void *)v4 + 8);
    if (!*(unsigned char *)(v16 + 32) && *(void *)(v16 + 40))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
        __nwrapport_copy_protocol_definition_block_invoke_2_cold_5(a1 + 56);
      }
      nw_framer_deliver_input_no_copy(v3, *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(nw_framer_message_t *)(a1 + 40), 0);
      goto LABEL_30;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
      __nwrapport_copy_protocol_definition_block_invoke_2_cold_4(a1 + 56);
    }
    v17 = *(NSObject **)(a1 + 32);
    int v18 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 33);
  }
  else
  {
    if (v15) {
      __nwrapport_copy_protocol_definition_block_invoke_2_cold_3();
    }
    if (*(_DWORD *)(*(void *)(*(void *)v4 + 8) + 36) == 320017171)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
        __nwrapport_copy_protocol_definition_block_invoke_2_cold_1();
      }
      nw_framer_connection_state_set_object_value();
      nw_framer_mark_ready(*(nw_framer_t *)(a1 + 32));
      goto LABEL_30;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      __nwrapport_copy_protocol_definition_block_invoke_2_cold_2();
    }
    uint64_t v19 = *(void *)(*(void *)v4 + 8);
    int v18 = *(unsigned __int8 *)(v19 + 33);
    if (!*(unsigned char *)(v19 + 33))
    {
      *(unsigned char *)(v19 + 33) = 53;
      int v18 = *(unsigned __int8 *)(*(void *)(*(void *)v4 + 8) + 33);
    }
    v17 = *(NSObject **)(a1 + 32);
  }
  nw_framer_mark_failed_with_error(v17, v18);
LABEL_30:
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;

  uint64_t v7 = 0;
LABEL_31:

  return v7;
}

uint64_t __nwrapport_copy_protocol_definition_block_invoke_3(void *a1, _OWORD *a2, unint64_t a3)
{
  if (!a2 || a1[6] > a3) {
    return 0;
  }
  *(_OWORD *)(*(void *)(a1[4] + 8) + 32) = *a2;
  uint64_t v4 = a1[5];
  uint64_t result = a1[6];
  *(unsigned char *)(*(void *)(v4 + 8) + 24) = 1;
  return result;
}

void __nwrapport_copy_protocol_definition_block_invoke_53(uint64_t a1, void *a2, uint64_t a3, size_t a4)
{
  uint64_t v5 = a2;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    __nwrapport_copy_protocol_definition_block_invoke_53_cold_1(a4);
  }
  v6[0] = 0;
  v6[1] = a4;
  nw_framer_write_output(v5, (const uint8_t *)v6, 0x10uLL);
  nw_framer_write_output_no_copy(v5, a4);
}

uint64_t __nwrapport_copy_protocol_definition_block_invoke_56(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __nwrapport_copy_protocol_definition_block_invoke_56_cold_1((uint64_t)v2);
  }
  +[RPNWFramer writeControlOnFramer:v2 type:3 error:0];

  return 1;
}

void __nwrapport_copy_protocol_definition_block_invoke_60(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v3 = 138412290;
    uint64_t v4 = a2;
    _os_log_impl(&dword_1B38EA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cleanup handler called for framer=%@", (uint8_t *)&v3, 0xCu);
  }
}

unint64_t *RPBonjourFlagsUpdateWithRPCompanionLinkFlags(unint64_t *result, unsigned int a2)
{
  *uint64_t result = *result & 0xFFFFFFFFFFFFF803 | (a2 >> 1) & 4 | (2 * a2) & 0x68 | (16 * ((a2 >> 1) & 1)) | (a2 >> 1) & 0x80 | (a2 >> 2) & 0x700;
  return result;
}

uint64_t RPCompanionLinkFlagsToShortString(__int16 a1, uint64_t a2)
{
  int8x16_t v2 = (int8x16_t)vdupq_n_s32(a1);
  int16x8_t v3 = (int16x8_t)vceqzq_s32((int32x4_t)vandq_s8(v2, (int8x16_t)xmmword_1B39702E0));
  *(int8x8_t *)v3.i8 = vbsl_s8((int8x8_t)vmovn_s32((int32x4_t)v3), (int8x8_t)0x68007000730075, (int8x8_t)0x48005000530055);
  *(_DWORD *)a2 = vmovn_s16(v3).u32[0];
  if ((a1 & 0x10) != 0) {
    char v4 = 65;
  }
  else {
    char v4 = 97;
  }
  *(unsigned char *)(a2 + 4) = v4;
  *(unsigned char *)(a2 + 5) = a1 & 0x20 ^ 0x77;
  int16x8_t v5 = (int16x8_t)vceqzq_s32((int32x4_t)vandq_s8(v2, (int8x16_t)xmmword_1B39702F0));
  *(int8x8_t *)v5.i8 = vbsl_s8((int8x8_t)vmovn_s32((int32x4_t)v5), (int8x8_t)0x750063006D006CLL, (int8x8_t)0x550043004D004CLL);
  *(_DWORD *)(a2 + 6) = vmovn_s16(v5).u32[0];
  if ((a1 & 0x400) != 0) {
    char v6 = 72;
  }
  else {
    char v6 = 104;
  }
  *(unsigned char *)(a2 + 10) = v6;
  if ((a1 & 0x800) != 0) {
    char v7 = 83;
  }
  else {
    char v7 = 115;
  }
  *(unsigned char *)(a2 + 11) = v7;
  if ((a1 & 0x1000) != 0) {
    char v8 = 84;
  }
  else {
    char v8 = 116;
  }
  *(unsigned char *)(a2 + 12) = v8;
  *(unsigned char *)(a2 + 13) = 0;
  return a2;
}

unsigned int *RPCompanionLinkFlagsWithUpdateBonjourFlags(unsigned int *result, unsigned int a2)
{
  *uint64_t result = (a2 >> 1) & 0x34 | (a2 >> 3) & 2 | (((a2 >> 7) & 1) << 8) & 0xFFFFE3FF | (((a2 >> 8) & 7) << 10) | *result & 0xFFFFE2C1 | (8 * ((a2 >> 2) & 1));
  return result;
}

__CFString *RPDeviceClassToString(int a1)
{
  uint64_t result = @"Unknown";
  switch(a1)
  {
    case 1:
      uint64_t result = @"iPhone";
      break;
    case 2:
      uint64_t result = @"iPod";
      break;
    case 3:
      uint64_t result = @"iPad";
      break;
    case 4:
      uint64_t result = @"AppleTV";
      break;
    case 5:
      uint64_t result = @"FPGA";
      break;
    case 6:
      uint64_t result = @"Watch";
      break;
    case 7:
      uint64_t result = @"AudioAccessory";
      break;
    case 8:
    case 9:
    case 10:
      return result;
    case 11:
      uint64_t result = @"RealityDevice";
      break;
    default:
      if (a1 == 100) {
        uint64_t result = @"Mac";
      }
      break;
  }
  return result;
}

void RPEncodeNSError(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (v3)
  {
    uint64_t v5 = *MEMORY[0x1E4F28760];
    int v6 = 3;
    id v17 = v4;
    while (1)
    {
      char v7 = NSNumber;
      uint64_t v8 = [v3 code];
      if (v8) {
        uint64_t v9 = v8;
      }
      else {
        uint64_t v9 = -6700;
      }
      uint64_t v10 = [v7 numberWithInteger:v9];
      [v17 setObject:v10 forKeyedSubscript:@"_ec"];

      int v11 = [v3 domain];
      v12 = v11;
      if (v11 && ([v11 isEqual:v5] & 1) == 0) {
        [v17 setObject:v12 forKeyedSubscript:@"_ed"];
      }
      uint64_t v13 = [v3 userInfo];
      CFStringGetTypeID();
      char v14 = CFDictionaryGetTypedValue();
      if ([v14 length]) {
        [v17 setObject:v14 forKeyedSubscript:@"_em"];
      }
      if (!v6) {
        break;
      }
      CFErrorGetTypeID();
      uint64_t v15 = CFDictionaryGetTypedValue();

      if (!v15)
      {
        id v3 = 0;
        break;
      }
      id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [v17 setObject:v16 forKeyedSubscript:@"_eu"];

      --v6;
      id v17 = v16;
      id v3 = (id)v15;
    }

    id v4 = v17;
  }
}

id RPDecodeNSError(void *a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  CFDictionaryGetInt64Ranged();
  id v31 = 0;
  id v32 = 0;
  v22 = v1;
  id v30 = v1;
  if (!v30)
  {
    id v31 = 0;
    goto LABEL_6;
  }
  CFDictionaryGetTypeID();
  id v31 = (id)CFDictionaryGetTypedValue();
  if (!v31)
  {
LABEL_6:
    id TypedValue = 0;
    id v32 = 0;
    goto LABEL_7;
  }
  CFDictionaryGetTypeID();
  id TypedValue = (id)CFDictionaryGetTypedValue();
  id v32 = TypedValue;
  if (TypedValue)
  {
    CFDictionaryGetTypeID();
    id TypedValue = (id)CFDictionaryGetTypedValue();
  }
LABEL_7:
  id v3 = 0;
  id v33 = TypedValue;
  id v4 = (void *)*MEMORY[0x1E4F28760];
  uint64_t v5 = 24;
  uint64_t v23 = *MEMORY[0x1E4F28A50];
  do
  {
    id v6 = *(id *)((char *)&v30 + v5);
    if (v6)
    {
      int Int64Ranged = CFDictionaryGetInt64Ranged();
      CFStringGetTypeID();
      uint64_t v8 = CFDictionaryGetTypedValue();
      CFStringGetTypeID();
      uint64_t v9 = CFDictionaryGetTypedValue();
      id v10 = objc_alloc(MEMORY[0x1E4F28C58]);
      if (v8) {
        int v11 = v8;
      }
      else {
        int v11 = v4;
      }
      uint64_t v12 = objc_msgSend(v9, "length", v22);
      if (v3)
      {
        if (v12)
        {
          v28[0] = v23;
          v28[1] = @"cuErrorMsg";
          v29[0] = v3;
          v29[1] = v9;
          uint64_t v13 = (void *)MEMORY[0x1E4F1C9E8];
          char v14 = (void **)v29;
          uint64_t v15 = v28;
          uint64_t v16 = 2;
        }
        else
        {
          uint64_t v26 = v23;
          v27 = v3;
          uint64_t v13 = (void *)MEMORY[0x1E4F1C9E8];
          char v14 = &v27;
          uint64_t v15 = &v26;
          uint64_t v16 = 1;
        }
        int v18 = [v13 dictionaryWithObjects:v14 forKeys:v15 count:v16];
        uint64_t v19 = [v10 initWithDomain:v11 code:Int64Ranged userInfo:v18];

        id v3 = (void *)v19;
      }
      else if (v12)
      {
        __int16 v24 = @"cuErrorMsg";
        int v25 = v9;
        id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
        id v3 = (void *)[v10 initWithDomain:v11 code:Int64Ranged userInfo:v17];
      }
      else
      {
        id v3 = (void *)[v10 initWithDomain:v11 code:Int64Ranged userInfo:0];
      }
    }
    v5 -= 8;
  }
  while (v5 != -8);
  for (uint64_t i = 24; i != -8; i -= 8)

  return v3;
}

id RPErrorF()
{
  v0 = NSErrorV();
  return v0;
}

id RPNestedErrorF()
{
  v0 = NSErrorNestedV();
  return v0;
}

id RPVersionToSourceVersionString()
{
  SourceVersionToCString();
  return 0;
}

id RPModelOSVersionToSourceVersionString()
{
  GestaltProductTypeStringToDeviceClass();
  if ((DeviceOSVersionAtOrLaterEx() & 1) != 0
    || (DeviceOSVersionAtOrLaterEx() & 1) != 0
    || (DeviceOSVersionAtOrLaterEx() & 1) != 0
    || (DeviceOSVersionAtOrLaterEx() & 1) != 0
    || (DeviceOSVersionAtOrLaterEx() & 1) != 0
    || (DeviceOSVersionAtOrLaterEx() & 1) != 0
    || (DeviceOSVersionAtOrLaterEx() & 1) != 0
    || (DeviceOSVersionAtOrLater() & 1) != 0
    || (DeviceOSVersionAtOrLater() & 1) != 0
    || (DeviceOSVersionAtOrLater() & 1) != 0
    || (DeviceOSVersionAtOrLater() & 1) != 0
    || (DeviceOSVersionAtOrLater() & 1) != 0
    || (DeviceOSVersionAtOrLater() & 1) != 0
    || (DeviceOSVersionAtOrLater() & 1) != 0
    || (DeviceOSVersionAtOrLater() & 1) != 0
    || (DeviceOSVersionAtOrLater() & 1) != 0
    || (DeviceOSVersionAtOrLater() & 1) != 0
    || DeviceOSVersionAtOrLater()
    || (DeviceOSVersionAtOrLater() & 1) != 0
    || (DeviceOSVersionAtOrLater() & 1) != 0
    || (DeviceOSVersionAtOrLater() & 1) != 0
    || (DeviceOSVersionAtOrLater() & 1) != 0
    || (DeviceOSVersionAtOrLater() & 1) != 0
    || (DeviceOSVersionAtOrLater() & 1) != 0
    || (DeviceOSVersionAtOrLater() & 1) != 0
    || (DeviceOSVersionAtOrLater() & 1) != 0
    || (DeviceOSVersionAtOrLater() & 1) != 0
    || (DeviceOSVersionAtOrLater() & 1) != 0
    || NADyFF4UGjtVGBmEW6h()
    || (TN6sBSnEP2() & 1) != 0
    || wInTP56r94EFs9NAAi())
  {
    v0 = RPVersionToSourceVersionString();
  }
  else
  {
    v0 = 0;
  }
  return v0;
}

id RPProcessIDToNameString(uint64_t a1)
{
  NSAppendPrintF();
  id v1 = 0;
  uint64_t v2 = objc_msgSend(v1, "rangeOfString:", @":", a1);
  id v3 = 0;
  if (v2 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v3 = objc_msgSend(v1, "substringWithRange:", 0, v2);
  }
  if (v3) {
    id v4 = v3;
  }
  else {
    id v4 = v1;
  }
  id v5 = v4;

  return v5;
}

void RPStringToOperatingSystemVersion(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  id v8 = [a1 componentsSeparatedByString:@"."];
  uint64_t v3 = [v8 count];
  if (v3)
  {
    unint64_t v4 = v3;
    id v5 = [v8 objectAtIndexedSubscript:0];
    *a2 = [v5 integerValue];

    if (v4 != 1)
    {
      id v6 = [v8 objectAtIndexedSubscript:1];
      a2[1] = [v6 integerValue];

      if (v4 >= 3)
      {
        char v7 = [v8 objectAtIndexedSubscript:2];
        a2[2] = [v7 integerValue];
      }
    }
  }
}

BOOL RPDeviceIsCommunal(int a1)
{
  return a1 == 4 || a1 == 7;
}

uint64_t __shouldPrintSensitiveData_block_invoke()
{
  if ((os_variant_has_internal_content() & 1) == 0) {
    shouldPrintSensitiveData_sensitive = 1;
  }
  uint64_t result = CFPrefs_GetInt64();
  if (result) {
    shouldPrintSensitiveData_sensitive = 0;
  }
  return result;
}

void sub_1B38FBA68(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B38FBB80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  objc_sync_exit(v7);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_1B38FBD30(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B38FBF28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1B38FC020(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B38FCFCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose((const void *)(v32 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1B38FE408(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1B390458C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_1B390503C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B39058B4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3905A6C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3905B6C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3905C3C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3905D0C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

const char *_StateToString(unsigned int a1)
{
  if (a1 > 0x1D) {
    return "?";
  }
  else {
    return off_1E605C6F8[a1];
  }
}

const char *RPDataLinkTypeToString(unsigned int a1)
{
  if (a1 > 0xB) {
    return "?";
  }
  else {
    return off_1E605C928[a1];
  }
}

void sub_1B39105E8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void sub_1B39115EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,char a56)
{
}

id RPConnectionLog()
{
  if (RPConnectionLog_onceToken != -1) {
    dispatch_once(&RPConnectionLog_onceToken, &__block_literal_global_1342);
  }
  v0 = (void *)RPConnectionLog___logger;
  return v0;
}

void sub_1B3912014(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 232), 8);
  _Unwind_Resume(a1);
}

const char *RPFrameTypeToString(int a1)
{
  if (a1 > 47)
  {
    if (a1 <= 63)
    {
      if (a1 == 48) {
        return "WatchIdentityRequest";
      }
      if (a1 == 49) {
        return "WatchIdentityResponse";
      }
    }
    else
    {
      switch(a1)
      {
        case '@':
          return "FriendIdentityRequest";
        case 'A':
          return "FriendIdentityResponse";
        case 'B':
          return "FriendIdentityUpdate";
      }
    }
    return "?";
  }
  else
  {
    uint64_t result = "Invalid";
    switch(a1)
    {
      case 0:
        return result;
      case 1:
        uint64_t result = "NoOp";
        break;
      case 3:
        uint64_t result = "PS_Start";
        break;
      case 4:
        uint64_t result = "PS_Next";
        break;
      case 5:
        uint64_t result = "PV_Start";
        break;
      case 6:
        uint64_t result = "PV_Next";
        break;
      case 7:
        uint64_t result = "U_OPACK";
        break;
      case 8:
        uint64_t result = "E_OPACK";
        break;
      case 9:
        uint64_t result = "P_OPACK";
        break;
      case 10:
        uint64_t result = "PA_Req";
        break;
      case 11:
        uint64_t result = "PA_Rsp";
        break;
      case 16:
        uint64_t result = "SessionStartRequest";
        break;
      case 17:
        uint64_t result = "SessionStartResponse";
        break;
      case 18:
        uint64_t result = "SessionData";
        break;
      case 32:
        uint64_t result = "FamilyIdentityRequest";
        break;
      case 33:
        uint64_t result = "FamilyIdentityResponse";
        break;
      case 34:
        uint64_t result = "FamilyIdentityUpdate";
        break;
      default:
        return "?";
    }
  }
  return result;
}

Class initMCProfileConnection()
{
  if (ManagedConfigurationLibrary_sOnce != -1) {
    dispatch_once(&ManagedConfigurationLibrary_sOnce, &__block_literal_global_4);
  }
  Class result = objc_getClass("MCProfileConnection");
  classMCProfileConnection = (uint64_t)result;
  getMCProfileConnectionClass[0] = (uint64_t (*)())MCProfileConnectionFunction;
  return result;
}

id MCProfileConnectionFunction()
{
  return (id)classMCProfileConnection;
}

void *__ManagedConfigurationLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/ManagedConfiguration.framework/ManagedConfiguration", 2);
  ManagedConfigurationLibrary_sLib = (uint64_t)result;
  return result;
}

id initValMCFeatureRemoteAppPairingAllowed()
{
  if (ManagedConfigurationLibrary_sOnce != -1) {
    dispatch_once(&ManagedConfigurationLibrary_sOnce, &__block_literal_global_4);
  }
  v0 = (id *)dlsym((void *)ManagedConfigurationLibrary_sLib, "MCFeatureRemoteAppPairingAllowed");
  if (v0) {
    objc_storeStrong((id *)&constantValMCFeatureRemoteAppPairingAllowed, *v0);
  }
  getMCFeatureRemoteAppPairingAllowed[0] = (uint64_t (*)())MCFeatureRemoteAppPairingAllowedFunction;
  uint64_t v1 = (void *)constantValMCFeatureRemoteAppPairingAllowed;
  return v1;
}

id MCFeatureRemoteAppPairingAllowedFunction()
{
  return (id)constantValMCFeatureRemoteAppPairingAllowed;
}

void __RPConnectionLog_block_invoke()
{
  uint64_t v0 = LogCategoryCopyOSLogHandle();
  uint64_t v1 = (void *)RPConnectionLog___logger;
  RPConnectionLog___logger = v0;
}

void sub_1B391AE00(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B391AEE8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B391AFB0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B391B088(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3920FD0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3921324(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3923A90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void sub_1B39256B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
}

void sub_1B392729C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
}

void sub_1B3927860(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Unwind_Resume(a1);
}

void sub_1B3928554(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Block_object_dispose((const void *)(v2 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1B3929DA0(_Unwind_Exception *a1)
{
  (*(void (**)(void))(v1 + 16))();
  _Block_object_dispose((const void *)(v2 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1B392AE98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
}

void sub_1B392B4F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  (*(void (**)(uint64_t))(v7 + 16))(v7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B392B770(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  (*(void (**)(uint64_t))(v9 + 16))(v9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B392C518(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  (*(void (**)(uint64_t))(v7 + 16))(v7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *RPNearFieldTransactionStateDescription(uint64_t a1)
{
  uint64_t v1 = @"Connected";
  if (a1 == 1) {
    uint64_t v1 = @"Interrupted";
  }
  if (a1 == 2) {
    return @"Exchange Completed";
  }
  else {
    return v1;
  }
}

Class initSFDeviceDiscovery()
{
  if (SharingLibrary_sOnce_0 != -1) {
    dispatch_once(&SharingLibrary_sOnce_0, &__block_literal_global_489);
  }
  Class result = objc_getClass("SFDeviceDiscovery");
  classSFDeviceDiscovery = (uint64_t)result;
  getSFDeviceDiscoveryClass[0] = (uint64_t (*)())SFDeviceDiscoveryFunction;
  return result;
}

id SFDeviceDiscoveryFunction()
{
  return (id)classSFDeviceDiscovery;
}

void *__SharingLibrary_block_invoke_0()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/Sharing.framework/Sharing", 2);
  SharingLibrary_sLib_0 = (uint64_t)result;
  return result;
}

void sub_1B393E78C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void sub_1B393E8FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B393EB88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B393ECE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B393EE38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B393EF90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B393F2E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B393F43C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B393F59C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B393F760(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B393F954(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B39402B8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void sub_1B394061C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3940EC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
}

void sub_1B3941300(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B39418C0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3941AB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1B3941DE8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3941EC0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3941F88(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3942184(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B39433CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Block_object_dispose((const void *)(v11 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1B3944B88(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B39461B0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B394886C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B39488E8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3948CCC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3948E58(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3948FEC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3949428(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1B39495EC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3949A64(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

const char *RPDataLinkTypeToString_0(unsigned int a1)
{
  if (a1 > 0xB) {
    return "?";
  }
  else {
    return off_1E605D4E0[a1];
  }
}

void sub_1B394E468(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3950304(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

Class initAVVCStartRecordSettings()
{
  if (AVFAudioLibrary_sOnce != -1) {
    dispatch_once(&AVFAudioLibrary_sOnce, &__block_literal_global_275);
  }
  Class result = objc_getClass("AVVCStartRecordSettings");
  classAVVCStartRecordSettings = (uint64_t)result;
  getAVVCStartRecordSettingsClass[0] = (uint64_t (*)())AVVCStartRecordSettingsFunction;
  return result;
}

id AVVCStartRecordSettingsFunction()
{
  return (id)classAVVCStartRecordSettings;
}

void *__AVFAudioLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/Frameworks/AVFAudio.framework/AVFAudio", 2);
  AVFAudioLibrary_sLib = (uint64_t)result;
  return result;
}

Class initAVAudioFormat()
{
  if (AVFAudioLibrary_sOnce != -1) {
    dispatch_once(&AVFAudioLibrary_sOnce, &__block_literal_global_275);
  }
  Class result = objc_getClass("AVAudioFormat");
  classAVAudioFormat = (uint64_t)result;
  getAVAudioFormatClass[0] = (uint64_t (*)())AVAudioFormatFunction;
  return result;
}

id AVAudioFormatFunction()
{
  return (id)classAVAudioFormat;
}

Class initAVVoiceController()
{
  if (AVFAudioLibrary_sOnce != -1) {
    dispatch_once(&AVFAudioLibrary_sOnce, &__block_literal_global_275);
  }
  Class result = objc_getClass("AVVoiceController");
  classAVVoiceController = (uint64_t)result;
  getAVVoiceControllerClass[0] = (uint64_t (*)())AVVoiceControllerFunction;
  return result;
}

id AVVoiceControllerFunction()
{
  return (id)classAVVoiceController;
}

Class initAVVCContextSettings()
{
  if (AVFAudioLibrary_sOnce != -1) {
    dispatch_once(&AVFAudioLibrary_sOnce, &__block_literal_global_275);
  }
  Class result = objc_getClass("AVVCContextSettings");
  classAVVCContextSettings = (uint64_t)result;
  getAVVCContextSettingsClass[0] = (uint64_t (*)())AVVCContextSettingsFunction;
  return result;
}

id AVVCContextSettingsFunction()
{
  return (id)classAVVCContextSettings;
}

Class initAVVCPrepareRecordSettings()
{
  if (AVFAudioLibrary_sOnce != -1) {
    dispatch_once(&AVFAudioLibrary_sOnce, &__block_literal_global_275);
  }
  Class result = objc_getClass("AVVCPrepareRecordSettings");
  classAVVCPrepareRecordSettings = (uint64_t)result;
  getAVVCPrepareRecordSettingsClass[0] = (uint64_t (*)())AVVCPrepareRecordSettingsFunction;
  return result;
}

id AVVCPrepareRecordSettingsFunction()
{
  return (id)classAVVCPrepareRecordSettings;
}

void sub_1B39564FC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B39579AC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B395844C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B395B1CC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B395B344(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B395C064(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  (*(void (**)(void))(a12 + 16))();
  _Block_object_dispose((const void *)(v12 - 152), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void sub_1B395F244(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Block_object_dispose((const void *)(v2 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

uint64_t __Block_byref_object_copy__84(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x1B3EBCC80](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__85(uint64_t a1)
{
}

void sub_1B396033C(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Block_object_dispose((const void *)(v2 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1B3960CF8(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Block_object_dispose((const void *)(v2 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1B39616E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  (*(void (**)(uint64_t))(v31 + 16))(v31);
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

id RPStreamSessionLog()
{
  if (RPStreamSessionLog_onceToken != -1) {
    dispatch_once(&RPStreamSessionLog_onceToken, &__block_literal_global_468);
  }
  uint64_t v0 = (void *)RPStreamSessionLog___logger;
  return v0;
}

void sub_1B3962E9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  (*(void (**)(uint64_t))(v15 + 16))(v15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3963E14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
  (*(void (**)(uint64_t))(v43 + 16))(v43);
  _Block_object_dispose(&a43, 8);
  _Unwind_Resume(a1);
}

void __RPStreamSessionLog_block_invoke()
{
  uint64_t v0 = LogCategoryCopyOSLogHandle();
  uint64_t v1 = (void *)RPStreamSessionLog___logger;
  RPStreamSessionLog___logger = v0;
}

Class initRTIDataPayload()
{
  if (RemoteTextInputLibrary_sOnce != -1) {
    dispatch_once(&RemoteTextInputLibrary_sOnce, &__block_literal_global_140);
  }
  Class result = objc_getClass("RTIDataPayload");
  classRTIDataPayload = (uint64_t)result;
  getRTIDataPayloadClass[0] = (uint64_t (*)())RTIDataPayloadFunction;
  return result;
}

id RTIDataPayloadFunction()
{
  return (id)classRTIDataPayload;
}

void *__RemoteTextInputLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/RemoteTextInput.framework/RemoteTextInput", 2);
  RemoteTextInputLibrary_sLib = (uint64_t)result;
  return result;
}

Class initRTIInputSystemSourceSession()
{
  if (RemoteTextInputLibrary_sOnce != -1) {
    dispatch_once(&RemoteTextInputLibrary_sOnce, &__block_literal_global_140);
  }
  Class result = objc_getClass("RTIInputSystemSourceSession");
  classRTIInputSystemSourceSession = (uint64_t)result;
  getRTIInputSystemSourceSessionClass[0] = (uint64_t (*)())RTIInputSystemSourceSessionFunction;
  return result;
}

id RTIInputSystemSourceSessionFunction()
{
  return (id)classRTIInputSystemSourceSession;
}

void __nwrapport_copy_protocol_definition_block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0();
  v1[0] = 67109120;
  v1[1] = v0;
  _os_log_debug_impl(&dword_1B38EA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Validated magic value: 0x%x", (uint8_t *)v1, 8u);
}

void __nwrapport_copy_protocol_definition_block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_0();
  v1[0] = 67109120;
  v1[1] = v0;
  _os_log_error_impl(&dword_1B38EA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Magic value does not match: 0x%x", (uint8_t *)v1, 8u);
}

void __nwrapport_copy_protocol_definition_block_invoke_2_cold_3()
{
  *(_WORD *)int v0 = 0;
  _os_log_debug_impl(&dword_1B38EA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Connection not validated yet", v0, 2u);
}

void __nwrapport_copy_protocol_definition_block_invoke_2_cold_4(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = *(unsigned __int8 *)(*(void *)(*(void *)a1 + 8) + 33);
  v2[0] = 67109120;
  v2[1] = v1;
  _os_log_debug_impl(&dword_1B38EA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Received error code=%u", (uint8_t *)v2, 8u);
}

void __nwrapport_copy_protocol_definition_block_invoke_2_cold_5(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(*(void *)(*(void *)a1 + 8) + 40);
  int v2 = 134217984;
  uint64_t v3 = v1;
  _os_log_debug_impl(&dword_1B38EA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Received data, length=%zu, passing through", (uint8_t *)&v2, 0xCu);
}

void __nwrapport_copy_protocol_definition_block_invoke_2_cold_6(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(*(void *)a1 + 8);
  int v2 = *(unsigned __int8 *)(v1 + 32);
  uint64_t v3 = *(void *)(v1 + 40);
  v4[0] = 67109376;
  v4[1] = v2;
  __int16 v5 = 2048;
  uint64_t v6 = v3;
  _os_log_debug_impl(&dword_1B38EA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Got a message header, type=%d, length=%zu", (uint8_t *)v4, 0x12u);
}

void __nwrapport_copy_protocol_definition_block_invoke_53_cold_1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 134217984;
  uint64_t v2 = a1;
  _os_log_debug_impl(&dword_1B38EA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Writing data (%zu bytes) on framer", (uint8_t *)&v1, 0xCu);
}

void __nwrapport_copy_protocol_definition_block_invoke_56_cold_1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_1B38EA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Stop handler called for framer=%@, sending CLOSE to daemon", (uint8_t *)&v1, 0xCu);
}

uint64_t BonjourAdvertiserCreate()
{
  return MEMORY[0x1F4115D80]();
}

uint64_t BonjourAdvertiserSetDispatchQueue()
{
  return MEMORY[0x1F4115D88]();
}

uint64_t BonjourAdvertiserSetPort()
{
  return MEMORY[0x1F4115DA8]();
}

uint64_t BonjourAdvertiserSetServiceType()
{
  return MEMORY[0x1F4115DB0]();
}

uint64_t BonjourAdvertiserSetTXTRecord()
{
  return MEMORY[0x1F4115DB8]();
}

uint64_t BonjourAdvertiserStart()
{
  return MEMORY[0x1F4115DC0]();
}

uint64_t BonjourAdvertiserStop()
{
  return MEMORY[0x1F4115DC8]();
}

uint64_t BonjourAdvertiserUpdate()
{
  return MEMORY[0x1F4115DD0]();
}

uint64_t BonjourBrowser_Create()
{
  return MEMORY[0x1F4115DD8]();
}

uint64_t BonjourBrowser_SetDispatchQueue()
{
  return MEMORY[0x1F4115DF0]();
}

uint64_t BonjourBrowser_SetEventHandlerBlock()
{
  return MEMORY[0x1F4115E00]();
}

uint64_t BonjourBrowser_Start()
{
  return MEMORY[0x1F4115E10]();
}

uint64_t BonjourBrowser_Stop()
{
  return MEMORY[0x1F4115E18]();
}

uint64_t BonjourDevice_GetDeviceID()
{
  return MEMORY[0x1F4115E40]();
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C9770](data, *(void *)&len, md);
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

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1F40D71D8]();
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x1F40D7860]();
}

CFTypeID CFDateGetTypeID(void)
{
  return MEMORY[0x1F40D7938]();
}

uint64_t CFDictionaryGetCFDataOfLength()
{
  return MEMORY[0x1F4115EC8]();
}

uint64_t CFDictionaryGetDouble()
{
  return MEMORY[0x1F4115EF0]();
}

uint64_t CFDictionaryGetInt64()
{
  return MEMORY[0x1F4115F10]();
}

uint64_t CFDictionaryGetInt64Ranged()
{
  return MEMORY[0x1F4115F18]();
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1F40D7A00]();
}

uint64_t CFDictionaryGetTypedValue()
{
  return MEMORY[0x1F4115F28]();
}

CFTypeID CFErrorGetTypeID(void)
{
  return MEMORY[0x1F40D7AC0]();
}

uint64_t CFGetHardwareAddress()
{
  return MEMORY[0x1F4115F78]();
}

uint64_t CFPrefs_GetDouble()
{
  return MEMORY[0x1F4115FE8]();
}

uint64_t CFPrefs_GetInt64()
{
  return MEMORY[0x1F4116000]();
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85F0]();
}

uint64_t CUDescriptionWithLevel()
{
  return MEMORY[0x1F41160B0]();
}

uint64_t CUDispatchTimerSet()
{
  return MEMORY[0x1F41160C0]();
}

uint64_t CUGetInterfaceAddresses()
{
  return MEMORY[0x1F41160E0]();
}

uint64_t CUMetricsLog()
{
  return MEMORY[0x1F41160F0]();
}

uint64_t CUMetricsLogEx()
{
  return MEMORY[0x1F41160F8]();
}

uint64_t CryptoHKDF()
{
  return MEMORY[0x1F4116290]();
}

uint64_t Curve25519MakeKeyPair()
{
  return MEMORY[0x1F41162A0]();
}

uint64_t DeviceOSVersionAtOrLater()
{
  return MEMORY[0x1F4116348]();
}

uint64_t DeviceOSVersionAtOrLaterEx()
{
  return MEMORY[0x1F4116350]();
}

uint64_t FPrintF()
{
  return MEMORY[0x1F4116358]();
}

uint64_t FatalErrorF()
{
  return MEMORY[0x1F4116368]();
}

uint64_t GestaltCopyAnswer()
{
  return MEMORY[0x1F4116378]();
}

uint64_t GestaltGetDeviceClass()
{
  return MEMORY[0x1F41163A8]();
}

uint64_t GestaltProductTypeStringToDeviceClass()
{
  return MEMORY[0x1F41163B0]();
}

uint64_t IsAppleInternalBuild()
{
  return MEMORY[0x1F41165A0]();
}

uint64_t LogCategoryCopyOSLogHandle()
{
  return MEMORY[0x1F41165D8]();
}

uint64_t LogCategoryReplaceF()
{
  return MEMORY[0x1F41165F8]();
}

uint64_t LogCategory_Remove()
{
  return MEMORY[0x1F4116600]();
}

uint64_t LogPrintF()
{
  return MEMORY[0x1F4116630]();
}

uint64_t NADyFF4UGjtVGBmEW6h()
{
  return MEMORY[0x1F41166C8]();
}

uint64_t NSAppendPrintF()
{
  return MEMORY[0x1F41166D0]();
}

uint64_t NSDecodeNSArrayOfClassIfPresent()
{
  return MEMORY[0x1F4116708]();
}

uint64_t NSDecodeNSDictionaryOfClassesIfPresent()
{
  return MEMORY[0x1F4116710]();
}

uint64_t NSDecodeNSSetOfClassIfPresent()
{
  return MEMORY[0x1F4116720]();
}

uint64_t NSDecodeObjectIfPresent()
{
  return MEMORY[0x1F4116728]();
}

uint64_t NSDecodeSInt64RangedIfPresent()
{
  return MEMORY[0x1F4116730]();
}

uint64_t NSDecodeStandardContainerIfPresent()
{
  return MEMORY[0x1F4116738]();
}

uint64_t NSDictionaryGetNSArrayOfClass()
{
  return MEMORY[0x1F4116740]();
}

uint64_t NSDictionaryGetNSNumber()
{
  return MEMORY[0x1F4116750]();
}

uint64_t NSDictionaryGetNSUUID()
{
  return MEMORY[0x1F4116758]();
}

uint64_t NSErrorNestedV()
{
  return MEMORY[0x1F4116788]();
}

uint64_t NSErrorV()
{
  return MEMORY[0x1F4116798]();
}

uint64_t NSErrorWithOSStatusF()
{
  return MEMORY[0x1F41167A0]();
}

uint64_t NSPrintF()
{
  return MEMORY[0x1F41167B0]();
}

uint64_t NSRandomData()
{
  return MEMORY[0x1F41167D0]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

uint64_t OPACKDecodeData()
{
  return MEMORY[0x1F41168C0]();
}

uint64_t OPACKEncoderCreateData()
{
  return MEMORY[0x1F41168D0]();
}

uint64_t OPACKEstimateEncodedSize()
{
  return MEMORY[0x1F41168E0]();
}

uint64_t RandomBytes()
{
  return MEMORY[0x1F4116A00]();
}

uint64_t SNPrintF()
{
  return MEMORY[0x1F4116A18]();
}

uint64_t SecondsToUpTicks()
{
  return MEMORY[0x1F4116A30]();
}

uint64_t ServerSocketOpenEx2()
{
  return MEMORY[0x1F4116A48]();
}

uint64_t ServerSocketPairOpen()
{
  return MEMORY[0x1F4116A50]();
}

uint64_t SipHash()
{
  return MEMORY[0x1F4116A60]();
}

uint64_t SockAddrCompareAddr()
{
  return MEMORY[0x1F4116A68]();
}

uint64_t SockAddrConvertToIPv6()
{
  return MEMORY[0x1F4116A70]();
}

uint64_t SockAddrGetPort()
{
  return MEMORY[0x1F4116A80]();
}

uint64_t SockAddrGetSize()
{
  return MEMORY[0x1F4116A88]();
}

uint64_t SockAddrSetPort()
{
  return MEMORY[0x1F4116A90]();
}

uint64_t SockAddrSimplify()
{
  return MEMORY[0x1F4116A98]();
}

uint64_t SockAddrToString()
{
  return MEMORY[0x1F4116AA0]();
}

uint64_t SocketGetInterfaceInfo()
{
  return MEMORY[0x1F4116AB8]();
}

uint64_t SourceVersionToCString()
{
  return MEMORY[0x1F4116B10]();
}

uint64_t StringToSockAddr()
{
  return MEMORY[0x1F4116B18]();
}

uint64_t TN6sBSnEP2()
{
  return MEMORY[0x1F4116B80]();
}

void TXTRecordCreate(TXTRecordRef *txtRecord, uint16_t bufferLen, void *buffer)
{
}

void TXTRecordDeallocate(TXTRecordRef *txtRecord)
{
}

const void *__cdecl TXTRecordGetBytesPtr(const TXTRecordRef *txtRecord)
{
  return (const void *)MEMORY[0x1F40C9A38](txtRecord);
}

uint16_t TXTRecordGetLength(const TXTRecordRef *txtRecord)
{
  return MEMORY[0x1F40C9A50](txtRecord);
}

uint64_t TXTRecordGetNextItem()
{
  return MEMORY[0x1F4116B88]();
}

DNSServiceErrorType TXTRecordSetValue(TXTRecordRef *txtRecord, const char *key, uint8_t valueSize, const void *value)
{
  return MEMORY[0x1F40C9A68](txtRecord, key, valueSize, value);
}

uint64_t TextToHardwareAddress()
{
  return MEMORY[0x1F4116BA0]();
}

uint64_t TextToHardwareAddressScalar()
{
  return MEMORY[0x1F4116BB0]();
}

uint64_t UpTicksToMilliseconds()
{
  return MEMORY[0x1F4116BF8]();
}

uint64_t UpTicksToSeconds()
{
  return MEMORY[0x1F4116C10]();
}

uint64_t UpTicksToSecondsF()
{
  return MEMORY[0x1F4116C20]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x1F40D9450]();
}

uint64_t _LogCategory_Initialize()
{
  return MEMORY[0x1F4116C88]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

float __exp10f(float a1)
{
  MEMORY[0x1F40C9B98](a1);
  return result;
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1F40C9CD8]();
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t cccurve25519()
{
  return MEMORY[0x1F40CA7D0]();
}

uint64_t cccurve25519_make_pub()
{
  return MEMORY[0x1F40CA7E8]();
}

uint64_t cced25519_make_key_pair_compat()
{
  return MEMORY[0x1F4116C90]();
}

uint64_t cced25519_sign_compat()
{
  return MEMORY[0x1F4116C98]();
}

uint64_t cced25519_verify_compat()
{
  return MEMORY[0x1F4116CA0]();
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

size_t compression_decode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x1F417F0A0](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(void *)&algorithm);
}

size_t compression_encode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x1F417F0B0](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(void *)&algorithm);
}

int connect(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x1F40CB440](*(void *)&a1, a2, *(void *)&a3);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1F40CC058](*(void *)&a1, *(void *)&a2);
}

void free(void *a1)
{
}

void freeifaddrs(ifaddrs *a1)
{
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x1F40CC2F0](*(void *)&a1, a2);
}

int getifaddrs(ifaddrs **a1)
{
  return MEMORY[0x1F40CC410](a1);
}

int getpeername(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x1F40CC488](*(void *)&a1, a2, a3);
}

int getsockname(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x1F40CC558](*(void *)&a1, a2, a3);
}

unsigned int if_nametoindex(const char *a1)
{
  return MEMORY[0x1F40CC650](a1);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1F40CC8F8](*(void *)&a1, a2, *(void *)&a3);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x1F40CCD40](__s, __smax, *(void *)&__c, __n);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1F40CD040](*(void *)&token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

uint64_t nw_activity_activate()
{
  return MEMORY[0x1F40F2870]();
}

uint64_t nw_activity_complete_with_reason()
{
  return MEMORY[0x1F40F2878]();
}

uint64_t nw_activity_complete_with_reason_and_underlying_error_string()
{
  return MEMORY[0x1F40F2888]();
}

uint64_t nw_activity_create()
{
  return MEMORY[0x1F40F2898]();
}

uint64_t nw_activity_create_from_token()
{
  return MEMORY[0x1F40F28A0]();
}

uint64_t nw_activity_get_token()
{
  return MEMORY[0x1F40F28C0]();
}

uint64_t nw_activity_is_activated()
{
  return MEMORY[0x1F40F28D0]();
}

uint64_t nw_activity_set_parent_activity()
{
  return MEMORY[0x1F40F28E8]();
}

uint64_t nw_activity_submit_metrics()
{
  return MEMORY[0x1F40F2900]();
}

void nw_connection_cancel(nw_connection_t connection)
{
}

nw_endpoint_t nw_endpoint_create_address(const sockaddr *address)
{
  return (nw_endpoint_t)MEMORY[0x1F40F2E80](address);
}

uint64_t nw_endpoint_create_address_with_ethernet()
{
  return MEMORY[0x1F40F2E88]();
}

const sockaddr *__cdecl nw_endpoint_get_address(nw_endpoint_t endpoint)
{
  return (const sockaddr *)MEMORY[0x1F40F2ED0](endpoint);
}

CFErrorRef nw_error_copy_cf_error(nw_error_t error)
{
  return (CFErrorRef)MEMORY[0x1F40F2F50](error);
}

void nw_framer_async(nw_framer_t framer, nw_framer_block_t async_block)
{
}

uint64_t nw_framer_connection_state_copy_object_value()
{
  return MEMORY[0x1F40F3110]();
}

uint64_t nw_framer_connection_state_set_object_value()
{
  return MEMORY[0x1F40F3118]();
}

nw_protocol_definition_t nw_framer_create_definition(const char *identifier, uint32_t flags, nw_framer_start_handler_t start_handler)
{
  return (nw_protocol_definition_t)MEMORY[0x1F40F3120](identifier, *(void *)&flags, start_handler);
}

BOOL nw_framer_deliver_input_no_copy(nw_framer_t framer, size_t input_length, nw_framer_message_t message, BOOL is_complete)
{
  return MEMORY[0x1F40F3130](framer, input_length, message, is_complete);
}

void nw_framer_mark_failed_with_error(nw_framer_t framer, int error_code)
{
}

void nw_framer_mark_ready(nw_framer_t framer)
{
}

nw_framer_message_t nw_framer_message_create(nw_framer_t framer)
{
  return (nw_framer_message_t)MEMORY[0x1F40F3150](framer);
}

BOOL nw_framer_parse_input(nw_framer_t framer, size_t minimum_incomplete_length, size_t maximum_length, uint8_t *temp_buffer, nw_framer_parse_completion_t parse)
{
  return MEMORY[0x1F40F3160](framer, minimum_incomplete_length, maximum_length, temp_buffer, parse);
}

void nw_framer_set_cleanup_handler(nw_framer_t framer, nw_framer_cleanup_handler_t cleanup_handler)
{
}

void nw_framer_set_input_handler(nw_framer_t framer, nw_framer_input_handler_t input_handler)
{
}

void nw_framer_set_output_handler(nw_framer_t framer, nw_framer_output_handler_t output_handler)
{
}

void nw_framer_set_stop_handler(nw_framer_t framer, nw_framer_stop_handler_t stop_handler)
{
}

void nw_framer_write_output(nw_framer_t framer, const uint8_t *output_buffer, size_t output_length)
{
}

BOOL nw_framer_write_output_no_copy(nw_framer_t framer, size_t output_length)
{
  return MEMORY[0x1F40F31B0](framer, output_length);
}

uint64_t nw_interface_create_with_name()
{
  return MEMORY[0x1F40F3238]();
}

void nw_listener_cancel(nw_listener_t listener)
{
}

uint64_t nw_listener_copy_local_endpoint()
{
  return MEMORY[0x1F40F3318]();
}

nw_listener_t nw_listener_create(nw_parameters_t parameters)
{
  return (nw_listener_t)MEMORY[0x1F40F3320](parameters);
}

uint64_t nw_listener_set_event_handler()
{
  return MEMORY[0x1F40F3348]();
}

void nw_listener_set_new_connection_handler(nw_listener_t listener, nw_listener_new_connection_handler_t handler)
{
}

void nw_listener_set_queue(nw_listener_t listener, dispatch_queue_t queue)
{
}

void nw_listener_start(nw_listener_t listener)
{
}

nw_protocol_stack_t nw_parameters_copy_default_protocol_stack(nw_parameters_t parameters)
{
  return (nw_protocol_stack_t)MEMORY[0x1F40F3418](parameters);
}

uint64_t nw_parameters_create_legacy_tcp_socket()
{
  return MEMORY[0x1F40F34A0]();
}

nw_parameters_t nw_parameters_create_secure_udp(nw_parameters_configure_protocol_block_t configure_dtls, nw_parameters_configure_protocol_block_t configure_udp)
{
  return (nw_parameters_t)MEMORY[0x1F40F34E0](configure_dtls, configure_udp);
}

void nw_parameters_require_interface(nw_parameters_t parameters, nw_interface_t interface)
{
}

uint64_t nw_parameters_set_allow_duplicate_state_updates()
{
  return MEMORY[0x1F40F35A8]();
}

uint64_t nw_parameters_set_delegated_unique_pid()
{
  return MEMORY[0x1F40F35F0]();
}

void nw_parameters_set_local_endpoint(nw_parameters_t parameters, nw_endpoint_t local_endpoint)
{
}

void nw_parameters_set_reuse_local_address(nw_parameters_t parameters, BOOL reuse_local_address)
{
}

uint64_t nw_path_create_evaluator_for_endpoint()
{
  return MEMORY[0x1F40F3858]();
}

uint64_t nw_path_evaluator_cancel()
{
  return MEMORY[0x1F40F3878]();
}

uint64_t nw_path_evaluator_get_client_id()
{
  return MEMORY[0x1F40F3890]();
}

void nw_protocol_stack_set_transport_protocol(nw_protocol_stack_t stack, nw_protocol_options_t protocol)
{
}

nw_protocol_options_t nw_udp_create_options(void)
{
  return (nw_protocol_options_t)MEMORY[0x1F40F3F98]();
}

uint64_t nw_udp_options_set_no_metadata()
{
  return MEMORY[0x1F40F3FA0]();
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CD0E0](a1, *(void *)&a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1F40CD560](log, ptr);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1F40CD648]();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1F40CDC50](*(void *)&a1, a2, a3);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CE110](a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

uint64_t stristr()
{
  return MEMORY[0x1F4116D50]();
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x1F40CE658](uu);
}

uint64_t wInTP56r94EFs9NAAi()
{
  return MEMORY[0x1F4116D78]();
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1F40CE928](*(void *)&__fd, __buf, __nbyte);
}

xpc_object_t xpc_fd_create(int fd)
{
  return (xpc_object_t)MEMORY[0x1F40CF0B8](*(void *)&fd);
}

int xpc_fd_dup(xpc_object_t xfd)
{
  return MEMORY[0x1F40CF0D0](xfd);
}