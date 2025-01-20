void OUTLINED_FUNCTION_9(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;
  uint64_t v10;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

void OUTLINED_FUNCTION_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x18u);
}

unsigned char *OUTLINED_FUNCTION_6(unsigned char *result, unsigned char *a2)
{
  *result = 0;
  *a2 = 0;
  return result;
}

uint64_t ggctl_connect(io_object_t *a1)
{
  io_connect_t connect = 0;
  mach_port_t v2 = *MEMORY[0x263F0EC88];
  CFDictionaryRef v3 = IOServiceMatching("AppleHDQGasGaugeControl");
  io_service_t MatchingService = IOServiceGetMatchingService(v2, v3);
  if (MatchingService)
  {
    io_object_t v5 = MatchingService;
    if (IOServiceOpen(MatchingService, *MEMORY[0x263EF8960], 0, &connect))
    {
      if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR)) {
        ggctl_connect_cold_2();
      }
      io_connect_t connect = 0;
    }
    if (a1) {
      *a1 = v5;
    }
    else {
      IOObjectRelease(v5);
    }
    return connect;
  }
  else
  {
    v6 = logger;
    uint64_t result = os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR);
    if (result)
    {
      ggctl_connect_cold_1(v6);
      return 0;
    }
  }
  return result;
}

uint64_t ggctl_disconnect(uint64_t connect)
{
  if (connect) {
    return IOServiceClose(connect);
  }
  return connect;
}

void ggctl_reset(mach_port_t a1, unsigned int a2)
{
  kern_return_t v2;
  NSObject *v3;
  uint8_t buf[8];
  uint64_t input;

  input = a2;
  mach_port_t v2 = IOConnectCallMethod(a1, 0, &input, 1u, 0, 0, 0, 0, 0, 0);
  CFDictionaryRef v3 = logger;
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR)) {
      ggctl_reset_cold_1();
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_225A99000, v3, OS_LOG_TYPE_DEFAULT, "gas gauge: reset", buf, 2u);
    }
    ++gauge_reset_count;
  }
}

uint64_t ggctl_get_hdq_state(mach_port_t a1)
{
  kern_return_t v1;
  uint32_t outputCnt;
  uint64_t output;

  output = 0;
  outputCnt = 1;
  v1 = IOConnectCallMethod(a1, 1u, 0, 0, 0, 0, &output, &outputCnt, 0, 0);
  if (v1 == -536870183) {
    return 4294967294;
  }
  if (v1) {
    return 0xFFFFFFFFLL;
  }
  return output != 0;
}

uint64_t ggctl_get_device_configuration(mach_port_t a1, void *outputStruct)
{
  size_t outputStructCnt = 352;
  return IOConnectCallStructMethod(a1, 2u, 0, 0, outputStruct, &outputStructCnt);
}

uint64_t ggctl_enable_currentlog(mach_port_t a1, unsigned int a2)
{
  uint64_t input = a2;
  return IOConnectCallScalarMethod(a1, 3u, &input, 1u, 0, 0);
}

uint64_t ggctl_map_currentlog(uint64_t a1, void *a2)
{
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  uint64_t result = MEMORY[0x22A639180](a1, 0, *MEMORY[0x263EF8960], &v6, &v5, 1);
  uint64_t v4 = v6;
  if (result) {
    uint64_t v4 = 0;
  }
  *a2 = v4;
  return result;
}

uint64_t ggctl_open_device(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = a1;
  if (!a3) {
    return v3;
  }
  int hdq_state = ggctl_get_hdq_state(a1);
  if (hdq_state < 0)
  {
    if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR)) {
      ggctl_open_device_cold_2();
    }
  }
  else
  {
    if (hdq_state)
    {
      if (IOConnectCallScalarMethod(v3, 6u, 0, 0, 0, 0)
        && os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
      {
        ggctl_open_device_cold_4();
      }
      return v3;
    }
    if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR)) {
      ggctl_open_device_cold_3();
    }
    ggctl_reset(v3, 1u);
  }
  uint64_t v5 = logger;
  if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR)) {
    ggctl_open_device_cold_1(v5);
  }
  return 0xFFFFFFFFLL;
}

uint64_t hdqBreak(mach_port_t a1)
{
  kern_return_t v1;
  unsigned int v2;

  v1 = IOConnectCallScalarMethod(a1, 6u, 0, 0, 0, 0);
  if (v1 == -536870183) {
    mach_port_t v2 = -2;
  }
  else {
    mach_port_t v2 = -1;
  }
  if (v1) {
    return v2;
  }
  else {
    return 0;
  }
}

uint64_t ggctl_hdqBreak(mach_port_t a1)
{
  kern_return_t v1;
  unsigned int v2;

  v1 = IOConnectCallScalarMethod(a1, 6u, 0, 0, 0, 0);
  if (v1 == -536870183) {
    mach_port_t v2 = -2;
  }
  else {
    mach_port_t v2 = -1;
  }
  if (v1) {
    return v2;
  }
  else {
    return 0;
  }
}

uint64_t ggctl_hdqRead8(mach_port_t a1, int a2)
{
  output[1] = *MEMORY[0x263EF8340];
  output[0] = 0;
  uint64_t input = a2;
  int64x2_t v5 = vdupq_n_s64(8uLL);
  uint32_t outputCnt = 1;
  if (IOConnectCallScalarMethod(a1, 7u, &input, 3u, output, &outputCnt)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return LODWORD(output[0]);
  }
}

uint64_t ggctl_hdqRead16(mach_port_t a1, int a2)
{
  output[1] = *MEMORY[0x263EF8340];
  output[0] = 0;
  uint32_t outputCnt = 1;
  uint64_t v3 = a2;
  if (IOConnectCallScalarMethod(a1, 8u, &v3, 1u, output, &outputCnt)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return LODWORD(output[0]);
  }
}

uint64_t ggctl_hdqWrite8(mach_port_t a1, char a2, unsigned __int8 a3)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v4 = a2 & 0x7F | (a3 << 8) | 0x80u;
  long long v5 = xmmword_225AA4190;
  if (IOConnectCallScalarMethod(a1, 7u, &v4, 3u, 0, 0)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t ggctl_controlRead16(mach_port_t a1, int a2)
{
  output[1] = *MEMORY[0x263EF8340];
  output[0] = 0;
  uint32_t outputCnt = 1;
  uint64_t v3 = a2;
  if (IOConnectCallScalarMethod(a1, 0xBu, &v3, 1u, output, &outputCnt)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return LODWORD(output[0]);
  }
}

uint64_t ggctl_controlWrite16(mach_port_t a1, int a2, int a3)
{
  input[2] = *MEMORY[0x263EF8340];
  input[0] = a2;
  input[1] = a3;
  if (IOConnectCallScalarMethod(a1, 0xAu, input, 2u, 0, 0)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t ggctl_readBlock(mach_port_t a1, int a2, int a3, void *outputStruct, unsigned char *a5)
{
  input[2] = *MEMORY[0x263EF8340];
  input[0] = a2;
  input[1] = a3;
  uint64_t output = 0;
  uint32_t outputCnt = 1;
  size_t v7 = 32;
  if (IOConnectCallMethod(a1, 9u, input, 2u, 0, 0, &output, &outputCnt, outputStruct, &v7)) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = 0;
  if (a5) {
    *a5 = output;
  }
  return result;
}

uint64_t ggctl_writeBlock(mach_port_t a1, int a2, int a3, void *inputStruct)
{
  input[2] = *MEMORY[0x263EF8340];
  input[0] = a2;
  input[1] = a3;
  if (IOConnectCallMethod(a1, 0xFu, input, 2u, inputStruct, 0x20uLL, 0, 0, 0, 0)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t ggctl_drainDataLog(mach_port_t a1)
{
  if (IOConnectCallMethod(a1, 0xEu, 0, 0, 0, 0, 0, 0, 0, 0)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t ggctl_gaugeInterrupts(mach_port_t a1, unsigned int a2)
{
  kern_return_t v2;
  unsigned int v3;
  uint64_t input;

  uint64_t input = a2;
  mach_port_t v2 = IOConnectCallScalarMethod(a1, 0x10u, &input, 1u, 0, 0);
  if (v2 == -536870183) {
    uint64_t v3 = -2;
  }
  else {
    uint64_t v3 = -1;
  }
  if (v2) {
    return v3;
  }
  else {
    return 0;
  }
}

CFDictionaryRef pmps_service()
{
  keys = @"built-in";
  CFDictionaryRef result = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const void **)&keys, MEMORY[0x263EFFB40], 1, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (result)
  {
    CFDictionaryRef v1 = result;
    mach_port_t v2 = IOServiceMatching("IOPMPowerSource");
    CFDictionarySetValue(v2, @"IOPropertyMatch", v1);
    CFRelease(v1);
    return (CFDictionaryRef)IOServiceGetMatchingService(*MEMORY[0x263F0EC88], v2);
  }
  return result;
}

uint64_t uart_open_device(uint64_t a1, uint64_t a2, int a3)
{
  return ggctl_open_device(a1, 0, a3);
}

uint64_t hdqRead16(mach_port_t a1, int a2)
{
  output[1] = *MEMORY[0x263EF8340];
  output[0] = 0;
  uint32_t outputCnt = 1;
  uint64_t v3 = a2;
  if (IOConnectCallScalarMethod(a1, 8u, &v3, 1u, output, &outputCnt)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return LODWORD(output[0]);
  }
}

uint64_t hdqWrite8(mach_port_t a1, char a2, unsigned __int8 a3)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v4 = a2 & 0x7F | (a3 << 8) | 0x80u;
  long long v5 = xmmword_225AA4190;
  if (IOConnectCallScalarMethod(a1, 7u, &v4, 3u, 0, 0)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t controlOp16(mach_port_t a1, int a2)
{
  uint64_t input = a2;
  if (IOConnectCallScalarMethod(a1, 0xAu, &input, 1u, 0, 0)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t controlRead16(mach_port_t a1, int a2)
{
  output[1] = *MEMORY[0x263EF8340];
  output[0] = 0;
  uint32_t outputCnt = 1;
  uint64_t v3 = a2;
  if (IOConnectCallScalarMethod(a1, 0xBu, &v3, 1u, output, &outputCnt)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return LODWORD(output[0]);
  }
}

uint64_t controlWrite16(mach_port_t a1, int a2, int a3)
{
  input[2] = *MEMORY[0x263EF8340];
  input[0] = a2;
  input[1] = a3;
  if (IOConnectCallScalarMethod(a1, 0xAu, input, 2u, 0, 0)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t writeBlock(mach_port_t a1, int a2, int a3, void *inputStruct)
{
  input[2] = *MEMORY[0x263EF8340];
  input[0] = a2;
  input[1] = a3;
  if (IOConnectCallMethod(a1, 0xFu, input, 2u, inputStruct, 0x20uLL, 0, 0, 0, 0)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t drainDataLog(mach_port_t a1)
{
  if (IOConnectCallMethod(a1, 0xEu, 0, 0, 0, 0, 0, 0, 0, 0)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t gaugeEnableInterrupts(mach_port_t a1)
{
  kern_return_t v1;
  unsigned int v2;
  uint64_t input;

  uint64_t input = 1;
  CFDictionaryRef v1 = IOConnectCallScalarMethod(a1, 0x10u, &input, 1u, 0, 0);
  if (v1 == -536870183) {
    mach_port_t v2 = -2;
  }
  else {
    mach_port_t v2 = -1;
  }
  if (v1) {
    return v2;
  }
  else {
    return 0;
  }
}

uint64_t gaugeDisableInterrupts(mach_port_t a1)
{
  kern_return_t v1;
  unsigned int v2;
  uint64_t input;

  uint64_t input = 0;
  CFDictionaryRef v1 = IOConnectCallScalarMethod(a1, 0x10u, &input, 1u, 0, 0);
  if (v1 == -536870183) {
    mach_port_t v2 = -2;
  }
  else {
    mach_port_t v2 = -1;
  }
  if (v1) {
    return v2;
  }
  else {
    return 0;
  }
}

uint64_t gaugeDisconnect(mach_port_t connection)
{
  int v2 = 0;
  uint64_t v13 = *MEMORY[0x263EF8340];
  do
  {
    uint64_t output = 0;
    uint32_t outputCnt = 1;
    uint64_t input = 23;
    if (IOConnectCallScalarMethod(connection, 0xBu, &input, 1u, &output, &outputCnt)) {
      int v3 = -1;
    }
    else {
      int v3 = output;
    }
    if (!v3) {
      break;
    }
    uint64_t v4 = logger;
    if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
    {
      LODWORD(output) = 67109376;
      HIDWORD(output) = v2;
      __int16 v11 = 1024;
      int v12 = v3;
      _os_log_error_impl(&dword_225A99000, v4, OS_LOG_TYPE_ERROR, "%d: retry OpenProtector (%d)", (uint8_t *)&output, 0xEu);
    }
    usleep(0xF4240u);
    ++v2;
  }
  while (v2 != 3);
  __int16 v7 = 0;
  uint64_t output = 0;
  uint32_t outputCnt = 1;
  uint64_t input = 32;
  IOConnectCallScalarMethod(connection, 0xBu, &input, 1u, &output, &outputCnt);
  if (controlReadU16(connection, 0, &v7)) {
    return 4294967291;
  }
  if (v3) {
    unsigned int v6 = -36;
  }
  else {
    unsigned int v6 = 0;
  }
  if ((v7 & 0x2000) != 0) {
    return v6;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t controlReadU16(mach_port_t a1, int a2, _WORD *a3)
{
  output[1] = *MEMORY[0x263EF8340];
  output[0] = 0;
  uint32_t outputCnt = 1;
  uint64_t v5 = a2;
  if (IOConnectCallScalarMethod(a1, 0xBu, &v5, 1u, output, &outputCnt)) {
    uint64_t result = 0xFFFFFFFFLL;
  }
  else {
    uint64_t result = LODWORD(output[0]);
  }
  if ((result & 0x80000000) == 0)
  {
    if (a3) {
      *a3 = result;
    }
    return 0;
  }
  return result;
}

uint64_t hdqReadS16(mach_port_t a1, int a2, _WORD *a3)
{
  output[1] = *MEMORY[0x263EF8340];
  output[0] = 0;
  uint32_t outputCnt = 1;
  uint64_t v5 = a2;
  if (IOConnectCallScalarMethod(a1, 8u, &v5, 1u, output, &outputCnt)) {
    uint64_t result = 0xFFFFFFFFLL;
  }
  else {
    uint64_t result = LODWORD(output[0]);
  }
  if ((result & 0x80000000) == 0)
  {
    if (a3) {
      *a3 = result;
    }
    return 0;
  }
  return result;
}

uint64_t hdqReadU16(mach_port_t a1, int a2, _WORD *a3)
{
  output[1] = *MEMORY[0x263EF8340];
  output[0] = 0;
  uint32_t outputCnt = 1;
  uint64_t v5 = a2;
  if (IOConnectCallScalarMethod(a1, 8u, &v5, 1u, output, &outputCnt)) {
    uint64_t result = 0xFFFFFFFFLL;
  }
  else {
    uint64_t result = LODWORD(output[0]);
  }
  if ((result & 0x80000000) == 0)
  {
    if (a3) {
      *a3 = result;
    }
    return 0;
  }
  return result;
}

uint64_t hdqReadS8(mach_port_t a1, int a2, unsigned char *a3)
{
  uint64_t result = ggctl_hdqRead8(a1, a2);
  if ((result & 0x80000000) == 0)
  {
    if (a3) {
      *a3 = result;
    }
    return 0;
  }
  return result;
}

uint64_t hdqReadU8(mach_port_t a1, int a2, unsigned char *a3)
{
  uint64_t result = ggctl_hdqRead8(a1, a2);
  if ((result & 0x80000000) == 0)
  {
    if (a3) {
      *a3 = result;
    }
    return 0;
  }
  return result;
}

uint64_t controlReadS16(mach_port_t a1, int a2, _WORD *a3)
{
  output[1] = *MEMORY[0x263EF8340];
  output[0] = 0;
  uint32_t outputCnt = 1;
  uint64_t v5 = a2;
  if (IOConnectCallScalarMethod(a1, 0xBu, &v5, 1u, output, &outputCnt)) {
    uint64_t result = 0xFFFFFFFFLL;
  }
  else {
    uint64_t result = LODWORD(output[0]);
  }
  if ((result & 0x80000000) == 0)
  {
    if (a3) {
      *a3 = result;
    }
    return 0;
  }
  return result;
}

uint64_t dumpBuffer(unsigned __int8 *a1, int a2)
{
  if (a2 >= 1)
  {
    uint64_t v4 = a2;
    do
    {
      int v5 = *a1++;
      printf(" %02x", v5);
      --v4;
    }
    while (v4);
  }
  return putchar(10);
}

uint64_t registerName(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0x600)
  {
    if (a2 - 1281 > 1 || (*(_DWORD *)a1 | 4) != 0x1E) {
      goto LABEL_8;
    }
    return 0;
  }
  if ((*(_DWORD *)a1 | 2) == 0xE) {
    return 0;
  }
LABEL_8:
  uint64_t v2 = *(void *)(a1 + 72);
  if (!v2
    && (a2 < 0x600 || (uint64_t v2 = *(void *)(a1 + 48)) == 0)
    && (a2 < 0x501 || (uint64_t v2 = *(void *)(a1 + 40)) == 0)
    && (a2 < 0x313 || (uint64_t v2 = *(void *)(a1 + 32)) == 0)
    && (a2 < 0x132 || (uint64_t v2 = *(void *)(a1 + 24)) == 0))
  {
    if (a2 < 0x119) {
      return *(void *)(a1 + 8);
    }
    uint64_t v2 = *(void *)(a1 + 16);
    if (!v2) {
      return *(void *)(a1 + 8);
    }
  }
  return v2;
}

uint64_t readRegister(_WORD *a1, uint64_t a2, mach_port_t a3)
{
  int v4 = *(_DWORD *)(a2 + 4);
  uint64_t result = 0xFFFFFFFFLL;
  if (v4 <= 1)
  {
    if (v4)
    {
      if (v4 == 1)
      {
        int v6 = *(_DWORD *)a2;
        return hdqReadU16(a3, v6, a1);
      }
    }
    else
    {
      int v9 = *(_DWORD *)a2;
      return hdqReadS16(a3, v9, a1);
    }
  }
  else
  {
    switch(v4)
    {
      case 100:
        __int16 v7 = *(uint64_t (**)(_WORD *))(a2 + 64);
        if (v7)
        {
          return v7(a1);
        }
        break;
      case 10:
        int v8 = *(_DWORD *)a2;
        return controlReadU16(a3, v8, a1);
      case 2:
        uint64_t result = ggctl_hdqRead8(a3, *(_DWORD *)a2);
        if ((result & 0x80000000) == 0)
        {
          if (a1) {
            *(unsigned char *)a1 = result;
          }
          return 0;
        }
        break;
    }
  }
  return result;
}

uint64_t getFWVersion(mach_port_t a1, __int16 *a2)
{
  __int16 v3 = getFWVersion_gFWVersion[0];
  if (getFWVersion_gFWVersion[0]) {
    goto LABEL_2;
  }
  if (!controlReadU16(a1, 2, getFWVersion_gFWVersion))
  {
    __int16 v3 = getFWVersion_gFWVersion[0];
    if (getFWVersion_gFWVersion[0] == 256)
    {
      __int16 v3 = 1536;
      getFWVersion_gFWVersion[0] = 1536;
    }
LABEL_2:
    uint64_t result = 0;
    *a2 = v3;
    return result;
  }
  return 0xFFFFFFFFLL;
}

double readLifetimeData(_OWORD *a1, uint64_t a2, mach_port_t a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  unsigned __int16 v8 = 0;
  if ((getFWVersion(a3, (__int16 *)&v8) & 0x80000000) == 0
    && v8 >= 0x313u
    && !ggctl_readBlock(a3, -1, 4, &outputStruct, 0))
  {
    long long v6 = v10;
    *a1 = outputStruct;
    a1[1] = v6;
    if (!ggctl_readBlock(a3, -1, 6, &outputStruct, 0))
    {
      double result = *(double *)&outputStruct;
      long long v7 = v10;
      a1[2] = outputStruct;
      a1[3] = v7;
    }
  }
  return result;
}

double readRaTableData(_OWORD *a1, uint64_t a2, mach_port_t a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  unsigned __int16 v7 = 0;
  if ((getFWVersion(a3, (__int16 *)&v7) & 0x80000000) == 0
    && v7 >= 0x600u
    && !ggctl_readBlock(a3, -1, 7, outputStruct, 0))
  {
    double result = *(double *)outputStruct;
    long long v6 = outputStruct[1];
    *a1 = outputStruct[0];
    a1[1] = v6;
  }
  return result;
}

double readIMAXAndSOCSmoothData(_OWORD *a1, uint64_t a2, mach_port_t a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  unsigned __int16 v7 = 0;
  if ((getFWVersion(a3, (__int16 *)&v7) & 0x80000000) == 0
    && v7 >= 0x600u
    && !ggctl_readBlock(a3, -1, 8, outputStruct, 0))
  {
    double result = *(double *)outputStruct;
    long long v6 = outputStruct[1];
    *a1 = outputStruct[0];
    a1[1] = v6;
  }
  return result;
}

uint64_t findRaWeightMulitplier(int a1)
{
  uint64_t v1 = 0;
  while ((unsigned __int16)battery_health_metric_config[v1] != a1)
  {
    v1 += 4;
    if (v1 == 68) {
      return 0;
    }
  }
  return *(unsigned int *)&battery_health_metric_config[v1 + 2];
}

float calculateWra(unsigned int a1, unsigned int a2, unsigned int a3, unsigned int a4, unsigned int a5, unsigned int a6, unsigned int a7, unsigned int a8, unsigned __int16 a9)
{
  return (double)a2 * 0.137995
       + (double)a1 * 0.0693069
       + (double)a3 * 0.137376
       + (double)a4 * 0.137376
       + (double)a5 * 0.137376
       + (double)a6 * 0.137376
       + (double)a7 * 0.137376
       + (double)a8 * 0.0872525
       + (double)a9 * 0.0185644;
}

float calculateChemicalWeightedRa(unsigned int a1, float a2)
{
  return (float)((float)a1 * a2) / 1000.0;
}

CFDictionaryRef readShutdownReasonData(mach_port_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  int v7 = 0;
  long long v6 = 0u;
  memset(v5, 0, sizeof(v5));
  memset(v12, 0, sizeof(v12));
  if (ggctl_logShutdownReason(a1, (uint64_t)v5, 1u))
  {
    uint64_t v2 = logger;
    if (!os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT)) {
      return 0;
    }
    *(_DWORD *)buf = 136315394;
    uint64_t v9 = "readShutdownReasonData";
    __int16 v10 = 1024;
    int v11 = 2502;
    __int16 v3 = "%s:%d cannot read data";
LABEL_4:
    _os_log_impl(&dword_225A99000, v2, OS_LOG_TYPE_DEFAULT, v3, buf, 0x12u);
    return 0;
  }
  if (!*((void *)&v6 + 1))
  {
    uint64_t v2 = logger;
    if (!os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT)) {
      return 0;
    }
    *(_DWORD *)buf = 136315394;
    uint64_t v9 = "readShutdownReasonData";
    __int16 v10 = 1024;
    int v11 = 2506;
    __int16 v3 = "%s:%d invalid timestamp";
    goto LABEL_4;
  }
  return parseShutdownReason((__int16 *)v5, (const UInt8 *)v12, a1);
}

uint64_t ggctl_logShutdownReason(mach_port_t a1, uint64_t a2, unsigned int a3)
{
  kern_return_t v4;
  long long v5;
  long long v7;
  uint64_t input;
  uint64_t v9;
  size_t v10;
  long long outputStruct;
  long long v12;
  long long v13;
  long long v14;
  _OWORD inputStruct[3];
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x263EF8340];
  __int16 v10 = 64;
  if (!a2) {
    return 0xFFFFFFFFLL;
  }
  if (a3)
  {
    uint64_t v13 = 0u;
    v14 = 0u;
    long long outputStruct = 0u;
    int v12 = 0u;
    uint64_t input = a3;
    int v4 = IOConnectCallMethod(a1, 0x11u, &input, 1u, inputStruct, 0x40uLL, 0, 0, &outputStruct, &v10);
    if (!v4)
    {
      int v5 = v12;
      *(_OWORD *)a2 = outputStruct;
      *(_OWORD *)(a2 + 16) = v5;
      *(_OWORD *)(a2 + 32) = v13;
      *(_DWORD *)(a2 + 48) = v14;
    }
  }
  else
  {
    int v7 = *(_OWORD *)(a2 + 16);
    inputStruct[0] = *(_OWORD *)a2;
    inputStruct[1] = v7;
    inputStruct[2] = *(_OWORD *)(a2 + 32);
    v16 = *(_DWORD *)(a2 + 48);
    uint64_t v9 = a3;
    int v4 = IOConnectCallMethod(a1, 0x11u, &v9, 1u, inputStruct, 0x40uLL, 0, 0, &outputStruct, &v10);
  }
  if (v4) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

CFDictionaryRef parseShutdownReason(__int16 *a1, const UInt8 *a2, mach_port_t a3)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  v39 = 0;
  keys[0] = @"ShutDownTimestamp";
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  uint64_t valuePtr = *((void *)a1 + 5);
  values[0] = CFNumberCreate(v6, kCFNumberLongType, &valuePtr);
  keys[1] = @"ShutDownUISoc";
  int v34 = *((_DWORD *)a1 + 12);
  values[1] = CFNumberCreate(v6, kCFNumberFloatType, &v34);
  keys[2] = @"ShutDownTemperature";
  int v33 = *a1;
  values[2] = CFNumberCreate(v6, kCFNumberIntType, &v33);
  keys[3] = @"ShutDownPresentDOD";
  int v32 = a1[1];
  values[3] = CFNumberCreate(v6, kCFNumberIntType, &v32);
  keys[4] = @"ShutDownMaxRa08";
  int v31 = a1[2];
  values[4] = CFNumberCreate(v6, kCFNumberIntType, &v31);
  keys[5] = @"ShutDownNominalChargeCapacity";
  int v30 = (unsigned __int16)a1[3];
  values[5] = CFNumberCreate(v6, kCFNumberIntType, &v30);
  keys[6] = @"ShutDownPrevNominalChargeCapacity";
  int v29 = (unsigned __int16)a1[4];
  values[6] = CFNumberCreate(v6, kCFNumberIntType, &v29);
  keys[7] = @"ShutDownFullChargeCapacity";
  int v28 = a1[5];
  values[7] = CFNumberCreate(v6, kCFNumberIntType, &v28);
  keys[8] = @"ShutDownPrevFullChargeCapacity";
  int v27 = a1[6];
  values[8] = CFNumberCreate(v6, kCFNumberIntType, &v27);
  keys[9] = @"ShutDownRemainingCapacity";
  int v26 = a1[7];
  values[9] = CFNumberCreate(v6, kCFNumberIntType, &v26);
  keys[10] = @"ShutDownPrevRemainingCapacity";
  int v25 = a1[8];
  values[10] = CFNumberCreate(v6, kCFNumberIntType, &v25);
  keys[11] = @"ShutDownCycleCount";
  int v24 = (unsigned __int16)a1[9];
  values[11] = CFNumberCreate(v6, kCFNumberIntType, &v24);
  keys[12] = @"ShutDownMaxDischargeCurrent";
  int v23 = a1[10];
  values[12] = CFNumberCreate(v6, kCFNumberIntType, &v23);
  keys[13] = @"ShutDownTimeAbove95";
  int v22 = *((unsigned __int8 *)a1 + 22);
  values[13] = CFNumberCreate(v6, kCFNumberIntType, &v22);
  keys[14] = @"ShutDownVoltage";
  int v21 = *(__int16 *)((char *)a1 + 23);
  values[14] = CFNumberCreate(v6, kCFNumberIntType, &v21);
  keys[15] = @"ShutDownPrevVoltage";
  int v20 = *(__int16 *)((char *)a1 + 25);
  values[15] = CFNumberCreate(v6, kCFNumberIntType, &v20);
  keys[16] = @"ShutDownAverageCurrent";
  int v19 = *(__int16 *)((char *)a1 + 27);
  values[16] = CFNumberCreate(v6, kCFNumberIntType, &v19);
  keys[17] = @"ShutDownPrevAverageCurrent";
  int v18 = *(__int16 *)((char *)a1 + 29);
  values[17] = CFNumberCreate(v6, kCFNumberIntType, &v18);
  keys[18] = @"ShutDownCycleCountLastQmax";
  int v17 = *((unsigned __int8 *)a1 + 31);
  values[18] = CFNumberCreate(v6, kCFNumberIntType, &v17);
  keys[19] = @"ShutDownResScale";
  int v16 = (unsigned __int16)a1[16];
  values[19] = CFNumberCreate(v6, kCFNumberIntType, &v16);
  keys[20] = @"ShutDownQstart";
  int v15 = a1[17];
  values[20] = CFNumberCreate(v6, kCFNumberIntType, &v15);
  keys[21] = @"ShutDownPassedCharge";
  int v14 = a1[18];
  values[21] = CFNumberCreate(v6, kCFNumberIntType, &v14);
  keys[22] = @"ShutDownDOD0";
  int v13 = (unsigned __int16)a1[19];
  *(void *)&long long v41 = CFNumberCreate(v6, kCFNumberIntType, &v13);
  *(void *)&long long v37 = @"Raw";
  *((void *)&v41 + 1) = CFDataCreate(v6, (const UInt8 *)a1, 52);
  uint64_t v46 = 0;
  *(_OWORD *)bytes = 0u;
  long long v45 = 0u;
  ggctl_logShutdownDLog(a3, (uint64_t)bytes, 1u);
  *((void *)&v37 + 1) = @"ShutDownDLog";
  *(void *)&long long v42 = CFDataCreate(v6, bytes, 40);
  *(void *)&long long v38 = @"timeSinceAwake";
  uint64_t v12 = *(void *)a2;
  *((void *)&v42 + 1) = CFNumberCreate(v6, kCFNumberLongType, &v12);
  *((void *)&v38 + 1) = @"ShutDownRaTableRaw";
  *(void *)&long long v43 = CFDataCreate(v6, a2 + 8, 32);
  v39 = @"ShutDownRSS";
  uint64_t v11 = *((unsigned __int16 *)a2 + 20);
  *((void *)&v43 + 1) = CFNumberCreate(v6, kCFNumberIntType, &v11);
  CFDictionaryRef v7 = CFDictionaryCreate(v6, (const void **)keys, (const void **)values, 28, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  uint64_t v8 = 27;
  do
  {
    CFRelease(values[v8]);
    unint64_t v9 = v8-- + 1;
  }
  while (v9 > 1);
  return v7;
}

void writeBatteryDiagnosticData(uint64_t a1, int a2)
{
  v7[44] = *MEMORY[0x263EF8340];
  bzero(v5, 0x258uLL);
  size_t outputStructCnt = 352;
  IOConnectCallStructMethod(a1, 2u, 0, 0, v7, &outputStructCnt);
  __int16 v6 = 4000;
  logBatteryDiagnosticData((uint64_t)v5, a1, a2);
}

void logBatteryDiagnosticData(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  uint64_t v14 = 0;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v42 = 0;
  CFDictionaryRef v6 = IOServiceMatching("IOPMPowerSource");
  service = IOServiceGetMatchingService(*MEMORY[0x263F0EC88], v6);
  if (service)
  {
    if ((getSInt32ForKey(@"CurrentCapacity", (_DWORD *)&v14 + 1) & 0x80000000) != 0)
    {
      IOObjectRelease(service);
    }
    else
    {
      int SInt32ForKey = getSInt32ForKey(@"MaxCapacity", &v14);
      IOObjectRelease(service);
      if ((SInt32ForKey & 0x80000000) == 0)
      {
        float v8 = (float)(100 * HIDWORD(v14)) / (float)(int)v14;
        setUPOData(@"IOPMUBootUPOState", v8 > 10.0);
        if (*(_DWORD *)(a1 + 596) && v8 > 10.0 && *(__int16 *)(a1 + 48) >= 2742) {
          setUPOData(@"IOPMUBootUPOCounter", 1);
        }
        int v9 = (__int16)(*(unsigned __int8 *)(a1 + 104) << 8) | *(unsigned __int8 *)(a1 + 105);
        int v10 = (__int16)(*(unsigned __int8 *)(a1 + 126) << 8) | *(unsigned __int8 *)(a1 + 127);
        int v11 = *(unsigned __int8 *)(a1 + 142);
        int v12 = *(unsigned __int8 *)(a1 + 139);
        if (a3)
        {
          time_t v38 = time(0);
          float v39 = v8;
          *(_WORD *)__str = *(_WORD *)(a1 + 48);
          __int16 v21 = *(_WORD *)(a1 + 58);
          __int16 v22 = v10;
          __int16 v23 = *(_WORD *)(a1 + 46);
          __int16 v24 = *(_WORD *)(a1 + 228);
          __int16 v25 = *(_WORD *)(a1 + 44);
          __int16 v26 = *(_WORD *)(a1 + 226);
          __int16 v27 = *(_WORD *)(a1 + 52);
          __int16 v28 = *(_WORD *)(a1 + 230);
          __int16 v29 = *(_WORD *)(a1 + 84);
          __int16 v30 = v9;
          char v31 = v11;
          __int16 v32 = *(_WORD *)(a1 + 42);
          __int16 v33 = *(_WORD *)(a1 + 222);
          __int16 v34 = *(_WORD *)(a1 + 50);
          __int16 v35 = *(_WORD *)(a1 + 224);
          char v36 = v12;
          uint64_t v37 = *(void *)(a1 + 60);
          uint64_t v19 = 0;
          *(void *)int v17 = v38 - *(void *)(a1 + 232);
          *(_OWORD *)&v17[8] = *(_OWORD *)(a1 + 158);
          long long v18 = *(_OWORD *)(a1 + 174);
          LOWORD(v19) = bswap32(*(unsigned __int16 *)(a1 + 191)) >> 16;
          ggctl_logShutdownReason(a2, (uint64_t)__str, 0);
          ggctl_logShutdownDLog(a2, (uint64_t)&v40, 0);
          ggctl_logShutdownReason2(a2, v17, 0);
        }
        *(_OWORD *)int v17 = *(_OWORD *)a1;
        *(_WORD *)&v17[16] = *(_WORD *)(a1 + 16);
        snprintf(__str, 0x200uLL, "%s,%5.2f,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d"
          ",%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d",
          v17,
          v8,
          *(__int16 *)(a1 + 48),
          *(__int16 *)(a1 + 58),
          v10,
          *(unsigned __int16 *)(a1 + 46),
          *(unsigned __int16 *)(a1 + 228),
          *(__int16 *)(a1 + 44),
          *(__int16 *)(a1 + 226),
          *(__int16 *)(a1 + 52),
          *(__int16 *)(a1 + 230),
          *(unsigned __int16 *)(a1 + 84),
          v9,
          v11,
          *(__int16 *)(a1 + 42),
          *(__int16 *)(a1 + 222),
          *(__int16 *)(a1 + 50),
          *(__int16 *)(a1 + 224),
          v12,
          *(unsigned __int16 *)(a1 + 60),
          __rev16(*(unsigned __int16 *)(a1 + 191)),
          __rev16(*(unsigned __int16 *)(a1 + 158)),
          __rev16(*(unsigned __int16 *)(a1 + 160)),
          __rev16(*(unsigned __int16 *)(a1 + 162)),
          __rev16(*(unsigned __int16 *)(a1 + 164)),
          __rev16(*(unsigned __int16 *)(a1 + 166)),
          __rev16(*(unsigned __int16 *)(a1 + 168)),
          __rev16(*(unsigned __int16 *)(a1 + 170)),
          __rev16(*(unsigned __int16 *)(a1 + 172)),
          __rev16(*(unsigned __int16 *)(a1 + 174)),
          __rev16(*(unsigned __int16 *)(a1 + 176)),
          __rev16(*(unsigned __int16 *)(a1 + 178)),
          __rev16(*(unsigned __int16 *)(a1 + 180)),
          __rev16(*(unsigned __int16 *)(a1 + 182)),
          __rev16(*(unsigned __int16 *)(a1 + 184)),
          __rev16(*(unsigned __int16 *)(a1 + 186)),
          (unsigned __int16)v40,
          WORD1(v40),
          WORD2(v40),
          WORD3(v40),
          WORD4(v40),
          WORD5(v40),
          WORD6(v40),
          HIWORD(v40),
          (unsigned __int16)v41,
          WORD1(v41),
          WORD2(v41),
          WORD3(v41),
          WORD4(v41),
          WORD5(v41),
          WORD6(v41),
          HIWORD(v41),
          (unsigned __int16)v42,
          WORD1(v42),
          WORD2(v42),
          HIWORD(v42));
        CFAbsoluteTimeGetCurrent();
        logLineForAppleCare();
        int v13 = logger;
        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          int v16 = __str;
          _os_log_impl(&dword_225A99000, v13, OS_LOG_TYPE_DEFAULT, "Battery Diagnostic Data:: %s", buf, 0xCu);
        }
      }
    }
  }
  else if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
  {
    logBatteryDiagnosticData_cold_1();
  }
}

BOOL okToLoad()
{
  memset(&v1, 0, sizeof(v1));
  return stat("/dev/cu.gas-gauge", &v1) == 0;
}

uint64_t startUpdateThread(unsigned int a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  memset(&v7, 0, sizeof(v7));
  if (stat("/dev/cu.gas-gauge", &v7)) {
    return 0xFFFFFFFFLL;
  }
  pthread_t v6 = 0;
  memset(&v7, 0, 64);
  pthread_attr_init((pthread_attr_t *)&v7);
  pthread_attr_setdetachstate((pthread_attr_t *)&v7, 2);
  logger = (uint64_t)os_log_create("com.apple.AppleHDQGasGauge", "battery");
  if (!logger) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v2 = pthread_create(&v6, (const pthread_attr_t *)&v7, (void *(__cdecl *)(void *))updateThread, (void *)a1);
  if (v2)
  {
    int v4 = logger;
    if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int v5 = 0;
      _os_log_error_impl(&dword_225A99000, v4, OS_LOG_TYPE_ERROR, "pthread_create", v5, 2u);
      int v4 = logger;
    }
    os_release(v4);
  }
  else
  {
    pthread_attr_destroy((pthread_attr_t *)&v7);
  }
  return v2;
}

uint64_t updateThread(uint64_t a1)
{
  kern_return_t v45;
  NSObject *v46;
  __CFRunLoop *v47;
  __CFRunLoopSource *v48;
  __darwin_time_t v49;
  NSObject *v50;
  int v51;
  char v52;
  int v53;
  int v54;
  double v55;
  double v56;
  int v57;
  mach_port_t v58;
  kern_return_t v59;
  int v60;
  NSObject *v61;
  int v62;
  int v63;
  NSObject *v64;
  CFAbsoluteTime v65;
  BOOL v66;
  BOOL v67;
  char v68;
  double v69;
  double v70;
  NSObject *v71;
  NSObject *v72;
  int v73;
  int v74;
  int v75;
  NSObject *v76;
  int v77;
  NSObject *v78;
  int v79;
  CFTypeRef CFProperty;
  CFTypeRef v81;
  CFTypeID v82;
  int v83;
  unsigned __int8 v84;
  NSObject *v85;
  int v86;
  int hdq_state;
  CFPropertyListRef v88;
  BOOL v89;
  mach_port_t v90;
  int v91;
  unint64_t v92;
  int v93;
  NSObject *v94;
  unsigned int v95;
  int v96;
  int v97;
  NSObject *v98;
  NSObject *v99;
  int v100;
  BOOL v101;
  uint64_t v102;
  int v103;
  int v104;
  CFNumberRef v105;
  CFNumberRef v106;
  int v107;
  BOOL v108;
  NSObject *v109;
  int v110;
  int Block;
  NSObject *v112;
  __darwin_time_t v113;
  unint64_t v114;
  NSObject *v115;
  __darwin_time_t v116;
  int v117;
  NSObject *v118;
  __darwin_time_t v119;
  unint64_t v120;
  NSObject *v121;
  NSObject *v122;
  __darwin_time_t v123;
  char v124;
  NSObject *v125;
  unint64_t v126;
  BOOL v127;
  BOOL v128;
  unint64_t v129;
  BOOL v130;
  NSObject *v131;
  int v132;
  int v133;
  NSObject *v134;
  NSObject *v135;
  int v136;
  NSObject *v137;
  uint64_t v138;
  int BatteryData;
  CFDictionaryRef ChargerData;
  BOOL v141;
  int v142;
  int v143;
  BOOL v144;
  int v145;
  int v146;
  __int16 v147;
  NSObject *v148;
  BOOL v149;
  __int16 v150;
  int v151;
  unsigned int v152;
  NSObject *v153;
  NSObject *v154;
  BOOL v155;
  int v156;
  BOOL v157;
  NSObject *v158;
  NSObject *v159;
  BOOL v160;
  CFDictionaryRef v161;
  NSObject *v162;
  CFAllocatorRef v163;
  int v164;
  __CFString *v165;
  int v166;
  int v167;
  NSObject *v168;
  BOOL v169;
  unsigned int v170;
  int v172;
  CFNumberRef v173;
  uint64_t v174;
  uint64_t v175;
  int U16;
  BOOL v177;
  NSObject *v178;
  unint64_t v179;
  NSObject *v180;
  CFNumberRef v181;
  uint64_t v182;
  uint64_t v183;
  CFNumberRef v184;
  uint64_t v185;
  CFNumberRef v186;
  uint64_t v187;
  CFNumberRef v188;
  uint64_t v189;
  CFNumberRef v190;
  uint64_t v191;
  unsigned int v192;
  CFNumberRef v193;
  uint64_t v194;
  const void *v195;
  uint64_t v196;
  CFNumberRef v197;
  uint64_t v198;
  char *v199;
  CFNumberRef v200;
  uint64_t v201;
  CFNumberRef v202;
  uint64_t v203;
  CFNumberRef v204;
  uint64_t v205;
  CFNumberRef v206;
  uint64_t v207;
  CFDictionaryRef v208;
  CFDictionaryRef v209;
  CFDictionaryRef v210;
  NSObject *v211;
  CFDictionaryRef v212;
  CFDictionaryRef v213;
  NSObject *v214;
  CFDictionaryRef v215;
  NSObject *v216;
  int S16;
  int v219;
  NSObject *v220;
  time_t v221;
  uint64_t v222;
  NSObject *v223;
  const char *v224;
  char v225;
  time_t v226;
  char v227;
  uint64_t v228;
  BOOL v229;
  NSObject *v230;
  const char *v231;
  int v232;
  int v233;
  NSObject *v234;
  __int16 v235;
  BOOL v236;
  NSObject *v237;
  int v238;
  int v239;
  int v240;
  NSObject *v241;
  char v242;
  NSObject *v243;
  int v244;
  NSObject *v245;
  int v246;
  int v247;
  int v248;
  NSObject *v249;
  NSObject *v250;
  uint64_t v251;
  BOOL v252;
  NSObject *v253;
  const char *v254;
  uint32_t v255;
  CFAbsoluteTime v256;
  NSObject *v257;
  NSObject *v258;
  int v259;
  BOOL v260;
  NSObject *log;
  os_log_t loga;
  os_log_t logb;
  os_log_t logc;
  int v265;
  int v266;
  BOOL v267;
  int v268;
  int v269;
  int v270;
  uint64_t v271;
  os_log_t v272;
  BOOL v273;
  NSObject *v274;
  time_t v275;
  BOOL v276;
  char v277;
  BOOL v278;
  int v279;
  uint64_t v280;
  BOOL v281;
  int v282;
  int v283;
  int v284;
  uint64_t v285;
  int v286;
  CFPropertyListRef v287;
  int v288;
  BOOL *v289;
  unsigned int v290;
  BOOL v291;
  BOOL v292;
  CFStringRef v293;
  CFStringRef v294;
  CFStringRef mode;
  io_connect_t v296;
  BOOL v297;
  BOOL v298;
  CFAllocatorRef allocator;
  io_connect_t kernelPort;
  CFTypeRef v301;
  BOOL v302;
  int v303;
  char v304;
  char v305;
  char v306[7];
  int v307;
  int v308;
  int v309;
  int v310;
  int v311;
  int v312;
  int v313;
  int v314;
  int v315;
  int v316;
  int v317;
  int v318;
  int v319;
  int v320;
  int v321;
  int v322;
  BOOL v323;
  int v324;
  char v325;
  char v326[15];
  char v327;
  char v328[15];
  char v329;
  char v330[15];
  size_t v331;
  int valuePtr;
  uint64_t refCon;
  intptr_t notificationID;
  io_object_t notifier;
  IONotificationPortRef thePortRef;
  unsigned __int16 v337;
  int v338;
  io_object_t notification[2];
  uint8_t v340[4];
  int v341[3];
  uint8_t v342[4];
  const char *v343;
  __int16 v344;
  int v345;
  void *keys[2];
  long long v347;
  long long v348;
  unsigned char input[52];
  double v350;
  int v351;
  void *v352[2];
  long long v353;
  long long v354;
  long long v355;
  long long v356;
  long long v357;
  long long v358;
  long long v359;
  long long v360;
  long long v361;
  long long v362;
  long long v363;
  long long v364;
  long long v365;
  long long v366;
  long long v367;
  long long v368;
  long long v369;
  long long v370;
  long long v371;
  long long v372;
  long long v373;
  uint8_t buf[32];
  long long v375;
  long long v376;
  long long v377;
  long long v378;
  long long v379;
  long long v380;
  long long v381;
  long long v382;
  long long v383;
  long long v384;
  long long v385;
  long long v386;
  long long v387;
  long long v388;
  long long v389;
  long long v390;
  long long v391;
  long long v392;
  long long v393;
  long long v394;
  char v395[64];
  uint64_t v396;

  v396 = *MEMORY[0x263EF8340];
  *(void *)notification = 0;
  v338 = 0;
  v337 = 0;
  thePortRef = 0;
  notifier = 0;
  notificationID = 0;
  refCon = 0;
  pthread_setname_np("GasGauge-updateThread");
  uint64_t v2 = &unk_268113000;
  gRestrictLogMessagesCounter = 0;
  unint64_t v3 = 0x26AD6C000uLL;
  int v4 = logger;
  if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_225A99000, v4, OS_LOG_TYPE_DEFAULT, "gasgauge: updateThread start", buf, 2u);
  }
  unsigned int v5 = pmps_service();
  if (v5)
  {
    io_service_t v6 = v5;
    mach_port_t v7 = *MEMORY[0x263F0EC88];
    uint64_t v8 = IONotificationPortCreate(*MEMORY[0x263F0EC88]);
    if (IOServiceAddInterestNotification(v8, v6, "IOGeneralInterest", (IOServiceInterestCallback)iokit_callback, &refCon, notification))
    {
      if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR)) {
        updateThread_cold_10();
      }
      return 0;
    }
    Current = CFRunLoopGetCurrent();
    RunLoopSource = IONotificationPortGetRunLoopSource(v8);
    CFStringRef v11 = (const __CFString *)*MEMORY[0x263EFFE88];
    CFRunLoopAddSource(Current, RunLoopSource, (CFRunLoopMode)*MEMORY[0x263EFFE88]);
    kernelPort = IORegisterForSystemPower(&refCon, &thePortRef, (IOServiceInterestCallback)iokit_callback, &notifier);
    if (kernelPort && thePortRef)
    {
      int v12 = CFRunLoopGetCurrent();
      int v13 = IONotificationPortGetRunLoopSource(thePortRef);
      CFRunLoopAddSource(v12, v13, v11);
      uint64_t v14 = ggctl_connect(&notification[1]);
      if (!v14) {
        return 0;
      }
      io_connect_t v15 = v14;
      *(void *)buf = 0;
      v352[0] = 0;
      mach_error_t v16 = MEMORY[0x22A639180](v14, 0, *MEMORY[0x263EF8960], buf, v352, 1);
      if (v16) {
        int v17 = 0;
      }
      else {
        int v17 = *(BOOL **)buf;
      }
      if (v16)
      {
        mach_error_t v18 = v16;
        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR)) {
          updateThread_cold_9(v18);
        }
        IOServiceClose(v15);
        return 0;
      }
      v285 = *(void *)buf;
      v289 = v17;
      mode = v11;
      *(void *)buf = 352;
      IOConnectCallStructMethod(v15, 2u, 0, 0, &dword_26AD6CD38, (size_t *)buf);
      byte_26AD6CC84 = dword_26AD6CDDC != 0;
      v337 = word_26AD6CDC6;
      v282 = dword_26AD6CE90;
      uint64_t valuePtr = dword_26AD6CDCC;
      v293 = (const __CFString *)*MEMORY[0x263EFFE68];
      v294 = (const __CFString *)*MEMORY[0x263EFFE70];
      CFNumberRef v20 = (const __CFNumber *)CFPreferencesCopyValue(@"UpdateSampleConfig", @"com.apple.gasgauge", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE68]);
      if (v20)
      {
        CFNumberRef v21 = v20;
        CFTypeID v22 = CFGetTypeID(v20);
        if (v22 == CFNumberGetTypeID())
        {
          CFNumberGetValue(v21, kCFNumberSInt32Type, &valuePtr);
          __int16 v23 = logger;
          if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&uint8_t buf[4] = valuePtr;
            _os_log_impl(&dword_225A99000, v23, OS_LOG_TYPE_DEFAULT, "changed updateSampleConfig=%#x", buf, 8u);
          }
        }
        CFRelease(v21);
      }
      v290 = valuePtr;
      CFNumberRef v24 = (const __CFNumber *)CFPreferencesCopyValue(@"CriticalBattery", @"com.apple.gasgauge", v294, v293);
      if (v24)
      {
        CFNumberRef v25 = v24;
        CFTypeID v26 = CFGetTypeID(v24);
        if (v26 == CFNumberGetTypeID())
        {
          CFNumberGetValue(v25, kCFNumberSInt32Type, &word_26AD6CDC4);
          CFRelease(v25);
        }
        else
        {
          int Value = CFBooleanGetValue(v25);
          CFRelease(v25);
          if (!Value)
          {
            v258 = logger;
            v288 = 0;
            if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_225A99000, v258, OS_LOG_TYPE_DEFAULT, "Critical battery shutdown disabled", buf, 2u);
              v288 = 0;
            }
            goto LABEL_30;
          }
        }
      }
      v288 = 1;
LABEL_30:
      CFBooleanRef v28 = (const __CFBoolean *)CFPreferencesCopyValue(@"UserMode", @"com.apple.gasgauge", v294, v293);
      if (v28)
      {
        CFBooleanRef v29 = v28;
        CFTypeID v30 = CFGetTypeID(v28);
        v291 = v30 == CFBooleanGetTypeID() && CFBooleanGetValue(v29) != 0;
        CFRelease(v29);
        char v31 = logger;
        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = v291;
          _os_log_impl(&dword_225A99000, v31, OS_LOG_TYPE_DEFAULT, "gas gauge: userModeEnabled=%d", buf, 8u);
        }
      }
      else
      {
        v291 = 0;
      }
      CFNumberRef v32 = (const __CFNumber *)CFPreferencesCopyValue(@"CriticalFlagDelay", @"com.apple.gasgauge", v294, v293);
      if (v32)
      {
        CFNumberRef v33 = v32;
        CFTypeID v34 = CFGetTypeID(v32);
        if (v34 == CFNumberGetTypeID()) {
          CFNumberGetValue(v33, kCFNumberSInt32Type, &v337);
        }
        CFRelease(v33);
        __int16 v35 = logger;
        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = v337;
          _os_log_impl(&dword_225A99000, v35, OS_LOG_TYPE_DEFAULT, "gas gauge: critical flag delay %d", buf, 8u);
        }
      }
      CFBooleanRef v36 = (const __CFBoolean *)CFPreferencesCopyValue(@"DebugPolling", @"com.apple.gasgauge", v294, v293);
      if (v36)
      {
        CFBooleanRef v37 = v36;
        CFTypeID v38 = CFGetTypeID(v36);
        if (v38 == CFBooleanGetTypeID()) {
          debug_polling = CFBooleanGetValue(v37) != 0;
        }
        CFRelease(v37);
        float v39 = logger;
        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = debug_polling;
          _os_log_impl(&dword_225A99000, v39, OS_LOG_TYPE_DEFAULT, "gas gauge: debug_polling=%d", buf, 8u);
        }
      }
      CFNumberRef v40 = (const __CFNumber *)CFPreferencesCopyValue(@"RestricLogCounter", @"com.apple.gasgauge", v294, v293);
      if (v40)
      {
        CFNumberRef v41 = v40;
        CFTypeID v42 = CFGetTypeID(v40);
        if (v42 == CFNumberGetTypeID()) {
          CFNumberGetValue(v41, kCFNumberSInt32Type, &gRestrictLogCounter);
        }
        CFRelease(v41);
        uint64_t v43 = logger;
        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = gRestrictLogCounter;
          _os_log_impl(&dword_225A99000, v43, OS_LOG_TYPE_DEFAULT, "gas gauge: log counter %d", buf, 8u);
        }
      }
      v303 = dword_26AD6CDD0;
      if (dword_26AD6CDD0)
      {
        v44 = IONotificationPortCreate(v7);
        long long v45 = IOServiceAddInterestNotification(v44, notification[1], "IOGeneralInterest", (IOServiceInterestCallback)iokit_callback, &refCon, notification);
        uint64_t v46 = logger;
        if (v45)
        {
          if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR)) {
            updateThread_cold_8();
          }
        }
        else
        {
          if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_225A99000, v46, OS_LOG_TYPE_DEFAULT, "gasgauge: listening for battery interrupts", buf, 2u);
          }
          uint64_t v47 = CFRunLoopGetCurrent();
          v48 = IONotificationPortGetRunLoopSource(v44);
          CFRunLoopAddSource(v47, v48, v11);
        }
      }
      v338 = 0;
      getUPOData(@"IOPMUBootUPOState", &v338);
      v297 = v338 != 0;
      getUPOData(@"IOPMUBootBatteryHealthMetric", &dword_26AD6CD30);
      v331 = 64;
      if (sysctlbyname("hw.model", v395, &v331, 0, 0) && os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR)) {
        updateThread_cold_7();
      }
      v296 = v15;
      v49 = UpSeconds();
      v50 = logger;
      if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134219776;
        *(void *)&uint8_t buf[4] = v49;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v288;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = (unsigned __int16)word_26AD6CDC4;
        *(_WORD *)&buf[24] = 1024;
        *(_DWORD *)&buf[26] = valuePtr;
        *(_WORD *)&buf[30] = 1024;
        LODWORD(v375) = byte_26AD6CC84;
        WORD2(v375) = 1024;
        *(_DWORD *)((char *)&v375 + 6) = v337;
        WORD5(v375) = 1024;
        HIDWORD(v375) = dword_26AD6CDC8;
        LOWORD(v376) = 1024;
        *(_DWORD *)((char *)&v376 + 2) = v338;
        _os_log_impl(&dword_225A99000, v50, OS_LOG_TYPE_DEFAULT, "gasgauge: %llu updateThread critical(%d, 0x%x), uscfg=0x%x, dyn=%d cfd=%d cfd-voltage=%d, upos=%x", buf, 0x36u);
      }
      v280 = a1;
      v276 = a1 != 0;
      LOBYTE(v51) = 0;
      v281 = 0;
      v302 = 0;
      v298 = 0;
      v292 = 0;
      v52 = 0;
      v304 = 0;
      v277 = 0;
      v275 = 0;
      v53 = 0;
      v286 = 0;
      v54 = 0;
      qword_26AD6CD28 = time(0);
      v278 = (dword_26AD6CDE0 | dword_26AD6CE24) != 0;
      v284 = (v290 >> 2) & 1;
      v283 = (v290 >> 3) & 1;
      allocator = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      v301 = (CFTypeRef)*MEMORY[0x263EFFB40];
      v287 = (CFPropertyListRef)*MEMORY[0x263EFFB38];
      v55 = 0.0;
      v56 = 0.0;
      LOBYTE(v279) = 1;
      v57 = -1;
      v58 = -1;
      while (1)
      {
        v394 = 0u;
        v393 = 0u;
        v392 = 0u;
        v391 = 0u;
        v390 = 0u;
        v389 = 0u;
        v388 = 0u;
        v387 = 0u;
        v386 = 0u;
        v385 = 0u;
        v384 = 0u;
        v383 = 0u;
        v382 = 0u;
        v381 = 0u;
        v380 = 0u;
        v379 = 0u;
        v378 = 0u;
        v377 = 0u;
        v376 = 0u;
        v375 = 0u;
        memset(buf, 0, sizeof(buf));
        v373 = 0u;
        v372 = 0u;
        v371 = 0u;
        v370 = 0u;
        v369 = 0u;
        v368 = 0u;
        v367 = 0u;
        v366 = 0u;
        v365 = 0u;
        v364 = 0u;
        v363 = 0u;
        v361 = 0u;
        v362 = 0u;
        v359 = 0u;
        v360 = 0u;
        v357 = 0u;
        v358 = 0u;
        v355 = 0u;
        v356 = 0u;
        v353 = 0u;
        v354 = 0u;
        *(_OWORD *)v352 = 0u;
        if (v303 && v58 != -1)
        {
          *(void *)uint64_t input = 1;
          v59 = IOConnectCallScalarMethod(v58, 0x10u, (const uint64_t *)input, 1u, 0, 0);
          v60 = v59 == -536870183 ? -2 : -1;
          if (v59)
          {
            v61 = *(NSObject **)(v3 + 3096);
            if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)uint64_t input = 67109120;
              *(_DWORD *)&input[4] = v60;
              _os_log_impl(&dword_225A99000, v61, OS_LOG_TYPE_DEFAULT, "cannot enable gauge interrupts (%d)", input, 8u);
            }
          }
        }
        LODWORD(refCon) = 0;
        if (v53)
        {
          v62 = v2[112];
          if (v62)
          {
            v63 = v62 - 1;
          }
          else
          {
            if (v55 == 0.0) {
              goto LABEL_81;
            }
            v64 = *(NSObject **)(v3 + 3096);
            if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
            {
              v65 = CFAbsoluteTimeGetCurrent();
              *(_DWORD *)uint64_t input = 67109632;
              *(_DWORD *)&input[4] = v53;
              *(_WORD *)&input[8] = 2048;
              *(double *)&input[10] = v65 - v55;
              *(_WORD *)&input[18] = 1024;
              *(_DWORD *)&input[20] = gRestrictLogCounter;
              _os_log_impl(&dword_225A99000, v64, OS_LOG_TYPE_DEFAULT, "failure last_update_failed_counter=%d last_success at %g, supressing %d subsequent errors", input, 0x18u);
            }
            v63 = gRestrictLogCounter;
          }
          v2[112] = v63;
        }
LABEL_81:
        v66 = v57 != -1;
        v67 = v57 < 50;
        v68 = v66 && v67;
        if (v66 && v67) {
          v69 = 5.0;
        }
        else {
          v69 = 20.0;
        }
        if (v52)
        {
LABEL_526:
          IOObjectRelease(v6);
          MEMORY[0x22A639190](v296, 0, *MEMORY[0x263EF8960], v289);
          IOServiceClose(v296);
          v2[112] = 0;
          v257 = *(NSObject **)(v3 + 3096);
          if (os_log_type_enabled(v257, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_225A99000, v257, OS_LOG_TYPE_DEFAULT, "gasgauge: updateThread terminated", buf, 2u);
          }
          return 0;
        }
        if (!(v54 | v53)) {
          goto LABEL_122;
        }
        v70 = CFAbsoluteTimeGetCurrent();
        if (debug_polling && (v71 = *(NSObject **)(v3 + 3096), os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG)))
        {
          *(_DWORD *)uint64_t input = 136316418;
          *(void *)&input[4] = "updateThread";
          *(_WORD *)&input[12] = 1024;
          *(_DWORD *)&input[14] = 2802;
          *(_WORD *)&input[18] = 1024;
          *(_DWORD *)&input[20] = v54;
          *(_WORD *)&input[24] = 1024;
          *(_DWORD *)&input[26] = v51 & 1;
          *(_WORD *)&input[30] = 2048;
          *(double *)&input[32] = v70;
          *(_WORD *)&input[40] = 2048;
          *(double *)&input[42] = v56;
          _os_log_debug_impl(&dword_225A99000, v71, OS_LOG_TYPE_DEBUG, "*** %s:%d updatesDone=%d last_update_ignored=%d now=%f deadline=%f *** ", input, 0x32u);
          if ((v51 & 1) == 0)
          {
LABEL_92:
            v56 = v69 + v70;
            goto LABEL_93;
          }
        }
        else if ((v51 & 1) == 0)
        {
          goto LABEL_92;
        }
        v69 = 0.0;
        if (v70 < v56) {
          v69 = v56 - v70;
        }
LABEL_93:
        if (debug_polling)
        {
          v72 = *(NSObject **)(v3 + 3096);
          if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)uint64_t input = 136316674;
            *(void *)&input[4] = "updateThread";
            *(_WORD *)&input[12] = 1024;
            *(_DWORD *)&input[14] = 2860;
            *(_WORD *)&input[18] = 1024;
            *(_DWORD *)&input[20] = v54;
            *(_WORD *)&input[24] = 1024;
            *(_DWORD *)&input[26] = v51 & 1;
            *(_WORD *)&input[30] = 2048;
            *(double *)&input[32] = v70;
            *(_WORD *)&input[40] = 2048;
            *(double *)&input[42] = v56;
            *(_WORD *)&input[50] = 2048;
            v350 = v69;
            _os_log_error_impl(&dword_225A99000, v72, OS_LOG_TYPE_ERROR, "*** %s:%d updatesDone=%d last_update_ignored=%d now=%f deadline=%f update_interval=%f *** ", input, 0x3Cu);
          }
        }
        if (v69 == 0.0)
        {
          v51 = 0;
          LODWORD(refCon) = 0;
LABEL_121:
          LOBYTE(v51) = v51 != 0;
          goto LABEL_122;
        }
        if (CFRunLoopRunInMode(mode, v69, 1u) != kCFRunLoopRunHandledSource)
        {
          v51 = 0;
          goto LABEL_121;
        }
        v51 = 0;
        v73 = refCon;
        v74 = 1;
        if ((int)refCon > -536870145)
        {
          if (refCon == -536870144 || refCon == -536723200) {
            goto LABEL_113;
          }
          v75 = -469794560;
        }
        else
        {
          if ((refCon + 536870288) <= 0x20
            && ((1 << (refCon - 112)) & 0x100010001) != 0)
          {
            goto LABEL_113;
          }
          v75 = -536870320;
        }
        if (refCon != v75)
        {
          v74 = debug_polling;
          if (debug_polling)
          {
            v76 = *(NSObject **)(v3 + 3096);
            if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)uint64_t input = 136315906;
              *(void *)&input[4] = "updateThread";
              *(_WORD *)&input[12] = 1024;
              *(_DWORD *)&input[14] = 2879;
              *(_WORD *)&input[18] = 1024;
              *(_DWORD *)&input[20] = v54;
              *(_WORD *)&input[24] = 1024;
              *(_DWORD *)&input[26] = v73;
              _os_log_error_impl(&dword_225A99000, v76, OS_LOG_TYPE_ERROR, "*** %s:%d updatesDone=%d message.messageType=%#x  (ign) *** ", input, 0x1Eu);
            }
            v74 = 0;
            v51 = 1;
          }
          else
          {
            v51 = 1;
          }
        }
LABEL_113:
        if (v73 > -536870145)
        {
          if (v73 == -536870144 || v73 == -469794560) {
            goto LABEL_121;
          }
          v77 = -536723200;
        }
        else
        {
          if ((v73 + 536870288) <= 0x20 && ((1 << (v73 - 112)) & 0x100010001) != 0) {
            goto LABEL_121;
          }
          v77 = -536870320;
        }
        if (v73 == v77) {
          goto LABEL_121;
        }
        if (v74)
        {
LABEL_122:
          if (debug_polling && (v78 = *(NSObject **)(v3 + 3096), os_log_type_enabled(v78, OS_LOG_TYPE_ERROR)))
          {
            *(_DWORD *)uint64_t input = 136316162;
            *(void *)&input[4] = "updateThread";
            *(_WORD *)&input[12] = 1024;
            *(_DWORD *)&input[14] = 2897;
            *(_WORD *)&input[18] = 1024;
            *(_DWORD *)&input[20] = v54;
            *(_WORD *)&input[24] = 1024;
            *(_DWORD *)&input[26] = refCon;
            *(_WORD *)&input[30] = 1024;
            *(_DWORD *)&input[32] = v304 & 1;
            _os_log_error_impl(&dword_225A99000, v78, OS_LOG_TYPE_ERROR, "*** %s:%d updatesDone=%d message.messageType=%#x system_sleep=%d *** ", input, 0x24u);
            if (v54) {
              goto LABEL_125;
            }
LABEL_126:
            CFProperty = IORegistryEntryCreateCFProperty(v6, @"AdapterInfo", allocator, 0);
            v81 = IORegistryEntryCreateCFProperty(v6, @"AppleRawExternalConnected", allocator, 0);
            LODWORD(keys[0]) = 0;
            if (CFProperty)
            {
              v82 = CFGetTypeID(CFProperty);
              if (v82 == CFNumberGetTypeID()) {
                CFNumberGetValue((CFNumberRef)CFProperty, kCFNumberSInt32Type, keys);
              }
              CFRelease(CFProperty);
              v83 = (int)keys[0];
              if (v302 != (LODWORD(keys[0]) == 0))
              {
LABEL_132:
                v84 = v298 ^ (v81 != v301);
                goto LABEL_133;
              }
              v84 = 0;
            }
            else
            {
              v83 = 0;
              v84 = 0;
              if (!v302) {
                goto LABEL_132;
              }
            }
LABEL_133:
            if (debug_polling)
            {
              v85 = logger;
              if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)uint64_t input = 136316418;
                *(void *)&input[4] = "updateThread";
                *(_WORD *)&input[12] = 1024;
                *(_DWORD *)&input[14] = 2921;
                *(_WORD *)&input[18] = 1024;
                *(_DWORD *)&input[20] = v54;
                *(_WORD *)&input[24] = 1024;
                *(_DWORD *)&input[26] = v84 & 1;
                *(_WORD *)&input[30] = 1024;
                *(_DWORD *)&input[32] = v83;
                *(_WORD *)&input[36] = 1024;
                *(_DWORD *)&input[38] = v81 == v301;
                _os_log_impl(&dword_225A99000, v85, OS_LOG_TYPE_DEFAULT, "*** %s:%d updatesDone=%d same_adaptor=%d adaptor_type=%d external_connected=%d *** ", input, 0x2Au);
              }
            }
            if ((v84 & (v54 != 0)) != 1 || v69 == 0.0)
            {
              v86 = (int)keys[0];
              v302 = LODWORD(keys[0]) != 0;
              v298 = v81 == v301;
              uint64_t v2 = (_DWORD *)&unk_268113000;
              if (v81) {
                CFRelease(v81);
              }
              if (v86 != 0 && v297)
              {
                setUPOData(@"IOPMUBootUPOState", 0);
                v297 = 0;
              }
              ++debug_cnt_ut_recv;
              v79 = refCon;
              unint64_t v3 = 0x26AD6C000uLL;
              goto LABEL_147;
            }
            uint64_t v2 = (_DWORD *)&unk_268113000;
            if (v81) {
              CFRelease(v81);
            }
            v52 = 0;
            v58 = -1;
            LOBYTE(v51) = 1;
LABEL_141:
            unint64_t v3 = 0x26AD6C000;
          }
          else
          {
            if (!v54) {
              goto LABEL_126;
            }
LABEL_125:
            v79 = refCon;
            if (refCon == -536723200) {
              goto LABEL_126;
            }
LABEL_147:
            if (v79 == -469794560)
            {
              LOBYTE(v51) = 1;
              if (v69 != 0.0) {
                v68 = 1;
              }
            }
            if ((v304 & (v79 != -536870144)) != 0)
            {
LABEL_156:
              v52 = 0;
              v58 = -1;
              v304 = 1;
            }
            else if (v79 == -536870288)
            {
              IOAllowPowerChange(kernelPort, notificationID);
              v52 = 0;
              v58 = -1;
              LOBYTE(v51) = 1;
            }
            else
            {
              if (v53 && v79 == -536870272)
              {
                IOAllowPowerChange(kernelPort, notificationID);
                goto LABEL_156;
              }
              if (v296 == -1)
              {
                v52 = 0;
                ++v53;
                goto LABEL_166;
              }
              if (v79 == -536870144)
              {
                if (v292) {
                  updateThermalCoolDownState(notification[1], 0);
                }
                v292 = 0;
                if (v304)
                {
                  v304 = 0;
                  qword_26AD6CD28 = time(0);
                }
                else
                {
                  v304 = 0;
                }
              }
              int hdq_state = ggctl_get_hdq_state(v296);
              if (hdq_state == -2)
              {
                v52 = 1;
                goto LABEL_444;
              }
              if (hdq_state)
              {
                if (hdq_state < 0)
                {
                  if (os_log_type_enabled(*(os_log_t *)(v3 + 3096), OS_LOG_TYPE_ERROR)) {
                    updateThread_cold_2(&v325, v326);
                  }
                  v52 = 0;
                  goto LABEL_443;
                }
                v91 = hdqBreak(v296);
                if (v91 != -2)
                {
                  if (v91 < 0)
                  {
                    v92 = v3;
                    v93 = ++updateThread_debug_break_failures;
                    v94 = *(NSObject **)(v92 + 3096);
                    if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)uint64_t input = 136315906;
                      *(void *)&input[4] = "updateThread";
                      *(_WORD *)&input[12] = 1024;
                      *(_DWORD *)&input[14] = 3024;
                      *(_WORD *)&input[18] = 1024;
                      *(_DWORD *)&input[20] = v93;
                      *(_WORD *)&input[24] = 1024;
                      *(_DWORD *)&input[26] = -1;
                      _os_log_error_impl(&dword_225A99000, v94, OS_LOG_TYPE_ERROR, "%s:%d break failed break_failures=%d (%d)", input, 0x1Eu);
                      v93 = updateThread_debug_break_failures;
                    }
                    if ((-858993459 * v93) <= 0x33333333)
                    {
                      statsAndLogs(notification[1], 0);
                      unint64_t v3 = 0x26AD6C000uLL;
                    }
                    else
                    {
                      v95 = -1227133513 * v93;
                      unint64_t v3 = 0x26AD6C000;
                      if (v95 <= 0x24924924) {
                        debugLog(notification[1], 63);
                      }
                    }
                  }
                  else if (updateThread_debug_break_failures)
                  {
                    statsAndLogs(notification[1], 1);
                    debugLog(notification[1], 0);
                    updateThread_debug_break_failures = 0;
                  }
                }
                if (v303)
                {
                  if (v54)
                  {
                    v96 = gaugeDisableInterrupts(v296);
                    if (v96 < 0)
                    {
                      v97 = v96;
                      v98 = *(NSObject **)(v3 + 3096);
                      if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)uint64_t input = 136315650;
                        *(void *)&input[4] = "updateThread";
                        *(_WORD *)&input[12] = 1024;
                        *(_DWORD *)&input[14] = 3044;
                        *(_WORD *)&input[18] = 1024;
                        *(_DWORD *)&input[20] = v97;
                        _os_log_error_impl(&dword_225A99000, v98, OS_LOG_TYPE_ERROR, "%s:%d cannot disable gauge interrupts (%d)", input, 0x18u);
                      }
                    }
                  }
                }
                if (refCon == -536870272)
                {
                  v104 = OSThermalNotificationCurrentLevel();
                  v292 = v104 > 14;
                  uint64_t v2 = (_DWORD *)&unk_268113000;
                  if (v104 >= 15) {
                    updateThermalCoolDownState(notification[1], 1);
                  }
                  IOAllowPowerChange(kernelPort, notificationID);
                  v52 = 0;
                  v304 = 1;
                  goto LABEL_444;
                }
                uint64_t v2 = (_DWORD *)&unk_268113000;
                if (refCon == -536870320) {
                  goto LABEL_526;
                }
                if (v54)
                {
                  v271 = 0;
                  goto LABEL_203;
                }
                if ((getFWVersion(v296, &word_26AD6CC66) & 0x80000000) != 0)
                {
                  v52 = 0;
                  v54 = 0;
                  ++v53;
                  v58 = v296;
                }
                else
                {
                  v105 = CFNumberCreate(allocator, kCFNumberIntType, &word_26AD6CC66);
                  if (v105)
                  {
                    v106 = v105;
                    IORegistryEntrySetCFProperty(v6, @"GasGaugeFirmwareVersion", v105);
                    CFRelease(v106);
                  }
                  v107 = (unsigned __int16)word_26AD6CC66;
                  v108 = (unsigned __int16)word_26AD6CC66 - 1281 < 2;
                  *v289 = (unsigned __int16)word_26AD6CC66 > 0x131u;
                  if (v107 == 265)
                  {
                    v109 = logger;
                    v288 = 0;
                    if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)uint64_t input = 0;
                      _os_log_impl(&dword_225A99000, v109, OS_LOG_TYPE_DEFAULT, "gas gauge firmware 1.09: disabling critical battery shutdown", input, 2u);
                      v288 = 0;
                    }
                  }
                  LOBYTE(v284) = v284 | v108;
                  keys[0] = 0;
                  if ((readChargeTable(v296, (__CFData **)keys) & 0x80000000) != 0)
                  {
                    v52 = 0;
                    v54 = 0;
                    ++v53;
                    v58 = v296;
                    goto LABEL_141;
                  }
                  unint64_t v3 = 0x26AD6C000uLL;
                  if (keys[0])
                  {
                    *(void **)buf = keys[0];
                    v352[0] = @"ChargeTable";
                    v271 = 1;
                  }
                  else
                  {
                    v271 = 0;
                  }
                  if (dword_26AD6CD38) {
                    v110 = dword_26AD6CD38;
                  }
                  else {
                    v110 = 2;
                  }
                  Block = ggctl_readBlock(v296, -1, v110, updateThread_batteryInfo, 0);
                  if (Block < 0) {
                    strcpy((char *)updateThread_batteryInfo, "000000");
                  }
                  if (v283)
                  {
                    byte_26AD6CC68 = dword_26AD6CDD8;
                    if ((_BYTE)dword_26AD6CDD8)
                    {
                      LOBYTE(v283) = 1;
                    }
                    else
                    {
                      v154 = logger;
                      if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
                      {
                        *(void *)uint64_t input = 67109376;
                        *(_WORD *)&input[8] = 1024;
                        *(_DWORD *)&input[10] = Block;
                        _os_log_error_impl(&dword_225A99000, v154, OS_LOG_TYPE_ERROR, "disabled passedCharge PCFF=%d err=%d", input, 0xEu);
                      }
                      LOBYTE(v283) = 0;
                      uint64_t v2 = (_DWORD *)&unk_268113000;
                    }
                  }
                  else
                  {
                    LOBYTE(v283) = 0;
                  }
                  if (byte_26AD6CC84) {
                    word_26AD6CC64 = 136;
                  }
                  if (hdqReadS16(v296, 60, &word_26AD6CC62)) {
                    word_26AD6CC62 = 0;
                  }
                  if (controlReadU16(v296, 8, &word_26AD6CC60))
                  {
                    word_26AD6CC60 = 0;
                    v267 = 0;
                    v268 = 1;
                    v102 = v271;
LABEL_280:
                    v323 = v54 < 16;
                    *(void *)&buf[8 * v102] = CFNumberCreate(allocator, kCFNumberIntType, &v323);
                    v352[v102] = @"ForceFullGGUpdateOnBoot";
                    HIDWORD(v126) = -1431655764 * v54 + 143165576;
                    LODWORD(v126) = HIDWORD(v126);
                    v127 = (v126 >> 2) < 0x4444445 && v54 < 16;
                    if (v127)
                    {
                      v128 = 1;
                    }
                    else
                    {
                      HIDWORD(v129) = -1813430636 * v54 + 9544368;
                      LODWORD(v129) = HIDWORD(v129);
                      v128 = (v129 >> 4) < 0x123457;
                    }
                    v272 = (os_log_t)v102;
                    if (debug_polling)
                    {
                      v130 = v128;
                      v131 = logger;
                      if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)uint64_t input = 136316418;
                        *(void *)&input[4] = "updateThread";
                        *(_WORD *)&input[12] = 1024;
                        *(_DWORD *)&input[14] = 3254;
                        *(_WORD *)&input[18] = 1024;
                        *(_DWORD *)&input[20] = v54;
                        *(_WORD *)&input[24] = 1024;
                        *(_DWORD *)&input[26] = v130;
                        *(_WORD *)&input[30] = 1024;
                        *(_DWORD *)&input[32] = v127;
                        *(_WORD *)&input[36] = 1024;
                        *(_DWORD *)&input[38] = v54 < 16;
                        _os_log_impl(&dword_225A99000, v131, OS_LOG_TYPE_DEFAULT, "%s:%d  updatesDone=%d, fullUpdate=%d, bootFullUpdate=%d, forceFullUpdate=%d] ", input, 0x2Au);
                        v132 = debug_polling;
                      }
                      else
                      {
                        v132 = 1;
                      }
                      if (v54) {
                        v133 = v130;
                      }
                      else {
                        v133 = 0;
                      }
                      unint64_t v3 = 0x26AD6C000uLL;
                      v128 = v130;
                      if (v132)
                      {
                        v102 = (uint64_t)v272;
                        if (v133)
                        {
                          v133 = 1;
                          statsAndLogs(notification[1], 1);
                        }
                      }
                      else
                      {
                        v102 = (uint64_t)v272;
                      }
                    }
                    else
                    {
                      if (v54) {
                        v133 = v128;
                      }
                      else {
                        v133 = 0;
                      }
                      unint64_t v3 = 0x26AD6C000;
                    }
                    if (v268)
                    {
LABEL_439:
                      if (*v289 && *(_DWORD *)(v285 + 4)) {
                        ++*(_DWORD *)(v285 + 28);
                      }
                      v52 = 0;
                      ++debug_cnt_ut_err;
LABEL_443:
                      ++v53;
                      goto LABEL_444;
                    }
                    v260 = v128;
                    if (debug_polling)
                    {
                      v134 = *(NSObject **)(v3 + 3096);
                      if (os_log_type_enabled(v134, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)uint64_t input = 136315650;
                        *(void *)&input[4] = "updateThread";
                        *(_WORD *)&input[12] = 1024;
                        *(_DWORD *)&input[14] = 3295;
                        *(_WORD *)&input[18] = 1024;
                        *(_DWORD *)&input[20] = v54;
                        _os_log_impl(&dword_225A99000, v134, OS_LOG_TYPE_DEFAULT, "%s:%d  updatesDone=%d POLLING THE BATTERY", input, 0x18u);
                      }
                    }
                    v135 = (v102 + 1);
                    v136 = !v291;
                    if (!v54) {
                      v136 = 1;
                    }
                    v265 = v136;
                    if (v136 != 1) {
                      goto LABEL_317;
                    }
                    v137 = (v102 + 1);
                    if (v260) {
                      v138 = 18;
                    }
                    else {
                      v138 = 10;
                    }
                    BatteryData = readBatteryData((uint64_t)&updateThread_updates, v138, v296);
                    if (BatteryData == v138)
                    {
                      calculateBatteryHealthMetric();
                      v135 = v137;
                      goto LABEL_317;
                    }
                    v269 = BatteryData;
                    log = *(NSObject **)(v3 + 3096);
                    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)uint64_t input = 67109376;
                      *(_DWORD *)&input[4] = v138;
                      *(_WORD *)&input[8] = 1024;
                      *(_DWORD *)&input[10] = v269;
                      _os_log_impl(&dword_225A99000, log, OS_LOG_TYPE_DEFAULT, "cannot read battery data count=%d (err=%d)", input, 0xEu);
                    }
                    calculateBatteryHealthMetric();
                    v135 = v137;
                    LODWORD(ChargerData) = v269;
                    if (v269)
                    {
                      v141 = 0;
                    }
                    else
                    {
LABEL_317:
                      v142 = word_26AD6CC6A;
                      v143 = word_26AD6CC72;
                      if (word_26AD6CC72) {
                        v144 = 0;
                      }
                      else {
                        v144 = word_26AD6CC6A == 3600;
                      }
                      v145 = (unsigned __int16)word_26AD6CC9A;
                      if (v144 || (unsigned __int16)word_26AD6CC9A == 0xFFFF)
                      {
                        logb = v135;
                        v153 = logger;
                        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)uint64_t input = 67110144;
                          *(_DWORD *)&input[4] = v145;
                          *(_WORD *)&input[8] = 1024;
                          *(_DWORD *)&input[10] = word_26AD6CC74;
                          *(_WORD *)&input[14] = 1024;
                          *(_DWORD *)&input[16] = word_26AD6CC6C;
                          *(_WORD *)&input[20] = 1024;
                          *(_DWORD *)&input[22] = v142;
                          *(_WORD *)&input[26] = 1024;
                          *(_DWORD *)&input[28] = v143;
                          _os_log_impl(&dword_225A99000, v153, OS_LOG_TYPE_DEFAULT, "gas gauge reset detected (flags %#x capacity %d/%dmAh voltage %dmV current %dmA)", input, 0x20u);
                        }
                        v141 = 0;
                        LODWORD(ChargerData) = -1;
                        unint64_t v3 = 0x26AD6C000;
                        v135 = logb;
                      }
                      else
                      {
                        if (!v54 && v338)
                        {
                          loga = v135;
                          v338 = 0;
                          v146 = word_26AD6CC6C;
                          v147 = 100 * (word_26AD6CC6C / 100) + 100;
                          v148 = logger;
                          v149 = os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT);
                          v150 = v147;
                          v151 = v147;
                          if (v149)
                          {
                            *(void *)uint64_t input = 67110144;
                            v152 = ((26215 * v147) >> 18) + ((26215 * v147) >> 31);
                            *(_WORD *)&input[8] = 1024;
                            *(_DWORD *)&input[10] = v146;
                            *(_WORD *)&input[14] = 1024;
                            *(_DWORD *)&input[16] = word_26AD6CC74;
                            *(_WORD *)&input[20] = 1024;
                            *(_DWORD *)&input[22] = v151;
                            *(_WORD *)&input[26] = 1024;
                            *(_DWORD *)&input[28] = ((26215 * v151) >> 18) + ((26215 * v151) >> 31);
                            _os_log_impl(&dword_225A99000, v148, OS_LOG_TYPE_DEFAULT, "mask real UPOState=%x FCC=%d RemCap=%d new FCC=%d new RemCap=%d", input, 0x20u);
                          }
                          else
                          {
                            v152 = ((26215 * v147) >> 18) + ((26215 * v147) >> 31);
                          }
                          word_26AD6CC6C = v150;
                          word_26AD6CC74 = v152;
                          v135 = loga;
                        }
                        if ((v265 ^ 1))
                        {
                          LODWORD(ChargerData) = 0;
                          v155 = v298;
                        }
                        else
                        {
                          v155 = v298;
                          if (v298) {
                            v156 = 24;
                          }
                          else {
                            v156 = 22;
                          }
                          LODWORD(ChargerData) = hdqReadS16(v296, v156, &word_26AD6CC76);
                        }
                        v141 = ChargerData == 0;
                        v157 = ChargerData != 0;
                        if ((v290 & 2) == 0) {
                          v157 = 1;
                        }
                        if ((v157 || !v155) | (v265 ^ 1) & 1)
                        {
                          unint64_t v3 = 0x26AD6C000;
                        }
                        else
                        {
                          ChargerData = readChargerData(v284 & 1, v283 & 1, v296);
                          *(void *)&buf[8 * (void)v135] = ChargerData;
                          unint64_t v3 = 0x26AD6C000uLL;
                          if (ChargerData)
                          {
                            if (v280) {
                              CFShow(ChargerData);
                            }
                            LODWORD(ChargerData) = 0;
                            v352[(void)v135] = @"ChargerData";
                            v135 = ((char *)&v272->isa + 2);
                          }
                        }
                      }
                    }
                    v270 = (int)ChargerData;
                    v273 = v141;
                    if (v141 && (unsigned __int16)word_26AD6CC66 >= 0x501u)
                    {
                      v322 = (unsigned __int16)word_26AD6CC6E;
                      *(void *)&buf[8 * (void)v135] = CFNumberCreate(allocator, kCFNumberIntType, &v322);
                      v352[(void)v135] = @"NominalChargeCapacity";
                      v158 = ((char *)&v135->isa + 1);
                    }
                    else
                    {
                      v158 = v135;
                    }
                    if (debug_polling)
                    {
                      v159 = *(NSObject **)(v3 + 3096);
                      if (os_log_type_enabled(v159, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)uint64_t input = 67109376;
                        *(_DWORD *)&input[4] = dword_26AD6CDE0;
                        *(_WORD *)&input[8] = 1024;
                        *(_DWORD *)&input[10] = dword_26AD6CE24;
                        _os_log_impl(&dword_225A99000, v159, OS_LOG_TYPE_DEFAULT, "determineVACVoltage, vacLevelCount=%d, vac95LevelCount=%d", input, 0xEu);
                      }
                    }
                    v160 = v298;
                    v259 = v133;
                    if (!byte_26AD6CC84 || v54 != 0 && !v298)
                    {
                      if (v278 && (v54 == 0 || v298))
                      {
                        v166 = determineVACVoltage();
                        if (v166 != dword_26AD6CC88)
                        {
                          v167 = v166;
                          dword_26AD6CC88 = v166;
                          v168 = *(NSObject **)(v3 + 3096);
                          if (os_log_type_enabled(v168, OS_LOG_TYPE_DEFAULT))
                          {
                            *(_DWORD *)uint64_t input = 67109120;
                            *(_DWORD *)&input[4] = v167;
                            _os_log_impl(&dword_225A99000, v168, OS_LOG_TYPE_DEFAULT, "Added atvAbsMaxVoltageMV=%u to battery dict", input, 8u);
                            v167 = dword_26AD6CC88;
                          }
                          v163 = allocator;
                          v321 = v167;
                          v162 = v158;
                          *(void *)&buf[8 * (void)v158] = CFNumberCreate(allocator, kCFNumberIntType, &v321);
                          v165 = @"atvAbsMaxVoltageMV";
                          v160 = v298;
                          v164 = v265;
LABEL_375:
                          v352[(void)v162] = v165;
                          v162 = ((char *)v162 + 1);
                          goto LABEL_376;
                        }
                        v160 = v298;
                      }
                      v163 = allocator;
                      v162 = v158;
                      goto LABEL_371;
                    }
                    v161 = dynamicATV(v296);
                    v162 = v158;
                    *(void *)&buf[8 * (void)v158] = v161;
                    v163 = allocator;
                    if (v161)
                    {
                      v164 = v265;
                      if (v280) {
                        CFShow(v161);
                      }
                      v165 = @"AppleDynamicATV";
                      goto LABEL_375;
                    }
LABEL_371:
                    v164 = v265;
LABEL_376:
                    v169 = v273;
                    if ((v290 & 2) != 0) {
                      v169 = 0;
                    }
                    if ((v164 & (v169 && v160)) == 1)
                    {
                      *(void *)uint64_t input = 0;
                      keys[0] = 0;
                      *(void *)uint64_t input = CFNumberCreate(v163, kCFNumberIntType, &dword_26AD6CC88);
                      keys[0] = @"ChargingVoltage";
                      *(void *)&buf[8 * (void)v162] = CFDictionaryCreate(v163, (const void **)keys, (const void **)input, 1, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
                      v352[(void)v162] = @"ChargerData";
                      v162 = ((char *)v162 + 1);
                      CFRelease(*(CFTypeRef *)input);
                    }
                    if (dword_26AD6CE68)
                    {
                      v170 = determinePoSMThreshold();
                      if (v170 != dword_26AD6CC90) {
                        dword_26AD6CC90 = v170;
                      }
                      *(_DWORD *)uint64_t input = HIWORD(v170);
                      LODWORD(keys[0]) = (unsigned __int16)v170;
                      if ((unsigned __int16)v170 == 0xFFFF || HIWORD(v170) == 0xFFFF) {
                        v172 = 0;
                      }
                      else {
                        v172 = dword_26AD6CE68;
                      }
                      *(_DWORD *)v342 = v172;
                      *(void *)&buf[8 * (void)v162] = CFNumberCreate(v163, kCFNumberIntType, v342);
                      v352[(void)v162] = @"PoSMEnabled";
                      v173 = CFNumberCreate(allocator, kCFNumberIntType, input);
                      v174 = 8 * (void)v162 + 8;
                      *(void *)&buf[v174] = v173;
                      *(void **)((char *)v352 + v174) = @"PoSMUpperThreshold";
                      v162 = ((char *)v162 + 2);
                      *(void *)&buf[8 * (void)v162] = CFNumberCreate(allocator, kCFNumberIntType, keys);
                      v352[(void)v162] = @"PoSMLowerThreshold";
                    }
                    else
                    {
                      *(_DWORD *)uint64_t input = 0;
                      *(void *)&buf[8 * (void)v162] = CFNumberCreate(v163, kCFNumberIntType, input);
                      v352[(void)v162] = @"PoSMEnabled";
                    }
                    if ((v273 & v290) != 0) {
                      U16 = 0;
                    }
                    else {
                      U16 = v270;
                    }
                    if ((v164 & v273 & v290) == 1) {
                      U16 = hdqReadU16(v296, 110, &word_26AD6CC78);
                    }
                    unint64_t v3 = 0x26AD6C000uLL;
                    uint64_t v2 = (_DWORD *)&unk_268113000;
                    v177 = v267;
                    v178 = v162;
                    v179 = (unint64_t)&v162->isa + 1;
                    if (!U16)
                    {
                      v180 = v178;
                      logc = v178;
                      v320 = 10 * word_26AD6CC70 - 27320;
                      *(void *)&buf[8 * v179] = CFNumberCreate(allocator, kCFNumberIntType, &v320);
                      v352[v179] = @"Temperature";
                      v319 = word_26AD6CC72;
                      v181 = CFNumberCreate(allocator, kCFNumberIntType, &v319);
                      v182 = 8 * (void)v180;
                      v183 = 8 * (void)v180 + 16;
                      *(void *)&buf[v183] = v181;
                      *(void **)((char *)v352 + v183) = @"Amperage";
                      v318 = word_26AD6CC6A;
                      v184 = CFNumberCreate(allocator, kCFNumberIntType, &v318);
                      v185 = 8 * (void)v180 + 24;
                      *(void *)&buf[v185] = v184;
                      *(void **)((char *)v352 + v185) = @"Voltage";
                      v317 = word_26AD6CC76;
                      v186 = CFNumberCreate(allocator, kCFNumberIntType, &v317);
                      v187 = 8 * (void)v180 + 32;
                      *(void *)&buf[v187] = v186;
                      *(void **)((char *)v352 + v187) = @"TimeRemaining";
                      v57 = word_26AD6CC74;
                      v316 = word_26AD6CC74;
                      v188 = CFNumberCreate(allocator, kCFNumberIntType, &v316);
                      v189 = v182 + 40;
                      *(void *)&buf[v189] = v188;
                      *(void **)((char *)v352 + v189) = @"CurrentCapacity";
                      v315 = word_26AD6CC6C;
                      v190 = CFNumberCreate(allocator, kCFNumberIntType, &v315);
                      v191 = v182 + 48;
                      *(void *)&buf[v191] = v190;
                      *(void **)((char *)v352 + v191) = @"MaxCapacity";
                      HIWORD(v192) = -18304;
                      LOWORD(v192) = word_26AD6CC96;
                      *(_DWORD *)uint64_t input = llroundf((float)((float)((float)word_26AD6CC7A * -0.000061035) + 1.0) * (float)v192);
                      v193 = CFNumberCreate(allocator, kCFNumberIntType, input);
                      v194 = v182 + 56;
                      *(void *)&buf[v194] = v193;
                      *(void **)((char *)v352 + v194) = @"AbsoluteCapacity";
                      v195 = v301;
                      if (!v267) {
                        v195 = v287;
                      }
                      v196 = v182 + 64;
                      *(void *)&buf[v196] = v195;
                      *(void **)((char *)v352 + v196) = @"AtCriticalLevel";
                      v314 = (unsigned __int16)word_26AD6CC9A;
                      v197 = CFNumberCreate(allocator, kCFNumberIntType, &v314);
                      v198 = v182 + 72;
                      *(void *)&buf[v198] = v197;
                      *(void **)((char *)v352 + v198) = @"AppleRawBatteryFlags";
                      v199 = (char *)&logc[1].isa + 2;
                      if (v290)
                      {
                        v313 = (unsigned __int16)word_26AD6CC78;
                        *(void *)&buf[8 * (void)v199] = CFNumberCreate(allocator, kCFNumberIntType, &v313);
                        v352[(void)v199] = @"ITMiscStatus";
                        v312 = word_26AD6CC78 & 3;
                        v200 = CFNumberCreate(allocator, kCFNumberIntType, &v312);
                        v201 = v182 + 88;
                        *(void *)&buf[v201] = v200;
                        *(void **)((char *)v352 + v201) = @"ITSimulationCounter";
                        v311 = ((unsigned __int16)word_26AD6CC78 >> 2) & 3;
                        v202 = CFNumberCreate(allocator, kCFNumberIntType, &v311);
                        v203 = v182 + 96;
                        *(void *)&buf[v203] = v202;
                        *(void **)((char *)v352 + v203) = @"RaUpdateCounter";
                        v199 = (char *)&logc[1].isa + 5;
                      }
                      v310 = word_26AD6CC9A & 0x80;
                      *(void *)&buf[8 * (void)v199] = CFNumberCreate(allocator, kCFNumberIntType, &v310);
                      v352[(void)v199] = @"OCVTakenFlag";
                      v309 = word_26AD6CC9A & 0x200;
                      v204 = CFNumberCreate(allocator, kCFNumberIntType, &v309);
                      v205 = 8 * (void)v199 + 8;
                      *(void *)&buf[v205] = v204;
                      *(void **)((char *)v352 + v205) = @"FCFlag";
                      v179 = (unint64_t)(v199 + 2);
                      if (!v260) {
                        goto LABEL_406;
                      }
                      v308 = (unsigned __int16)word_26AD6CC94;
                      *(void *)&buf[8 * v179] = CFNumberCreate(allocator, kCFNumberIntType, &v308);
                      v352[v179] = @"CycleCount";
                      v307 = word_26AD6CC62;
                      v206 = CFNumberCreate(allocator, kCFNumberIntType, &v307);
                      v207 = 8 * (void)v199 + 24;
                      *(void *)&buf[v207] = v206;
                      *(void **)((char *)v352 + v207) = @"DesignCapacity";
                      v179 = (unint64_t)(v199 + 4);
                      v208 = parseBatteryData(v290 & 1, v276);
                      *(void *)&buf[8 * (void)(v199 + 4)] = v208;
                      if (v208)
                      {
                        U16 = 0;
                        if (v280) {
                          CFShow(v208);
                        }
                        v352[v179] = @"BatteryData";
                        v179 = (unint64_t)(v199 + 5);
                        v177 = v267;
                      }
                      else
                      {
LABEL_406:
                        v177 = v267;
                        U16 = 0;
                      }
                      uint64_t v2 = (_DWORD *)&unk_268113000;
                    }
                    if (v282 && (updateThread_oneTime & 1) == 0)
                    {
                      v348 = 0u;
                      memset(input, 0, sizeof(input));
                      *(_OWORD *)keys = 0u;
                      v347 = 0u;
                      if (ggctl_logShutdownReason(v296, (uint64_t)input, 1u) || !*(void *)&input[40])
                      {
                        v211 = logger;
                        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)v342 = 136315394;
                          v343 = "updateThread";
                          v344 = 1024;
                          v345 = 3577;
                          _os_log_impl(&dword_225A99000, v211, OS_LOG_TYPE_DEFAULT, "%s:%d  Error Reading Shutdown reason", v342, 0x12u);
                        }
                      }
                      else
                      {
                        ggctl_logShutdownReason2(v296, keys, 1u);
                        v209 = parseShutdownReason((__int16 *)input, (const UInt8 *)keys, v296);
                        if (v209)
                        {
                          v210 = v209;
                          if (v280) {
                            CFShow(v209);
                          }
                          *(void *)&buf[8 * v179] = v210;
                          v352[v179++] = @"BatteryShutdownReason";
                        }
                        memset(input, 0, sizeof(input));
                        ggctl_logShutdownReason(v296, (uint64_t)input, 0);
                        *(_OWORD *)keys = 0u;
                        v347 = 0u;
                        v348 = 0u;
                        ggctl_logShutdownReason2(v296, keys, 0);
                      }
                      uint64_t v2 = (_DWORD *)&unk_268113000;
                      updateThread_oneTime = 1;
                      v177 = v267;
                    }
                    if (v177)
                    {
                      readIMAXAndSOCSmoothData(byte_26AD6CCFE, v175, v296);
                      logBatteryDiagnosticData((uint64_t)updateThread_batteryInfo, v296, v282 != 0);
                    }
                    if (!U16)
                    {
                      v212 = CFDictionaryCreate(allocator, (const void **)v352, (const void **)buf, v179, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
                      if (v212)
                      {
                        v213 = v212;
                        if (v280) {
                          CFShow(v212);
                        }
                        if (debug_polling)
                        {
                          v214 = logger;
                          if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
                          {
                            *(_DWORD *)uint64_t input = 136315650;
                            *(void *)&input[4] = "updateThread";
                            *(_WORD *)&input[12] = 1024;
                            *(_DWORD *)&input[14] = 3600;
                            *(_WORD *)&input[18] = 1024;
                            *(_DWORD *)&input[20] = v54;
                            _os_log_impl(&dword_225A99000, v214, OS_LOG_TYPE_DEFAULT, "%s:%d  updatesDone=%d PUBLISHING BATTERY data", input, 0x18u);
                          }
                        }
                        v215 = v213;
                        U16 = IORegistryEntrySetCFProperties(v6, v213);
                        if (U16)
                        {
                          v274 = logger;
                          if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
                          {
                            *(_DWORD *)uint64_t input = 67109120;
                            *(_DWORD *)&input[4] = U16;
                            _os_log_error_impl(&dword_225A99000, v274, OS_LOG_TYPE_ERROR, "IORegistryEntrySetCFProperties(0x%x)", input, 8u);
                          }
                        }
                        CFRelease(v215);
                        ++debug_cnt_ut_sent;
                      }
                      else
                      {
                        v216 = logger;
                        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)uint64_t input = 136315650;
                          *(void *)&input[4] = "updateThread";
                          *(_WORD *)&input[12] = 1024;
                          *(_DWORD *)&input[14] = 3608;
                          *(_WORD *)&input[18] = 1024;
                          *(_DWORD *)&input[20] = v54;
                          _os_log_error_impl(&dword_225A99000, v216, OS_LOG_TYPE_ERROR, "%s:%d  updatesDone=%d dictionary failed", input, 0x18u);
                        }
                        U16 = 0;
                      }
                      uint64_t v2 = (_DWORD *)&unk_268113000;
                    }
                    do
                      CFRelease(*(CFTypeRef *)&buf[8 * v179 - 8]);
                    while (v179-- > 1);
                    if (U16) {
                      goto LABEL_439;
                    }
                    if (v291)
                    {
                      if (v279)
                      {
                        S16 = controlReadS16(v296, 25, 0);
                        if (S16)
                        {
                          v219 = S16;
                          v220 = logger;
                          if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
                          {
                            *(_DWORD *)uint64_t input = 67109120;
                            *(_DWORD *)&input[4] = v219;
                            _os_log_error_impl(&dword_225A99000, v220, OS_LOG_TYPE_ERROR, "CCA: usermode cannot disable DLOG (%#x)", input, 8u);
                          }
                          LOBYTE(v279) = 1;
                        }
                        else
                        {
                          LOBYTE(v279) = 0;
                          *(_DWORD *)(v285 + 24) = 0;
                          *(_DWORD *)(v285 + 16) = 0;
                          *(void *)(v285 + 8) = 0;
                        }
                        goto LABEL_516;
                      }
                      LOBYTE(v279) = 0;
LABEL_517:
                      if (v2[112])
                      {
                        v2[112] = 0;
                        v251 = logger;
                        v252 = os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT);
                        if (v55 == 0.0)
                        {
                          if (v252)
                          {
                            *(_WORD *)uint64_t input = 0;
                            v253 = v251;
                            v254 = "gasgauge success after previous failure";
                            v255 = 2;
                            goto LABEL_523;
                          }
                        }
                        else if (v252)
                        {
                          v256 = CFAbsoluteTimeGetCurrent();
                          *(_DWORD *)uint64_t input = 134217984;
                          *(double *)&input[4] = v256 - v55;
                          v253 = v251;
                          v254 = "gasgauge success after previous %gs failure";
                          v255 = 12;
LABEL_523:
                          _os_log_impl(&dword_225A99000, v253, OS_LOG_TYPE_DEFAULT, v254, input, v255);
                        }
                      }
                      v55 = CFAbsoluteTimeGetCurrent();
                      v52 = 0;
                      v53 = 0;
                      word_26AD6CD1E = word_26AD6CC6A;
                      word_26AD6CD20 = word_26AD6CC72;
                      dword_26AD6CD22 = *(_DWORD *)&word_26AD6CC6C;
                      word_26AD6CD26 = word_26AD6CC74;
                      ++v54;
                      goto LABEL_444;
                    }
                    if ((unsigned __int16)word_26AD6CC66 < 0x132u) {
                      goto LABEL_517;
                    }
                    if (v277)
                    {
                      v221 = time(0);
                      if (v221 < v275)
                      {
                        v222 = logger;
                        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)uint64_t input = 134217984;
                          *(void *)&input[4] = v275;
                          v223 = v222;
                          v224 = "CCA: wait for deadline now=%lu";
                          goto LABEL_475;
                        }
                        goto LABEL_476;
                      }
                      v226 = v221;
                      if ((unsigned __int16)word_26AD6CC66 < 0x600u)
                      {
                        LOWORD(keys[0]) = 0;
                        v232 = controlReadU16(v296, 0, keys);
                        if (v232)
                        {
                          v233 = v232;
                          v234 = logger;
                          if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
                          {
                            *(_DWORD *)uint64_t input = 67109120;
                            *(_DWORD *)&input[4] = v233;
                            _os_log_error_impl(&dword_225A99000, v234, OS_LOG_TYPE_ERROR, "CCA: cannot read DLOG status (%#x)", input, 8u);
                          }
                          goto LABEL_476;
                        }
                        v235 = (__int16)keys[0];
                        v228 = logger;
                        v236 = os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT);
                        if ((v235 & 0x800) != 0)
                        {
                          if (!v236) {
                            goto LABEL_476;
                          }
                          goto LABEL_474;
                        }
                        if (v236)
                        {
                          *(_DWORD *)uint64_t input = 67109376;
                          *(_DWORD *)&input[4] = v54;
                          *(_WORD *)&input[8] = 2048;
                          *(void *)&input[10] = v226;
                          v230 = v228;
                          v231 = "CCA: re-enable DLOG updatesDone=%d, now=%lu";
LABEL_471:
                          _os_log_impl(&dword_225A99000, v230, OS_LOG_TYPE_DEFAULT, v231, input, 0x12u);
                        }
LABEL_472:
                        v225 = 0;
                        v275 = 0;
                      }
                      else
                      {
                        v227 = word_26AD6CC9A;
                        v228 = logger;
                        v229 = os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT);
                        if ((v227 & 0x20) == 0)
                        {
                          if (v229)
                          {
                            *(_DWORD *)uint64_t input = 67109376;
                            *(_DWORD *)&input[4] = v54;
                            *(_WORD *)&input[8] = 2048;
                            *(void *)&input[10] = v226;
                            v230 = v228;
                            v231 = "CCA: re-enable DLOG updatesDone=%u, now=%lu";
                            goto LABEL_471;
                          }
                          goto LABEL_472;
                        }
                        if (!v229) {
                          goto LABEL_476;
                        }
LABEL_474:
                        *(_DWORD *)uint64_t input = 134217984;
                        *(void *)&input[4] = v226;
                        v223 = v228;
                        v224 = "CCA: GasGauge still calibrating now=%lu";
LABEL_475:
                        _os_log_impl(&dword_225A99000, v223, OS_LOG_TYPE_DEFAULT, v224, input, 0xCu);
LABEL_476:
                        v225 = 1;
                      }
                    }
                    else
                    {
                      v225 = 0;
                    }
                    if (v279)
                    {
                      if (*(_DWORD *)(v285 + 4)) {
                        goto LABEL_484;
                      }
                      v237 = logger;
                      if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
                      {
                        v238 = *(_DWORD *)(v285 + 4);
                        *(_DWORD *)uint64_t input = 67109120;
                        *(_DWORD *)&input[4] = v238;
                        _os_log_impl(&dword_225A99000, v237, OS_LOG_TYPE_DEFAULT, "disabling DLOG (num_clients=%i)", input, 8u);
                      }
                      v239 = controlReadS16(v296, 25, 0);
                      if (v239)
                      {
                        v240 = v239;
                        v241 = logger;
                        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)uint64_t input = 67109120;
                          *(_DWORD *)&input[4] = v240;
                          _os_log_error_impl(&dword_225A99000, v241, OS_LOG_TYPE_ERROR, "cannot disable DLOG (%#x)", input, 8u);
                        }
LABEL_484:
                        v279 = 1;
                      }
                      else
                      {
                        v279 = 0;
                        *(_DWORD *)(v285 + 24) = 0;
                        *(_DWORD *)(v285 + 16) = 0;
                        *(void *)(v285 + 8) = 0;
                      }
                    }
                    else
                    {
                      v279 = 0;
                    }
                    if (*(_DWORD *)(v285 + 4)) {
                      v242 = v225;
                    }
                    else {
                      v242 = 1;
                    }
                    if ((v242 & 1) == 0)
                    {
                      if (!v54 || v279 != 1)
                      {
                        v243 = logger;
                        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
                        {
                          v244 = *(_DWORD *)(v285 + 4);
                          *(_DWORD *)uint64_t input = 67109376;
                          *(_DWORD *)&input[4] = v54;
                          *(_WORD *)&input[8] = 1024;
                          *(_DWORD *)&input[10] = v244;
                          _os_log_impl(&dword_225A99000, v243, OS_LOG_TYPE_DEFAULT, "gathering data log updatesDone=%d num_clients=%d", input, 0xEu);
                        }
                      }
                      if ((*(_DWORD *)(v285 + 4) & 0x80000000) != 0
                        && os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
                      {
                        updateThread_cold_4(&v305, v306);
                      }
                      if (drainDataLog(v296))
                      {
                        v245 = logger;
                        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR)) {
                          updateThread_cold_3(v340, v341, v245);
                        }
                      }
                      v279 = 1;
                    }
                    if (v225)
                    {
                      v246 = 1;
                    }
                    else if ((unsigned __int16)word_26AD6CC66 < 0x600u)
                    {
                      v246 = v259;
                      if ((unsigned __int16)word_26AD6CC66 <= 0x501u) {
                        v246 = 0;
                      }
                    }
                    else
                    {
                      v246 = ((unsigned __int16)word_26AD6CC9A >> 5) & 1;
                    }
                    v277 = v246;
                    if ((v279 & v246) == 1)
                    {
                      v247 = controlReadS16(v296, 25, 0);
                      if (v247)
                      {
                        v248 = v247;
                        v249 = logger;
                        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)uint64_t input = 67109120;
                          *(_DWORD *)&input[4] = v248;
                          _os_log_error_impl(&dword_225A99000, v249, OS_LOG_TYPE_ERROR, "CCA: cannot disable DLOG (%#x)", input, 8u);
                        }
                        v277 = 0;
                        LOBYTE(v279) = 1;
                      }
                      else
                      {
                        *(_DWORD *)(v285 + 16) = 0;
                        *(void *)(v285 + 8) = 0;
                        v275 = time(0) + 20;
                        v250 = logger;
                        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)uint64_t input = 67109376;
                          *(_DWORD *)&input[4] = v54;
                          *(_WORD *)&input[8] = 2048;
                          *(void *)&input[10] = v275;
                          _os_log_impl(&dword_225A99000, v250, OS_LOG_TYPE_DEFAULT, "CCA: disabled DLOG updatesDone=%d ccaDeadline=%lu", input, 0x12u);
                        }
                        LOBYTE(v279) = 0;
                        v277 = 1;
                      }
                    }
                    unint64_t v3 = 0x26AD6C000uLL;
LABEL_516:
                    uint64_t v2 = &unk_268113000;
                    goto LABEL_517;
                  }
LABEL_203:
                  if (debug_polling)
                  {
                    v99 = *(NSObject **)(v3 + 3096);
                    if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)uint64_t input = 136315650;
                      *(void *)&input[4] = "updateThread";
                      *(_WORD *)&input[12] = 1024;
                      *(_DWORD *)&input[14] = 3146;
                      *(_WORD *)&input[18] = 1024;
                      *(_DWORD *)&input[20] = v54;
                      _os_log_impl(&dword_225A99000, v99, OS_LOG_TYPE_DEFAULT, "%s:%d  updatesDone=%d READING FLAGS", input, 0x18u);
                    }
                  }
                  v100 = hdqReadU16(v296, 10, &word_26AD6CC9A);
                  v101 = 0;
                  v268 = v100;
                  if (v100 || (unsigned __int16)word_26AD6CC9A == 0xFFFF)
                  {
                    v102 = v271;
                  }
                  else
                  {
                    v102 = v271;
                    if (((v288 ^ 1) & 1) == 0)
                    {
                      if (word_26AD6CDC4)
                      {
                        v266 = 0;
                        if ((v290 & 0x20) != 0)
                        {
                          v103 = v281
                              && (unsigned __int16)(word_26AD6CDC4 & word_26AD6CC9A) == (unsigned __int16)word_26AD6CDC4;
                          v281 = (unsigned __int16)(word_26AD6CDC4 & word_26AD6CC9A) == (unsigned __int16)word_26AD6CDC4;
                        }
                        else
                        {
                          v103 = (unsigned __int16)(word_26AD6CDC4 & word_26AD6CC9A) == (unsigned __int16)word_26AD6CDC4;
                        }
                      }
                      else if (v54 && dword_26AD6CDC8 >= word_26AD6CC6A)
                      {
                        v266 = 0;
                        v103 = 1;
                      }
                      else
                      {
                        v103 = ((unsigned __int16)word_26AD6CC9A >> 2) & 1;
                        v266 = 1;
                      }
                      if (debug_polling)
                      {
                        v112 = *(NSObject **)(v3 + 3096);
                        if (os_log_type_enabled(v112, OS_LOG_TYPE_DEFAULT))
                        {
                          v113 = UpSeconds();
                          *(_DWORD *)uint64_t input = 136317186;
                          *(void *)&input[4] = "updateThread";
                          *(_WORD *)&input[12] = 1024;
                          *(_DWORD *)&input[14] = 3178;
                          *(_WORD *)&input[18] = 1024;
                          *(_DWORD *)&input[20] = v54;
                          *(_WORD *)&input[24] = 1024;
                          *(_DWORD *)&input[26] = v103;
                          *(_WORD *)&input[30] = 1024;
                          *(_DWORD *)&input[32] = v298;
                          unint64_t v3 = 0x26AD6C000uLL;
                          *(_WORD *)&input[36] = 2048;
                          *(void *)&input[38] = v113;
                          *(_WORD *)&input[46] = 1024;
                          *(_DWORD *)&input[48] = v337;
                          LOWORD(v350) = 1024;
                          *(_DWORD *)((char *)&v350 + 2) = dword_26AD6CDC8;
                          HIWORD(v350) = 1024;
                          v351 = word_26AD6CC6A;
                          _os_log_impl(&dword_225A99000, v112, OS_LOG_TYPE_DEFAULT, "%s:%d  updatesDone=%d criticalValue=%d external_connected=%d UpSeconds=%llu cfd=%d cfd-voltage=%d batteryInfo.voltage=%d", input, 0x40u);
                        }
                      }
                      if (!v337) {
                        goto LABEL_263;
                      }
                      v114 = UpSeconds();
                      if (v114 <= v337)
                      {
                        if (!v54) {
                          goto LABEL_532;
                        }
                        v117 = word_26AD6CC6A;
                        if (dword_26AD6CDC8 >= word_26AD6CC6A)
                        {
                          v120 = v114;
                          v121 = logger;
                          if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
                          {
                            *(_DWORD *)uint64_t input = 136316162;
                            *(void *)&input[4] = "updateThread";
                            *(_WORD *)&input[12] = 1024;
                            *(_DWORD *)&input[14] = 3201;
                            *(_WORD *)&input[18] = 1024;
                            *(_DWORD *)&input[20] = v54;
                            *(_WORD *)&input[24] = 2048;
                            *(void *)&input[26] = v120;
                            *(_WORD *)&input[34] = 1024;
                            *(_DWORD *)&input[36] = v117;
                            _os_log_impl(&dword_225A99000, v121, OS_LOG_TYPE_DEFAULT, "%s:%d updatesDone=%d UpSeconds=%llu voltage=%d (low)", input, 0x28u);
                          }
                          v266 = 0;
                          v103 = 1;
                          unint64_t v3 = 0x26AD6C000uLL;
                          goto LABEL_263;
                        }
                        unint64_t v3 = 0x26AD6C000uLL;
                        if (v298)
                        {
LABEL_532:
                          if (debug_polling)
                          {
                            if (v103)
                            {
                              v118 = *(NSObject **)(v3 + 3096);
                              if (os_log_type_enabled(v118, OS_LOG_TYPE_DEFAULT))
                              {
                                v119 = UpSeconds();
                                *(_DWORD *)uint64_t input = 136315906;
                                *(void *)&input[4] = "updateThread";
                                *(_WORD *)&input[12] = 1024;
                                *(_DWORD *)&input[14] = 3209;
                                *(_WORD *)&input[18] = 2048;
                                *(void *)&input[20] = v119;
                                *(_WORD *)&input[28] = 1024;
                                *(_DWORD *)&input[30] = v337;
                                _os_log_impl(&dword_225A99000, v118, OS_LOG_TYPE_DEFAULT, "%s:%d UpSeconds=%llu (cfd = %u) forcing critical to 0", input, 0x22u);
                              }
                            }
                          }
                          if (!v266) {
                            v103 = 0;
                          }
                          v266 = v266 << 31 >> 31;
                        }
                      }
                      else if (debug_polling)
                      {
                        v115 = *(NSObject **)(v3 + 3096);
                        if (os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT))
                        {
                          v116 = UpSeconds();
                          *(_DWORD *)uint64_t input = 136315906;
                          *(void *)&input[4] = "updateThread";
                          *(_WORD *)&input[12] = 1024;
                          *(_DWORD *)&input[14] = 3191;
                          *(_WORD *)&input[18] = 2048;
                          *(void *)&input[20] = v116;
                          *(_WORD *)&input[28] = 1024;
                          *(_DWORD *)&input[30] = v337;
                          _os_log_impl(&dword_225A99000, v115, OS_LOG_TYPE_DEFAULT, "%s:%d deadline expired at UpSeconds=%llu (cfd = %u)", input, 0x22u);
                        }
                      }
LABEL_263:
                      if (!word_26AD6CDC4)
                      {
                        v324 = v266;
                        *(void *)((unint64_t)buf | (8 * v271)) = CFNumberCreate(allocator, kCFNumberIntType, &v324);
                        *(void *)((unint64_t)v352 & 0xFFFFFFFFFFFFFFF7 | (8 * (v271 & 1))) = @"SOCBasedShutdown";
                        v102 = v271 + 1;
                      }
                      if (debug_polling)
                      {
                        if (v103)
                        {
                          v122 = *(NSObject **)(v3 + 3096);
                          if (os_log_type_enabled(v122, OS_LOG_TYPE_DEFAULT))
                          {
                            v123 = UpSeconds();
                            *(_DWORD *)uint64_t input = 136316674;
                            *(void *)&input[4] = "updateThread";
                            *(_WORD *)&input[12] = 1024;
                            *(_DWORD *)&input[14] = 3227;
                            *(_WORD *)&input[18] = 1024;
                            *(_DWORD *)&input[20] = v54;
                            *(_WORD *)&input[24] = 1024;
                            *(_DWORD *)&input[26] = 1;
                            *(_WORD *)&input[30] = 1024;
                            *(_DWORD *)&input[32] = v298;
                            unint64_t v3 = 0x26AD6C000uLL;
                            *(_WORD *)&input[36] = 2048;
                            *(void *)&input[38] = v123;
                            *(_WORD *)&input[46] = 1024;
                            *(_DWORD *)&input[48] = word_26AD6CC6A;
                            _os_log_impl(&dword_225A99000, v122, OS_LOG_TYPE_DEFAULT, "%s:%d  updatesDone=%d criticalValue=%d external_connected=%d UpSeconds=%llu batteryInfo.voltage=%d", input, 0x34u);
                          }
                        }
                      }
                      v101 = v103 != 0;
                      uint64_t v2 = (_DWORD *)&unk_268113000;
                    }
                  }
                  if ((v68 & 1) == 0 || (v286 > 2 ? (v124 = 1) : (v124 = v101), (v124 & 1) != 0 || v53))
                  {
                    v267 = v101;
                    v286 = 0;
                    goto LABEL_280;
                  }
                  ++v286;
                  v125 = *(NSObject **)(v3 + 3096);
                  if (os_log_type_enabled(v125, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)uint64_t input = 0;
                    _os_log_impl(&dword_225A99000, v125, OS_LOG_TYPE_INFO, "flags update only", input, 2u);
                  }
                  v52 = 0;
                  v53 = 0;
LABEL_444:
                  v58 = v296;
                }
              }
              else
              {
                v88 = CFPreferencesCopyValue(@"ResetEnabled", @"com.apple.gasgauge", v294, v293);
                v89 = os_log_type_enabled(*(os_log_t *)(v3 + 3096), OS_LOG_TYPE_ERROR);
                if (v88 == v287)
                {
                  v90 = v296;
                  if (v89) {
                    updateThread_cold_5(&v329, v330);
                  }
                }
                else
                {
                  if (v89) {
                    updateThread_cold_6(&v327, v328);
                  }
                  v90 = v296;
                  ggctl_reset(v296, 1u);
                }
                v52 = 0;
                ++v53;
                v58 = v90;
              }
            }
          }
        }
        else
        {
          v52 = 0;
LABEL_166:
          v58 = -1;
        }
      }
    }
    if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR)) {
      updateThread_cold_1();
    }
  }
  return 0;
}

uint64_t batteryThread(unsigned int a1)
{
  return 0;
}

uint64_t GGEventInstall()
{
  memset(&v5, 0, sizeof(v5));
  uint64_t result = stat("/dev/cu.gas-gauge", &v5);
  if (!result)
  {
    EnableFullSleepForRevCOrLater(0);
    uint64_t result = os_transaction_create();
    if (result)
    {
      uint64_t v1 = result;
      global_queue = dispatch_get_global_queue(0, 0);
      unint64_t v3 = dispatch_source_create(MEMORY[0x263EF83F0], 0xFuLL, 0, global_queue);
      v4[0] = MEMORY[0x263EF8330];
      v4[1] = 0x40000000;
      v4[2] = __GGEventInstall_block_invoke;
      v4[3] = &__block_descriptor_tmp;
      v4[4] = v1;
      v4[5] = v3;
      dispatch_source_set_event_handler(v3, v4);
      dispatch_resume(v3);
      return startUpdateThread(0);
    }
  }
  return result;
}

uint64_t EnableFullSleepForRevCOrLater(int a1)
{
  uint64_t result = ggctl_connect(0);
  if (result)
  {
    mach_port_t v3 = result;
    long long v18 = 0u;
    long long v19 = 0u;
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
    long long v7 = 0u;
    memset(outputStruct, 0, sizeof(outputStruct));
    size_t outputStructCnt = 352;
    uint64_t result = IOConnectCallStructMethod(result, 2u, 0, 0, outputStruct, &outputStructCnt);
    if (v3 != -1)
    {
      if (DWORD2(v7))
      {
        size_t outputStructCnt = 0;
        if (IOConnectCallScalarMethod(v3, 0x10u, &outputStructCnt, 1u, 0, 0))
        {
          if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR)) {
            EnableFullSleepForRevCOrLater_cold_5();
          }
        }
      }
      if (IOConnectCallScalarMethod(v3, 6u, 0, 0, 0, 0))
      {
        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR)) {
          EnableFullSleepForRevCOrLater_cold_4();
        }
      }
      else
      {
        unsigned __int16 v5 = -1;
        if ((getFWVersion(v3, (__int16 *)&v5) & 0x80000000) != 0
          && os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
        {
          EnableFullSleepForRevCOrLater_cold_3();
        }
        if (v5 >= 0x310u)
        {
          size_t v4 = a1 ? 16 : 19;
          size_t outputStructCnt = v4;
          if (IOConnectCallScalarMethod(v3, 0xAu, &outputStructCnt, 1u, 0, 0))
          {
            if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR)) {
              EnableFullSleepForRevCOrLater_cold_2();
            }
          }
        }
      }
      if (DWORD2(v7))
      {
        size_t outputStructCnt = 1;
        if (IOConnectCallScalarMethod(v3, 0x10u, &outputStructCnt, 1u, 0, 0))
        {
          if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR)) {
            EnableFullSleepForRevCOrLater_cold_1();
          }
        }
      }
      return IOServiceClose(v3);
    }
  }
  return result;
}

void __GGEventInstall_block_invoke(uint64_t a1)
{
  EnableFullSleepForRevCOrLater(1);
  os_release(*(void **)(a1 + 32));
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 40));
  uint64_t v2 = *(NSObject **)(a1 + 40);

  dispatch_release(v2);
}

double ggctl_logShutdownDLog(mach_port_t a1, uint64_t a2, unsigned int a3)
{
  kern_return_t v4;
  double result;
  long long v6;
  uint64_t v7;
  uint64_t input;
  size_t v9;
  long long outputStruct;
  long long v11;
  uint64_t v12;
  uint64_t v13;

  long long v13 = *MEMORY[0x263EF8340];
  long long v9 = 40;
  if (a3)
  {
    if (!a2) {
      return result;
    }
    long long v12 = 0;
    long long outputStruct = 0u;
    long long v11 = 0u;
    long long v7 = a3;
    size_t v4 = IOConnectCallMethod(a1, 0x12u, &v7, 1u, 0, 0, 0, 0, &outputStruct, &v9);
  }
  else
  {
    if (!a2) {
      return result;
    }
    long long v12 = 0;
    long long outputStruct = 0u;
    long long v11 = 0u;
    uint64_t input = a3;
    size_t v4 = IOConnectCallMethod(a1, 0x12u, &input, 1u, 0, 0, 0, 0, &outputStruct, &v9);
  }
  if (!v4)
  {
    uint64_t result = *(double *)&outputStruct;
    io_service_t v6 = v11;
    *(_OWORD *)a2 = outputStruct;
    *(_OWORD *)(a2 + 16) = v6;
    *(void *)(a2 + 32) = v12;
  }
  return result;
}

uint64_t getSInt32ForKey(CFStringRef key, _DWORD *a2)
{
  CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(service, key, (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  if (CFProperty)
  {
    CFNumberRef v4 = CFProperty;
    CFTypeID TypeID = CFNumberGetTypeID();
    if (TypeID == CFGetTypeID(v4))
    {
      int Value = CFNumberGetValue(v4, kCFNumberSInt32Type, a2);
      CFRelease(v4);
      if (Value) {
        return 0;
      }
    }
    else
    {
      CFRelease(v4);
    }
  }
  uint64_t result = 0xFFFFFFFFLL;
  *a2 = -1;
  return result;
}

void setUPOData(const __CFString *a1, int a2)
{
  int v14 = a2;
  CFMutableDictionaryRef v3 = IOServiceMatching("IOService");
  if (v3)
  {
    CFNumberRef v4 = v3;
    int valuePtr = 0;
    CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFNumberRef v12 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt32Type, &valuePtr);
    CFDictionaryRef v6 = CFDictionaryCreate(v5, (const void **)&setUPOData_tmp, (const void **)&v12, 1, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    if (v6)
    {
      CFDictionaryRef v7 = v6;
      CFDictionarySetValue(v4, @"IOPropertyMatch", v6);
      CFRelease(v7);
      io_service_t MatchingService = IOServiceGetMatchingService(*MEMORY[0x263F0EC88], v4);
      if (!MatchingService) {
        return;
      }
      io_registry_entry_t v9 = MatchingService;
      CFNumberRef v10 = CFNumberCreate(v5, kCFNumberSInt32Type, &v14);
      IORegistryEntrySetCFProperty(v9, a1, v10);
      IOObjectRelease(v9);
      CFNumberRef v11 = v10;
    }
    else
    {
      CFNumberRef v11 = v4;
    }
    CFRelease(v11);
  }
}

uint64_t ggctl_logShutdownReason2(uint64_t result, _OWORD *a2, unsigned int a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  size_t v8 = 48;
  if (a2)
  {
    if (a3)
    {
      long long v10 = 0u;
      long long v11 = 0u;
      long long outputStruct = 0u;
      uint64_t input = a3;
      uint64_t result = IOConnectCallMethod(result, 0x13u, &input, 1u, inputStruct, 0x30uLL, 0, 0, &outputStruct, &v8);
      if (!result)
      {
        long long v4 = v10;
        *a2 = outputStruct;
        a2[1] = v4;
        a2[2] = v11;
      }
    }
    else
    {
      long long v5 = a2[1];
      inputStruct[0] = *a2;
      inputStruct[1] = v5;
      inputStruct[2] = a2[2];
      uint64_t v7 = a3;
      return IOConnectCallMethod(result, 0x13u, &v7, 1u, inputStruct, 0x30uLL, 0, 0, &outputStruct, &v8);
    }
  }
  return result;
}

uint64_t iokit_callback(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  *(_DWORD *)uint64_t result = a3;
  *(void *)(result + 8) = a4;
  return result;
}

void getUPOData(CFStringRef key, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  io_registry_entry_t v4 = find_pmu_pmu_service;
  long long v5 = (CFAllocatorRef *)MEMORY[0x263EFFB08];
  if (find_pmu_pmu_service) {
    goto LABEL_7;
  }
  CFMutableDictionaryRef v6 = IOServiceMatching("IOService");
  if (v6)
  {
    uint64_t v7 = v6;
    int v15 = 0;
    CFAllocatorRef v8 = *v5;
    find_pmu_zero_number = (uint64_t)CFNumberCreate(*v5, kCFNumberSInt32Type, &v15);
    CFDictionaryRef v9 = CFDictionaryCreate(v8, (const void **)&find_pmu_tmp, (const void **)&find_pmu_zero_number, 1, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    if (v9)
    {
      CFDictionaryRef v10 = v9;
      CFDictionarySetValue(v7, @"IOPropertyMatch", v9);
      CFRelease(v10);
      find_pmu_pmu_service = IOServiceGetMatchingService(*MEMORY[0x263F0EC88], v7);
    }
    else
    {
      CFRelease(v7);
    }
  }
  io_registry_entry_t v4 = find_pmu_pmu_service;
  if (find_pmu_pmu_service)
  {
LABEL_7:
    CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v4, key, *v5, 0);
    if (CFProperty)
    {
      CFNumberRef v12 = CFProperty;
      CFTypeID TypeID = CFNumberGetTypeID();
      if (TypeID != CFGetTypeID(v12) || !CFNumberGetValue((CFNumberRef)v12, kCFNumberSInt32Type, a2))
      {
        int v14 = logger;
        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
        {
          int v15 = 136315394;
          long long v16 = "/Library/Caches/com.apple.xbs/Sources/AppleHDQGasGauge/AppleHDQGasGauge.c";
          __int16 v17 = 1024;
          int v18 = 2348;
          _os_log_impl(&dword_225A99000, v14, OS_LOG_TYPE_DEFAULT, "%s:%d cannot read upo data", (uint8_t *)&v15, 0x12u);
        }
      }
      CFRelease(v12);
    }
  }
}

void updateThermalCoolDownState(io_registry_entry_t a1, int a2)
{
  keys[1] = *(void **)MEMORY[0x263EF8340];
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  keys[0] = (void *)CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], "ThermalCoolDown", 0x8000100u);
  long long v5 = (void **)MEMORY[0x263EFFB40];
  if (!a2) {
    long long v5 = (void **)MEMORY[0x263EFFB38];
  }
  values = *v5;
  CFDictionaryRef v6 = CFDictionaryCreate(v4, (const void **)keys, (const void **)&values, 1, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (v6)
  {
    CFDictionaryRef v7 = v6;
    IORegistryEntrySetCFProperties(a1, v6);
    CFRelease(v7);
  }
  else if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
  {
    updateThermalCoolDownState_cold_1();
  }
}

void statsAndLogs(io_registry_entry_t a1, int a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  CFStringRef v12 = 0;
  CFTypeRef cf = 0;
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  keys = (void *)CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], "stats", 0x8000100u);
  long long v5 = (const void *)*MEMORY[0x263EFFB38];
  values = (void *)*MEMORY[0x263EFFB38];
  if (a2)
  {
    CFStringRef v12 = CFStringCreateWithCString(v4, "log", 0x8000100u);
    CFTypeRef cf = v5;
    CFIndex v6 = 2;
  }
  else
  {
    CFIndex v6 = 1;
  }
  CFDictionaryRef v7 = CFDictionaryCreate(v4, (const void **)&keys, (const void **)&values, v6, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (v7)
  {
    CFDictionaryRef v8 = v7;
    if (IORegistryEntrySetCFProperties(a1, v7) && os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR)) {
      statsAndLogs_cold_2();
    }
    CFRelease(v8);
    CFRelease(values);
    if (a2) {
      CFRelease(cf);
    }
  }
  else if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
  {
    statsAndLogs_cold_1();
  }
}

void debugLog(io_registry_entry_t a1, int a2)
{
  keys[1] = *(void **)MEMORY[0x263EF8340];
  int valuePtr = a2;
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  keys[0] = (void *)CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], "debug", 0x8000100u);
  values = CFNumberCreate(v3, kCFNumberSInt32Type, &valuePtr);
  CFDictionaryRef v4 = CFDictionaryCreate(v3, (const void **)keys, (const void **)&values, 1, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (v4)
  {
    CFDictionaryRef v5 = v4;
    if (IORegistryEntrySetCFProperties(a1, v4))
    {
      if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR)) {
        debugLog_cold_2();
      }
    }
    CFRelease(v5);
    CFRelease(values);
  }
  else if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
  {
    debugLog_cold_1();
  }
}

uint64_t readChargeTable(mach_port_t a1, __CFData **a2)
{
  *(void *)&v48[26] = *MEMORY[0x263EF8340];
  *a2 = 0;
  if (!dword_26AD6CD3C) {
    return 0;
  }
  uint64_t v3 = 0xFFFFFFFFLL;
  if (!ggctl_readBlock(a1, -1, dword_26AD6CD3C, &outputStruct, 0))
  {
    int v4 = v47;
    if (v47 == 255)
    {
      unsigned int v9 = outputStruct;
      unint64_t v10 = (unint64_t)outputStruct >> 4;
      uint64_t v11 = 6 * v10 + 4;
      if (outputStruct <= 0x4FuLL)
      {
        unsigned __int8 v13 = 0;
        unsigned int v37 = v46;
        p_unsigned __int8 outputStruct = (char *)&outputStruct;
        do
        {
          char v15 = *p_outputStruct++;
          v13 += v15;
          --v11;
        }
        while (v11);
        int v16 = v13;
        if (v13)
        {
          uint64_t v17 = logger;
          uint64_t v3 = 0;
          if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109632;
            int v39 = v16;
            __int16 v40 = 1024;
            int v41 = v45;
            __int16 v42 = 1024;
            int v43 = 256 - (v16 - v45);
            CFIndex v6 = "gas gauge charge table bad checksum: checksum %#x checksum byte %#x expecting %#x";
            CFDictionaryRef v7 = v17;
            uint32_t v8 = 20;
            goto LABEL_14;
          }
        }
        else
        {
          unint64_t v19 = (unint64_t)v46 >> 4;
          uint64_t v20 = 4 * v19 + 8;
          Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], v20 * (unint64_t)v10);
          CFDataSetLength(Mutable, v20 * (unint64_t)v10);
          if (v9 >= 0x10)
          {
            uint64_t v22 = 0;
            if (v19 <= 1) {
              uint64_t v23 = 1;
            }
            else {
              uint64_t v23 = v19;
            }
            uint64_t v36 = v23;
            if (v10 <= 1) {
              uint64_t v24 = 1;
            }
            else {
              uint64_t v24 = v10;
            }
            CFNumberRef v25 = v48;
            uint64_t v26 = 10;
            do
            {
              MutableBytePtr = CFDataGetMutableBytePtr(Mutable);
              CFBooleanRef v28 = &MutableBytePtr[v22 * v20];
              CFBooleanRef v29 = (char *)(&outputStruct + 6 * v22);
              *(_WORD *)CFBooleanRef v28 = 100 * v29[4];
              *((_WORD *)v28 + 1) = 100 * v29[5];
              *((_DWORD *)v28 + 1) = v19;
              if (v37 >= 0x10)
              {
                CFTypeID v30 = &MutableBytePtr[v26];
                uint64_t v31 = v19 - 1;
                uint64_t v32 = v36;
                CFNumberRef v33 = v25;
                do
                {
                  if (v31) {
                    int v34 = updateThread_batteryInfo[(*v33 & 0xF) + 64];
                  }
                  else {
                    LOWORD(v34) = -1;
                  }
                  *((_WORD *)v30 - 1) = v34;
                  unsigned int v35 = *v33++;
                  *(_WORD *)CFTypeID v30 = *(int *)((char *)&updateThread_batteryInfo[80] + (((unint64_t)v35 >> 2) & 0x3C));
                  v30 += 4;
                  --v31;
                  --v32;
                }
                while (v32);
              }
              ++v22;
              v26 += v20;
              v25 += 6;
            }
            while (v22 != v24);
          }
          uint64_t v3 = 0;
          *a2 = Mutable;
        }
      }
      else
      {
        uint64_t v12 = logger;
        uint64_t v3 = 0;
        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109376;
          int v39 = v10;
          __int16 v40 = 1024;
          int v41 = 6 * v10 + 4;
          CFIndex v6 = "gas gauge charge table inconsistent: %d data entries, %d bytes";
          CFDictionaryRef v7 = v12;
          uint32_t v8 = 14;
          goto LABEL_14;
        }
      }
    }
    else
    {
      uint64_t v5 = logger;
      uint64_t v3 = 0;
      if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v39 = v4;
        CFIndex v6 = "gas gauge charge table invalid type: %#x";
        CFDictionaryRef v7 = v5;
        uint32_t v8 = 8;
LABEL_14:
        _os_log_impl(&dword_225A99000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
        return 0;
      }
    }
  }
  return v3;
}

uint64_t readRemainingCapacity__(_WORD *a1, int *a2, mach_port_t a3)
{
  unsigned __int16 v8 = 0;
  if ((getFWVersion(a3, (__int16 *)&v8) & 0x80000000) != 0) {
    return 0xFFFFFFFFLL;
  }
  if (v8 <= 0x118u) {
    int v6 = *a2;
  }
  else {
    int v6 = 50;
  }

  return hdqReadS16(a3, v6, a1);
}

uint64_t readFAC__(_WORD *a1, uint64_t a2, mach_port_t a3)
{
  __int16 v6 = 0;
  if ((getFWVersion(a3, &v6) & 0x80000000) != 0) {
    return 0xFFFFFFFFLL;
  }
  if (v6 == 1536) {
    return 0;
  }

  return hdqReadU16(a3, 14, a1);
}

uint64_t readBatteryData(uint64_t a1, uint64_t a2, mach_port_t a3)
{
  unsigned __int16 v10 = 0;
  if ((getFWVersion(a3, (__int16 *)&v10) & 0x80000000) != 0) {
    return 0xFFFFFFFFLL;
  }
  if ((int)a2 >= 1)
  {
    uint64_t v6 = 0;
    unsigned int v7 = v10;
    while (1)
    {
      if (*(_DWORD *)(a1 + 4) == -1) {
        return v6;
      }
      if (registerName(a1, v7))
      {
        uint64_t Register = readRegister(*(_WORD **)(a1 + 56), a1, a3);
        if ((Register & 0x80000000) != 0) {
          break;
        }
      }
      ++v6;
      a1 += 80;
      if (a2 == v6) {
        return a2;
      }
    }
    return Register;
  }
  return a2;
}

void calculateBatteryHealthMetric()
{
  if ((unsigned __int16)word_26AD6CC66 >= 0x600u)
  {
    uint64_t v0 = 0;
    float v1 = (double)(bswap32((unsigned __int16)word_26AD6CCE0) >> 16) * 0.137995
       + (double)(bswap32((unsigned __int16)word_26AD6CCDE) >> 16) * 0.0693069
       + (double)(bswap32((unsigned __int16)word_26AD6CCE2) >> 16) * 0.137376
       + (double)(bswap32((unsigned __int16)word_26AD6CCE4) >> 16) * 0.137376
       + (double)(bswap32((unsigned __int16)word_26AD6CCE6) >> 16) * 0.137376
       + (double)(bswap32((unsigned __int16)word_26AD6CCE8) >> 16) * 0.137376
       + (double)(bswap32((unsigned __int16)word_26AD6CCEA) >> 16) * 0.137376
       + (double)(bswap32((unsigned __int16)word_26AD6CCEC) >> 16) * 0.0872525
       + (double)(bswap32((unsigned __int16)word_26AD6CCEE) >> 16) * 0.0185644;
    word_26AD6CD34 = (int)v1;
    while (battery_health_metric_config[v0] != word_26AD6CC60)
    {
      v0 += 4;
      if (v0 == 68)
      {
        float v2 = 0.0;
        goto LABEL_7;
      }
    }
    float v2 = (float)*(unsigned int *)&battery_health_metric_config[v0 + 2];
LABEL_7:
    float v3 = (float)(v2 * v1) / 1000.0;
    word_26AD6CD36 = (int)v3;
    if (dword_26AD6CD30 < (int)v3)
    {
      dword_26AD6CD30 = (int)v3;
      setUPOData(@"IOPMUBootBatteryHealthMetric", (int)v3);
    }
  }
}

CFDictionaryRef readChargerData(int a1, int a2, mach_port_t a3)
{
  values[8] = *(void **)MEMORY[0x263EF8340];
  if (readBatteryData((uint64_t)&readChargerData_chargerRegs, 5, a3) != 5) {
    return 0;
  }
  memset(&values[2], 0, 48);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  values[0] = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt8Type, &readChargerData_notChargingReason);
  keys[0] = @"NotChargingReason";
  values[1] = CFNumberCreate(v6, kCFNumberSInt8Type, &readChargerData_chargerAlert);
  keys[1] = @"ChargerAlert";
  if (!a1) {
    goto LABEL_11;
  }
  int v7 = readChargerData_notChargingReason & 0x10;
  if (a2)
  {
    if ((readChargerData_notChargingReason & 0x10) != 0)
    {
      int v7 = (readChargerData_notChargingReason >> 4) & 1;
      LOWORD(v19) = 0;
      if ((hdqReadU16(a3, 52, &v19) & 0x80000000) == 0)
      {
        uint64_t v8 = 1717986919 * byte_26AD6CC68 * word_26AD6CC62;
        if ((int)((v8 >> 34) + ((unint64_t)v8 >> 63)) > (unsigned __int16)v19) {
          int v7 = 0;
        }
      }
    }
  }
  if (v7)
  {
    values[2] = *(void **)MEMORY[0x263EFFB40];
    *(void *)&long long v21 = @"ChargerTimeout";
    uint64_t v9 = 3;
  }
  else
  {
LABEL_11:
    uint64_t v9 = 2;
  }
  if ((readChargerData_notChargingReason & 0x20) != 0)
  {
    values[v9] = (void *)*MEMORY[0x263EFFB40];
    keys[v9++] = @"ChargerWatchdogTimeout";
  }
  values[v9] = CFNumberCreate(v6, kCFNumberSInt8Type, &readChargerData_chargingCurrent);
  keys[v9] = @"ChargingCurrent";
  CFNumberRef v11 = CFNumberCreate(v6, kCFNumberSInt8Type, &readChargerData_chargingVoltage);
  uint64_t v12 = 8 * v9 + 8;
  *(void **)((char *)values + v12) = v11;
  *(void **)((char *)keys + v12) = @"ChargingVoltage";
  CFNumberRef v13 = CFNumberCreate(v6, kCFNumberSInt8Type, &readChargerData_chargerStatus);
  uint64_t v14 = 8 * v9 + 16;
  *(void **)((char *)values + v14) = v13;
  *(void **)((char *)keys + v14) = @"ChargerStatus";
  time_t v19 = time(0);
  CFNumberRef v15 = CFNumberCreate(v6, kCFNumberLongType, &v19);
  uint64_t v16 = 8 * v9 + 24;
  *(void **)((char *)values + v16) = v15;
  *(void **)((char *)keys + v16) = @"UpdateTime";
  CFDictionaryRef v10 = CFDictionaryCreate(v6, (const void **)keys, (const void **)values, v9 + 4, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  do
  {
    CFRelease(values[v9 + 3]);
    unint64_t v17 = v9 + 4;
    --v9;
  }
  while (v17 > 1);
  return v10;
}

CFDictionaryRef dynamicATV(mach_port_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  CFNumberRef v21 = 0;
  time_t v19 = 0;
  *(_OWORD *)uint64_t input = xmmword_225AA41A0;
  uint64_t v23 = 0;
  if (IOConnectCallScalarMethod(a1, 7u, input, 3u, 0, 0))
  {
    float v1 = logger;
    if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR)) {
      dynamicATV_cold_1(v1, v2, v3, v4, v5, v6, v7, v8);
    }
  }
  unsigned int v9 = word_26AD6CC64 + (unsigned __int16)word_26AD6CC6E;
  int v10 = word_26AD6CC62;
  if (v9 <= (__int16)(v10 + ((unsigned __int16)(v10 & 0x8000) >> 15)) >> 1) {
    int v11 = (__int16)(word_26AD6CC62 + ((word_26AD6CC62 & 0x8000u) >> 15)) >> 1;
  }
  else {
    int v11 = word_26AD6CC64 + (unsigned __int16)word_26AD6CC6E;
  }
  if (v9 <= word_26AD6CC62) {
    int v10 = v11;
  }
  dword_26AD6CC8C = v10;
  CFAllocatorRef v12 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  values = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberIntType, &dword_26AD6CC8C);
  int v18 = @"atvBatteryCapacityMA";
  if (dword_26AD6CDE0)
  {
    int v13 = determineVACVoltage();
    if (v13 != dword_26AD6CC88) {
      dword_26AD6CC88 = v13;
    }
    CFNumberRef v21 = CFNumberCreate(v12, kCFNumberIntType, &dword_26AD6CC88);
    time_t v19 = @"atvAbsMaxVoltageMV";
    unint64_t v14 = 2;
  }
  else
  {
    unint64_t v14 = 1;
  }
  CFDictionaryRef v15 = CFDictionaryCreate(v12, (const void **)&v18, (const void **)&values, v14, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  do
    CFRelease(*(&v19 + v14));
  while (v14-- > 1);
  return v15;
}

uint64_t determineVACVoltage()
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  unsigned int v0 = dword_26AD6CC88;
  uint64_t v1 = dword_26AD6CDE0;
  if (dword_26AD6CDE0)
  {
    if (determineVACVoltage_lastBatteryCycleCount != (unsigned __int16)word_26AD6CC94 || dword_26AD6CC88 == 0)
    {
      determineVACVoltage_lastBatteryCycleCount = (unsigned __int16)word_26AD6CC94;
      uint64_t v3 = &dword_26AD6CDE4;
      while (1)
      {
        unsigned int v5 = *v3++;
        unsigned __int16 v4 = v5;
        unsigned int v6 = HIWORD(v5);
        if (v5 < 0x10000 || v6 > (unsigned __int16)word_26AD6CC94) {
          break;
        }
        if (!--v1)
        {
          int v8 = determineVACVoltage_vacBasedVoltageMV;
          if (determineVACVoltage_vacBasedVoltageMV) {
            goto LABEL_17;
          }
          goto LABEL_16;
        }
      }
      int v8 = v4;
      if (v4) {
        goto LABEL_17;
      }
LABEL_16:
      int v8 = LOWORD(updateThread_batteryInfo[dword_26AD6CDE0 + 104]);
LABEL_17:
      determineVACVoltage_vacBasedVoltageMV = v8;
      unsigned int v9 = logger;
      if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
      {
        int v37 = 67109120;
        int v38 = v8;
        _os_log_impl(&dword_225A99000, v9, OS_LOG_TYPE_DEFAULT, "determineVACVoltage:: vacBasedVoltageMV=%d", (uint8_t *)&v37, 8u);
        int v8 = determineVACVoltage_vacBasedVoltageMV;
      }
      if (v0) {
        BOOL v10 = 1;
      }
      else {
        BOOL v10 = v8 == 0;
      }
      if (!v10) {
        unsigned int v0 = v8;
      }
    }
  }
  uint64_t v11 = dword_26AD6CE24;
  if (dword_26AD6CE24 && (unsigned __int16)word_26AD6CC66 >= 0x313u)
  {
    unsigned __int8 v12 = word_26AD6CCCE;
    if ((unsigned __int16)word_26AD6CC66 <= 0x500u) {
      __int16 v13 = word_26AD6CCCE;
    }
    else {
      __int16 v13 = word_26AD6CCCC;
    }
    unint64_t v14 = (unsigned __int8 *)&word_26AD6CCCE + 1;
    if ((unsigned __int16)word_26AD6CC66 > 0x500u) {
      unint64_t v14 = (unsigned __int8 *)&word_26AD6CCCC + 1;
    }
    unsigned __int16 v15 = *v14 | (unsigned __int16)(v13 << 8);
    if ((unsigned __int16)word_26AD6CC66 <= 0x500u) {
      unsigned __int8 v12 = byte_26AD6CCD0;
    }
    if (v12 && v15 != 0)
    {
      if (determineVACVoltage_lastTimeAbove95 != v12
        || ((unsigned __int16)determineVACVoltage_lastToT == v15 ? (BOOL v17 = v0 == 0) : (BOOL v17 = 1), v17))
      {
        determineVACVoltage_lastTimeAbove95 = v12;
        determineVACVoltage_lastToT = v15;
        unint64_t v18 = (42949673 * (unint64_t)(v12 * v15)) >> 32;
        time_t v19 = &dword_26AD6CE28;
        while (1)
        {
          unsigned int v21 = *v19++;
          unsigned __int16 v20 = v21;
          unsigned int v22 = HIWORD(v21);
          if (v21 < 0x10000 || v18 < v22) {
            break;
          }
          if (!--v11)
          {
            int v24 = determineVACVoltage_vac95BasedVoltageMV;
            if (determineVACVoltage_vac95BasedVoltageMV) {
              goto LABEL_54;
            }
            goto LABEL_53;
          }
        }
        int v24 = v20;
        if (v20) {
          goto LABEL_54;
        }
LABEL_53:
        int v24 = LOWORD(updateThread_batteryInfo[dword_26AD6CE24 + 121]);
LABEL_54:
        determineVACVoltage_vac95BasedVoltageMV = v24;
        CFNumberRef v25 = logger;
        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
        {
          int v37 = 67109376;
          int v38 = v24;
          __int16 v39 = 1024;
          unsigned int v40 = v0;
          _os_log_impl(&dword_225A99000, v25, OS_LOG_TYPE_DEFAULT, "determineVACVoltage:: vac95BasedVoltageMV=%d absMaxVoltageMV=%d", (uint8_t *)&v37, 0xEu);
          int v24 = determineVACVoltage_vac95BasedVoltageMV;
        }
        if (v0) {
          BOOL v26 = 1;
        }
        else {
          BOOL v26 = v24 == 0;
        }
        if (!v26) {
          unsigned int v0 = v24;
        }
      }
    }
  }
  unsigned int v27 = determineVACVoltage_vacBasedVoltageMV;
  if (determineVACVoltage_vacBasedVoltageMV >= v0 || determineVACVoltage_vacBasedVoltageMV == 0) {
    unsigned int v27 = v0;
  }
  if (determineVACVoltage_vac95BasedVoltageMV >= v27 || determineVACVoltage_vac95BasedVoltageMV == 0) {
    uint64_t v30 = v27;
  }
  else {
    uint64_t v30 = determineVACVoltage_vac95BasedVoltageMV;
  }
  uint64_t v31 = dword_26AD6CC88;
  int v32 = word_26AD6CC6A;
  if (dword_26AD6CC88) {
    BOOL v33 = v30 >= word_26AD6CC6A;
  }
  else {
    BOOL v33 = 1;
  }
  if (v33) {
    return v30;
  }
  int v34 = logger;
  if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
  {
    int v37 = 67109376;
    int v38 = v32;
    __int16 v39 = 1024;
    unsigned int v40 = v30;
    _os_log_impl(&dword_225A99000, v34, OS_LOG_TYPE_DEFAULT, "determineVACVoltage:: waiting for vbat(%d) < vac(%d)", (uint8_t *)&v37, 0xEu);
    return dword_26AD6CC88;
  }
  return v31;
}

uint64_t determinePoSMThreshold()
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  if ((unsigned __int16)word_26AD6CC66 <= 0x500u)
  {
    if ((unsigned __int16)word_26AD6CC66 < 0x313u) {
      return 0xFFFFFFFFLL;
    }
    uint64_t v2 = &word_26AD6CCCE;
    unsigned int v0 = (__int16 *)&byte_26AD6CCD0;
    uint64_t v1 = (unsigned __int8 *)&word_26AD6CCCE + 1;
  }
  else
  {
    unsigned int v0 = &word_26AD6CCCE;
    uint64_t v1 = (unsigned __int8 *)&word_26AD6CCCC + 1;
    uint64_t v2 = &word_26AD6CCCC;
  }
  unsigned int v3 = *v1 | (*(unsigned __int8 *)v2 << 8);
  unsigned int v4 = *(unsigned __int8 *)v0;
  int v5 = (unsigned __int16)dword_26AD6CE6C;
  BOOL v6 = (unsigned __int16)dword_26AD6CE6C != 0;
  int v7 = (unsigned __int16)word_26AD6CE70;
  BOOL v8 = word_26AD6CE70 != 0;
  int v9 = (unsigned __int16)word_26AD6CE78;
  BOOL v10 = word_26AD6CE78 != 0;
  BOOL v11 = determinePoSMThreshold_lastBatteryCycleCount != (unsigned __int16)word_26AD6CC94
     && (unsigned __int16)dword_26AD6CE6C != 0;
  BOOL v12 = (unsigned __int16)determinePoSMThreshold_lastToT != v3 && word_26AD6CE70 != 0;
  BOOL v13 = determinePoSMThreshold_lastAbove95 != v4
     || (unsigned __int16)determinePoSMThreshold_lastToT != v3;
  BOOL v14 = determinePoSMThreshold_lastAbove95 != v4 && word_26AD6CE78 != 0;
  BOOL v32 = v11;
  BOOL v33 = v14;
  int v15 = (unsigned __int16)dword_26AD6CE74;
  BOOL v31 = (unsigned __int16)dword_26AD6CE74 != 0;
  if ((_WORD)dword_26AD6CE74) {
    BOOL v16 = v13;
  }
  else {
    BOOL v16 = 0;
  }
  if (v11)
  {
    determinePoSMThreshold_lastBatteryCycleCount = (unsigned __int16)word_26AD6CC94;
    if ((unsigned __int16)word_26AD6CC94 <= HIWORD(dword_26AD6CE6C)) {
      int v17 = -1;
    }
    else {
      int v17 = dword_26AD6CE7C;
    }
    determinePoSMThreshold_vacThreshold = v17;
  }
  if (v12)
  {
    determinePoSMThreshold_lastToT = v3;
    if (v3 <= HIWORD(*(_DWORD *)&word_26AD6CE70)) {
      int v18 = -1;
    }
    else {
      int v18 = dword_26AD6CE80;
    }
    determinePoSMThreshold_vacpThreshold = v18;
  }
  if (v16)
  {
    determinePoSMThreshold_lastToT = v3;
    determinePoSMThreshold_lastAbove95 = v4;
    if ((42949673 * (unint64_t)(v4 * v3)) >> 32 <= HIWORD(dword_26AD6CE74)) {
      int v19 = -1;
    }
    else {
      int v19 = dword_26AD6CE84;
    }
    determinePoSMThreshold_vac95Threshold = v19;
  }
  int v34 = (unsigned __int16)word_26AD6CC94;
  if (word_26AD6CE78)
  {
    determinePoSMThreshold_lastAbove95 = v4;
    if (v4 <= HIWORD(*(_DWORD *)&word_26AD6CE78))
    {
      unint64_t v21 = 0x26AD6C000uLL;
      unsigned int v20 = -1;
    }
    else
    {
      unsigned int v20 = dword_26AD6CE88;
      unint64_t v21 = 0x26AD6C000;
    }
    *(_DWORD *)(v21 + 3804) = v20;
  }
  else
  {
    unsigned int v20 = determinePoSMThreshold_vac95pThreshold;
  }
  if (determinePoSMThreshold_vacThreshold == -1 || v5 == 0) {
    unsigned int v24 = -1;
  }
  else {
    unsigned int v24 = determinePoSMThreshold_vacThreshold;
  }
  if (determinePoSMThreshold_vacpThreshold >= v24 || v7 == 0) {
    unsigned int v26 = v24;
  }
  else {
    unsigned int v26 = determinePoSMThreshold_vacpThreshold;
  }
  if (determinePoSMThreshold_vac95Threshold < v26 && v15 != 0) {
    unsigned int v26 = determinePoSMThreshold_vac95Threshold;
  }
  if (v20 >= v26 || v9 == 0) {
    uint64_t v22 = v26;
  }
  else {
    uint64_t v22 = v20;
  }
  CFBooleanRef v29 = logger;
  if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109888;
    BOOL v36 = v6;
    __int16 v37 = 1024;
    int v38 = v8;
    __int16 v39 = 1024;
    int v40 = v31;
    __int16 v41 = 1024;
    int v42 = v10;
    _os_log_impl(&dword_225A99000, v29, OS_LOG_TYPE_DEFAULT, "determinePoSMThreshold, enabled:%d %d %d %d ", buf, 0x1Au);
    CFBooleanRef v29 = logger;
  }
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109888;
    BOOL v36 = v32;
    __int16 v37 = 1024;
    int v38 = v12;
    __int16 v39 = 1024;
    int v40 = v16;
    __int16 v41 = 1024;
    int v42 = v33;
    _os_log_impl(&dword_225A99000, v29, OS_LOG_TYPE_DEFAULT, "determinePoSMThreshold, changed:%d %d %d %d ", buf, 0x1Au);
    CFBooleanRef v29 = logger;
  }
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67110912;
    BOOL v36 = v34;
    __int16 v37 = 1024;
    int v38 = HIWORD(dword_26AD6CE6C);
    __int16 v39 = 1024;
    int v40 = v3;
    __int16 v41 = 1024;
    int v42 = (unsigned __int16)word_26AD6CE72;
    __int16 v43 = 1024;
    int v44 = (42949673 * (unint64_t)(v4 * v3)) >> 32;
    __int16 v45 = 1024;
    int v46 = HIWORD(dword_26AD6CE74);
    __int16 v47 = 1024;
    unsigned int v48 = v4;
    __int16 v49 = 1024;
    int v50 = (unsigned __int16)word_26AD6CE7A;
    _os_log_impl(&dword_225A99000, v29, OS_LOG_TYPE_DEFAULT, "determinePoSMThreshold, cmp:%d>%u %d>%u %d>%u %d>%u", buf, 0x32u);
    CFBooleanRef v29 = logger;
  }
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67110144;
    BOOL v36 = v22;
    __int16 v37 = 1024;
    int v38 = determinePoSMThreshold_vacThreshold;
    __int16 v39 = 1024;
    int v40 = determinePoSMThreshold_vacpThreshold;
    __int16 v41 = 1024;
    int v42 = determinePoSMThreshold_vac95Threshold;
    __int16 v43 = 1024;
    int v44 = determinePoSMThreshold_vac95pThreshold;
    _os_log_impl(&dword_225A99000, v29, OS_LOG_TYPE_DEFAULT, "determinePoSMThreshold,minThreshold=%u threshold:%u %u %u %u", buf, 0x20u);
  }
  return v22;
}

CFDictionaryRef parseBatteryData(int a1, int a2)
{
  uint64_t v130 = *MEMORY[0x263EF8340];
  *(void *)&valuePtr[4] = 0;
  uint64_t v121 = 0;
  long long v120 = 0u;
  long long v119 = 0u;
  long long v118 = 0u;
  long long v117 = 0u;
  long long v116 = 0u;
  long long v115 = 0u;
  long long v114 = 0u;
  long long v113 = 0u;
  long long v112 = 0u;
  long long v111 = 0u;
  long long v110 = 0u;
  long long v109 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  uint64_t v106 = 0;
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  v107 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const UInt8 *)updateThread_batteryInfo, 32);
  v93[0] = @"MfgData";
  v108[0] = createStringWithBytes((UInt8 *)updateThread_batteryInfo, 0x12uLL);
  v93[1] = @"Serial";
  *(void *)int valuePtr = word_26AD6CC62;
  v108[1] = CFNumberCreate(v4, kCFNumberIntType, valuePtr);
  v93[2] = @"DesignCapacity";
  int v64 = (unsigned __int16)word_26AD6CC96;
  values = CFNumberCreate(v4, kCFNumberIntType, &v64);
  if (values)
  {
    *(void *)&long long v109 = CFArrayCreate(v4, (const void **)&values, 1, MEMORY[0x263EFFF70]);
    *(void *)&long long v94 = @"Qmax";
    CFRelease(values);
    uint64_t v5 = 4;
  }
  else
  {
    uint64_t v5 = 3;
  }
  int v63 = word_26AD6CC6C;
  v108[v5 - 1] = CFNumberCreate(v4, kCFNumberIntType, &v63);
  v93[v5] = @"MaxCapacity";
  int v62 = (unsigned __int16)word_26AD6CC94;
  CFNumberRef v6 = CFNumberCreate(v4, kCFNumberIntType, &v62);
  uint64_t v7 = 8 * v5 + 8;
  *(void *)((char *)&v108[-1] + v7) = v6;
  *(void **)((char *)v93 + v7) = @"CycleCount";
  int v61 = (unsigned __int16)word_26AD6CC98;
  CFNumberRef v8 = CFNumberCreate(v4, kCFNumberIntType, &v61);
  uint64_t v9 = 8 * v5 + 16;
  *(void *)((char *)&v108[-1] + v9) = v8;
  *(void **)((char *)v93 + v9) = @"StateOfCharge";
  int v60 = word_26AD6CC6A;
  CFNumberRef v10 = CFNumberCreate(v4, kCFNumberIntType, &v60);
  uint64_t v11 = 8 * v5 + 24;
  *(void *)((char *)&v108[-1] + v11) = v10;
  *(void **)((char *)v93 + v11) = @"Voltage";
  int v59 = (unsigned __int16)word_26AD6CC9A;
  CFNumberRef v12 = CFNumberCreate(v4, kCFNumberIntType, &v59);
  uint64_t v13 = 8 * v5 + 32;
  *(void *)((char *)&v108[-1] + v13) = v12;
  *(void **)((char *)v93 + v13) = @"Flags";
  CFStringRef StringWithBytes = createStringWithBytes((UInt8 *)updateThread_batteryInfo + 2, 4uLL);
  uint64_t v15 = 8 * v5 + 40;
  *(void *)((char *)&v108[-1] + v15) = StringWithBytes;
  *(void **)((char *)v93 + v15) = @"ManufactureDate";
  __int16 v58 = word_26AD6CC60;
  CFNumberRef v16 = CFNumberCreate(v4, kCFNumberSInt16Type, &v58);
  uint64_t v17 = 8 * v5 + 48;
  *(void *)((char *)&v108[-1] + v17) = v16;
  *(void **)((char *)v93 + v17) = @"ChemID";
  uint64_t v18 = v5 + 7;
  if (word_26AD6CC66 != 1536)
  {
    int v57 = (unsigned __int16)word_26AD6CC9C;
    v108[v18 - 1] = CFNumberCreate(v4, kCFNumberIntType, &v57);
    v93[v18] = @"FullAvailableCapacity";
    uint64_t v18 = v5 | 8;
    if ((unsigned __int16)word_26AD6CC66 < 0x313u) {
      goto LABEL_20;
    }
  }
  long long v127 = 0u;
  long long v128 = 0u;
  long long v129 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  uint64_t v125 = 0;
  time_t v92 = time(0);
  keys[0] = @"UpdateTime";
  v126[0] = CFNumberCreate(v4, kCFNumberLongType, &v92);
  keys[1] = @"MaximumTemperature";
  int v91 = (__int16)(byte_26AD6CC9E << 8) | byte_26AD6CC9F;
  v126[1] = CFNumberCreate(v4, kCFNumberIntType, &v91);
  keys[2] = @"MinimumTemperature";
  int v90 = (__int16)(byte_26AD6CCA0 << 8) | byte_26AD6CCA1;
  v126[2] = CFNumberCreate(v4, kCFNumberIntType, &v90);
  keys[3] = @"MaximumPackVoltage";
  int v89 = (__int16)(byte_26AD6CCA2 << 8) | byte_26AD6CCA3;
  v126[3] = CFNumberCreate(v4, kCFNumberIntType, &v89);
  keys[4] = @"MinimumPackVoltage";
  int v88 = (__int16)(byte_26AD6CCA4 << 8) | byte_26AD6CCA5;
  v126[4] = CFNumberCreate(v4, kCFNumberIntType, &v88);
  keys[5] = @"MaximumChargeCurrent";
  int v87 = (__int16)(byte_26AD6CCA6 << 8) | byte_26AD6CCA7;
  v126[5] = CFNumberCreate(v4, kCFNumberIntType, &v87);
  keys[6] = @"MaximumDischargeCurrent";
  int v86 = (__int16)(byte_26AD6CCA8 << 8) | byte_26AD6CCA9;
  v126[6] = CFNumberCreate(v4, kCFNumberIntType, &v86);
  keys[7] = @"MaximumOverChargedCapacity";
  int v85 = (__int16)(byte_26AD6CCAA << 8) | byte_26AD6CCAB;
  v126[7] = CFNumberCreate(v4, kCFNumberIntType, &v85);
  keys[8] = @"MaximumOverDischargedCapacity";
  int v84 = (__int16)(byte_26AD6CCAC << 8) | byte_26AD6CCAD;
  v126[8] = CFNumberCreate(v4, kCFNumberIntType, &v84);
  keys[9] = @"MaximumFCC";
  int v83 = (__int16)(byte_26AD6CCAE << 8) | byte_26AD6CCAF;
  v126[9] = CFNumberCreate(v4, kCFNumberIntType, &v83);
  keys[10] = @"MinimumFCC";
  int v82 = (__int16)(byte_26AD6CCB0 << 8) | byte_26AD6CCB1;
  v126[10] = CFNumberCreate(v4, kCFNumberIntType, &v82);
  keys[11] = @"MaximumDeltaVoltage";
  int v81 = (__int16)(byte_26AD6CCB2 << 8) | byte_26AD6CCB3;
  v126[11] = CFNumberCreate(v4, kCFNumberIntType, &v81);
  keys[12] = @"MinimumDeltaVoltage";
  int v80 = (__int16)(byte_26AD6CCB4 << 8) | byte_26AD6CCB5;
  v126[12] = CFNumberCreate(v4, kCFNumberIntType, &v80);
  keys[13] = @"LowAvgCurrentLastRun";
  int v79 = (__int16)(byte_26AD6CCB6 << 8) | byte_26AD6CCB7;
  v126[13] = CFNumberCreate(v4, kCFNumberIntType, &v79);
  keys[14] = @"HighAvgCurrentLastRun";
  int v78 = (__int16)(byte_26AD6CCB8 << 8) | byte_26AD6CCB9;
  v126[14] = CFNumberCreate(v4, kCFNumberIntType, &v78);
  keys[15] = @"MaximumQmax";
  int v77 = (__int16)(byte_26AD6CCBA << 8) | byte_26AD6CCBB;
  v126[15] = CFNumberCreate(v4, kCFNumberIntType, &v77);
  keys[16] = @"MinimumQmax";
  int v76 = (__int16)(byte_26AD6CCBC << 8) | byte_26AD6CCBD;
  v126[16] = CFNumberCreate(v4, kCFNumberIntType, &v76);
  keys[17] = @"MaximumRa0-8";
  int v75 = (__int16)(byte_26AD6CCBE << 8) | byte_26AD6CCBF;
  v126[17] = CFNumberCreate(v4, kCFNumberIntType, &v75);
  keys[18] = @"MinimumRa0-8";
  int v74 = (__int16)(byte_26AD6CCC0 << 8) | byte_26AD6CCC1;
  v126[18] = CFNumberCreate(v4, kCFNumberIntType, &v74);
  keys[19] = @"AverageTemperature";
  int v73 = byte_26AD6CCC2;
  v126[19] = CFNumberCreate(v4, kCFNumberIntType, &v73);
  keys[20] = @"TemperatureSamples";
  unsigned int v72 = bswap32(unk_26AD6CCC3);
  v126[20] = CFNumberCreate(v4, kCFNumberIntType, &v72);
  keys[21] = @"FlashWriteCount";
  unsigned int v71 = __rev16(unk_26AD6CCC7);
  *(void *)&long long v127 = CFNumberCreate(v4, kCFNumberIntType, &v71);
  *(void *)&long long v123 = @"RDISCnt";
  unsigned int v70 = __rev16(unk_26AD6CCC9);
  *((void *)&v127 + 1) = CFNumberCreate(v4, kCFNumberIntType, &v70);
  *((void *)&v123 + 1) = @"CycleCountLastQmax";
  int v69 = byte_26AD6CCCB;
  *(void *)&long long v128 = CFNumberCreate(v4, kCFNumberIntType, &v69);
  if ((unsigned __int16)word_26AD6CC66 < 0x501u)
  {
    if ((unsigned __int16)word_26AD6CC66 < 0x313u)
    {
      uint64_t v22 = 24;
      goto LABEL_12;
    }
    int v19 = &word_26AD6CCCE;
  }
  else
  {
    int v19 = &word_26AD6CCCC;
  }
  unsigned int v20 = __rev16((unsigned __int16)*v19);
  *(void *)&long long v124 = @"TotalOperatingTime";
  unsigned int v68 = v20;
  *((void *)&v128 + 1) = CFNumberCreate(v4, kCFNumberIntType, &v68);
  int v21 = *((unsigned __int8 *)v19 + 2);
  *((void *)&v124 + 1) = @"TimeAbove95Perc";
  int v67 = v21;
  *(void *)&long long v129 = CFNumberCreate(v4, kCFNumberIntType, &v67);
  uint64_t v22 = 26;
LABEL_12:
  keys[v22] = @"Raw";
  v126[v22] = CFDataCreate(v4, (const UInt8 *)&byte_26AD6CC9E, 64);
  CFDictionaryRef v23 = CFDictionaryCreate(v4, (const void **)keys, (const void **)v126, v22 | 1, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  do
  {
    CFRelease(v126[v22]);
    unint64_t v24 = v22-- + 1;
  }
  while (v24 > 1);
  if (!v23)
  {
    if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
    {
      parseBatteryData_cold_2();
      if (!a1) {
        goto LABEL_22;
      }
LABEL_21:
      int v56 = (unsigned __int16)word_26AD6CC78;
      v108[v18 - 1] = CFNumberCreate(v4, kCFNumberIntType, &v56);
      v93[v18] = @"ITMiscStatus";
      int v55 = word_26AD6CC78 & 3;
      CFNumberRef v25 = CFNumberCreate(v4, kCFNumberIntType, &v55);
      uint64_t v26 = 8 * v18 + 8;
      *(void *)((char *)&v108[-1] + v26) = v25;
      *(void **)((char *)v93 + v26) = @"ITSimulationCounter";
      v18 += 2;
      goto LABEL_22;
    }
LABEL_20:
    if (!a1) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  if (a2) {
    CFShow(v23);
  }
  v108[v18 - 1] = v23;
  v93[v18++] = @"LifetimeData";
  if (a1) {
    goto LABEL_21;
  }
LABEL_22:
  if ((unsigned __int16)word_26AD6CC66 >= 0x600u)
  {
    *(void *)&valuePtr[4] = CFDataCreate(v4, (const UInt8 *)&word_26AD6CCDE, 32);
    if (*(void *)&valuePtr[4])
    {
      v108[v18 - 1] = CFArrayCreate(v4, (const void **)&valuePtr[4], 1, MEMORY[0x263EFFF70]);
      v93[v18++] = @"RaTableRaw";
      CFRelease(*(CFTypeRef *)&valuePtr[4]);
    }
    int v54 = (unsigned __int16)word_26AD6CD34;
    v108[v18 - 1] = CFNumberCreate(v4, kCFNumberIntType, &v54);
    v93[v18] = @"WeightedRa";
    int v53 = (unsigned __int16)word_26AD6CD36;
    CFNumberRef v27 = CFNumberCreate(v4, kCFNumberIntType, &v53);
    uint64_t v28 = 8 * v18 + 8;
    *(void *)((char *)&v108[-1] + v28) = v27;
    *(void **)((char *)v93 + v28) = @"ChemicalWeightedRa";
    int v52 = dword_26AD6CD30;
    CFNumberRef v29 = CFNumberCreate(v4, kCFNumberIntType, &v52);
    uint64_t v30 = 8 * v18 + 16;
    *(void *)((char *)&v108[-1] + v30) = v29;
    *(void **)((char *)v93 + v30) = @"BatteryHealthMetric";
    uint64_t v31 = v18 + 3;
    if ((unsigned __int16)word_26AD6CC66 < 0x600u)
    {
      v18 += 3;
    }
    else
    {
      v108[v31 - 1] = CFDataCreate(v4, byte_26AD6CCFE, 32);
      v93[v31] = @"iMaxAndSocSmoothTable";
      unsigned int v51 = __rev16(*(unsigned __int16 *)&byte_26AD6CCFE[1]);
      CFNumberRef v32 = CFNumberCreate(v4, kCFNumberIntType, &v51);
      uint64_t v33 = 8 * v18 + 32;
      *(void *)((char *)&v108[-1] + v33) = v32;
      *(void **)((char *)v93 + v33) = @"RSS";
      v18 += 5;
    }
  }
  int v50 = (unsigned __int16)word_26AD6CC7C;
  v108[v18 - 1] = CFNumberCreate(v4, kCFNumberIntType, &v50);
  v93[v18] = @"ResScale";
  int v49 = word_26AD6CC7E;
  CFNumberRef v34 = CFNumberCreate(v4, kCFNumberIntType, &v49);
  uint64_t v35 = 8 * v18 + 8;
  *(void *)((char *)&v108[-1] + v35) = v34;
  *(void **)((char *)v93 + v35) = @"Qstart";
  int v48 = word_26AD6CC80;
  CFNumberRef v36 = CFNumberCreate(v4, kCFNumberIntType, &v48);
  uint64_t v37 = 8 * v18 + 16;
  *(void *)((char *)&v108[-1] + v37) = v36;
  *(void **)((char *)v93 + v37) = @"PassedCharge";
  uint64_t v38 = v18 + 3;
  int v47 = (unsigned __int16)word_26AD6CC82;
  values = CFNumberCreate(v4, kCFNumberIntType, &v47);
  if (values)
  {
    v108[v38 - 1] = CFArrayCreate(v4, (const void **)&values, 1, MEMORY[0x263EFFF70]);
    v93[v38] = @"DOD0";
    uint64_t v38 = v18 + 4;
    CFRelease(values);
  }
  int v46 = word_26AD6CC7A;
  values = CFNumberCreate(v4, kCFNumberIntType, &v46);
  if (values)
  {
    v108[v38 - 1] = CFArrayCreate(v4, (const void **)&values, 1, MEMORY[0x263EFFF70]);
    v93[v38++] = @"PresentDOD";
    CFRelease(values);
  }
  int v45 = (unsigned __int16)word_26AD6CC9A;
  v108[v38 - 1] = CFNumberCreate(v4, kCFNumberIntType, &v45);
  v93[v38] = @"GaugeFlagRaw";
  uint64_t v44 = gauge_reset_count;
  CFNumberRef v39 = CFNumberCreate(v4, kCFNumberLongLongType, &v44);
  uint64_t v40 = 8 * v38 + 8;
  *(void *)((char *)&v108[-1] + v40) = v39;
  *(void **)((char *)v93 + v40) = @"GaugeResetCounter";
  if (v38 >= 27) {
    parseBatteryData_cold_1();
  }
  CFDictionaryRef v41 = CFDictionaryCreate(v4, (const void **)v93, (const void **)&v107, v38 + 2, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (v38 >= -1)
  {
    do
    {
      CFRelease((CFTypeRef)v108[v38]);
      unint64_t v42 = v38 + 2;
      --v38;
    }
    while (v42 > 1);
  }
  return v41;
}

__darwin_time_t UpSeconds()
{
  if (!UpSeconds_boottime)
  {
    v1.tv_sec = 16;
    sysctlbyname("kern.boottime", &UpSeconds_boottime, (size_t *)&v1, 0, 0);
  }
  v1.tv_sec = 0;
  *(void *)&v1.tv_usec = 0;
  gettimeofday(&v1, 0);
  return v1.tv_sec - UpSeconds_boottime;
}

CFStringRef createStringWithBytes(UInt8 *bytes, unint64_t a2)
{
  unint64_t v2 = 0;
  if (a2)
  {
    unsigned int v3 = 1;
    do
    {
      if (!bytes[v2]) {
        break;
      }
      unint64_t v2 = v3++;
    }
    while (v2 < a2);
  }
  return CFStringCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], bytes, v2, 0x8000100u, 0, (CFAllocatorRef)*MEMORY[0x263EFFB28]);
}

void ggctl_connect_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  unint64_t v2 = "AppleHDQGasGaugeControl";
  _os_log_error_impl(&dword_225A99000, log, OS_LOG_TYPE_ERROR, "could not find %s service", (uint8_t *)&v1, 0xCu);
}

void ggctl_connect_cold_2()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_4(&dword_225A99000, v0, v1, "could not open service: %#x", v2, v3, v4, v5, v6);
}

void ggctl_reset_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1(&dword_225A99000, v0, v1, "gas gauge: cannot issue a reset", v2, v3, v4, v5, v6);
}

void ggctl_open_device_cold_1(NSObject *a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = __error();
  uint64_t v3 = strerror(*v2);
  int v4 = 136315394;
  uint64_t v5 = "checkreset";
  __int16 v6 = 2080;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_225A99000, a1, OS_LOG_TYPE_ERROR, "%s: %s", (uint8_t *)&v4, 0x16u);
}

void ggctl_open_device_cold_2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1(&dword_225A99000, v0, v1, "gas gauge: cannot determine the state of SWI line", v2, v3, v4, v5, v6);
}

void ggctl_open_device_cold_3()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1(&dword_225A99000, v0, v1, "gas gauge: SWI line low, issuing reset", v2, v3, v4, v5, v6);
}

void ggctl_open_device_cold_4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_225A99000, v0, v1, "%s:%d break failed (%d)", v2, v3, v4, v5, 2u);
}

void logBatteryDiagnosticData_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  *(_DWORD *)uint64_t v1 = 136315650;
  OUTLINED_FUNCTION_0();
  *(_DWORD *)&v1[7] = 2373;
  v1[9] = 2080;
  uint64_t v2 = "IOPMPowerSource";
  _os_log_error_impl(&dword_225A99000, v0, OS_LOG_TYPE_ERROR, "%s:%d cannot find service %s\n", (uint8_t *)v1, 0x1Cu);
}

void updateThread_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1(&dword_225A99000, v0, v1, "gasgauge: could not register for system power notifications", v2, v3, v4, v5, v6);
}

void updateThread_cold_2(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_6(a1, a2);
  OUTLINED_FUNCTION_2(&dword_225A99000, v2, (uint64_t)v2, "gasgauge: SWI line, cannot determine the state of line", v3);
}

void updateThread_cold_3(uint8_t *buf, _DWORD *a2, os_log_t log)
{
  *(_DWORD *)buf = 67109120;
  *a2 = -1;
  _os_log_error_impl(&dword_225A99000, log, OS_LOG_TYPE_ERROR, "cannot drain the data log (%d)", buf, 8u);
}

void updateThread_cold_4(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_6(a1, a2);
  OUTLINED_FUNCTION_2(&dword_225A99000, v2, (uint64_t)v2, "num_client<0, client error?", v3);
}

void updateThread_cold_5(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_6(a1, a2);
  OUTLINED_FUNCTION_2(&dword_225A99000, v2, (uint64_t)v2, "gasgauge: SWI line low reset disabled, ignoring", v3);
}

void updateThread_cold_6(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_6(a1, a2);
  OUTLINED_FUNCTION_2(&dword_225A99000, v2, (uint64_t)v2, "gasgauge: SWI line low issuing reset", v3);
}

void updateThread_cold_7()
{
  os_log_t v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_9(&dword_225A99000, v1, v2, "could not find hw.model: %s", v3, v4, v5, v6, 2u);
}

void updateThread_cold_8()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_4(&dword_225A99000, v0, v1, "gasgauge: could not register for battery events err=%x", v2, v3, v4, v5, v6);
}

void updateThread_cold_9(mach_error_t a1)
{
  mach_error_string(a1);
  OUTLINED_FUNCTION_9(&dword_225A99000, v1, v2, "gasgauge: could not map data log: %s", v3, v4, v5, v6, 2u);
}

void updateThread_cold_10()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1(&dword_225A99000, v0, v1, "gasgauge: could not register for power source events", v2, v3, v4, v5, v6);
}

void EnableFullSleepForRevCOrLater_cold_1()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_4(&dword_225A99000, v0, v1, "cannot disable interrupts '%d'", v2, v3, v4, v5, v6);
}

void EnableFullSleepForRevCOrLater_cold_2()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_4(&dword_225A99000, v0, v1, "full sleep failed (%x)", v2, v3, v4, v5, v6);
}

void EnableFullSleepForRevCOrLater_cold_3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7(&dword_225A99000, v0, v1, "%s:%d cannot read fw version", v2, v3, v4, v5, 2u);
}

void EnableFullSleepForRevCOrLater_cold_4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_225A99000, v0, v1, "%s:%d break failed (%d)", v2, v3, v4, v5, 2u);
}

void EnableFullSleepForRevCOrLater_cold_5()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_225A99000, v0, v1, "%s:%d cannot disable interrupts '%d'", v2, v3, v4, v5, 2u);
}

void updateThermalCoolDownState_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7(&dword_225A99000, v0, v1, "%s:%d cannot update thermal state", v2, v3, v4, v5, 2u);
}

void statsAndLogs_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7(&dword_225A99000, v0, v1, "%s:%d cannot create dictionary", v2, v3, v4, v5, 2u);
}

void statsAndLogs_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_225A99000, v0, v1, "%s:%d cannot dump stats and logs (%x)", v2, v3, v4, v5, 2u);
}

void debugLog_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7(&dword_225A99000, v0, v1, "%s:%d cannot create dictionary", v2, v3, v4, v5, 2u);
}

void debugLog_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_225A99000, v0, v1, "%s:%d cannot dump stats and logs (%x)", v2, v3, v4, v5, 2u);
}

void dynamicATV_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void parseBatteryData_cold_1()
{
  __assert_rtn("parseBatteryData", "AppleHDQGasGauge.c", 1565, "batteryDataCount<=kNumBatteryDataUpdateKeys");
}

void parseBatteryData_cold_2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1(&dword_225A99000, v0, v1, "Cannot create the lifetime dictionary", v2, v3, v4, v5, v6);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x270EE42F0](allocator, values, numValues, callBacks);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x270EE47C8](allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x270EE47E0](allocator, capacity);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x270EE4830](theData);
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x270EE4908](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
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

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CC0](key, applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x270EE4E58]();
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x270EE4ED0](mode, returnAfterSourceHandled, seconds);
}

void CFShow(CFTypeRef obj)
{
}

CFStringRef CFStringCreateWithBytesNoCopy(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x270EE50D8](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation, contentsDeallocator);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

IOReturn IOAllowPowerChange(io_connect_t kernelPort, intptr_t notificationID)
{
  return MEMORY[0x270EF3EE0](*(void *)&kernelPort, notificationID);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x270EF3F30](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x270EF3F38](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, output, outputCnt);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x270EF3F40](*(void *)&connection, *(void *)&selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

kern_return_t IOConnectMapMemory(io_connect_t connect, uint32_t memoryType, task_port_t intoTask, mach_vm_address_t *atAddress, mach_vm_size_t *ofSize, IOOptionBits options)
{
  return MEMORY[0x270EF3F50](*(void *)&connect, *(void *)&memoryType, *(void *)&intoTask, atAddress, ofSize, *(void *)&options);
}

kern_return_t IOConnectUnmapMemory(io_connect_t connect, uint32_t memoryType, task_port_t fromTask, mach_vm_address_t atAddress)
{
  return MEMORY[0x270EF3FB8](*(void *)&connect, *(void *)&memoryType, *(void *)&fromTask, atAddress);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x270EF47B8](*(void *)&mainPort);
}

CFRunLoopSourceRef IONotificationPortGetRunLoopSource(IONotificationPortRef notify)
{
  return (CFRunLoopSourceRef)MEMORY[0x270EF47D0](notify);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

io_connect_t IORegisterForSystemPower(void *refcon, IONotificationPortRef *thePortRef, IOServiceInterestCallback callback, io_object_t *notifier)
{
  return MEMORY[0x270EF49B0](refcon, thePortRef, callback, notifier);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x270EF49D8](*(void *)&entry, key, allocator, *(void *)&options);
}

kern_return_t IORegistryEntrySetCFProperties(io_registry_entry_t entry, CFTypeRef properties)
{
  return MEMORY[0x270EF4A58](*(void *)&entry, properties);
}

kern_return_t IORegistryEntrySetCFProperty(io_registry_entry_t entry, CFStringRef propertyName, CFTypeRef property)
{
  return MEMORY[0x270EF4A60](*(void *)&entry, propertyName, property);
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return MEMORY[0x270EF4A80](notifyPort, *(void *)&service, interestType, callback, refCon, notification);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x270EF4A98](*(void *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x270EF4AB0](*(void *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD0](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x270EF4AE0](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
}

uint64_t OSThermalNotificationCurrentLevel()
{
  return MEMORY[0x270ED7C88]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
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

void bzero(void *a1, size_t a2)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x270ED9D98](a1, a2);
}

uint64_t logLineForAppleCare()
{
  return MEMORY[0x270F24B78]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x270EDA168](*(void *)&error_value);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_release(void *object)
{
}

uint64_t os_transaction_create()
{
  return MEMORY[0x270EDAA90]();
}

int printf(const char *a1, ...)
{
  return MEMORY[0x270EDAD20](a1);
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  return MEMORY[0x270EDADF8](a1);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return MEMORY[0x270EDAE10](a1);
}

int pthread_attr_setdetachstate(pthread_attr_t *a1, int a2)
{
  return MEMORY[0x270EDAE20](a1, *(void *)&a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x270EDAEA0](a1, a2, a3, a4);
}

int pthread_setname_np(const char *a1)
{
  return MEMORY[0x270EDB038](a1);
}

int putchar(int a1)
{
  return MEMORY[0x270EDB090](*(void *)&a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x270EDB568](a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x270EDB7D8](a1, a2, a3, a4, a5);
}

time_t time(time_t *a1)
{
  return MEMORY[0x270EDB930](a1);
}