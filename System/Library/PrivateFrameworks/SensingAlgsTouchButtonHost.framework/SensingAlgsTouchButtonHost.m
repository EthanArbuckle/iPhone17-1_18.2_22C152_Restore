void *OUTLINED_FUNCTION_0(size_t a1)
{
  return malloc_type_malloc(a1, 0x8C5DC2A9uLL);
}

void sub_25BF2B6A8(_Unwind_Exception *a1)
{
  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_25BF2B738(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  v10 = v9;

  a9.super_class = (Class)SACaseConnectionInfoProvider;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
}

void sub_25BF2BAAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double __os_log_helper_16_0_1_4_2(_DWORD *a1, int a2)
{
  *(void *)&double result = 67240192;
  *a1 = 67240192;
  a1[1] = a2;
  return result;
}

_WORD *__os_log_helper_16_0_0(_WORD *result)
{
  *double result = 0;
  return result;
}

double __os_log_helper_16_2_2_8_66_8_66(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)&double result = 138543618;
  *(_DWORD *)a1 = 138543618;
  *(void *)(a1 + 4) = a2;
  *(_WORD *)(a1 + 12) = 2114;
  *(void *)(a1 + 14) = a3;
  return result;
}

double __os_log_helper_16_2_1_8_66(uint64_t a1, uint64_t a2)
{
  *(void *)&double result = 138543362;
  *(_DWORD *)a1 = 138543362;
  *(void *)(a1 + 4) = a2;
  return result;
}

void sub_25BF2BC2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25BF2BF60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t SASGetTimestampCallback(void)
{
  if (_MergedGlobals != -1) {
    dispatch_once(&_MergedGlobals, &__block_literal_global);
  }
  return mach_continuous_time() * dword_26A583C30 / *(unsigned int *)algn_26A583C34 / 0x3E8;
}

void sub_25BF2C2BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_25BF2C7A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double __os_log_helper_16_0_1_4_0(_DWORD *a1, int a2)
{
  *(void *)&double result = 67109120;
  *a1 = 67109120;
  a1[1] = a2;
  return result;
}

double __os_log_helper_16_0_3_8_2_8_0_4_0(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  *(void *)&double result = 134349568;
  *(_DWORD *)a1 = 134349568;
  *(void *)(a1 + 4) = a2;
  *(_WORD *)(a1 + 12) = 2048;
  *(void *)(a1 + 14) = a3;
  *(_WORD *)(a1 + 22) = 1024;
  *(_DWORD *)(a1 + 24) = a4;
  return result;
}

void sub_25BF2C908(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  PacketCollection::~PacketCollection((PacketCollection *)va);
  _Unwind_Resume(a1);
}

void sub_25BF2C9CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_25BF2CAD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_25BF2CCB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25BF2CD9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25BF2D080(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double __os_log_helper_16_0_7_8_2_8_0_8_0_4_0_4_0_4_0_4_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6, int a7, int a8)
{
  *(void *)&double result = 134350592;
  *(_DWORD *)a1 = 134350592;
  *(void *)(a1 + 4) = a2;
  *(_WORD *)(a1 + 12) = 2048;
  *(void *)(a1 + 14) = a3;
  *(_WORD *)(a1 + 22) = 2048;
  *(void *)(a1 + 24) = a4;
  *(_WORD *)(a1 + 32) = 1024;
  *(_DWORD *)(a1 + 34) = a5;
  *(_WORD *)(a1 + 38) = 1024;
  *(_DWORD *)(a1 + 40) = a6;
  *(_WORD *)(a1 + 44) = 1024;
  *(_DWORD *)(a1 + 46) = a7;
  *(_WORD *)(a1 + 50) = 1024;
  *(_DWORD *)(a1 + 52) = a8;
  return result;
}

void sub_25BF2D2E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  PacketCollection::~PacketCollection((PacketCollection *)va);
  _Unwind_Resume(a1);
}

void sub_25BF2D5A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double __os_log_helper_16_2_2_8_64_8_64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)&double result = 138412546;
  *(_DWORD *)a1 = 138412546;
  *(void *)(a1 + 4) = a2;
  *(_WORD *)(a1 + 12) = 2112;
  *(void *)(a1 + 14) = a3;
  return result;
}

void sub_25BF2D6E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25BF2D7B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  PacketCollection::~PacketCollection((PacketCollection *)va);
  _Unwind_Resume(a1);
}

void sub_25BF2DE98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  AlgDataPacket::~AlgDataPacket((AlgDataPacket *)(v30 - 176));

  PacketCollection::~PacketCollection((PacketCollection *)&a15);
  PacketCollection::~PacketCollection((PacketCollection *)&a27);

  _Unwind_Resume(a1);
}

double __os_log_helper_16_2_1_8_64(uint64_t a1, uint64_t a2)
{
  *(void *)&double result = 138412290;
  *(_DWORD *)a1 = 138412290;
  *(void *)(a1 + 4) = a2;
  return result;
}

double __os_log_helper_16_2_2_8_64_4_0(uint64_t a1, uint64_t a2, int a3)
{
  *(void *)&double result = 138412546;
  *(_DWORD *)a1 = 138412546;
  *(void *)(a1 + 4) = a2;
  *(_WORD *)(a1 + 12) = 1024;
  *(_DWORD *)(a1 + 14) = a3;
  return result;
}

double __os_log_helper_16_2_6_8_64_4_0_8_0_8_0_8_64_8_32(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  *(void *)&double result = 138413570;
  *(_DWORD *)a1 = 138413570;
  *(void *)(a1 + 4) = a2;
  *(_WORD *)(a1 + 12) = 1024;
  *(_DWORD *)(a1 + 14) = a3;
  *(_WORD *)(a1 + 18) = 2048;
  *(void *)(a1 + 20) = a4;
  *(_WORD *)(a1 + 28) = 2048;
  *(void *)(a1 + 30) = a5;
  *(_WORD *)(a1 + 38) = 2112;
  *(void *)(a1 + 40) = a6;
  *(_WORD *)(a1 + 48) = 2080;
  *(void *)(a1 + 50) = a7;
  return result;
}

void sub_25BF2E44C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va1, a5);
  va_start(va, a5);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  uint64_t v20 = va_arg(va1, void);
  uint64_t v21 = va_arg(va1, void);
  AlgDataPacket::~AlgDataPacket((AlgDataPacket *)(v7 - 160));
  PacketCollection::~PacketCollection((PacketCollection *)va);
  PacketCollection::~PacketCollection((PacketCollection *)va1);

  _Unwind_Resume(a1);
}

double __os_log_helper_16_2_3_8_64_8_0_8_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)&double result = 138412802;
  *(_DWORD *)a1 = 138412802;
  *(void *)(a1 + 4) = a2;
  *(_WORD *)(a1 + 12) = 2048;
  *(void *)(a1 + 14) = a3;
  *(_WORD *)(a1 + 22) = 2048;
  *(void *)(a1 + 24) = a4;
  return result;
}

double __os_log_helper_16_2_4_8_64_8_0_8_0_8_64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)&double result = 138413058;
  *(_DWORD *)a1 = 138413058;
  *(void *)(a1 + 4) = a2;
  *(_WORD *)(a1 + 12) = 2048;
  *(void *)(a1 + 14) = a3;
  *(_WORD *)(a1 + 22) = 2048;
  *(void *)(a1 + 24) = a4;
  *(_WORD *)(a1 + 32) = 2112;
  *(void *)(a1 + 34) = a5;
  return result;
}

void sub_25BF2E60C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25BF2EA20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25BF2EC48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t ___ZL23SASGetTimestampCallbackv_block_invoke()
{
  return mach_timebase_info((mach_timebase_info_t)&dword_26A583C30);
}

void *AlgDataExtractor::AlgDataExtractor(uint64_t a1, int a2, char a3)
{
  double result = (void *)PacketCollection::PacketCollection(a1, a2, a3);
  *double result = &unk_27096DAB8;
  result[10] = 0;
  result[11] = 0;
  return result;
}

void PacketCollection::~PacketCollection(PacketCollection *this)
{
  *(void *)this = &unk_27096DAE8;
  v2 = (uint64_t *)((char *)this + 8);
  SAList<unsigned char>::~SAList((uint64_t *)this + 7);
  SAList<unsigned char>::~SAList((uint64_t *)this + 4);
  SAList<unsigned char>::~SAList(v2);
}

{
  uint64_t vars8;

  PacketCollection::~PacketCollection(this);
  OUTLINED_FUNCTION_36();
  JUMPOUT(0x261178DD0);
}

uint64_t *SAList<unsigned char>::~SAList(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    MEMORY[0x261178DC0](v2, 0x1000C8077774924);
  }
  return a1;
}

void sub_25BF2EFEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_25BF2F05C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void *AlgDataInjector::AlgDataInjector(uint64_t a1, int a2, char a3)
{
  double result = (void *)PacketCollection::PacketCollection(a1, a2, a3);
  *double result = &unk_27096DB18;
  return result;
}

uint64_t *OUTLINED_FUNCTION_0_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return &a9;
}

char *OUTLINED_FUNCTION_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
  return &a11;
}

void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_impl(a1, v9, OS_LOG_TYPE_DEFAULT, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_impl(a1, v9, OS_LOG_TYPE_DEFAULT, a4, &a9, 2u);
}

uint64_t OUTLINED_FUNCTION_4()
{
  return mach_get_times();
}

void OUTLINED_FUNCTION_9(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

char *OUTLINED_FUNCTION_10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  return &a35;
}

uint64_t OUTLINED_FUNCTION_11(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  return PacketCollection::at((PacketCollection *)va, 0);
}

void OUTLINED_FUNCTION_12(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_error_impl(a1, v4, OS_LOG_TYPE_ERROR, a4, (uint8_t *)(v5 - 176), 0x12u);
}

uint64_t NovaHost::NovaHostAlgsDevice::NovaHostAlgsDevice(uint64_t a1, uint64_t a2, int a3, char a4)
{
  v8 = SANovaHostVersionDescriptor();
  uint64_t v9 = (NovaHost::NovaHostAlgsDevice *)AlgsDevice::AlgsDevice(a1, a2, (uint64_t)"NovaHostDefaultPersonality", a3, a4, *v8, 1);
  *(void *)a1 = &unk_27096D158;
  *(void *)(a1 + 120) = 0;
  *(unsigned char *)(a1 + 128) = a2;
  NovaHost::NovaHostAlgsDevice::newPlanNode(v9, 0);
  return a1;
}

void sub_25BF2F2CC(_Unwind_Exception *a1)
{
  AlgsDevice::~AlgsDevice(v1);
  _Unwind_Resume(a1);
}

BOOL NovaHost::NovaHostAlgsDevice::newPlanNode(NovaHost::NovaHostAlgsDevice *this, int a2)
{
  if (!a2)
  {
    uint64_t v4 = *((void *)this + 15);
    if (v4) {
      (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
    }
    uint64_t v5 = (NovaHost::NovaHostActivePlan *)operator new(4744, *((unsigned __int8 *)this + 128));
    *((void *)this + 15) = NovaHost::NovaHostActivePlan::NovaHostActivePlan(v5);
  }
  return a2 == 0;
}

void NovaHost::NovaHostAlgsDevice::~NovaHostAlgsDevice(NovaHost::NovaHostAlgsDevice *this)
{
  NovaHost::NovaHostAlgsDevice::~NovaHostAlgsDevice(this);
  JUMPOUT(0x261178DD0);
}

{
  uint64_t v2;
  uint64_t vars8;

  *(void *)this = &unk_27096D158;
  uint64_t v2 = *((void *)this + 15);
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  AlgsDevice::~AlgsDevice(this);
}

uint64_t NovaHost::NovaHostAlgsDevice::planNode(NovaHost::NovaHostAlgsDevice *this)
{
  return *((void *)this + 15);
}

NovaHost::NovaHostActivePlan *NovaHost::NovaHostActivePlan::NovaHostActivePlan(NovaHost::NovaHostActivePlan *this)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  AlgTaskNode::AlgTaskNode(this);
  void *v2 = &unk_27096D1B8;
  v2[17] = 0;
  uint64_t v3 = (uint64_t)(v2 + 17);
  uint64_t v4 = (long long *)(v2 + 20);
  v2[18] = 0;
  v2[19] = 0;
  AlgDataNode::AlgDataNode((AlgDataNode *)(v2 + 20), 0x726CDCE2C4D2802ALL, 0);
  *((void *)this + 20) = &unk_27096D230;
  *((_OWORD *)this + 12) = 0u;
  *((_OWORD *)this + 13) = 0u;
  *((_DWORD *)this + 44) = 61451;
  *((_DWORD *)this + 46) = 32;
  AlgDataNode::AlgDataNode((NovaHost::NovaHostActivePlan *)((char *)this + 224), 0xC79177FE77B0293ALL, 0);
  *((_WORD *)this + 127) = 0;
  *((_DWORD *)this + 60) = 20480;
  *((_DWORD *)this + 62) = 1;
  *((void *)this + 28) = &unk_27096D280;
  AlgDataNode::AlgDataNode((NovaHost::NovaHostActivePlan *)((char *)this + 256), 0x658001896A50D1BALL, 0);
  uint64_t v8 = v5;
  *((void *)this + 32) = &unk_27096D2E8;
  *((unsigned char *)this + 286) = 0;
  *((_DWORD *)this + 68) = 20480;
  *((_DWORD *)this + 70) = 1;
  AlgDataNode::AlgDataNode((NovaHost::NovaHostActivePlan *)((char *)this + 288), 0x5A93A297EE678DAALL, 1);
  *((void *)this + 72) = 0;
  *((_OWORD *)this + 34) = 0u;
  *((_OWORD *)this + 35) = 0u;
  *((_OWORD *)this + 32) = 0u;
  *((_OWORD *)this + 33) = 0u;
  *((_OWORD *)this + 30) = 0u;
  *((_OWORD *)this + 31) = 0u;
  *((_OWORD *)this + 28) = 0u;
  *((_OWORD *)this + 29) = 0u;
  *((_OWORD *)this + 26) = 0u;
  *((_OWORD *)this + 27) = 0u;
  *((_OWORD *)this + 24) = 0u;
  *((_OWORD *)this + 25) = 0u;
  *((_OWORD *)this + 22) = 0u;
  *((_OWORD *)this + 23) = 0u;
  *((_OWORD *)this + 20) = 0u;
  *((_OWORD *)this + 21) = 0u;
  *((_DWORD *)this + 80) = -267714552;
  *((_WORD *)this + 162) = 32;
  *((_DWORD *)this + 76) = 39426;
  *((_DWORD *)this + 78) = 264;
  uint64_t v9 = v6;
  *((void *)this + 36) = &unk_27096D320;
  *((void *)this + 73) = &unk_27096D368;
  *((_WORD *)this + 296) = 0;
  AlgDataNode::AlgDataNode((NovaHost::NovaHostActivePlan *)((char *)this + 600), 0xF761B8249EC06F80, 1);
  bzero((char *)this + 632, 0x408uLL);
  *((_DWORD *)this + 158) = -251592696;
  *((_WORD *)this + 318) = 32;
  *((_DWORD *)this + 154) = 39426;
  *((_DWORD *)this + 156) = 1032;
  *((void *)this + 75) = &unk_27096D3E8;
  *((void *)this + 208) = &unk_27096D430;
  *((_WORD *)this + 836) = 0;
  AlgDataNode::AlgDataNode((NovaHost::NovaHostActivePlan *)((char *)this + 1680), 0x5BF249159B57CEALL, 1);
  bzero((char *)this + 1712, 0x508uLL);
  *((_DWORD *)this + 428) = -251527160;
  *((_WORD *)this + 858) = 40;
  *((_DWORD *)this + 424) = 39426;
  *((_DWORD *)this + 426) = 1288;
  *((void *)this + 210) = &unk_27096D4B0;
  *((void *)this + 375) = &unk_27096D4F8;
  *((_WORD *)this + 1504) = 0;
  AlgDataNode::AlgDataNode((NovaHost::NovaHostActivePlan *)((char *)this + 3016), 0xE86303465E47D408, 0);
  *((void *)this + 381) = 0;
  *((_DWORD *)this + 758) = 61699;
  *((_DWORD *)this + 760) = 8;
  *((void *)this + 377) = &unk_27096D578;
  *((unsigned char *)this + 3056) = 0;
  AlgDataNode::AlgDataNode((NovaHost::NovaHostActivePlan *)((char *)this + 3064), 0xAD01BBB57934580ALL, 0);
  *((void *)this + 388) = 0;
  *((void *)this + 387) = 0;
  *((void *)this + 389) = 0;
  *((_DWORD *)this + 770) = 61471;
  *((_DWORD *)this + 772) = 24;
  *((void *)this + 383) = &unk_27096D5E0;
  *((unsigned char *)this + 3120) = 0;
  NovaHost::InterpolationStep::InterpolationStep((uint64_t)this + 3128, 0xAD07F5970BDB4DA9, (uint64_t)v4, v9);
  NovaHost::NovaButtonStateMachineStep::NovaButtonStateMachineStep((uint64_t)this + 3720, 0x9E0D7441786CB2A9, v3, v9, (uint64_t)this + 224, v8, (uint64_t)this + 600, (uint64_t)this + 1680);
  NovaHost::LiftoffVelocityStep::LiftoffVelocityStep((NovaHost::NovaHostActivePlan *)((char *)this + 4248), 0xB54CAD6BAF9995ALL, (uint64_t)this + 600, (uint64_t)this + 1680);
  NovaHost::CoreAnalyticsStep::CoreAnalyticsStep((uint64_t)this + 4584, 0xDA4E27EE52440112, v4, v8, (uint64_t)this + 224, (uint64_t)this + 3064, (uint64_t)this + 3016);
  uint64_t v10 = v4;
  uint64_t v11 = (uint64_t)this + 224;
  uint64_t v12 = (char *)v8;
  uint64_t v13 = (char *)this + 3064;
  uint64_t v14 = &v10;
  uint64_t v15 = 4;
  SAList<std::reference_wrapper<AlgDataNode>>::appendAndResize((uint64_t)this + 8, (uint64_t)&v14);
  uint64_t v14 = (void *)v9;
  uint64_t v10 = (long long *)&v14;
  uint64_t v11 = 1;
  SAList<std::reference_wrapper<AlgDataNode>>::appendAndResize((uint64_t)this + 32, (uint64_t)&v10);
  uint64_t v10 = (long long *)((char *)this + 600);
  uint64_t v11 = (uint64_t)this + 1680;
  uint64_t v12 = (char *)this + 3016;
  uint64_t v13 = (char *)this + 3064;
  uint64_t v14 = &v10;
  uint64_t v15 = 4;
  SAList<std::reference_wrapper<AlgDataNode>>::appendAndResize((uint64_t)this + 56, (uint64_t)&v14);
  uint64_t v10 = (long long *)((char *)this + 3128);
  uint64_t v11 = (uint64_t)this + 3720;
  uint64_t v12 = (char *)this + 4248;
  uint64_t v13 = (char *)this + 4584;
  uint64_t v14 = &v10;
  uint64_t v15 = 4;
  SAList<std::reference_wrapper<AlgDataNode>>::appendAndResize((uint64_t)this + 112, (uint64_t)&v14);
  *((unsigned char *)this + 3048) = 1;
  return this;
}

void sub_25BF2F904(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, NovaHost::NovaButtonStateMachineStep *a11, NovaHost::InterpolationStep *a12, void *a13, void *a14, void *a15)
{
  AlgWorkNode::~AlgWorkNode(v16);
  AlgWorkNode::~AlgWorkNode(v20);
  NovaHost::NovaButtonStateMachineStep::~NovaButtonStateMachineStep(a11);
  NovaHost::InterpolationStep::~InterpolationStep(a12);
  *uint64_t v21 = &unk_27096D910;
  void *v19 = &unk_27096D910;
  void *v18 = &unk_27096D910;
  void *v17 = &unk_27096D910;
  *a14 = &unk_27096D910;
  *a13 = &unk_27096D910;
  *a15 = &unk_27096D910;
  *a10 = &unk_27096D910;
  AlgTaskNode::~AlgTaskNode(v15);
  _Unwind_Resume(a1);
}

void sub_25BF2FA3C()
{
}

void sub_25BF2FA44()
{
}

void sub_25BF2FA4C()
{
}

void sub_25BF2FA54()
{
}

void sub_25BF2FA5C()
{
}

void sub_25BF2FA64()
{
}

void sub_25BF2FA6C()
{
}

void sub_25BF2FA74()
{
}

void sub_25BF2FA7C()
{
}

void sub_25BF2FA84()
{
}

void sub_25BF2FA8C()
{
}

void NovaHost::NovaButtonStateMachineStep::~NovaButtonStateMachineStep(NovaHost::NovaButtonStateMachineStep *this)
{
  *(void *)this = &unk_27096D738;
  uint64_t v2 = *((void *)this + 56);
  if (v2) {
    MEMORY[0x261178DC0](v2, 0x1000C8077774924);
  }
  uint64_t v3 = *((void *)this + 53);
  if (v3) {
    MEMORY[0x261178DC0](v3, 0x1000C8077774924);
  }
  uint64_t v4 = *((void *)this + 50);
  if (v4) {
    MEMORY[0x261178DC0](v4, 0x1000C8077774924);
  }
  *((void *)this + 40) = &unk_27096D910;
  *((void *)this + 32) = &unk_27096D910;
  *((void *)this + 27) = &unk_27096D910;
  *((void *)this + 22) = &unk_27096D910;
  *((void *)this + 18) = &unk_27096D910;
  AlgWorkNode::~AlgWorkNode(this);
}

{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t vars8;

  *(void *)this = &unk_27096D738;
  uint64_t v2 = *((void *)this + 56);
  if (v2) {
    MEMORY[0x261178DC0](v2, 0x1000C8077774924);
  }
  uint64_t v3 = *((void *)this + 53);
  if (v3) {
    MEMORY[0x261178DC0](v3, 0x1000C8077774924);
  }
  uint64_t v4 = *((void *)this + 50);
  if (v4) {
    MEMORY[0x261178DC0](v4, 0x1000C8077774924);
  }
  *((void *)this + 40) = &unk_27096D910;
  *((void *)this + 32) = &unk_27096D910;
  *((void *)this + 27) = &unk_27096D910;
  *((void *)this + 22) = &unk_27096D910;
  *((void *)this + 18) = &unk_27096D910;
  AlgWorkNode::~AlgWorkNode(this);
  JUMPOUT(0x261178DD0);
}

void *PlainDataNodeWithValidity<NovaCoreAnalytics>::~PlainDataNodeWithValidity(void *result)
{
  *double result = &unk_27096D910;
  return result;
}

void AlgTaskNode::~AlgTaskNode(AlgTaskNode *this)
{
  *(void *)this = &unk_27096D958;
  if (*((_DWORD *)this + 31)) {
    *((_DWORD *)this + 31) = 0;
  }
  uint64_t v2 = *((void *)this + 14);
  if (v2) {
    MEMORY[0x261178DC0](v2, 0x1000C8077774924);
  }
  AlgWorkNode::~AlgWorkNode(this);
}

{
  uint64_t vars8;

  AlgTaskNode::~AlgTaskNode(this);
  JUMPOUT(0x261178DD0);
}

void NovaHost::NovaHostActivePlan::~NovaHostActivePlan(NovaHost::NovaHostActivePlan *this)
{
  NovaHost::NovaHostActivePlan::~NovaHostActivePlan(this);
  JUMPOUT(0x261178DD0);
}

{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t vars8;

  *(void *)this = &unk_27096D1B8;
  AlgWorkNode::~AlgWorkNode((NovaHost::NovaHostActivePlan *)((char *)this + 4584));
  AlgWorkNode::~AlgWorkNode((NovaHost::NovaHostActivePlan *)((char *)this + 4248));
  *((void *)this + 465) = &unk_27096D738;
  uint64_t v2 = *((void *)this + 521);
  if (v2) {
    MEMORY[0x261178DC0](v2, 0x1000C8077774924);
  }
  uint64_t v3 = *((void *)this + 518);
  if (v3) {
    MEMORY[0x261178DC0](v3, 0x1000C8077774924);
  }
  uint64_t v4 = *((void *)this + 515);
  if (v4) {
    MEMORY[0x261178DC0](v4, 0x1000C8077774924);
  }
  *((void *)this + 505) = &unk_27096D910;
  *((void *)this + 497) = &unk_27096D910;
  *((void *)this + 492) = &unk_27096D910;
  *((void *)this + 487) = &unk_27096D910;
  *((void *)this + 483) = &unk_27096D910;
  AlgWorkNode::~AlgWorkNode((NovaHost::NovaHostActivePlan *)((char *)this + 3720));
  NovaHost::InterpolationStep::~InterpolationStep((NovaHost::NovaHostActivePlan *)((char *)this + 3128));
  *((void *)this + 383) = &unk_27096D910;
  *((void *)this + 377) = &unk_27096D910;
  *((void *)this + 210) = &unk_27096D910;
  *((void *)this + 75) = &unk_27096D910;
  *((void *)this + 36) = &unk_27096D910;
  *((void *)this + 32) = &unk_27096D910;
  *((void *)this + 28) = &unk_27096D910;
  *((void *)this + 20) = &unk_27096D910;
  AlgTaskNode::~AlgTaskNode(this);
}

uint64_t AlgTaskNode::children(AlgTaskNode *this)
{
  return (uint64_t)this + 112;
}

uint64_t AlgTaskNode::run(AlgTaskNode *this)
{
  return 1280;
}

void NovaHost::NovaHostActivePlan::runPlan(uint64_t a1, uint64_t a2, AlgDataInjector *a3, AlgDataExtractor *a4)
{
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(v4 + 16);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)v4;
  *(void *)(a1 + 152) = v5;
  AlgTaskNode::runTask((AlgTaskNode *)a1, a3, a4);
}

void PlainDataNode<NovaOutput>::~PlainDataNode(void *a1)
{
  *a1 = &unk_27096D910;
  JUMPOUT(0x261178DD0);
}

uint64_t PlainDataNode<NovaOutput>::sendCallback(uint64_t a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  *(void *)(a3 + 56) = a1 + 32;
  return a2(a3);
}

__n128 PlainDataNode<NovaOutput>::injectBuffer(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 48) = v3;
  return result;
}

void PlainDataNodeWithValidity<BOOL>::~PlainDataNodeWithValidity(void *a1)
{
  *a1 = &unk_27096D910;
  JUMPOUT(0x261178DD0);
}

uint64_t PlainDataNodeWithValidity<BOOL>::sendCallback(uint64_t result, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  if (*(unsigned char *)(result + 31))
  {
    *(void *)(a3 + 56) = result + 30;
    return a2(a3);
  }
  return result;
}

uint64_t PlainDataNode<BOOL>::injectBuffer(uint64_t result, unsigned char *a2)
{
  *(unsigned char *)(result + 30) = *a2;
  return result;
}

void PlainDataNode<BOOL>::~PlainDataNode(void *a1)
{
  *a1 = &unk_27096D910;
  JUMPOUT(0x261178DD0);
}

uint64_t PlainDataNode<BOOL>::sendCallback(uint64_t a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  *(void *)(a3 + 56) = a1 + 30;
  return a2(a3);
}

void SADynamicArray<NovaOutput,(unsigned short)8>::~SADynamicArray(void *a1)
{
  *a1 = &unk_27096D910;
  JUMPOUT(0x261178DD0);
}

uint64_t SADynamicArray<NovaOutput,(unsigned short)8>::sendCallback(unsigned __int16 *a1, uint64_t (*a2)(void *), void *a3)
{
  if (*((unsigned char *)a1 + 304)
    || (uint64_t result = (*(uint64_t (**)(unsigned __int16 *))(*(void *)a1 + 40))(a1), result))
  {
    a3[4] = a1[16];
    a3[5] = a1 + 16;
    a3[7] = (*(uint64_t (**)(unsigned __int16 *))(*(void *)a1 + 48))(a1);
    a3[6] = 32 * (*(unsigned int (**)(unsigned __int16 *))(*(void *)a1 + 40))(a1);
    return a2(a3);
  }
  return result;
}

void SADynamicArray<NovaOutput,(unsigned short)8>::injectBuffer(uint64_t a1, unsigned __int16 *a2)
{
  if (*(unsigned char *)(a1 + 305) || !*(unsigned char *)(a1 + 29))
  {
    *(_WORD *)(a1 + 38) = a2[3];
    unsigned int v3 = a2[2];
    size_t v4 = v3 >= 0x20 ? 32 : a2[2];
    if (a2[3])
    {
      unint64_t v5 = 0;
      uint64_t v6 = (char *)a2 + *a2;
      if (v3 <= 0x20) {
        size_t v7 = 32 - v3;
      }
      else {
        size_t v7 = 0;
      }
      uint64_t v8 = (char *)(a1 + 40);
      do
      {
        memcpy(v8, &v6[v5 * a2[2]], v4);
        if (v3 <= 0x1F) {
          bzero(&v8[v4], v7);
        }
        ++v5;
        v8 += 32;
      }
      while (v5 < a2[3]);
    }
  }
}

uint64_t SADynamicArray<NovaOutput,(unsigned short)8>::numElems(uint64_t a1)
{
  return *(unsigned __int16 *)(a1 + 38);
}

uint64_t SADynamicArray<NovaOutput,(unsigned short)8>::contents(uint64_t a1)
{
  return a1 + 40;
}

uint64_t non-virtual thunk to'SADynamicArray<NovaOutput,(unsigned short)8>::numElems(uint64_t a1)
{
  return *(unsigned __int16 *)(a1 - 258);
}

uint64_t non-virtual thunk to'SADynamicArray<NovaOutput,(unsigned short)8>::contents(uint64_t a1)
{
  return a1 - 256;
}

void SADynamicArray<TouchSensitiveButtonEventPacket,(unsigned short)32>::~SADynamicArray(void *a1)
{
  *a1 = &unk_27096D910;
  JUMPOUT(0x261178DD0);
}

uint64_t SADynamicArray<TouchSensitiveButtonEventPacket,(unsigned short)32>::sendCallback(unsigned __int16 *a1, uint64_t (*a2)(void *), void *a3)
{
  if (*((unsigned char *)a1 + 1072)
    || (uint64_t result = (*(uint64_t (**)(unsigned __int16 *))(*(void *)a1 + 40))(a1), result))
  {
    a3[4] = a1[16];
    a3[5] = a1 + 16;
    a3[7] = (*(uint64_t (**)(unsigned __int16 *))(*(void *)a1 + 48))(a1);
    a3[6] = 32 * (*(unsigned int (**)(unsigned __int16 *))(*(void *)a1 + 40))(a1);
    return a2(a3);
  }
  return result;
}

void SADynamicArray<TouchSensitiveButtonEventPacket,(unsigned short)32>::injectBuffer(uint64_t a1, unsigned __int16 *a2)
{
  if (*(unsigned char *)(a1 + 1073) || !*(unsigned char *)(a1 + 29))
  {
    *(_WORD *)(a1 + 38) = a2[3];
    unsigned int v3 = a2[2];
    size_t v4 = v3 >= 0x20 ? 32 : a2[2];
    if (a2[3])
    {
      unint64_t v5 = 0;
      uint64_t v6 = (char *)a2 + *a2;
      if (v3 <= 0x20) {
        size_t v7 = 32 - v3;
      }
      else {
        size_t v7 = 0;
      }
      uint64_t v8 = (char *)(a1 + 40);
      do
      {
        memcpy(v8, &v6[v5 * a2[2]], v4);
        if (v3 <= 0x1F) {
          bzero(&v8[v4], v7);
        }
        ++v5;
        v8 += 32;
      }
      while (v5 < a2[3]);
    }
  }
}

uint64_t non-virtual thunk to'SADynamicArray<TouchSensitiveButtonEventPacket,(unsigned short)32>::numElems(uint64_t a1)
{
  return *(unsigned __int16 *)(a1 - 1026);
}

uint64_t non-virtual thunk to'SADynamicArray<TouchSensitiveButtonEventPacket,(unsigned short)32>::contents(uint64_t a1)
{
  return a1 - 1024;
}

void SADynamicArray<ForceStageEventPacket,(unsigned short)32>::~SADynamicArray(void *a1)
{
  *a1 = &unk_27096D910;
  JUMPOUT(0x261178DD0);
}

uint64_t SADynamicArray<ForceStageEventPacket,(unsigned short)32>::sendCallback(unsigned __int16 *a1, uint64_t (*a2)(void *), void *a3)
{
  if (*((unsigned char *)a1 + 1328)
    || (uint64_t result = (*(uint64_t (**)(unsigned __int16 *))(*(void *)a1 + 40))(a1), result))
  {
    a3[4] = a1[16];
    a3[5] = a1 + 16;
    a3[7] = (*(uint64_t (**)(unsigned __int16 *))(*(void *)a1 + 48))(a1);
    a3[6] = 40 * (*(unsigned int (**)(unsigned __int16 *))(*(void *)a1 + 40))(a1);
    return a2(a3);
  }
  return result;
}

void SADynamicArray<ForceStageEventPacket,(unsigned short)32>::injectBuffer(uint64_t a1, unsigned __int16 *a2)
{
  if (*(unsigned char *)(a1 + 1329) || !*(unsigned char *)(a1 + 29))
  {
    *(_WORD *)(a1 + 38) = a2[3];
    unsigned int v3 = a2[2];
    size_t v4 = v3 >= 0x28 ? 40 : a2[2];
    if (a2[3])
    {
      unint64_t v5 = 0;
      uint64_t v6 = (char *)a2 + *a2;
      if (v3 <= 0x28) {
        size_t v7 = 40 - v3;
      }
      else {
        size_t v7 = 0;
      }
      uint64_t v8 = (char *)(a1 + 40);
      do
      {
        memcpy(v8, &v6[v5 * a2[2]], v4);
        if (v3 <= 0x27) {
          bzero(&v8[v4], v7);
        }
        ++v5;
        v8 += 40;
      }
      while (v5 < a2[3]);
    }
  }
}

uint64_t non-virtual thunk to'SADynamicArray<ForceStageEventPacket,(unsigned short)32>::numElems(uint64_t a1)
{
  return *(unsigned __int16 *)(a1 - 1282);
}

uint64_t non-virtual thunk to'SADynamicArray<ForceStageEventPacket,(unsigned short)32>::contents(uint64_t a1)
{
  return a1 - 1280;
}

void PlainDataNodeWithValidity<NovaHostCoreAnalytics>::~PlainDataNodeWithValidity(void *a1)
{
  *a1 = &unk_27096D910;
  JUMPOUT(0x261178DD0);
}

uint64_t PlainDataNodeWithValidity<NovaHostCoreAnalytics>::sendCallback(uint64_t result, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  if (*(unsigned char *)(result + 40))
  {
    *(void *)(a3 + 56) = result + 32;
    return a2(a3);
  }
  return result;
}

uint64_t PlainDataNode<NovaHostCoreAnalytics>::injectBuffer(uint64_t result, void *a2)
{
  *(void *)(result + 32) = *a2;
  return result;
}

void PlainDataNodeWithValidity<NovaCoreAnalytics>::~PlainDataNodeWithValidity(void *a1)
{
  *a1 = &unk_27096D910;
  JUMPOUT(0x261178DD0);
}

uint64_t PlainDataNodeWithValidity<NovaCoreAnalytics>::sendCallback(uint64_t result, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  if (*(unsigned char *)(result + 56))
  {
    *(void *)(a3 + 56) = result + 32;
    return a2(a3);
  }
  return result;
}

__n128 PlainDataNode<NovaCoreAnalytics>::injectBuffer(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[3].n128_u64[0] = a2[1].n128_u64[0];
  a1[2] = result;
  return result;
}

uint64_t NovaHost::InterpolationStep::InterpolationStep(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v14[2] = *MEMORY[0x263EF8340];
  AlgWorkNode::AlgWorkNode((AlgWorkNode *)a1);
  *size_t v7 = &unk_27096D648;
  v7[14] = a3;
  uint64_t v8 = v7 + 15;
  AlgDataNode::AlgDataNode((AlgDataNode *)(v7 + 15), 0xEA52A8B328945C38, 0);
  *(void *)(a1 + 120) = &unk_27096D2E8;
  *(unsigned char *)(a1 + 150) = 0;
  *(_DWORD *)(a1 + 136) = 20480;
  *(_DWORD *)(a1 + 144) = 1;
  AlgDataNode::AlgDataNode((AlgDataNode *)(a1 + 152), 0xC99FA38EDDBFB984, 0);
  *(void *)(a1 + 184) = 0;
  *(void *)(a1 + 152) = &unk_27096D698;
  *(_DWORD *)(a1 + 168) = 20720;
  *(_DWORD *)(a1 + 176) = 8;
  AlgDataNode::AlgDataNode((AlgDataNode *)(a1 + 192), 0xC99FB05AB16417D5, 0);
  *(void *)(a1 + 192) = &unk_27096D230;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 240) = 0u;
  *(_DWORD *)(a1 + 208) = 61451;
  *(_DWORD *)(a1 + 216) = 32;
  AlgDataNode::AlgDataNode((AlgDataNode *)(a1 + 256), 0xF860E8F10D73DE9ELL, 0);
  *(void *)(a1 + 256) = &unk_27096D6E8;
  *(_DWORD *)(a1 + 272) = 20488;
  *(_DWORD *)(a1 + 280) = 8;
  *(void *)(a1 + 288) = 0;
  *(void *)(a1 + 296) = a4;
  *(void *)(a1 + 304) = a1 + 184;
  *(unsigned char *)(a1 + 312) = 1;
  *(_DWORD *)(a1 + 316) = 8;
  *(void *)(a1 + 320) = 0;
  *(void *)(a1 + 328) = 8;
  *(unsigned char *)(a1 + 336) = 0;
  *(void *)(a1 + 344) = 0;
  *(void *)(a1 + 352) = 8;
  *(unsigned char *)(a1 + 360) = 0;
  *(void *)(a1 + 400) = a1 + 184;
  *(unsigned char *)(a1 + 408) = 0;
  *(_DWORD *)(a1 + 412) = 8;
  *(void *)(a1 + 416) = 0;
  *(void *)(a1 + 424) = 8;
  *(unsigned char *)(a1 + 432) = 0;
  *(void *)(a1 + 440) = 0;
  *(void *)(a1 + 448) = 8;
  *(unsigned char *)(a1 + 456) = 0;
  *(void *)(a1 + 496) = a1 + 184;
  *(unsigned char *)(a1 + 504) = 0;
  *(_DWORD *)(a1 + 508) = 8;
  *(void *)(a1 + 512) = 0;
  *(void *)(a1 + 520) = 8;
  *(unsigned char *)(a1 + 528) = 0;
  *(void *)(a1 + 536) = 0;
  *(void *)(a1 + 544) = 8;
  *(unsigned char *)(a1 + 552) = 0;
  uint64_t v9 = *(void *)(a1 + 112);
  uint64_t v13 = 1;
  v14[0] = v9;
  uint64_t v12 = v14;
  SAList<std::reference_wrapper<AlgDataNode>>::appendAndResize(a1 + 8, (uint64_t)&v12);
  v14[0] = a1 + 152;
  v14[1] = v8;
  uint64_t v12 = v14;
  uint64_t v13 = 2;
  SAList<std::reference_wrapper<AlgDataNode>>::appendAndResize(a1 + 32, (uint64_t)&v12);
  uint64_t v10 = *(void *)(a1 + 296);
  uint64_t v12 = v14;
  uint64_t v13 = 1;
  v14[0] = v10;
  SAList<std::reference_wrapper<AlgDataNode>>::appendAndResize(a1 + 56, (uint64_t)&v12);
  *(void *)(a1 + 184) = 0x406E000000000000;
  *(unsigned char *)(a1 + 150) = 1;
  return a1;
}

void sub_25BF30754(_Unwind_Exception *a1)
{
  NovaHost::Interpolator<float>::~Interpolator((uint64_t)v1 + 496);
  NovaHost::Interpolator<float>::~Interpolator((uint64_t)v1 + 400);
  NovaHost::Interpolator<float>::~Interpolator((uint64_t)v1 + 304);
  void *v5 = &unk_27096D910;
  *size_t v4 = &unk_27096D910;
  void *v3 = &unk_27096D910;
  void *v2 = &unk_27096D910;
  AlgWorkNode::~AlgWorkNode(v1);
  _Unwind_Resume(a1);
}

void sub_25BF30810()
{
}

void sub_25BF30818()
{
}

uint64_t NovaHost::Interpolator<float>::~Interpolator(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    MEMORY[0x261178DC0](v2, 0x1000C8077774924);
  }
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3) {
    MEMORY[0x261178DC0](v3, 0x1000C8077774924);
  }
  return a1;
}

void AlgWorkNode::~AlgWorkNode(AlgWorkNode *this)
{
  *(void *)this = &unk_27096D9D0;
  if (*((_DWORD *)this + 5)) {
    *((_DWORD *)this + 5) = 0;
  }
  if (*((_DWORD *)this + 11)) {
    *((_DWORD *)this + 11) = 0;
  }
  if (*((_DWORD *)this + 17)) {
    *((_DWORD *)this + 17) = 0;
  }
  if (*((_DWORD *)this + 23)) {
    *((_DWORD *)this + 23) = 0;
  }
  uint64_t v2 = *((void *)this + 10);
  if (v2) {
    MEMORY[0x261178DC0](v2, 0x1000C8077774924);
  }
  uint64_t v3 = *((void *)this + 7);
  if (v3) {
    MEMORY[0x261178DC0](v3, 0x1000C8077774924);
  }
  uint64_t v4 = *((void *)this + 4);
  if (v4) {
    MEMORY[0x261178DC0](v4, 0x1000C8077774924);
  }
  uint64_t v5 = *((void *)this + 1);
  if (v5) {
    MEMORY[0x261178DC0](v5, 0x1000C8077774924);
  }
}

void NovaHost::InterpolationStep::~InterpolationStep(NovaHost::InterpolationStep *this)
{
  NovaHost::InterpolationStep::~InterpolationStep(this);
  JUMPOUT(0x261178DD0);
}

{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t vars8;

  *(void *)this = &unk_27096D648;
  uint64_t v2 = *((void *)this + 67);
  if (v2) {
    MEMORY[0x261178DC0](v2, 0x1000C8077774924);
  }
  uint64_t v3 = *((void *)this + 64);
  if (v3) {
    MEMORY[0x261178DC0](v3, 0x1000C8077774924);
  }
  uint64_t v4 = *((void *)this + 55);
  if (v4) {
    MEMORY[0x261178DC0](v4, 0x1000C8077774924);
  }
  uint64_t v5 = *((void *)this + 52);
  if (v5) {
    MEMORY[0x261178DC0](v5, 0x1000C8077774924);
  }
  uint64_t v6 = *((void *)this + 43);
  if (v6) {
    MEMORY[0x261178DC0](v6, 0x1000C8077774924);
  }
  size_t v7 = *((void *)this + 40);
  if (v7) {
    MEMORY[0x261178DC0](v7, 0x1000C8077774924);
  }
  *((void *)this + 32) = &unk_27096D910;
  *((void *)this + 24) = &unk_27096D910;
  *((void *)this + 19) = &unk_27096D910;
  *((void *)this + 15) = &unk_27096D910;
  AlgWorkNode::~AlgWorkNode(this);
}

uint64_t NovaHost::InterpolationStep::run(__n128 *this)
{
  v1 = (__n128 *)this[7].n128_u64[0];
  *(_WORD *)(this[18].n128_u64[1] + 38) = 0;
  if (v1[1].n128_u8[13])
  {
    uint64_t v3 = v1 + 2;
    if (!v1[2].n128_u8[2]) {
      goto LABEL_17;
    }
    uint64_t v4 = v1[2].n128_i64[1];
    unint64_t v5 = v4 - this[18].n128_u64[0];
    if (this[14].n128_u8[2] && v5 >= 0x4E21)
    {
      uint64_t v6 = SALoggingGeneral();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        NovaHost::InterpolationStep::run((uint64_t *)&this[18], &v1[2].n128_i64[1], v6);
      }
      goto LABEL_17;
    }
    if (!this[9].n128_u8[6]
      || !this[14].n128_u8[2]
      || v5 >= 0x4E21
      || (BOOL v7 = NovaHost::Interpolator<float>::run((uint64_t)&this[19], v4, v1[2].n128_f32[1]),
          BOOL v8 = NovaHost::Interpolator<float>::run((uint64_t)&this[25], v1[2].n128_i64[1], v1[3].n128_f32[0]),
          BOOL v9 = NovaHost::Interpolator<float>::run((uint64_t)&this[31], v1[2].n128_i64[1], v1[3].n128_f32[1]),
          !v7)
      || !v8
      || !v9)
    {
LABEL_17:
      NovaHost::InterpolationStep::runPassthrough(this, v1 + 2);
      return 0;
    }
    if (this[22].n128_u32[1])
    {
      unint64_t v10 = 0;
      do
      {
        unint64_t v11 = this[18].n128_u64[1];
        uint64_t v12 = *(unsigned __int16 *)(v11 + 38);
        unint64_t v13 = v11 + 32 * v12;
        *(_WORD *)(v11 + 38) = v12 + 1;
        __n128 v14 = *v3;
        *(__n128 *)(v13 + 56) = v1[3];
        *(__n128 *)(v13 + 40) = v14;
        *(void *)(v13 + 48) = *(void *)(this[21].n128_u64[1] + 8 * v10);
        *(_DWORD *)(v13 + 44) = *(_DWORD *)(this[20].n128_u64[0] + 4 * v10);
        *(_DWORD *)(v13 + 56) = *(_DWORD *)(this[26].n128_u64[0] + 4 * v10);
        *(_DWORD *)(v13 + 60) = *(_DWORD *)(this[32].n128_u64[0] + 4 * v10++);
      }
      while (v10 < this[22].n128_u32[1]);
    }
    __n128 v15 = v1[3];
    this[14] = *v3;
    this[15] = v15;
    this[18].n128_u64[0] = v1[2].n128_u64[1];
  }
  return 0;
}

void PlainDataNode<double>::~PlainDataNode(void *a1)
{
  *a1 = &unk_27096D910;
  JUMPOUT(0x261178DD0);
}

__n128 NovaHost::InterpolationStep::runPassthrough(__n128 *a1, __n128 *a2)
{
  NovaHost::Interpolator<float>::reset_state((uint64_t)&a1[19], a2->n128_u64[1], a2->n128_f32[1]);
  NovaHost::Interpolator<float>::reset_state((uint64_t)&a1[25], a2->n128_u64[1], a2[1].n128_f32[0]);
  NovaHost::Interpolator<float>::reset_state((uint64_t)&a1[31], a2->n128_u64[1], a2[1].n128_f32[1]);
  uint64_t v4 = a1[18].n128_i64[1];
  uint64_t v5 = *(unsigned __int16 *)(v4 + 38);
  uint64_t v6 = v4 + 32 * v5;
  *(_WORD *)(v4 + 38) = v5 + 1;
  __n128 v7 = *a2;
  *(__n128 *)(v6 + 56) = a2[1];
  *(__n128 *)(v6 + 40) = v7;
  __n128 result = *a2;
  __n128 v9 = a2[1];
  a1[14] = *a2;
  a1[15] = v9;
  a1[18].n128_u64[0] = a2->n128_u64[1];
  return result;
}

uint64_t NovaHost::NovaButtonStateMachineStep::NovaButtonStateMachineStep(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  AlgWorkNode::AlgWorkNode((AlgWorkNode *)a1);
  *__n128 v15 = &unk_27096D738;
  v15[14] = a3;
  v15[15] = a4;
  v15[16] = a5;
  v15[17] = a6;
  AlgDataNode::AlgDataNode((AlgDataNode *)(v15 + 18), 0xC9B3C161F911BBE6, 0);
  uint64_t v18 = v16;
  *(unsigned char *)(a1 + 174) = 0;
  *(void *)(a1 + 144) = &unk_27096D2E8;
  *(_DWORD *)(a1 + 160) = 20480;
  *(_DWORD *)(a1 + 168) = 1;
  AlgDataNode::AlgDataNode((AlgDataNode *)(a1 + 176), 0x35AAE77916372217, 0);
  *(_DWORD *)(a1 + 208) = 0;
  *(void *)(a1 + 176) = &unk_27096D788;
  *(_DWORD *)(a1 + 192) = 20481;
  *(_DWORD *)(a1 + 200) = 4;
  AlgDataNode::AlgDataNode((AlgDataNode *)(a1 + 216), 0xC9B395F2E24E96B8, 0);
  *(_DWORD *)(a1 + 248) = 0;
  *(void *)(a1 + 216) = &unk_27096D788;
  *(_DWORD *)(a1 + 232) = 20481;
  *(_DWORD *)(a1 + 240) = 4;
  AlgDataNode::AlgDataNode((AlgDataNode *)(a1 + 256));
  *(void *)(a1 + 256) = &unk_27096D230;
  *(_OWORD *)(a1 + 288) = 0u;
  *(_OWORD *)(a1 + 304) = 0u;
  *(_DWORD *)(a1 + 272) = 61451;
  *(_DWORD *)(a1 + 280) = 32;
  AlgDataNode::AlgDataNode((AlgDataNode *)(a1 + 320), 0x7DC316DA412088EELL, 0);
  *(void *)(a1 + 320) = &unk_27096D2E8;
  *(unsigned char *)(a1 + 350) = 0;
  *(_DWORD *)(a1 + 336) = 20480;
  *(_DWORD *)(a1 + 344) = 1;
  *(void *)(a1 + 352) = a7;
  *(void *)(a1 + 360) = a8;
  *(void *)(a1 + 368) = a1 + 174;
  *(void *)(a1 + 376) = a1 + 208;
  *(void *)(a1 + 384) = a1 + 248;
  *(void *)(a1 + 392) = a1 + 350;
  *(void *)(a1 + 400) = 0;
  *(void *)(a1 + 408) = 16;
  *(unsigned char *)(a1 + 416) = 0;
  *(void *)(a1 + 424) = 0;
  *(void *)(a1 + 432) = 16;
  *(unsigned char *)(a1 + 440) = 0;
  *(void *)(a1 + 448) = 0;
  *(void *)(a1 + 456) = 16;
  *(unsigned char *)(a1 + 464) = 0;
  *(_OWORD *)(a1 + 498) = 0u;
  *(_OWORD *)(a1 + 488) = 0u;
  *(_OWORD *)(a1 + 472) = 0u;
  *(void *)(a1 + 516) = 0;
  *(unsigned char *)(a1 + 524) = 0;
  long long v19 = *(_OWORD *)(a1 + 120);
  uint64_t v20 = *(void *)(a1 + 136);
  *(void *)&long long v22 = &v19;
  *((void *)&v22 + 1) = 3;
  SAList<std::reference_wrapper<AlgDataNode>>::appendAndResize(a1 + 8, (uint64_t)&v22);
  *(void *)&long long v19 = v18;
  *((void *)&v19 + 1) = a1 + 176;
  uint64_t v20 = a1 + 216;
  uint64_t v21 = a1 + 320;
  *(void *)&long long v22 = &v19;
  *((void *)&v22 + 1) = 4;
  SAList<std::reference_wrapper<AlgDataNode>>::appendAndResize(a1 + 32, (uint64_t)&v22);
  long long v22 = *(_OWORD *)(a1 + 352);
  *(void *)&long long v19 = &v22;
  *((void *)&v19 + 1) = 2;
  SAList<std::reference_wrapper<AlgDataNode>>::appendAndResize(a1 + 56, (uint64_t)&v19);
  *(unsigned char *)(a1 + 174) = 1;
  *(unsigned char *)(a1 + 350) = 0;
  *(_DWORD *)(a1 + 208) = 1040187392;
  *(_DWORD *)(a1 + 248) = 1036831949;
  return a1;
}

void sub_25BF30EF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10)
{
  NovaHost::NovaButtonStateMachine::~NovaButtonStateMachine(v14);
  *__n128 v15 = &unk_27096D910;
  *unint64_t v13 = &unk_27096D910;
  *uint64_t v12 = &unk_27096D910;
  *unint64_t v11 = &unk_27096D910;
  *a10 = &unk_27096D910;
  AlgWorkNode::~AlgWorkNode(v10);
  _Unwind_Resume(a1);
}

void sub_25BF30FB4()
{
}

void sub_25BF30FBC()
{
}

void sub_25BF30FC4()
{
}

void NovaHost::NovaButtonStateMachine::~NovaButtonStateMachine(NovaHost::NovaButtonStateMachine *this)
{
  uint64_t v2 = *((void *)this + 10);
  if (v2) {
    MEMORY[0x261178DC0](v2, 0x1000C8077774924);
  }
  uint64_t v3 = *((void *)this + 7);
  if (v3) {
    MEMORY[0x261178DC0](v3, 0x1000C8077774924);
  }
  uint64_t v4 = *((void *)this + 4);
  if (v4) {
    MEMORY[0x261178DC0](v4, 0x1000C8077774924);
  }
}

uint64_t NovaHost::NovaButtonStateMachineStep::run(NovaHost::NovaButtonStateMachineStep *this)
{
  uint64_t v2 = *((void *)this + 45);
  *(_WORD *)(*((void *)this + 44) + 38) = 0;
  *(_WORD *)(v2 + 38) = 0;
  uint64_t v3 = (NovaHost::NovaButtonStateMachineStep *)((char *)this + 368);
  NovaHost::NovaButtonStateMachine::clearHIDEvents((uint64_t)this + 368);
  uint64_t v4 = *((void *)this + 17);
  int v5 = *(unsigned __int8 *)(v4 + 29);
  int v6 = *(unsigned __int8 *)(v4 + 30);
  if (!v5)
  {
    if (!v6)
    {
      __n128 v7 = (unsigned char *)*((void *)this + 16);
      if (!v7[29]) {
        return 0;
      }
      goto LABEL_6;
    }
LABEL_5:
    __n128 v7 = (unsigned char *)*((void *)this + 16);
    if (!v7[29])
    {
      v7[31] = 0;
      goto LABEL_8;
    }
LABEL_6:
    v7[31] = 1;
    NovaHost::NovaButtonStateMachine::setFullPressState((uint64_t)v3, v7[30]);
LABEL_8:
    int v8 = (*(uint64_t (**)(void))(**((void **)this + 15) + 40))(*((void *)this + 15));
    if (!v8)
    {
      uint64_t v9 = *((void *)this + 15);
      uint64_t v10 = *(unsigned __int16 *)(v9 + 38);
      uint64_t v11 = v9 + 32 * v10;
      *(_WORD *)(v9 + 38) = v10 + 1;
      long long v12 = *((_OWORD *)this + 19);
      *(_OWORD *)(v11 + 40) = *((_OWORD *)this + 18);
      *(_OWORD *)(v11 + 56) = v12;
      *(_DWORD *)(v11 + 44) = 0;
    }
    if ((*(unsigned int (**)(void))(**((void **)this + 15) + 40))(*((void *)this + 15)))
    {
      unint64_t v14 = 0;
      uint64_t v15 = 40;
      do
      {
        if (v8)
        {
          uint64_t v16 = *((void *)this + 15);
          uint64_t v17 = (uint64_t *)(v16 + v15 + 8);
        }
        else
        {
          uint64_t v17 = (uint64_t *)*((void *)this + 14);
          uint64_t v16 = *((void *)this + 15);
        }
        NovaHost::NovaButtonStateMachine::update((uint64_t)v3, (long long *)(v16 + v15), *v17, v13);
        uint64_t v18 = *((void *)this + 15);
        long long v19 = *(_OWORD *)(v18 + v15 + 16);
        *((_OWORD *)this + 18) = *(_OWORD *)(v18 + v15);
        *((_OWORD *)this + 19) = v19;
        ++v14;
        v15 += 32;
      }
      while (v14 < (*(unsigned int (**)(uint64_t))(*(void *)v18 + 40))(v18));
    }
    goto LABEL_16;
  }
  if (v6) {
    goto LABEL_5;
  }
  NovaHost::NovaButtonStateMachine::cleanup(v3);
LABEL_16:
  if (*((_DWORD *)this + 109))
  {
    uint64_t v20 = 0;
    unint64_t v21 = 0;
    do
    {
      long long v22 = (long long *)(*((void *)this + 53) + v20);
      uint64_t v23 = *((void *)this + 44);
      uint64_t v24 = *(unsigned __int16 *)(v23 + 38);
      uint64_t v25 = v23 + 32 * v24;
      *(_WORD *)(v23 + 38) = v24 + 1;
      long long v26 = *v22;
      *(_OWORD *)(v25 + 56) = v22[1];
      *(_OWORD *)(v25 + 40) = v26;
      ++v21;
      v20 += 32;
    }
    while (v21 < *((unsigned int *)this + 109));
  }
  if (*((_DWORD *)this + 115))
  {
    uint64_t v27 = 0;
    unint64_t v28 = 0;
    do
    {
      v29 = (long long *)(*((void *)this + 56) + v27);
      uint64_t v30 = *((void *)this + 45);
      uint64_t v31 = v30 + 40 * (unsigned __int16)(*(_WORD *)(v30 + 38))++;
      long long v32 = *v29;
      long long v33 = v29[1];
      *(void *)(v31 + 72) = *((void *)v29 + 4);
      *(_OWORD *)(v31 + 56) = v33;
      *(_OWORD *)(v31 + 40) = v32;
      ++v28;
      v27 += 40;
    }
    while (v28 < *((unsigned int *)this + 115));
  }
  return 0;
}

void PlainDataNode<float>::~PlainDataNode(void *a1)
{
  *a1 = &unk_27096D910;
  JUMPOUT(0x261178DD0);
}

uint64_t PlainDataNode<float>::injectBuffer(uint64_t result, _DWORD *a2)
{
  *(_DWORD *)(result + 32) = *a2;
  return result;
}

AlgWorkNode *NovaHost::LiftoffVelocityStep::LiftoffVelocityStep(AlgWorkNode *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v12[2] = *MEMORY[0x263EF8340];
  AlgWorkNode::AlgWorkNode(a1);
  *(void *)uint64_t v7 = &unk_27096D7D8;
  *(void *)(v7 + 112) = a3;
  *(void *)(v7 + 120) = a4;
  *(_OWORD *)(v7 + 144) = 0u;
  *(_OWORD *)(v7 + 160) = 0u;
  *(_OWORD *)(v7 + 176) = 0u;
  *(_OWORD *)(v7 + 192) = 0u;
  *(_OWORD *)(v7 + 208) = 0u;
  *(_OWORD *)(v7 + 224) = 0u;
  *(_OWORD *)(v7 + 240) = 0u;
  *(_OWORD *)(v7 + 256) = 0u;
  *(_OWORD *)(v7 + 272) = 0u;
  *(_OWORD *)(v7 + 288) = 0u;
  *(_OWORD *)(v7 + 128) = 0u;
  *(_OWORD *)(v7 + 297) = 0u;
  *(void *)(v7 + 324) = 0;
  *(void *)(v7 + 316) = 0;
  v12[0] = a3;
  v12[1] = a4;
  uint64_t v10 = v12;
  uint64_t v11 = 2;
  SAList<std::reference_wrapper<AlgDataNode>>::appendAndResize(v7 + 8, (uint64_t)&v10);
  uint64_t v8 = *((void *)a1 + 14);
  uint64_t v10 = v12;
  uint64_t v11 = 1;
  v12[0] = v8;
  SAList<std::reference_wrapper<AlgDataNode>>::appendAndResize((uint64_t)a1 + 56, (uint64_t)&v10);
  return a1;
}

void sub_25BF3150C(_Unwind_Exception *a1)
{
  AlgWorkNode::~AlgWorkNode(v1);
  _Unwind_Resume(a1);
}

void NovaHost::LiftoffVelocityStep::~LiftoffVelocityStep(NovaHost::LiftoffVelocityStep *this)
{
  AlgWorkNode::~AlgWorkNode(this);
  JUMPOUT(0x261178DD0);
}

uint64_t NovaHost::LiftoffVelocityStep::run(NovaHost::LiftoffVelocityStep *this)
{
  if ((*(unsigned int (**)(void))(**((void **)this + 14) + 40))(*((void *)this + 14)))
  {
    int v2 = 0;
    uint64_t v3 = 0;
    unsigned __int8 v4 = 0;
    do
    {
      uint64_t v5 = (*(uint64_t (**)(uint64_t))(*(void *)(*((void *)this + 14) + 1064) + 8))(*((void *)this + 14) + 1064);
      int v6 = (TouchSensitiveButtonEventPacket *)(v5 + 32 * v3);
      uint64_t v7 = (*(uint64_t (**)(uint64_t))(*(void *)(*((void *)this + 15) + 1320) + 8))(*((void *)this + 15) + 1320);
      uint64_t v8 = v7;
      v10 = v6->var6 || (unsigned int v9 = *(_DWORD *)(v7 + 40 * v3 + 24), v9 > 1) || v9 == 1 && *(_DWORD *)(v7 + 40 * v3 + 28) != 2;
      unint64_t v11 = v3 + 1;
      if (v3 + 1 < (unint64_t)(*(unsigned int (**)(void))(**((void **)this + 14) + 40))(*((void *)this + 14))
        && v6->var0 == *(void *)((*(uint64_t (**)(uint64_t))(*(void *)(*((void *)this + 14) + 1064)
                                                                      + 8))(*((void *)this + 14) + 1064)
                                 + 32 * v11))
      {
        ++v4;
      }
      else if (*(_WORD *)(v5 + 32 * v3 + 24) == 2 || !v10)
      {
        NovaHost::LiftoffVelocityCalculator::update((NovaHost::LiftoffVelocityStep *)((char *)this + 128), v6, (ForceStageEventPacket *)(v8 + 40 * v3));
        if (v4)
        {
          double v13 = (_DWORD *)(v5 + 32 * v3 + 28);
          unsigned int v14 = v2 - v4;
          int v15 = v4 - 1;
          do
            *(_DWORD *)((*(uint64_t (**)(uint64_t))(*(void *)(*((void *)this + 14) + 1064) + 8))(*((void *)this + 14) + 1064)
                      + 32 * v14++
                      + 28) = *v13;
          while (v15--);
        }
        unsigned __int8 v4 = 0;
      }
      ++v2;
      ++v3;
    }
    while (v11 < (*(unsigned int (**)(void))(**((void **)this + 14) + 40))(*((void *)this + 14)));
  }
  return 0;
}

uint64_t NovaHost::CoreAnalyticsStep::CoreAnalyticsStep(uint64_t a1, uint64_t a2, long long *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  AlgWorkNode::AlgWorkNode((AlgWorkNode *)a1);
  *(void *)uint64_t v13 = &unk_27096D828;
  *(void *)(v13 + 112) = a3;
  *(void *)(v13 + 120) = a4;
  *(void *)(v13 + 128) = a5;
  *(void *)(v13 + 136) = a6;
  *(void *)(v13 + 144) = a7;
  *(unsigned char *)(v13 + 152) = 0;
  int v15 = a3;
  uint64_t v16 = a4;
  uint64_t v17 = a5;
  uint64_t v18 = a6;
  *(void *)&long long v19 = &v15;
  *((void *)&v19 + 1) = 4;
  SAList<std::reference_wrapper<AlgDataNode>>::appendAndResize(v13 + 8, (uint64_t)&v19);
  long long v19 = *(_OWORD *)(a1 + 136);
  int v15 = &v19;
  uint64_t v16 = 2;
  SAList<std::reference_wrapper<AlgDataNode>>::appendAndResize(a1 + 56, (uint64_t)&v15);
  return a1;
}

void sub_25BF318C0(_Unwind_Exception *a1)
{
  AlgWorkNode::~AlgWorkNode(v1);
  _Unwind_Resume(a1);
}

void NovaHost::CoreAnalyticsStep::~CoreAnalyticsStep(NovaHost::CoreAnalyticsStep *this)
{
  AlgWorkNode::~AlgWorkNode(this);
  JUMPOUT(0x261178DD0);
}

uint64_t NovaHost::CoreAnalyticsStep::run(NovaHost::CoreAnalyticsStep *this)
{
  uint64_t v2 = *((void *)this + 17);
  uint64_t v1 = *((void *)this + 18);
  int v3 = *((unsigned __int8 *)this + 152);
  int v4 = *(unsigned __int8 *)(*((void *)this + 16) + 30);
  *((unsigned char *)this + 152) = v4;
  *(unsigned char *)(v2 + 56) = *(unsigned char *)(v2 + 29);
  if (v3) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v4 == 0;
  }
  if (v5)
  {
    char v6 = 0;
  }
  else
  {
    char v6 = *(unsigned char *)(*((void *)this + 15) + 30);
    if (v6)
    {
      uint64_t v7 = *((void *)this + 14);
      *(_WORD *)(v1 + 33) = 257;
      *(_DWORD *)(v1 + 36) = *(_DWORD *)(v7 + 48);
      char v6 = 1;
      *(unsigned char *)(v1 + 35) = 1;
    }
  }
  *(unsigned char *)(v1 + 40) = v6;
  return 0;
}

uint64_t SAList<std::reference_wrapper<AlgDataNode>>::appendAndResize(uint64_t a1, uint64_t a2)
{
  uint64_t result = SAList<std::reference_wrapper<AlgDataNode>>::resize(a1, *(_DWORD *)(a1 + 12) + *(_DWORD *)(a2 + 8));
  uint64_t v5 = *(void *)(a2 + 8);
  if (v5)
  {
    char v6 = *(void **)a2;
    uint64_t v7 = 8 * v5;
    do
    {
      uint64_t result = SAList<std::reference_wrapper<AlgDataNode>>::push_back(a1, v6++);
      v7 -= 8;
    }
    while (v7);
  }
  return result;
}

uint64_t SAList<std::reference_wrapper<AlgDataNode>>::resize(uint64_t result, unsigned int a2)
{
  int v2 = *(_DWORD *)(result + 8);
  *(_DWORD *)(result + 8) = a2;
  if (a2)
  {
    if (v2 != a2)
    {
      uint64_t v3 = result;
      int v4 = *(const void **)result;
      if (*(void *)result)
      {
        uint64_t v5 = (void *)operator new(8 * a2, *(unsigned __int8 *)(result + 16));
        *(void *)uint64_t v3 = v5;
        memcpy(v5, v4, 8 * *(unsigned int *)(v3 + 12));
        JUMPOUT(0x261178DC0);
      }
    }
  }
  return result;
}

uint64_t SAList<std::reference_wrapper<AlgDataNode>>::push_back(uint64_t a1, void *a2)
{
  uint64_t result = *(void *)a1;
  if (!result)
  {
    uint64_t result = operator new(8 * *(unsigned int *)(a1 + 8), *(unsigned __int8 *)(a1 + 16));
    *(void *)a1 = result;
  }
  *(void *)(result + 8 * (*(_DWORD *)(a1 + 12))++) = *a2;
  return result;
}

void NovaHost::InterpolationStep::run(uint64_t *a1, uint64_t *a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  uint64_t v4 = *a2;
  int v5 = 134218496;
  uint64_t v6 = 20000;
  __int16 v7 = 2048;
  uint64_t v8 = v3;
  __int16 v9 = 2048;
  uint64_t v10 = v4;
  _os_log_error_impl(&dword_25BF2A000, log, OS_LOG_TYPE_ERROR, "Timeout of %lluus exceeded, likely dropped frames? %llu -> %llu", (uint8_t *)&v5, 0x20u);
}

uint64_t NovaHost::NovaButtonStateMachine::update(uint64_t a1, long long *a2, uint64_t a3, double a4)
{
  *(void *)(a1 + 136) = a3;
  int v6 = *(_DWORD *)(a1 + 44);
  if (v6) {
    int v6 = *(_DWORD *)(*(void *)(a1 + 32) + 4 * (v6 - 1));
  }
  int v7 = *(_DWORD *)(a1 + 68);
  do
  {
    int v8 = v6;
    switch(v6)
    {
      case 0:
        NovaHost::NovaButtonStateMachine::_processIdle(a1, (uint64_t)a2);
        break;
      case 1:
        a4 = NovaHost::NovaButtonStateMachine::_processEngaged(a1, (uint64_t)a2, a4);
        break;
      case 2:
        a4 = NovaHost::NovaButtonStateMachine::_processMaybeIntermediate(a1, (uint64_t)a2);
        break;
      case 3:
        a4 = NovaHost::NovaButtonStateMachine::_processIntermediate(a1, (uint64_t)a2);
        break;
      case 4:
        if (!*(unsigned char *)(a1 + 144)) {
          a4 = NovaHost::NovaButtonStateMachine::_exitStage(a1, (uint64_t)a2);
        }
        break;
      default:
        break;
    }
    int v6 = *(_DWORD *)(a1 + 44);
    if (v6) {
      int v6 = *(_DWORD *)(*(void *)(a1 + 32) + 4 * (v6 - 1));
    }
  }
  while (v8 != v6);
  int v9 = *(_DWORD *)(a1 + 92);
  if (v9 && v8 && v7 != v9 && *(_DWORD *)(*(void *)(a1 + 80) + 40 * (v9 - 1) + 28) == 2
    || v7 == v9 && NovaHost::NovaButtonStateMachine::_shouldGenerateEvent(a1, (uint64_t)a2))
  {
    NovaHost::NovaButtonStateMachine::_changeInSameStage(a1, (uint64_t)a2);
  }
  long long v10 = *a2;
  *(_OWORD *)(a1 + 120) = a2[1];
  *(_OWORD *)(a1 + 104) = v10;
  return 1;
}

void NovaHost::NovaButtonStateMachine::_processIdle(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 144))
  {
    int v3 = 4;
LABEL_3:
    NovaHost::NovaButtonStateMachine::_enterStage((unsigned char **)a1, v3, a2);
    return;
  }
  if (*(unsigned char *)(a2 + 2)) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = *(float *)(a2 + 20) < 50.0;
  }
  if (!v4 || *(void *)(a1 + 112) && *(unsigned __int8 *)(a2 + 1) > *(unsigned __int8 *)(a1 + 105))
  {
    int v3 = 1;
    goto LABEL_3;
  }
}

double NovaHost::NovaButtonStateMachine::_processEngaged(uint64_t a1, uint64_t a2, double result)
{
  if (*(unsigned char *)(a1 + 144))
  {
    int v4 = 4;
    return NovaHost::NovaButtonStateMachine::_enterStage((unsigned char **)a1, v4, a2);
  }
  unsigned int v5 = *(unsigned __int8 *)(a2 + 1);
  if (v5 != 3)
  {
    LODWORD(result) = *(_DWORD *)(a2 + 20);
    if (v5 | *(unsigned __int8 *)(a2 + 2)) {
      BOOL v6 = 0;
    }
    else {
      BOOL v6 = *(float *)&result < 50.0;
    }
    if (v6)
    {
      return NovaHost::NovaButtonStateMachine::_exitStage(a1, a2);
    }
    else if (*(void *)(a1 + 112) && v5 > *(unsigned __int8 *)(a1 + 105))
    {
      int v4 = 2;
      return NovaHost::NovaButtonStateMachine::_enterStage((unsigned char **)a1, v4, a2);
    }
  }
  return result;
}

double NovaHost::NovaButtonStateMachine::_processMaybeIntermediate(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 144))
  {
    int v3 = 4;
    return NovaHost::NovaButtonStateMachine::_enterStage((unsigned char **)a1, v3, a2);
  }
  unsigned int v4 = *(unsigned __int8 *)(a2 + 1);
  if (v4 != 3)
  {
    if (*(unsigned char *)(a2 + 1))
    {
      if (*(void *)(a1 + 112) && v4 >= 2 && v4 > *(unsigned __int8 *)(a1 + 105))
      {
        int v3 = 3;
        return NovaHost::NovaButtonStateMachine::_enterStage((unsigned char **)a1, v3, a2);
      }
    }
    else
    {
      return NovaHost::NovaButtonStateMachine::_exitStage(a1, a2);
    }
  }
  return result;
}

double NovaHost::NovaButtonStateMachine::_processIntermediate(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 144)) {
    return NovaHost::NovaButtonStateMachine::_enterStage((unsigned char **)a1, 4, a2);
  }
  if (*(unsigned __int8 *)(a2 + 1) <= 1u) {
    return NovaHost::NovaButtonStateMachine::_exitStage(a1, a2);
  }
  return result;
}

BOOL NovaHost::NovaButtonStateMachine::_shouldGenerateEvent(uint64_t a1, uint64_t a2)
{
  if (*(float *)(a2 + 4) != 0.0
    || *(unsigned __int8 *)(a1 + 106) != *(unsigned __int8 *)(a2 + 2)
    || vabds_f32(*(float *)(a2 + 24), *(float *)(a1 + 152)) > 0.1
    || *(_DWORD *)(a1 + 132) != *(_DWORD *)(a2 + 28))
  {
    return 1;
  }
  if (*(_DWORD *)(a1 + 44))
  {
    float v2 = *(float *)(a2 + 20);
    if (v2 >= 50.0) {
      return vabds_f32(v2, *(float *)(a1 + 148)) > 5.0;
    }
  }
  return 0;
}

double NovaHost::NovaButtonStateMachine::_changeInSameStage(uint64_t a1, uint64_t a2)
{
  unsigned int v4 = SALoggingGeneral();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    NovaHost::NovaButtonStateMachine::_changeInSameStage(a1, v4);
  }
  int v5 = *(_DWORD *)(a1 + 44);
  if (v5) {
    int v6 = *(_DWORD *)(*(void *)(a1 + 32) + 4 * (v5 - 1));
  }
  else {
    int v6 = 0;
  }
  return NovaHost::NovaButtonStateMachine::_createEvent(a1, a2, v6, 0);
}

uint64_t NovaHost::NovaButtonStateMachine::setFullPressState(uint64_t this, char a2)
{
  *(unsigned char *)(this + 144) = a2;
  return this;
}

uint64_t NovaHost::NovaButtonStateMachine::clearHIDEvents(uint64_t this)
{
  if (*(_DWORD *)(this + 68)) {
    *(_DWORD *)(this + 68) = 0;
  }
  if (*(_DWORD *)(this + 92)) {
    *(_DWORD *)(this + 92) = 0;
  }
  return this;
}

void NovaHost::NovaButtonStateMachine::cleanup(NovaHost::NovaButtonStateMachine *this)
{
  float v2 = SALoggingGeneral();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    NovaHost::NovaButtonStateMachine::cleanup(v2);
  }
  *(_OWORD *)((char *)this + 120) = 0u;
  *(_OWORD *)((char *)this + 104) = 0u;
  *((unsigned char *)this + 145) = 1;
  memset(v3, 0, sizeof(v3));
  while (*((_DWORD *)this + 11))
    NovaHost::NovaButtonStateMachine::_exitStage((uint64_t)this, (uint64_t)v3);
  *((unsigned char *)this + 145) = 0;
}

double NovaHost::NovaButtonStateMachine::_exitStage(uint64_t a1, uint64_t a2)
{
  int v4 = *(_DWORD *)(a1 + 44);
  int v5 = *(_DWORD *)(*(void *)(a1 + 32) + 4 * (v4 - 1));
  if (v4) {
    *(_DWORD *)(a1 + 44) = v4 - 1;
  }
  int v6 = SALoggingGeneral();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    NovaHost::NovaButtonStateMachine::_exitStage();
  }
  if (v5 != 2 || **(unsigned char **)a1) {
    return NovaHost::NovaButtonStateMachine::_createEvent(a1, a2, v5, 2);
  }
  return result;
}

double NovaHost::NovaButtonStateMachine::_enterStage(unsigned char **a1, int a2, uint64_t a3)
{
  int v7 = a2;
  int v5 = SALoggingGeneral();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    NovaHost::NovaButtonStateMachine::_enterStage();
  }
  SAList<NovaForceStage>::push_back((uint64_t)(a1 + 4), &v7);
  if (v7 != 2 || **a1) {
    return NovaHost::NovaButtonStateMachine::_createEvent((uint64_t)a1, a3, v7, 1);
  }
  return result;
}

uint64_t SAList<NovaForceStage>::push_back(uint64_t a1, _DWORD *a2)
{
  uint64_t result = *(void *)a1;
  if (!result)
  {
    uint64_t result = operator new(4 * *(unsigned int *)(a1 + 8), *(unsigned __int8 *)(a1 + 16));
    *(void *)a1 = result;
  }
  *(_DWORD *)(result + 4 * (*(_DWORD *)(a1 + 12))++) = *a2;
  return result;
}

double NovaHost::NovaButtonStateMachine::_createEvent(uint64_t a1, uint64_t a2, int a3, int a4)
{
  if (*(unsigned char *)(a1 + 145))
  {
    LOBYTE(v8) = 0;
    __int16 v9 = 8;
LABEL_3:
    *(unsigned char *)(a1 + 156) = v8;
    goto LABEL_4;
  }
  int v8 = *(_DWORD *)(a1 + 44);
  if (*(unsigned char *)(a1 + 156))
  {
    if (!v8)
    {
      __int16 v9 = 4;
      goto LABEL_3;
    }
    __int16 v9 = 2;
  }
  else
  {
    if (v8)
    {
      LOBYTE(v8) = 1;
      __int16 v9 = 1;
      goto LABEL_3;
    }
    __int16 v9 = 0;
  }
LABEL_4:
  uint64_t v10 = a1 + 56;
  int v11 = *(_DWORD *)(a1 + 68);
  if (v11)
  {
    uint64_t v12 = *(void *)(a1 + 56);
    uint64_t v13 = (v11 - 1);
    uint64_t v14 = *(void *)(v12 + 32 * v13);
    uint64_t v15 = *(void *)(a1 + 136);
    if (v14 == v15)
    {
      *(_DWORD *)(v12 + 32 * v13 + 12) = 0;
      uint64_t v15 = v14;
    }
  }
  else
  {
    uint64_t v15 = *(void *)(a1 + 136);
  }
  uint64_t v30 = v15;
  float v31 = *(float *)(a2 + 16) * 0.061275;
  float v16 = *(float *)(a2 + 28);
  float v17 = *(float *)(a2 + 4);
  if (**(unsigned char **)(a1 + 24)) {
    BOOL v18 = (*(_DWORD *)(a2 + 28) & 1) == 0;
  }
  else {
    BOOL v18 = 0;
  }
  if (v18) {
    float v17 = v17 * 0.5;
  }
  int v19 = *(_DWORD *)(a2 + 24);
  float v32 = v17 * 0.061275;
  int v33 = v19;
  float v34 = v16;
  LOWORD(v35) = v9;
  HIWORD(v35) = *(unsigned __int8 *)(a2 + 2);
  int v36 = 0;
  SAList<TouchSensitiveButtonEventPacket>::push_back(v10, (uint64_t)&v30);
  float v20 = *(float *)(a2 + 20);
  if (a3 == 3)
  {
    int v22 = **(int **)(a1 + 8);
    float v23 = **(float **)(a1 + 16);
    float v21 = NAN;
  }
  else if (a3 == 2)
  {
    float v21 = (float)(v20 * 0.001) + 0.001;
    int v22 = **(int **)(a1 + 8);
    float v23 = **(float **)(a1 + 16);
  }
  else
  {
    if (a3 == 1)
    {
      float v21 = **(float **)(a1 + 8);
      *(float *)&int v22 = 0.05;
    }
    else
    {
      *(float *)&int v22 = NAN;
      float v21 = NAN;
    }
    float v23 = *(float *)&v22;
  }
  float v24 = v20 * 0.001;
  BOOL v25 = v20 < 50.0;
  float v26 = 0.0;
  if (!v25) {
    float v26 = v24;
  }
  if (v26 > v21) {
    float v21 = v26;
  }
  if (v26 >= v23 || a4 == 2) {
    float v28 = v23;
  }
  else {
    float v28 = v26;
  }
  uint64_t v30 = *(void *)(a1 + 136);
  float v31 = v26;
  float v32 = v21;
  int v33 = v22;
  float v34 = v28;
  int v35 = a3;
  int v36 = a4;
  __int16 v37 = v9;
  int v38 = 0;
  __int16 v39 = 0;
  SAList<ForceStageEventPacket>::push_back(a1 + 80, (uint64_t)&v30);
  double result = *(double *)(a2 + 20);
  *(double *)(a1 + 148) = result;
  return result;
}

__n128 SAList<TouchSensitiveButtonEventPacket>::push_back(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a1;
  if (!v4)
  {
    uint64_t v4 = operator new(32 * *(unsigned int *)(a1 + 8), *(unsigned __int8 *)(a1 + 16));
    *(void *)a1 = v4;
  }
  int v5 = (_OWORD *)(v4 + 32 * *(unsigned int *)(a1 + 12));
  __n128 result = *(__n128 *)a2;
  long long v7 = *(_OWORD *)(a2 + 16);
  _OWORD *v5 = *(_OWORD *)a2;
  v5[1] = v7;
  ++*(_DWORD *)(a1 + 12);
  return result;
}

__n128 SAList<ForceStageEventPacket>::push_back(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a1;
  if (!v4)
  {
    uint64_t v4 = operator new(40 * *(unsigned int *)(a1 + 8), *(unsigned __int8 *)(a1 + 16));
    *(void *)a1 = v4;
  }
  uint64_t v5 = v4 + 40 * *(unsigned int *)(a1 + 12);
  __n128 result = *(__n128 *)a2;
  long long v7 = *(_OWORD *)(a2 + 16);
  *(void *)(v5 + 32) = *(void *)(a2 + 32);
  *(__n128 *)uint64_t v5 = result;
  *(_OWORD *)(v5 + 16) = v7;
  ++*(_DWORD *)(a1 + 12);
  return result;
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x12u);
}

void NovaHost::NovaButtonStateMachine::_changeInSameStage(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 136);
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_25BF2A000, a2, OS_LOG_TYPE_DEBUG, "[NovaButtonStateMachine] %llu: change in same stage event", (uint8_t *)&v3, 0xCu);
}

void NovaHost::NovaButtonStateMachine::cleanup(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_25BF2A000, log, OS_LOG_TYPE_DEBUG, "[NovaButtonStateMachine] Cleaning up", v1, 2u);
}

void NovaHost::NovaButtonStateMachine::_exitStage()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_25BF2A000, v0, v1, "[NovaButtonStateMachine] %llu: exit stage %u", v2, v3);
}

void NovaHost::NovaButtonStateMachine::_enterStage()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_25BF2A000, v0, v1, "[NovaButtonStateMachine] %llu: enter stage %u", v2, v3);
}

uint64_t NovaHost::LiftoffVelocityCalculator::update(NovaHost::LiftoffVelocityCalculator *this, TouchSensitiveButtonEventPacket *a2, ForceStageEventPacket *a3)
{
  a2->var8 = 0.0;
  p_var8 = &a2->var8;
  uint64_t v5 = (void *)((char *)this + 168);
  uint64_t v6 = *((void *)this + 21);
  unsigned int v7 = a2->var4 & 0x38;
  if (!a2->var6)
  {
    float v21 = 0.0;
    if (v7) {
      BOOL v22 = 0;
    }
    else {
      BOOL v22 = v6 == 0;
    }
    if (v22) {
      float v21 = NovaHost::LiftoffVelocityCalculator::_filteredVelocity(this);
    }
    float *p_var8 = v21;
    *(_OWORD *)((char *)this + 169) = 0u;
    *((_OWORD *)this + 9) = 0u;
    *((_OWORD *)this + 10) = 0u;
    float v23 = SALoggingGeneral();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      NovaHost::LiftoffVelocityCalculator::update((uint64_t)p_var8);
    }
    return 1;
  }
  if (!*((unsigned char *)this + 184))
  {
    *((unsigned char *)this + 184) = 1;
    *((_DWORD *)this + 47) = 0;
    float var1 = a2->var1;
    *((float *)this + 50) = var1;
    *((_DWORD *)this + 49) = 0;
    NovaHost::LiftoffVelocityCalculator::_pushSample((uint64_t)this, var1, 0.0, a2->var0);
  }
  if (!*((void *)this + 19)) {
    return 0;
  }
  int v11 = (char *)this + 24 * ((*((void *)this + 18) + 5) % 6uLL);
  float v12 = a2->var1;
  float v13 = *(float *)v11;
  float v14 = v12 - *(float *)v11;
  float v15 = NovaHost::LiftoffVelocityCalculator::_filteredVelocity(this);
  unsigned int var4 = a2->var4;
  float v17 = v14 * *((float *)this + 49);
  *((float *)this + 49) = v14;
  float v18 = vabds_f32(v12, v13);
  float v19 = (float)(a2->var0 - *((void *)v11 + 1));
  if (v18 < (float)((float)(v19 * 0.05) / 1000000.0) || (v17 >= -0.00001 ? (BOOL v20 = v7 == 0) : (BOOL v20 = 0), !v20))
  {
    *((float *)this + 50) = v12;
    if ((var4 & 4) != 0) {
      goto LABEL_22;
    }
LABEL_12:
    *((float *)this + 48) = v18;
    goto LABEL_33;
  }
  if ((var4 & 4) == 0) {
    goto LABEL_12;
  }
LABEL_22:
  if (vabds_f32(v12, *((float *)this + 50)) >= 0.05)
  {
    float v24 = *((float *)this + 48) * 1.5;
  }
  else
  {
    *((_DWORD *)this + 48) = 0;
    float v24 = 0.0;
  }
  float v25 = -v24;
  if (v14 > (float)-v24) {
    float v25 = v14;
  }
  if (v14 < v24) {
    float v24 = v14;
  }
  if (v14 >= 0.0) {
    float v14 = v24;
  }
  else {
    float v14 = v25;
  }
  a2->var2 = v14;
LABEL_33:
  BOOL v27 = (var4 & 4) == 0 || v6 == 0;
  if (v7 || !v27)
  {
    uint64_t v30 = SALoggingGeneral();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
      NovaHost::LiftoffVelocityCalculator::update(v30);
    }
    uint64_t v31 = *((void *)this + 19);
    if (v31)
    {
      float v32 = (_DWORD *)((char *)this + 4);
      do
      {
        *float v32 = 0;
        v32 += 6;
        --v31;
      }
      while (v31);
    }
    float v14 = 0.0;
    if (v7) {
      a2->var2 = 0.0;
    }
  }
  else if ((var4 & 4) != 0 && !v6)
  {
    float v28 = (float)(v15 * v19) / 1000000.0;
    if (fabsf(v28) < fabsf(v14))
    {
      v29 = SALoggingGeneral();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
        NovaHost::LiftoffVelocityCalculator::update();
      }
      float v14 = v28;
    }
  }
  NovaHost::LiftoffVelocityCalculator::_pushSample((uint64_t)this, a2->var1, v14, a2->var0);
  uint64_t v33 = *((void *)this + 19);
  if (!v33) {
    return 0;
  }
  float v34 = (float *)(v5 - 1);
  int v35 = (char *)this + 24 * ((*((void *)this + 18) + 5) % 6uLL);
  unint64_t v36 = *((void *)v35 + 2);
  if (v36 <= 0xA) {
    unint64_t v36 = 10;
  }
  float v37 = (float)(*((float *)v35 + 1) / (float)v36) * 1000000.0;
  if (fabsf(v37) < 0.48387 || v17 < -0.00001)
  {
    if (!v6) {
      *((float *)this + 47) = v14 + *((float *)this + 47);
    }
  }
  else
  {
    unsigned int var5 = a3->var5;
    if (v6)
    {
      if (var5 != 4)
      {
        float v39 = 0.0;
        if (vabds_f32(*(float *)v35, *v34) <= 0.096774) {
          goto LABEL_84;
        }
        *((_DWORD *)this + 47) = 0;
        void *v5 = 0;
        v5[1] = 0;
        *(void *)float v34 = 0;
        v40 = SALoggingGeneral();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
          NovaHost::LiftoffVelocityCalculator::update(v40);
        }
        goto LABEL_83;
      }
    }
    else
    {
      *((float *)this + 47) = v14 + *((float *)this + 47);
      if (var5 != 4) {
        goto LABEL_83;
      }
    }
  }
  *(_OWORD *)float v34 = *(_OWORD *)v35;
  v5[1] = *((void *)v35 + 2);
  v42 = (_DWORD *)((char *)this + 4);
  do
  {
    _DWORD *v42 = 0;
    v42 += 6;
    --v33;
  }
  while (v33);
  float v43 = *((float *)this + 47);
  BOOL v44 = v43 >= -0.1 || v37 <= 0.00001;
  float v39 = 0.0;
  if (v44) {
    float v45 = 0.0;
  }
  else {
    float v45 = 0.05;
  }
  BOOL v46 = v43 > 0.1 && v37 < -0.00001;
  float v47 = -0.05;
  if (!v46) {
    float v47 = v45;
  }
  *((float *)this + 40) = *((float *)this + 40) + v47;
  v48 = SALoggingGeneral();
  if (!os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
  {
    if (v6) {
      goto LABEL_84;
    }
    goto LABEL_83;
  }
  NovaHost::LiftoffVelocityCalculator::update((uint64_t)(v5 - 1));
  if (!v6) {
LABEL_83:
  }
    float v39 = NovaHost::LiftoffVelocityCalculator::_filteredVelocity(this);
LABEL_84:
  float *p_var8 = v39;
  v49 = SALoggingGeneral();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG)) {
    NovaHost::LiftoffVelocityCalculator::update((uint64_t)p_var8);
  }
  return 1;
}

float NovaHost::LiftoffVelocityCalculator::_filteredVelocity(NovaHost::LiftoffVelocityCalculator *this)
{
  unint64_t v1 = *((void *)this + 19);
  if (v1)
  {
    uint64_t v2 = (unint64_t *)((char *)this + 16);
    float v3 = 0.0;
    uint64_t v4 = *((void *)this + 19);
    do
    {
      unint64_t v5 = *v2;
      if (*v2 <= 0xA) {
        unint64_t v5 = 10;
      }
      float v3 = v3 + (float)((float)(*((float *)v2 - 3) / (float)v5) * 1000000.0);
      v2 += 3;
      --v4;
    }
    while (v4);
  }
  else
  {
    float v3 = 0.0;
  }
  return v3 / (float)v1;
}

uint64_t NovaHost::LiftoffVelocityCalculator::_pushSample(uint64_t this, float a2, float a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(this + 144);
  unint64_t v4 = *(void *)(this + 152);
  if (v4) {
    uint64_t v6 = a4 - *(void *)(this + 24 * ((v5 + 5) % 6uLL) + 8);
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = this + 24 * v5;
  *(float *)uint64_t v7 = a2;
  *(float *)(v7 + 4) = a3;
  *(void *)(v7 + 8) = a4;
  *(void *)(v7 + 16) = v6;
  *(void *)(this + 144) = (v5 + 1) % 6uLL;
  if (v4 <= 5) {
    *(void *)(this + 152) = v4 + 1;
  }
  return this;
}

void OUTLINED_FUNCTION_0_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

double OUTLINED_FUNCTION_1_1@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(v2 - 8) = a2;
  return *(float *)a1;
}

void NovaHost::LiftoffVelocityCalculator::update(uint64_t a1)
{
  OUTLINED_FUNCTION_1_1(a1, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3(&dword_25BF2A000, v1, v2, "[LiftoffVelocity] Break touch received; liftoff velocity:%f",
    v3,
    v4,
    v5,
    v6,
    v7);
}

{
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_1_1(a1, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3(&dword_25BF2A000, v1, v2, "[LiftoffVelocity] Filtered Velocity:%f", v3, v4, v5, v6, v7);
}

{
  uint64_t v1;
  os_log_t v2;
  uint8_t v3[12];
  __int16 v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_1(a1, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  uint64_t v4 = 2048;
  uint64_t v5 = v1;
  _os_log_debug_impl(&dword_25BF2A000, v2, OS_LOG_TYPE_DEBUG, "[LiftoffVelocity] Set new deadzone at pos:%f, TS:%llu", v3, 0x16u);
}

void NovaHost::LiftoffVelocityCalculator::update(os_log_t log)
{
  *(_WORD *)unint64_t v1 = 0;
  _os_log_debug_impl(&dword_25BF2A000, log, OS_LOG_TYPE_DEBUG, "[LiftoffVelocity] Exit deadzone", v1, 2u);
}

{
  uint8_t v1[16];

  *(_WORD *)unint64_t v1 = 0;
  _os_log_debug_impl(&dword_25BF2A000, log, OS_LOG_TYPE_DEBUG, "[LiftoffVelocity] Resetting velocities due to scroll rejection", v1, 2u);
}

void NovaHost::LiftoffVelocityCalculator::update()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3(&dword_25BF2A000, v0, v1, "[LiftoffVelocity] Clamping delta to %f", v2, v3, v4, v5, v6);
}

char **SANovaHostVersionDescriptor(void)
{
  return &SensingAlgsNovaHostDetailedVersionDescriptor;
}

uint64_t NovaHost::Interpolator<float>::reset_state(uint64_t result, unint64_t a2, float a3)
{
  *(double *)(result + 64) = (double)a2;
  *(double *)(result + 72) = (double)a2;
  *(float *)(result + 80) = a3;
  *(float *)(result + 84) = a3;
  *(_DWORD *)(result + 88) = 0;
  return result;
}

BOOL NovaHost::Interpolator<float>::run(uint64_t a1, uint64_t a2, float a3)
{
  if (*(_DWORD *)(a1 + 28)) {
    *(_DWORD *)(a1 + 28) = 0;
  }
  if (*(_DWORD *)(a1 + 52)) {
    *(_DWORD *)(a1 + 52) = 0;
  }
  double v6 = (double)(unint64_t)a2;
  uint8_t v7 = (double *)(a1 + 72);
  double v8 = *(double *)(a1 + 72);
  if (v8 <= (double)(unint64_t)a2)
  {
    float v11 = a3;
    if (!*(unsigned char *)(a1 + 8)) {
      float v11 = a3 - *(float *)(a1 + 80);
    }
    double v12 = 1000000.0 / **(double **)a1;
    double v13 = *(double *)(a1 + 64);
    float v14 = v11 + *(float *)(a1 + 88);
    double v15 = v12 + v13;
    if (v12 + v13 > v6)
    {
LABEL_21:
      *(float *)(a1 + 88) = v14;
      *(float *)(a1 + 80) = a3;
      BOOL result = 1;
      *(double *)(a1 + 72) = v6;
      return result;
    }
    double v16 = v6 - v8;
    double v17 = v11;
    while (*(_DWORD *)(a1 + 28) < *(_DWORD *)(a1 + 24) && *(_DWORD *)(a1 + 52) < *(_DWORD *)(a1 + 48))
    {
      double v18 = *(double *)(a1 + 72);
      if (v13 >= v18) {
        double v19 = v12;
      }
      else {
        double v19 = v15 - v18;
      }
      float v20 = *(float *)(a1 + 88) + v17 * (v19 / v16);
      float v23 = v20;
      *(_DWORD *)(a1 + 88) = 0;
      if (*(unsigned char *)(a1 + 8))
      {
        SAList<NovaForceStage>::push_back(a1 + 16, &v23);
      }
      else
      {
        *(float *)&unint64_t v22 = *(float *)(a1 + 84) + v20;
        SAList<NovaForceStage>::push_back(a1 + 16, &v22);
        *(_DWORD *)(a1 + 84) = v22;
      }
      float v14 = v14 - v20;
      unint64_t v22 = (unint64_t)v15;
      SAList<std::reference_wrapper<AlgDataNode>>::push_back(a1 + 40, &v22);
      *(double *)(a1 + 64) = v15;
      double v13 = v15;
      double v15 = v12 + v15;
      if (v15 > v6) {
        goto LABEL_21;
      }
    }
    float v21 = SALoggingGeneral();
    BOOL result = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (result)
    {
      NovaHost::Interpolator<float>::run(v21);
      return 0;
    }
  }
  else
  {
    uint64_t v9 = SALoggingGeneral();
    BOOL result = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (result)
    {
      NovaHost::Interpolator<float>::run(v7, a2, v9);
      return 0;
    }
  }
  return result;
}

void NovaHost::Interpolator<float>::run(double *a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  unint64_t v3 = (unint64_t)*a1;
  int v4 = 134218240;
  unint64_t v5 = v3;
  __int16 v6 = 2048;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_25BF2A000, log, OS_LOG_TYPE_ERROR, "Timestamps going backwards! %llu -> %llu", (uint8_t *)&v4, 0x16u);
}

void NovaHost::Interpolator<float>::run(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_25BF2A000, log, OS_LOG_TYPE_ERROR, "Interpolation buffer overflow", v1, 2u);
}

uint64_t SALoggingGeneral()
{
  if (qword_26A583C40 != -1) {
    dispatch_once(&qword_26A583C40, &__block_literal_global_0);
  }
  return _MergedGlobals_0;
}

os_log_t __SALoggingGeneral_block_invoke()
{
  os_log_t result = os_log_create("com.apple.SensingAlgs", "General");
  _MergedGlobals_0 = (uint64_t)result;
  return result;
}

uint64_t SALoggingHIDEventSignpost()
{
  if (qword_26A583C50 != -1) {
    dispatch_once(&qword_26A583C50, &__block_literal_global_17);
  }
  return qword_26A583C48;
}

os_log_t __SALoggingHIDEventSignpost_block_invoke()
{
  os_log_t result = os_log_create("com.apple.SensingAlgs", "HIDEventSignpost");
  qword_26A583C48 = (uint64_t)result;
  return result;
}

uint64_t AlgsDevice::newPlanNode(AlgsDevice *this)
{
  return 1;
}

BOOL AlgsDevice::injExtWith(AlgsDevice *this, AlgDataInjector *a2, AlgDataExtractor *a3, void *a4, unint64_t *a5)
{
  uint64_t v9 = (AlgsDevice::StreamingClient *)OUTLINED_FUNCTION_31((uint64_t)this);
  if (v11) {
    uint64_t v12 = *v5;
  }
  else {
    uint64_t v12 = 0;
  }
  AlgsDevice::StreamingClient::setBuffer(v9, v10, v12);
  BOOL v13 = AlgsDevice::injExtWith(v6, v8, v7);
  uint64_t v14 = AlgsDevice::StreamingClient::resetBuffer(*(AlgsDevice::StreamingClient **)(v6 + 64));
  if (v5) {
    uint64_t *v5 = v14;
  }
  return v13;
}

BOOL AlgsDevice::injExtWith(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_29();
  for (uint64_t i = 32; i != 48; i += 8)
  {
    if (*(void *)(v4 + i))
    {
      OUTLINED_FUNCTION_1_2();
      (*(void (**)(void))(v7 + 24))();
    }
  }
  OUTLINED_FUNCTION_39();
  uint64_t v9 = v8();
  int v10 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void, void, uint64_t))(*(void *)v9 + 40))(v9, v3, a3, 0, 0, 1);
  for (uint64_t j = 0; j != 16; j += 8)
  {
    if (*(void *)(v4 + 32 + j))
    {
      OUTLINED_FUNCTION_1_2();
      (*(void (**)(void))(v12 + 32))();
    }
  }
  return v10 == 0;
}

BOOL AlgsDevice::runPlan(uint64_t a1)
{
  uint64_t v3 = (AlgsDevice::StreamingClient *)OUTLINED_FUNCTION_31(a1);
  if (v5) {
    uint64_t v6 = *v1;
  }
  else {
    uint64_t v6 = 0;
  }
  AlgsDevice::StreamingClient::setBuffer(v3, v4, v6);
  BOOL v7 = AlgsDevice::run(v2);
  uint64_t v8 = AlgsDevice::StreamingClient::resetBuffer(*(AlgsDevice::StreamingClient **)(v2 + 64));
  if (v1) {
    uint64_t *v1 = v8;
  }
  return v7;
}

BOOL AlgsDevice::run(uint64_t a1)
{
  for (uint64_t i = 32; i != 48; i += 8)
  {
    if (*(void *)(a1 + i))
    {
      OUTLINED_FUNCTION_1_2();
      OUTLINED_FUNCTION_18();
      v3();
    }
  }
  uint64_t v4 = *(void *)(a1 + 56);
  SAList<unsigned char>::clear(v4 + 56);
  for (unsigned int j = 0; *(_DWORD *)(v4 + 20) > j; ++j)
  {
    char v15 = j;
    SAList<unsigned char>::push_back(v4 + 56, &v15);
  }
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_39();
  v6();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_18();
  int v8 = v7();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_39();
  int v10 = (AlgWorkNode *)v9();
  AlgWorkNode::resetInjectionState(v10);
  uint64_t v11 = 0;
  uint64_t v12 = a1 + 32;
  while (v11 != 16)
  {
    if (*(void *)(v12 + v11))
    {
      OUTLINED_FUNCTION_1_2();
      (*(void (**)(void))(v13 + 32))();
    }
    v11 += 8;
  }
  return v8 == 0;
}

BOOL AlgsDevice::runPlan(AlgsDevice *this, AlgDataInjector *a2, AlgDataExtractor *a3)
{
  OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_1_2();
  uint64_t v6 = (*(uint64_t (**)(void))(v5 + 48))();
  BOOL v7 = (*(unsigned int (**)(uint64_t, uint64_t, AlgDataExtractor *))(*(void *)v6 + 48))(v6, v3, a3) == 0;
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_39();
  uint64_t v9 = (AlgWorkNode *)v8();
  AlgWorkNode::resetInjectionState(v9);
  return v7;
}

uint64_t AlgsDevice::AlgsDevice(uint64_t a1, uint64_t a2, uint64_t a3, int a4, char a5, const char *a6, char a7)
{
  *(void *)a1 = &unk_27096D8B8;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = a3;
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 32) = 0;
  uint64_t v13 = operator new(96, 1);
  *(void *)(a1 + 56) = AlgDataExtractor::AlgDataExtractor(v13, 0, 1);
  uint64_t v14 = operator new(152, a2);
  *(void *)uint64_t v14 = &unk_27096DA58;
  *(void *)(v14 + 8) = 0;
  *(_WORD *)(v14 + 16) = 256;
  *(void *)(v14 + 24) = 0;
  *(void *)(v14 + 32) = a1;
  StreamingWriter::StreamingWriter(v14 + 40, 0, 0, 0);
  *(void *)(v14 + 88) = 0;
  *(unsigned char *)(v14 + 97) = 0;
  *(void *)(v14 + 104) = 0;
  *(void *)(v14 + 112) = 0;
  *(unsigned char *)(v14 + 120) = a2;
  *(unsigned char *)(v14 + 128) = 0;
  *(void *)(v14 + 136) = 0;
  *(unsigned char *)(v14 + 144) = a2;
  AlgDataExtractor::AlgDataExtractor((uint64_t)v17, 0, 1);
  AlgsDevice::StreamingClient::configure((AlgsDevice::StreamingClient *)v14, 0, (AlgDataExtractor *)v17);
  PacketCollection::~PacketCollection((PacketCollection *)v17);
  *(void *)(a1 + 64) = v14;
  *(void *)(a1 + 80) = 0;
  *(void *)(a1 + 88) = 16;
  *(unsigned char *)(a1 + 96) = 0;
  *(void *)(a1 + 104) = 0;
  *(unsigned char *)(a1 + 112) = a7;
  *(unsigned char *)(a1 + 76) = a5;
  *(_DWORD *)(a1 + 72) = a4;
  *(unsigned char *)(a1 + 77) = 0;
  if (a6) {
    char v15 = a6;
  }
  else {
    char v15 = (const char *)&unk_25BF3A7A3;
  }
  AlgsDevice::addVersion((AlgsDevice *)a1, v15);
  return a1;
}

void sub_25BF33B88(_Unwind_Exception *a1)
{
  SAList<char const*>::~SAList(v1);
  _Unwind_Resume(a1);
}

uint64_t AlgsDevice::addVersion(AlgsDevice *this, const char *a2)
{
  uint64_t v3 = a2;
  if (!a2 || !*a2) {
    return 0;
  }
  SAList<char const*>::push_back((uint64_t)this + 80, &v3);
  return 1;
}

uint64_t SAList<char const*>::~SAList(uint64_t a1)
{
  if (OUTLINED_FUNCTION_3_0(a1)) {
    OUTLINED_FUNCTION_0_4();
  }
  return v1;
}

void SAList<char const*>::push_back(uint64_t a1, void *a2)
{
  uint64_t v4 = OUTLINED_FUNCTION_3_0(a1);
  if (!v4)
  {
    uint64_t v4 = operator new(8 * *(unsigned int *)(v2 + 8), *(unsigned __int8 *)(v2 + 16));
    *(void *)uint64_t v2 = v4;
  }
  *(void *)(v4 + 8 * *(unsigned int *)(v2 + 12)) = *a2;
  OUTLINED_FUNCTION_5_0();
}

void AlgsDevice::~AlgsDevice(AlgsDevice *this)
{
  *(void *)this = &unk_27096D8B8;
  if (*((void *)this + 7))
  {
    OUTLINED_FUNCTION_1_2();
    (*(void (**)(void))(v2 + 8))();
  }
  if (*((void *)this + 8))
  {
    OUTLINED_FUNCTION_1_2();
    (*(void (**)(void))(v3 + 8))();
  }
  SAList<char const*>::~SAList((uint64_t)this + 80);
}

void AlgsDevice::handleInputStream(AlgsDevice *this, const void *a2, unint64_t a3, void *a4, unint64_t *a5, unsigned __int8 *a6, unsigned __int16 *a7, const void **a8)
{
  OUTLINED_FUNCTION_11_0();
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  char v15 = v14;
  double v16 = v9;
  unint64_t v18 = v17;
  uint64_t v20 = v19;
  uint64_t v22 = v21;
  float v23 = *(AlgsDevice::StreamingClient **)(v21 + 64);
  if (v9) {
    uint64_t v24 = *v9;
  }
  else {
    uint64_t v24 = 0;
  }
  AlgsDevice::StreamingClient::setBuffer(v23, v8, v24);
  uint64_t v29 = *(void *)(v22 + 64);
  if (v15) {
    *char v15 = 0;
  }
  uint64_t v31 = (unsigned char *)(v29 + 128);
  char v30 = *(unsigned char *)(v29 + 128);
  uint64_t v32 = *(void *)(v29 + 136);
  uint64_t v110 = v29 + 128;
  uint64_t v111 = v20;
  uint64_t v113 = 0;
  uint64_t v114 = 0;
  uint64_t v112 = v18;
  LOBYTE(v115) = v30;
  uint64_t v116 = v32;
  if (v18 < 2 || *(unsigned char *)v20 != 1)
  {
LABEL_106:
    uint64_t v90 = 0;
    if (!v16) {
      goto LABEL_108;
    }
LABEL_107:
    uint64_t *v16 = v90;
    goto LABEL_108;
  }
  switch(*(unsigned char *)(v20 + 1))
  {
    case 1:
      v130 = (unint64_t *)&v127;
      long long v131 = 0u;
      long long v132 = 0u;
      long long v133 = 0u;
      uint64_t v113 = 2;
      uint64_t v114 = (uint64_t)&v130;
      if (v18 == 2) {
        goto LABEL_106;
      }
      uint64_t v33 = *(unsigned __int8 *)(v20 + 2);
      LOBYTE(v127) = *(unsigned char *)(v20 + 2);
      if (v18 == 3) {
        goto LABEL_13;
      }
      SABinaryParser::parseInfoData(&v111, (unsigned int (*)(uint64_t, void, void, void, void))StreamingParser::parseReset(unsigned char *,unsigned int *,unsigned char *,unsigned char *,SAList<char const*> *,BOOL *,AlgDataExtractor *)::$_0::__invoke, 0, 0);
      if (!v34) {
        goto LABEL_106;
      }
      uint64_t v33 = v127;
LABEL_13:
      uint64_t v35 = *(void *)(v29 + 32);
      OUTLINED_FUNCTION_22();
      (*(void (**)(uint64_t, uint64_t))(v36 + 40))(v35, v33);
      uint64_t v37 = 0;
      *(unsigned char *)(v35 + 77) = v33;
      uint64_t v38 = v35 + 32;
      while (v37 != 16)
      {
        if (*(void *)(v38 + v37))
        {
          OUTLINED_FUNCTION_1_2();
          (*(void (**)(void))(v39 + 16))();
        }
        v37 += 8;
      }
      goto LABEL_122;
    case 2:
      unint64_t v121 = 0;
      *(void *)v122 = 0;
      StreamingParser::numberOfPackets((StreamingParser *)&v110, (unint64_t *)v122, &v121, 0, v25, v26, v27, v28);
      if ((v52 & 1) == 0) {
        goto LABEL_106;
      }
      uint64_t v53 = *(void *)(v29 + 104);
      int v54 = *(_DWORD *)v122;
      if (v53)
      {
        int v54 = *(_DWORD *)v122 + *(_DWORD *)(v53 + 20);
        *(void *)v122 += *(unsigned int *)(v53 + 20);
      }
      v55 = AlgDataInjector::AlgDataInjector((uint64_t)&v127, v54, 1);
      OUTLINED_FUNCTION_37((uint64_t)v55, v121);
      StreamingParser::parseRun((uint64_t)&v110, (uint64_t)v117, (uint64_t)&v127, (uint64_t)&v130);
      if (v56)
      {
        AlgsDevice::StreamingClient::translate((AlgsDevice::StreamingClient *)v29, (PacketCollection *)&v127, (PacketCollection *)&v130);
        *(unsigned char *)(v29 + 97) = 1;
        AlgsDevice::run(*(void *)(v29 + 32));
        PacketCollection::~PacketCollection((PacketCollection *)&v130);
        v57 = &v127;
        goto LABEL_121;
      }
      PacketCollection::~PacketCollection((PacketCollection *)&v130);
      v80 = &v127;
      goto LABEL_105;
    case 3:
      unint64_t v120 = 0;
      unint64_t v121 = 0;
      unint64_t v119 = 0;
      StreamingParser::numberOfPackets((StreamingParser *)&v110, &v121, &v120, &v119, v25, v26, v27, v28);
      if ((v40 & 1) == 0) {
        goto LABEL_106;
      }
      uint64_t v41 = *(void *)(v29 + 104);
      int v42 = v121;
      if (v41)
      {
        int v42 = v121 + *(_DWORD *)(v41 + 20);
        v121 += *(unsigned int *)(v41 + 20);
      }
      float v43 = AlgDataInjector::AlgDataInjector((uint64_t)v117, v42, 1);
      OUTLINED_FUNCTION_37((uint64_t)v43, v120);
      AlgDataExtractor::AlgDataExtractor((uint64_t)&v127, v119, 1);
      *(void *)v122 = v29 + 88;
      v123 = v117;
      v124 = &v130;
      v125 = &v127;
      uint64_t v114 = (uint64_t)v122;
      SABinaryParser::parseInjExtFrame(&v111, (unsigned int (*)(uint64_t, void))StreamingParser::parseInjExt(unsigned long long *,AlgDataInjector *,AlgDataExtractor *,AlgDataExtractor *)::$_0::__invoke, (uint64_t)StreamingParser::parseInjExt(unsigned long long *,AlgDataInjector *,AlgDataExtractor *,AlgDataExtractor *)::$_1::__invoke, (uint64_t)StreamingParser::parseInjExt(unsigned long long *,AlgDataInjector *,AlgDataExtractor *,AlgDataExtractor *)::$_2::__invoke, (uint64_t (*)(void))StreamingParser::parseInjExt(unsigned long long *,AlgDataInjector *,AlgDataExtractor *,AlgDataExtractor *)::$_3::__invoke);
      char v45 = v44;
      if ((v44 & 1) == 0)
      {
        PacketCollection::~PacketCollection((PacketCollection *)&v127);
        PacketCollection::~PacketCollection((PacketCollection *)&v130);
        v80 = (unint64_t **)v117;
        goto LABEL_105;
      }
      uint64_t v46 = HIDWORD(v129);
      float v47 = (uint64_t *)(v128 + 72);
      if (HIDWORD(v129))
      {
        do
        {
          *(v47 - 1) = (uint64_t)AlgsDevice::StreamingClient::extraction;
          *float v47 = v29;
          --v46;
          v47 += 10;
        }
        while (v46);
      }
      AlgsDevice::StreamingClient::translate((AlgsDevice::StreamingClient *)v29, (PacketCollection *)v117, (PacketCollection *)&v130);
      *(unsigned char *)(v29 + 97) = 1;
      AlgsDevice::injExtWith(*(void *)(v29 + 32), (uint64_t)v117, (uint64_t)&v127);
      *(void *)(v29 + 88) = 0;
      PacketCollection::~PacketCollection((PacketCollection *)&v127);
      PacketCollection::~PacketCollection((PacketCollection *)&v130);
      PacketCollection::~PacketCollection((PacketCollection *)v117);
      if (v45) {
        goto LABEL_122;
      }
      goto LABEL_106;
    case 4:
      if (v18 - 5 >= 0xFFFFFFFFFFFFFFFDLL)
      {
        int v58 = 1;
        if (v15)
        {
          *char v15 = 1;
          int v58 = 0;
        }
        if (v13) {
          *uint64_t v13 = 0;
        }
      }
      else
      {
        int v58 = *(unsigned __int8 *)(v20 + 2);
        if (v15)
        {
          *char v15 = v58;
          int v58 = 0;
        }
        if (v13) {
          *uint64_t v13 = *(_WORD *)(v20 + 3);
        }
        if (v11) {
          *uint64_t v11 = v20 + 5;
        }
      }
      if (v15) {
        int v58 = *v15;
      }
      if (v13 && v58 == 1 && *v13 && *(unsigned __int8 *)*v11 == 255) {
        *(unsigned char *)*uint64_t v11 = *(unsigned char *)(*(void *)(v29 + 32) + 77);
      }
      goto LABEL_122;
    case 5:
      v122[0] = 0;
      LOBYTE(v121) = 0;
      *(void *)v117 = 0;
      StreamingParser::numberOfPackets((StreamingParser *)&v110, 0, 0, (unint64_t *)v117, v25, v26, v27, v28);
      if ((v48 & 1) == 0) {
        goto LABEL_106;
      }
      OUTLINED_FUNCTION_37(v48, *(int *)v117);
      v127 = &v121;
      v128 = v122;
      v129 = &v130;
      uint64_t v114 = (uint64_t)&v127;
      SABinaryParser::parseConfigure(&v111, (unsigned int (*)(uint64_t, BOOL))StreamingParser::parseConfigure(unsigned char *,BOOL *,AlgDataExtractor *)::$_0::__invoke, (uint64_t)StreamingParser::parseConfigure(unsigned char *,BOOL *,AlgDataExtractor *)::$_1::__invoke, (unsigned int (*)(uint64_t, uint64_t))StreamingParser::parseConfigure(unsigned char *,BOOL *,AlgDataExtractor *)::$_2::__invoke);
      if ((v50 & 1) == 0) {
        goto LABEL_104;
      }
      int v51 = v121;
      if (v121 <= 2u)
      {
        AlgsDevice::StreamingClient::configure((AlgsDevice::StreamingClient *)v29, v122[0], (AlgDataExtractor *)&v130);
        int v51 = v121;
      }
      if (v51 == 3 && HIDWORD(v131)) {
        StreamingWriter::writeConfigure((StreamingWriter *)(v29 + 40), v122[0], (AlgDataExtractor *)&v130, v49);
      }
      else {
        AlgsDevice::StreamingClient::configureStatus((AlgsDevice::StreamingClient *)v29);
      }
      goto LABEL_120;
    case 6:
      LODWORD(v121) = 0;
      LOBYTE(v120) = 0;
      LOBYTE(v119) = 0;
      __int16 v126 = 0;
      *(void *)v117 = 0;
      *(void *)&v117[8] = 16;
      v118[0] = 0;
      *(void *)v122 = 0;
      StreamingParser::numberOfPackets((StreamingParser *)&v110, 0, 0, (unint64_t *)v122, v25, v26, v27, v28);
      if ((v59 & 1) == 0)
      {
        SAList<char const*>::~SAList((uint64_t)v117);
        goto LABEL_106;
      }
      AlgDataExtractor::AlgDataExtractor((uint64_t)&v127, *(int *)v122, 1);
      v130 = &v120;
      *(void *)&long long v131 = &v121;
      *((void *)&v131 + 1) = &v119;
      *(void *)&long long v132 = (char *)&v126 + 1;
      *((void *)&v132 + 1) = v117;
      *(void *)&long long v133 = &v126;
      *((void *)&v133 + 1) = &v127;
      uint64_t v114 = (uint64_t)&v130;
      SABinaryParser::parseInfo(&v111, (unsigned int (*)(uint64_t, void, void, void, void))StreamingParser::parseInfo(unsigned char *,unsigned int *,unsigned char *,unsigned char *,SAList<char const*> *,BOOL *,AlgDataExtractor *)::$_0::__invoke, (uint64_t (*)(uint64_t, const char *))StreamingParser::parseInfo(unsigned char *,unsigned int *,unsigned char *,unsigned char *,SAList<char const*> *,BOOL *,AlgDataExtractor *)::$_1::__invoke, (unsigned int (*)(uint64_t, BOOL))StreamingParser::parseInfo(unsigned char *,unsigned int *,unsigned char *,unsigned char *,SAList<char const*> *,BOOL *,AlgDataExtractor *)::$_2::__invoke);
      if (v60)
      {
        uint64_t v61 = *(void *)(v29 + 32);
        if (v121 && v121 != *(_DWORD *)(v61 + 72))
        {
          StreamingWriter::writeInfo(v29 + 40, v120, v121, v119, HIBYTE(v126), (uint64_t)v117, v126);
          char v64 = 1;
        }
        else
        {
          unint64_t Info = AlgsDevice::getInfo(*(AlgsDevice **)(v29 + 32));
          OUTLINED_FUNCTION_37(Info, *(_DWORD *)(v61 + 48));
          AlgsDevice::getClientExtractor(*(void *)(v29 + 32), (uint64_t)&v130);
          StreamingWriter::writeInfo(v29 + 40, BYTE5(Info), Info, BYTE4(Info), BYTE6(Info), *(void *)(v29 + 32) + 80, *(unsigned char *)(v29 + 96));
          char v64 = v63;
          PacketCollection::~PacketCollection((PacketCollection *)&v130);
        }
      }
      else
      {
        char v64 = 0;
      }
      PacketCollection::~PacketCollection((PacketCollection *)&v127);
      SAList<char const*>::~SAList((uint64_t)v117);
      if (v64) {
        goto LABEL_122;
      }
      goto LABEL_106;
    case 7:
      *(_DWORD *)v122 = 0;
      AlgDataExtractor::AlgDataExtractor((AlgDataExtractor *)&v130);
      AlgDataExtractor::AlgDataExtractor((AlgDataExtractor *)&v127);
      *(void *)v117 = v122;
      *(void *)&v117[8] = &v130;
      *(void *)v118 = &v127;
      uint64_t v114 = (uint64_t)v117;
      if (v18 < 6) {
        goto LABEL_103;
      }
      uint64_t v113 = 6;
      if (!StreamingParser::parseConfigureTranslation(unsigned int *,AlgDataExtractor *,AlgDataExtractor *)::$_0::__invoke((_DWORD **)v117, *(_DWORD *)(v20 + 2)))goto LABEL_103; {
      unint64_t v65 = v113;
      }
      unint64_t v66 = v112 - v113;
      break;
    case 8:
      OUTLINED_FUNCTION_1_2();
      v71 = (AlgWorkNode *)(*(uint64_t (**)(void))(v70 + 48))();
      unsigned int TreeSize = AlgWorkNode::getTreeSize(v71);
      unint64_t v73 = AlgsDevice::getInfo(*(AlgsDevice **)(v29 + 32));
      *(_DWORD *)((char *)&v130 + 1) = 0;
      LOBYTE(v130) = BYTE5(v73);
      if (!SABinaryWriter::writeHeader(v29 + 48, 8))
      {
        *(void *)(v29 + 64) += 4 * TreeSize;
        goto LABEL_106;
      }
      char v74 = SABinaryWriter::write((SABinaryWriter *)(v29 + 48), &v130, 5uLL);
      *(void *)(v29 + 64) += 4 * TreeSize;
      if (v74)
      {
        OUTLINED_FUNCTION_1_2();
        uint64_t v76 = (*(uint64_t (**)(void))(v75 + 48))();
        if (AlgWorkNode::getTreeInfo(v76, v29, 1)) {
          goto LABEL_122;
        }
      }
      goto LABEL_106;
    case 9:
      LOBYTE(v127) = 0;
      v130 = (unint64_t *)&v127;
      *(void *)&long long v131 = v29 + 128;
      if (v18 - 2 <= 2) {
        goto LABEL_106;
      }
      if (!StreamingParser::parsePacketCache(unsigned char &,StreamingPacketCache &)::$_0::__invoke((uint64_t)&v130, *(unsigned char *)(v20 + 2), *(unsigned __int8 *)(v20 + 3), (const void *)(v20 + 4)))goto LABEL_106; {
      uint64_t v77 = *v31;
      }
      if (!*v31) {
        goto LABEL_106;
      }
      v78 = (SABinaryWriter *)(v29 + 48);
      v79 = *(const void **)(v29 + 136);
      LOBYTE(v130) = 1;
      BYTE1(v130) = v77;
      SABinaryWriter::updateCacheSizes(v77, (uint64_t)v79);
      if (!SABinaryWriter::writeHeader((uint64_t)v78, 9)
        || (SABinaryWriter::write(v78, &v130, 2uLL) & 1) == 0
        || (SABinaryWriter::write(v78, v79, 22 * v77) & 1) == 0)
      {
        goto LABEL_106;
      }
      goto LABEL_122;
    default:
      goto LABEL_106;
  }
  while (1)
  {
    uint64_t v67 = v65;
    if (v112 <= v65) {
      break;
    }
    if (v66 < 0x12) {
      goto LABEL_102;
    }
    uint64_t v68 = v111 + v65;
    if (*(unsigned char *)(v111 + v65) != 3 || v66 - 18 < 0x12) {
      goto LABEL_102;
    }
    v69 = (unsigned char *)(v111 + v65 + 18);
    v65 += 36;
    if (*v69 != 3)
    {
      v67 += 36;
      goto LABEL_102;
    }
    v66 -= 36;
    if ((StreamingParser::parseConfigureTranslation(unsigned int *,AlgDataExtractor *,AlgDataExtractor *)::$_1::__invoke(v114, v68, (uint64_t)v69) & 1) == 0)
    {
      v67 += 36;
LABEL_102:
      uint64_t v113 = v67;
LABEL_103:
      PacketCollection::~PacketCollection((PacketCollection *)&v127);
LABEL_104:
      v80 = &v130;
LABEL_105:
      PacketCollection::~PacketCollection((PacketCollection *)v80);
      goto LABEL_106;
    }
  }
  uint64_t v113 = v65;
  int v81 = *(_DWORD *)v122;
  if (*(_DWORD *)v122 == *(_DWORD *)(*(void *)(v29 + 32) + 72))
  {
    if (*(void *)(v29 + 104))
    {
      OUTLINED_FUNCTION_1_2();
      (*(void (**)(void))(v82 + 8))();
    }
    if (*(void *)(v29 + 112))
    {
      OUTLINED_FUNCTION_1_2();
      (*(void (**)(void))(v83 + 8))();
    }
    if (HIDWORD(v131) && HIDWORD(v131) == HIDWORD(v129))
    {
      uint64_t v84 = operator new(80, *(unsigned __int8 *)(v29 + 120));
      *(void *)(v29 + 104) = PacketCollection::PacketCollection(v84, SHIDWORD(v131), *(unsigned char *)(v29 + 120));
      uint64_t v85 = operator new(80, *(unsigned __int8 *)(v29 + 120));
      uint64_t v86 = 0;
      unint64_t v87 = 0;
      *(void *)(v29 + 112) = PacketCollection::PacketCollection(v85, SHIDWORD(v129), *(unsigned char *)(v29 + 120));
      while (v87 < HIDWORD(v131))
      {
        OUTLINED_FUNCTION_1_2();
        OUTLINED_FUNCTION_20();
        v88();
        OUTLINED_FUNCTION_1_2();
        OUTLINED_FUNCTION_20();
        v89();
        ++v87;
        v86 += 80;
      }
    }
    else
    {
      *(void *)(v29 + 104) = 0;
      *(void *)(v29 + 112) = 0;
    }
    int v81 = *(_DWORD *)v122;
  }
  *(_DWORD *)v117 = v81;
  if (SABinaryWriter::writeHeader(v29 + 48, 7))
  {
    int v91 = SABinaryWriter::write((SABinaryWriter *)(v29 + 48), v117, 4uLL);
    if (v91)
    {
      if (HIDWORD(v131) == HIDWORD(v129))
      {
        uint64_t v99 = 0;
        uint64_t v100 = -1;
        do
        {
          if (++v100 >= (unint64_t)HIDWORD(v131)) {
            break;
          }
          if (*(unsigned char *)(v29 + 72) != 7) {
            break;
          }
          int v101 = OUTLINED_FUNCTION_25(v91, v92, v93, v94, v95, v96, v97, v98, *(void *)&v128[v99], *(void *)&v128[v99 + 8], v110, v111, v112, v113, v114, v115, v116, 3, *(_OWORD *)(v131 + v99) >> 56,
                   HIBYTE(*(_OWORD *)(v131 + v99)),
                   v118[1]);
          if ((v101 & 1) == 0) {
            break;
          }
          v99 += 80;
          int v91 = OUTLINED_FUNCTION_25(v101, v102, v103, v104, v105, v106, v107, v108, v109[0], v109[1], v110, v111, v112, v113, v114, v115, v116, v117[0], *(_OWORD *)v109 >> 56,
                  SHIBYTE(v109[1]),
                  v118[1]);
        }
        while ((v91 & 1) != 0);
      }
    }
  }
  PacketCollection::~PacketCollection((PacketCollection *)&v127);
LABEL_120:
  v57 = &v130;
LABEL_121:
  PacketCollection::~PacketCollection((PacketCollection *)v57);
LABEL_122:
  uint64_t v90 = AlgsDevice::StreamingClient::resetBuffer(*(AlgsDevice::StreamingClient **)(v22 + 64));
  if (v16) {
    goto LABEL_107;
  }
LABEL_108:
  OUTLINED_FUNCTION_13_0();
}

void sub_25BF34808(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
  PacketCollection::~PacketCollection((PacketCollection *)&a36);
  PacketCollection::~PacketCollection((PacketCollection *)(v36 - 184));
  _Unwind_Resume(a1);
}

void AlgsDevice::configureInternalClient(uint64_t a1, const PacketCollection *a2, uint64_t a3)
{
}

void AlgsDevice::addClient(uint64_t a1, unsigned int a2, uint64_t a3, const PacketCollection *a4)
{
  *(void *)(a1 + 8 * a2 + 32) = a3;
  uint64_t v4 = a1 + 4 * a2;
  int v6 = *(_DWORD *)(v4 + 48);
  uint64_t v5 = (_DWORD *)(v4 + 48);
  if (v6 | *((_DWORD *)a4 + 5))
  {
    uint64_t v10 = a2;
    uint64_t v11 = *(const PacketCollection **)(a1 + 56);
    uint64_t v12 = operator new(96, 1);
    uint64_t v13 = AlgDataExtractor::AlgDataExtractor(v12, *((_DWORD *)a4 + 5) - *v5 + *((_DWORD *)v11 + 5), 1);
    uint64_t v14 = 0;
    unint64_t v15 = 0;
    *(void *)(a1 + 56) = v13;
    double v16 = a2 ? v11 : a4;
    *((_OWORD *)v13 + 5) = *((_OWORD *)v16 + 5);
    uint64_t v17 = a1 + 48;
    uint64_t v18 = 4 * v10;
    while (v14 != 8)
    {
      if (v18 == v14)
      {
        uint64_t v19 = a4;
        unint64_t v20 = -1;
        unint64_t v21 = 0;
      }
      else
      {
        unint64_t v20 = *(unsigned int *)(v17 + v14);
        uint64_t v19 = v11;
        unint64_t v21 = v15;
      }
      PacketCollection::append(*(PacketCollection **)(a1 + 56), v19, v20, v21);
      v15 += *(unsigned int *)(v17 + v14);
      v14 += 4;
    }
    _DWORD *v5 = *((_DWORD *)a4 + 5);
    if (v11)
    {
      OUTLINED_FUNCTION_22();
      OUTLINED_FUNCTION_32();
      __asm { BRAA            X1, X16 }
    }
  }
  OUTLINED_FUNCTION_32();
}

void AlgsDevice::configureStreaming(AlgsDevice::StreamingClient **this, char a2, AlgDataExtractor *a3, void *a4, unint64_t *a5)
{
  AlgsDevice::StreamingClient::configure(this[8], a2, a3);
  if (a4)
  {
    if (a5) {
      uint64_t v8 = *a5;
    }
    else {
      uint64_t v8 = 0;
    }
    AlgsDevice::StreamingClient::setBuffer(this[8], a4, v8);
    if (AlgsDevice::StreamingClient::configureStatus(this[8]))
    {
      unint64_t v9 = AlgsDevice::StreamingClient::resetBuffer(this[8]);
      if (!a5) {
        return;
      }
    }
    else
    {
      unint64_t v9 = 0;
      if (!a5) {
        return;
      }
    }
    *a5 = v9;
  }
}

uint64_t AlgsDevice::getClientExtractor(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = 0;
  uint64_t v5 = 0;
LABEL_4:
  uint64_t v6 = 80 * (v5 + v4);
  for (unint64_t i = v4; i < *(unsigned int *)(a1 + 48); ++i)
  {
    OUTLINED_FUNCTION_6_0();
    OUTLINED_FUNCTION_20();
    v8();
    v6 += 80;
  }
  do
  {
    v5 += *(unsigned int *)(a1 + 4 * v4++ + 48);
    if (!v4) {
      goto LABEL_4;
    }
  }
  while (v4 != 2);
  return a2;
}

unint64_t AlgsDevice::getInfo(AlgsDevice *this)
{
  return *((unsigned int *)this + 18) | ((unint64_t)*((unsigned __int8 *)this + 76) << 32) | ((unint64_t)*((unsigned __int8 *)this + 77) << 40) | ((unint64_t)*((unsigned __int8 *)this + 112) << 48);
}

unint64_t AlgDataNode::sendCallback(uint64_t a1, uint64_t (*a2)(void *), uint64_t a3)
{
  unint64_t result = *(void *)(a3 + 48) + *(void *)(a3 + 32);
  if (result)
  {
    if (result < 0x81)
    {
      MEMORY[0x270FA5388]();
      OUTLINED_FUNCTION_22();
      uint64_t v9 = OUTLINED_FUNCTION_38();
      v10(v9);
      uint64_t v11 = OUTLINED_FUNCTION_30();
      return a2(v11);
    }
    else
    {
      uint64_t v5 = operator new(result, 1);
      OUTLINED_FUNCTION_22();
      uint64_t v6 = OUTLINED_FUNCTION_38();
      v7(v6);
      uint64_t v8 = OUTLINED_FUNCTION_30();
      unint64_t result = a2(v8);
      if (v5)
      {
        JUMPOUT(0x261178DC0);
      }
    }
  }
  return result;
}

uint64_t *AlgDataNode::extractBuffer(uint64_t *this, unsigned __int8 *a2)
{
  int v2 = *((_DWORD *)this + 6);
  if (v2)
  {
    v4[0] = a2;
    v4[1] = 0;
    uint64_t v3 = *this;
    v4[2] = this[1];
    int v5 = *((_DWORD *)this + 4);
    char v6 = 0;
    uint64_t v7 = *((unsigned __int16 *)this + 10);
    uint64_t v8 = 0;
    uint64_t v9 = ((v2 + 3) & 0xFFFFFFFC) - v7;
    uint64_t v10 = 0;
    return (uint64_t *)(*(uint64_t (**)(uint64_t *, void *(*)(void **), void *))(v3 + 24))(this, AlgDataNode::extractBuffer(unsigned char *)const::$_0::__invoke, v4);
  }
  return this;
}

void *AlgDataNode::extractBuffer(unsigned char *)const::$_0::__invoke(void **a1)
{
  int v2 = (char *)*a1;
  memcpy(*a1, a1[5], (size_t)a1[4]);
  uint64_t v3 = (char *)a1[4] + (void)v2;
  size_t v5 = (size_t)a1[6];
  unint64_t v4 = (char *)a1[7];
  return memcpy(v3, v4, v5);
}

void AlgDataNode::~AlgDataNode(AlgDataNode *this)
{
  *(void *)this = &unk_27096D910;
  JUMPOUT(0x261178DD0);
}

{
  *(void *)this = &unk_27096D910;
}

void AlgDataNode::AlgDataNode(AlgDataNode *this)
{
  *(void *)this = &unk_27096D910;
  *((void *)this + 1) = 0;
  *((_WORD *)this + 14) = 0;
  OUTLINED_FUNCTION_24((uint64_t)this);
}

void AlgDataNode::AlgDataNode(AlgDataNode *this, uint64_t a2, char a3)
{
  *(void *)this = &unk_27096D910;
  *((void *)this + 1) = a2;
  *((unsigned char *)this + 28) = a3;
  *((unsigned char *)this + 29) = 0;
  OUTLINED_FUNCTION_24((uint64_t)this);
}

uint64_t AlgTaskNode::runPlan(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a3 + 8);
  if (a2 && *(_DWORD *)a2 == 0x2000)
  {
    unint64_t v4 = *(uint64_t **)(a2 + 16);
    uint64_t v5 = *v4;
    int v6 = *((_DWORD *)v4 + 2);
  }
  else
  {
    uint64_t v5 = 0;
    int v6 = 0;
  }
  *(void *)(v3 + 40) = v5;
  *(_DWORD *)(v3 + 48) = v6;
  OUTLINED_FUNCTION_1_2();
  return (*(uint64_t (**)(void))(v7 + 48))();
}

uint64_t AlgTaskNode::runPlan(AlgTaskNode *this, AlgDataInjector *a2, AlgDataExtractor *a3)
{
  return 1;
}

void AlgTaskNode::runTask(AlgTaskNode *this, AlgDataInjector *a2, AlgDataExtractor *a3)
{
  OUTLINED_FUNCTION_17(this, a2, a3);
  if ((v8 & 1) == 0) {
    (*(void (**)(uint64_t))(*(void *)v7 + 64))(v7);
  }
  for (unint64_t i = 0; i < *(unsigned int *)(v7 + 124); ++i)
  {
    uint64_t v10 = *(void **)(*(void *)(v7 + 112) + 8 * i);
    uint64_t v11 = *(void (**)(void, void))(v5 + 80);
    if (v11) {
      v11(*(void *)(v5 + 88), v10[13]);
    }
    (*(void (**)(void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*v10 + 16))(v10, v6, v5, v4, v3, v8);
  }
  if ((v8 & 1) == 0) {
    (*(void (**)(uint64_t))(*(void *)v7 + 72))(v7);
  }
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_32();
}

uint64_t AlgTaskNode::runStep()
{
  OUTLINED_FUNCTION_1_2();
  return (*(uint64_t (**)(void))(v0 + 40))();
}

void AlgTaskNode::AlgTaskNode(AlgTaskNode *this)
{
  uint64_t v1 = OUTLINED_FUNCTION_14_0((uint64_t)this, COERCE_DOUBLE(16));
  *(void *)(v1 + 104) = v2;
  *(void *)(v1 + 112) = 0;
  *(void *)uint64_t v1 = &unk_27096D958;
  *(void *)(v1 + 8) = 0;
  *(void *)(v1 + 120) = 32;
  *(unsigned char *)(v1 + 128) = 0;
}

uint64_t *AlgWorkNode::children(AlgWorkNode *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26A583C58, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26A583C58))
  {
    qword_26A583C68 = 0;
    byte_26A583C70 = 0;
    qword_26A583C60 = 0;
    __cxa_atexit((void (*)(void *))SAList<std::reference_wrapper<AlgWorkNode>>::~SAList, &qword_26A583C60, &dword_25BF2A000);
    __cxa_guard_release(&qword_26A583C58);
  }
  return &qword_26A583C60;
}

uint64_t AlgWorkNode::runStep(AlgWorkNode *this, AlgDataInjector *a2, AlgDataExtractor *a3)
{
  OUTLINED_FUNCTION_17(this, a2, a3);
  if (v4) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 32))(v3);
  }
  OUTLINED_FUNCTION_23();
  return v5;
}

void AlgWorkNode::runPrologue(AlgWorkNode *this, AlgDataInjector *a2, AlgDataExtractor *a3)
{
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  uint64_t v7 = *((unsigned int *)a2 + 17);
  while (v7 != v5)
  {
    uint64_t v8 = *((void *)a2 + 1) + 80 * *(unsigned __int8 *)(*((void *)a2 + 7) - v6 + v5);
    BOOL v9 = *(void *)v8 == *((void *)this + 13) && *(unsigned char *)(v8 + 33) == 1;
    if (v9
      && (AlgWorkNode::injectDataIfOnList(*((void *)this + 10), *((_DWORD *)this + 23), (void *)(*((void *)a2 + 1) + 80 * *(unsigned __int8 *)(*((void *)a2 + 7) - v6 + v5)))|| AlgWorkNode::injectDataIfOnList(*((void *)this + 1), *((_DWORD *)this + 5), (void *)v8)|| AlgWorkNode::injectDataIfOnList(*((void *)this + 4), *((_DWORD *)this + 11), (void *)v8)))
    {
      *(unsigned char *)(*((void *)a2 + 4) + 2 * *(unsigned __int8 *)(*((void *)a2 + 7) - v6 + v5)) = 1;
      PacketCollection::popIterableAt(a2, v5 - v6++);
    }
    ++v5;
  }
  OUTLINED_FUNCTION_18();
  AlgWorkNode::runPrologue(v10, v11);
}

void AlgWorkNode::runEpilogue(AlgWorkNode *this, AlgDataInjector *a2, AlgDataExtractor *a3)
{
  OUTLINED_FUNCTION_11_0();
  uint64_t v10 = v9;
  OUTLINED_FUNCTION_4_0();
  while (v6 != v4)
  {
    unint64_t v11 = *(void *)(v10 + 8) + *(unsigned __int8 *)(*(void *)(v10 + 56) - v5 + v4) * (unint64_t)v7;
    if (*(void *)v11 == *(void *)(v3 + 104)
      && *(unsigned char *)(v11 + 33) == 2
      && AlgWorkNode::injectDataIfOnList(*(void *)(v3 + 56), *(_DWORD *)(v3 + 68), (void *)v11))
    {
      *(unsigned char *)(*(void *)(v10 + 32) + 2 * *(unsigned __int8 *)(*(void *)(v10 + 56) - v5 + v4)) = v8;
      PacketCollection::popIterableAt((_DWORD *)v10, v4 - v5++);
    }
    ++v4;
  }
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_13_0();
  AlgWorkNode::runEpilogue(v13, v14);
}

void AlgWorkNode::runEpilogue(AlgWorkNode *this, AlgDataExtractor *a2)
{
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_4_0();
  while (v4 != v3)
  {
    OUTLINED_FUNCTION_8_0();
    BOOL v6 = v6 && v5 == 2;
    if (v6
      && (OUTLINED_FUNCTION_15(*(void *)(v2 + 56), *(_DWORD *)(v2 + 68))
       || OUTLINED_FUNCTION_15(*(void *)(v2 + 32), *(_DWORD *)(v2 + 44))))
    {
      OUTLINED_FUNCTION_16();
    }
    ++v3;
  }
  OUTLINED_FUNCTION_13_0();
}

BOOL AlgWorkNode::extractDataIfOnList(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, int a5)
{
  unint64_t v5 = 0;
  unint64_t v6 = a2;
  do
  {
    if (a2 == v5)
    {
      unint64_t v7 = a2;
      return v7 < v6;
    }
    unint64_t v7 = v5;
    uint64_t v8 = *(void *)(a1 + 8 * v5++);
  }
  while (*(void *)(v8 + 8) != *(void *)(a3 + 8));
  *(_DWORD *)(a3 + 16) = *(_DWORD *)(v8 + 16);
  uint64_t v9 = (*(_DWORD *)(v8 + 24) + 3) & 0xFFFFFFFC;
  *(void *)(a3 + 24) = v9;
  *(void *)(a3 + 40) = a4;
  *(_DWORD *)(a3 + 48) = a5;
  if (*(void *)(a3 + 64))
  {
    OUTLINED_FUNCTION_6_0();
    (*(void (**)(uint64_t))(v10 + 24))(v8);
  }
  else
  {
    if (!*(void *)(a3 + 56)) {
      *(void *)(a3 + 56) = operator new(v9, 1);
    }
    OUTLINED_FUNCTION_6_0();
    (*(void (**)(uint64_t))(v11 + 16))(v8);
  }
  return v7 < v6;
}

BOOL AlgWorkNode::injectDataIfOnList(uint64_t a1, unsigned int a2, void *a3)
{
  unint64_t v4 = 0;
  unint64_t v5 = a2;
  do
  {
    if (a2 == v4)
    {
      unint64_t v6 = a2;
      return v6 < v5;
    }
    unint64_t v6 = v4;
    uint64_t v7 = *(void *)(a1 + 8 * v4++);
  }
  while (*(void *)(v7 + 8) != a3[1]);
  uint64_t v8 = a3[7];
  uint64_t v9 = v8 & 3;
  if ((v8 & 3) != 0)
  {
    uint64_t v8 = operator new(a3[3], 1);
    memcpy((void *)v8, (const void *)a3[7], a3[3]);
  }
  OUTLINED_FUNCTION_19();
  (*(void (**)(uint64_t, uint64_t))(v10 + 32))(v7, v8);
  *(unsigned char *)(v7 + 29) = 1;
  if (v9 && v8) {
    OUTLINED_FUNCTION_0_4();
  }
  return v6 < v5;
}

void AlgWorkNode::runPrologue(AlgWorkNode *this, AlgDataExtractor *a2)
{
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_4_0();
  while (v4 != v3)
  {
    OUTLINED_FUNCTION_8_0();
    BOOL v6 = v6 && v5 == 1;
    if (v6
      && (OUTLINED_FUNCTION_15(*(void *)(v2 + 80), *(_DWORD *)(v2 + 92))
       || OUTLINED_FUNCTION_15(*(void *)(v2 + 8), *(_DWORD *)(v2 + 20))))
    {
      OUTLINED_FUNCTION_16();
    }
    ++v3;
  }
  OUTLINED_FUNCTION_13_0();
}

void AlgWorkNode::AlgWorkNode(AlgWorkNode *this)
{
  *(void *)this = &unk_27096D9D0;
  *((void *)this + 1) = 0;
  uint64_t v1 = OUTLINED_FUNCTION_14_0((uint64_t)this, COERCE_DOUBLE(16));
  *(void *)(v1 + 104) = v2;
}

uint64_t AlgWorkNode::getDataNodeInfo(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v8 = 0;
  uint64_t v5 = *(void *)(a1 + 8);
  unsigned int v3 = (*(_DWORD *)(a1 + 24) + 3) & 0xFFFFFFFC;
  int v6 = *(_DWORD *)(a1 + 16);
  unsigned int v7 = v3;
  LOBYTE(v8) = a2;
  return AlgsDevice::StreamingClient::writeTreeInfo(void)::$_0::__invoke(a3, &v5);
}

uint64_t AlgWorkNode::getTreeInfo(uint64_t a1, uint64_t a2, int a3)
{
  if (!a3) {
    goto LABEL_3;
  }
  char v5 = *(unsigned char *)(a1 + 44) + *(unsigned char *)(a1 + 20) + *(unsigned char *)(a1 + 68) + *(unsigned char *)(a1 + 92);
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_7_0();
  char v7 = v5 + *(unsigned char *)(v6() + 12);
  uint64_t v8 = *(void *)(a1 + 104);
  uint64_t v31 = 0;
  uint64_t v30 = v8;
  uint64_t v32 = 0;
  BYTE1(v32) = v7;
  AlgsDevice::StreamingClient::writeTreeInfo(void)::$_0::__invoke(a2, &v30);
  uint64_t result = OUTLINED_FUNCTION_34();
  if (v10)
  {
LABEL_3:
    unint64_t v11 = 0;
    while (v11 < *(unsigned int *)(a1 + 20))
    {
      DataNodeunint64_t Info = AlgWorkNode::getDataNodeInfo(*(void *)(*(void *)(a1 + 8) + 8 * v11++), 2, a2);
      if ((DataNodeInfo & 1) == 0) {
        return 0;
      }
    }
    unint64_t v13 = 0;
    while (v13 < *(unsigned int *)(a1 + 44))
    {
      char v14 = AlgWorkNode::getDataNodeInfo(*(void *)(*(void *)(a1 + 32) + 8 * v13++), 4, a2);
      if ((v14 & 1) == 0) {
        return 0;
      }
    }
    unint64_t v15 = 0;
    while (v15 < *(unsigned int *)(a1 + 68))
    {
      char v16 = AlgWorkNode::getDataNodeInfo(*(void *)(*(void *)(a1 + 56) + 8 * v15++), 3, a2);
      if ((v16 & 1) == 0) {
        return 0;
      }
    }
    unint64_t v17 = 0;
    while (v17 < *(unsigned int *)(a1 + 92))
    {
      char v18 = AlgWorkNode::getDataNodeInfo(*(void *)(*(void *)(a1 + 80) + 8 * v17++), 5, a2);
      if ((v18 & 1) == 0) {
        return 0;
      }
    }
    unint64_t v19 = 0;
    do
    {
      OUTLINED_FUNCTION_19();
      OUTLINED_FUNCTION_7_0();
      unint64_t v21 = *(unsigned int *)(v20() + 12);
      uint64_t result = v19 >= v21;
      if (v19 >= v21) {
        break;
      }
      OUTLINED_FUNCTION_19();
      OUTLINED_FUNCTION_7_0();
      uint64_t v23 = *(unsigned char **)(*(void *)v22() + 8 * v19);
      char v24 = v23[44] + v23[20] + v23[68] + v23[92];
      OUTLINED_FUNCTION_22();
      OUTLINED_FUNCTION_7_0();
      char v26 = v24 + *(unsigned char *)(v25() + 12);
      OUTLINED_FUNCTION_19();
      OUTLINED_FUNCTION_7_0();
      uint64_t v28 = *(void *)(*(void *)v27() + 8 * v19);
      uint64_t v31 = 0;
      uint64_t v32 = 1;
      uint64_t v30 = *(void *)(v28 + 104);
      BYTE1(v32) = v26;
      uint64_t result = AlgsDevice::StreamingClient::writeTreeInfo(void)::$_0::__invoke(a2, &v30);
      if (!result) {
        break;
      }
      AlgWorkNode::getTreeInfo(v23, a2, 0);
      uint64_t result = OUTLINED_FUNCTION_34();
      ++v19;
    }
    while ((v29 & 1) != 0);
  }
  return result;
}

uint64_t AlgWorkNode::getTreeSize(AlgWorkNode *this)
{
  unint64_t v1 = 0;
  for (int i = *((unsigned __int16 *)this + 10)
          + *((unsigned __int16 *)this + 22)
          + *((unsigned __int16 *)this + 34)
          + *((unsigned __int16 *)this + 46)
          + 1; ; i += AlgWorkNode::getTreeSize(*(AlgWorkNode **)(*v5 + 8 * v1++)))
  {
    OUTLINED_FUNCTION_6_0();
    OUTLINED_FUNCTION_7_0();
    if (v1 >= *(unsigned int *)(v3() + 12)) {
      break;
    }
    OUTLINED_FUNCTION_6_0();
    OUTLINED_FUNCTION_7_0();
    char v5 = (void *)v4();
  }
  return (unsigned __int16)i;
}

uint64_t *AlgWorkNode::resetInjectionStateOnList(uint64_t *result, unsigned int a2)
{
  uint64_t v2 = a2;
  if (a2)
  {
    do
    {
      uint64_t v3 = *result++;
      *(unsigned char *)(v3 + 29) = 0;
      --v2;
    }
    while (v2);
  }
  return result;
}

uint64_t AlgWorkNode::resetInjectionState(AlgWorkNode *this)
{
  AlgWorkNode::resetInjectionStateOnList(*((uint64_t **)this + 10), *((_DWORD *)this + 23));
  AlgWorkNode::resetInjectionStateOnList(*((uint64_t **)this + 1), *((_DWORD *)this + 5));
  AlgWorkNode::resetInjectionStateOnList(*((uint64_t **)this + 4), *((_DWORD *)this + 11));
  AlgWorkNode::resetInjectionStateOnList(*((uint64_t **)this + 7), *((_DWORD *)this + 17));
  for (unint64_t i = 0; ; ++i)
  {
    OUTLINED_FUNCTION_6_0();
    OUTLINED_FUNCTION_7_0();
    uint64_t result = v3();
    if (i >= *(unsigned int *)(result + 12)) {
      break;
    }
    OUTLINED_FUNCTION_6_0();
    OUTLINED_FUNCTION_7_0();
    int v6 = (void *)v5();
    AlgWorkNode::resetInjectionState(*(AlgWorkNode **)(*v6 + 8 * i));
  }
  return result;
}

void StreamingPacketCache::~StreamingPacketCache(StreamingPacketCache *this)
{
  if (*((void *)this + 1)) {
    OUTLINED_FUNCTION_40();
  }
}

uint64_t StreamingParser::StreamingParser(uint64_t result, uint64_t a2, uint64_t a3, char *a4)
{
  *(void *)uint64_t result = a4;
  if (a4)
  {
    char v4 = *a4;
    uint64_t v5 = *((void *)a4 + 1);
  }
  else
  {
    char v4 = 0;
    uint64_t v5 = 0;
  }
  *(void *)(result + 8) = a2;
  *(void *)(result + 16) = a3;
  *(void *)(result + 24) = 0;
  *(void *)(result + 32) = 0;
  *(unsigned char *)(result + 40) = v4;
  *(void *)(result + 48) = v5;
  return result;
}

void SABinaryParser::parseInfoData(uint64_t *a1, unsigned int (*a2)(uint64_t, void, void, void, void), uint64_t (*a3)(uint64_t, const char *), unsigned int (*a4)(uint64_t, BOOL))
{
  uint64_t v4 = a1[2];
  if ((unint64_t)(a1[1] - v4) >= 7)
  {
    uint64_t v8 = *a1;
    a1[2] = v4 + 7;
    if (!a2
      || a2(a1[3], *(unsigned __int8 *)(v8 + v4), *(unsigned int *)(v8 + v4 + 1), *(unsigned __int8 *)(v8 + v4 + 5), *(unsigned __int8 *)(v8 + v4 + 6)))
    {
      while (1)
      {
        uint64_t v9 = a1[1];
        uint64_t v10 = a1[2];
        if (v9 == v10) {
          break;
        }
        uint64_t v11 = *a1;
        uint64_t v12 = (unsigned __int8 *)(*a1 + v10);
        int v13 = *v12;
        uint64_t v14 = v10 + 1;
        a1[2] = v10 + 1;
        if (!v13)
        {
          if (v9 == v14) {
            return;
          }
          uint64_t v18 = v10 + 2;
          a1[2] = v18;
          if (a4)
          {
            if (!a4(a1[3], *(unsigned char *)(v11 + v14) != 0)) {
              return;
            }
            uint64_t v9 = a1[1];
            uint64_t v18 = a1[2];
          }
          if (v9 != v18)
          {
            uint64_t v19 = OUTLINED_FUNCTION_41();
            SABinaryParser::parseInjExtData(v19, v20, v21, v22);
          }
          return;
        }
        unint64_t v15 = *v12;
        if (v9 - v14 >= v15)
        {
          a1[2] = v14 + v15;
          unsigned int v17 = *v12;
          char v16 = (const char *)(v12 + 1);
          if (strnlen(v16, v17) != v17 && (!a3 || (a3(a1[3], v16) & 1) != 0)) {
            continue;
          }
        }
        return;
      }
    }
  }
}

void SABinaryParser::parseInjExtData(uint64_t a1, uint64_t (*a2)(uint64_t, unsigned __int8 *, char *), uint64_t (*a3)(uint64_t, unsigned __int8 *, char *), uint64_t (*a4)(void))
{
  while (1)
  {
    unint64_t v8 = *(void *)(a1 + 8);
    unint64_t v9 = *(void *)(a1 + 16);
    unint64_t v10 = v8 - v9;
    if (v8 <= v9) {
      break;
    }
    uint64_t v11 = (unsigned __int8 *)(*(void *)a1 + v9);
    int v12 = (char)*v11;
    if (v12 < 0)
    {
      uint64_t v14 = *(void *)(a1 + 40);
      if (!v14) {
        break;
      }
      unsigned int v15 = v12 & 0x7F;
      if (v15 >= *(unsigned __int8 *)(a1 + 32)) {
        break;
      }
      char v16 = (unsigned __int8 *)(v14 + 22 * v15);
      unint64_t v17 = *((unsigned __int16 *)v16 + 10);
      if (v10 <= v17) {
        break;
      }
      *(void *)(a1 + 16) = v9 + v17 + 1;
      if (*v16 == 1)
      {
        if (a2)
        {
          uint64_t v18 = *(void *)(a1 + 24);
          uint64_t v19 = (char *)(v11 + 1);
          uint64_t v11 = v16;
LABEL_20:
          if ((a2(v18, v11, v19) & 1) == 0) {
            break;
          }
        }
      }
      else if (a3)
      {
        uint64_t v21 = *(void *)(a1 + 24);
        uint64_t v22 = (char *)(v11 + 1);
        uint64_t v11 = v16;
LABEL_26:
        if ((a3(v21, v11, v22) & 1) == 0) {
          break;
        }
      }
    }
    else
    {
      if (v10 < 0x12) {
        break;
      }
      int v13 = *v11;
      *(void *)(a1 + 16) = v9 + 18;
      if (v13 == 3)
      {
        if (a4 && (a4(*(void *)(a1 + 24)) & 1) == 0) {
          break;
        }
      }
      else
      {
        if (v8 - (v9 + 18) < 4) {
          break;
        }
        *(void *)(a1 + 16) = v9 + 22;
        unint64_t v20 = *((unsigned __int16 *)v11 + 10);
        if (v8 - (v9 + 22) < v20) {
          break;
        }
        *(void *)(a1 + 16) = v9 + 22 + v20;
        if (v13 == 2)
        {
          if (a3)
          {
            uint64_t v21 = *(void *)(a1 + 24);
            uint64_t v22 = (char *)(v11 + 22);
            goto LABEL_26;
          }
        }
        else
        {
          if (v13 != 1) {
            break;
          }
          if (a2)
          {
            uint64_t v18 = *(void *)(a1 + 24);
            uint64_t v19 = (char *)(v11 + 22);
            goto LABEL_20;
          }
        }
      }
    }
  }
  OUTLINED_FUNCTION_32();
}

uint64_t StreamingParser::parseReset(unsigned char *,unsigned int *,unsigned char *,unsigned char *,SAList<char const*> *,BOOL *,AlgDataExtractor *)::$_0::__invoke(uint64_t a1, char a2, int a3, char a4, char a5)
{
  if (*(void *)a1) {
    **(unsigned char **)a1 = a2;
  }
  uint64_t v5 = *(_DWORD **)(a1 + 8);
  if (v5) {
    _DWORD *v5 = a3;
  }
  int v6 = *(unsigned char **)(a1 + 16);
  if (v6) {
    unsigned char *v6 = a4;
  }
  char v7 = *(unsigned char **)(a1 + 24);
  if (v7) {
    *char v7 = a5;
  }
  return 1;
}

uint64_t StreamingParser::addPoint(uint64_t a1, uint64_t a2)
{
  if (!*(unsigned char *)(a2 + 17)) {
    return 0;
  }
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_20();
  return v7(v2, v3, v4, v5, v6);
}

void StreamingParser::parseRun(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v7[0] = a2;
  v7[1] = a3;
  v7[2] = a4;
  *(void *)(a1 + 32) = v7;
  if (a2) {
    uint64_t v4 = StreamingParser::parseRun(InjectionInfo *,AlgDataInjector *,AlgDataExtractor *)::$_0::__invoke;
  }
  else {
    uint64_t v4 = 0;
  }
  if (a3) {
    uint64_t v5 = (uint64_t (*)(uint64_t, unsigned __int8 *, char *))StreamingParser::parseRun(InjectionInfo *,AlgDataInjector *,AlgDataExtractor *)::$_1::__invoke;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a4) {
    uint64_t v6 = (uint64_t (*)(uint64_t, unsigned __int8 *, char *))StreamingParser::parseRun(InjectionInfo *,AlgDataInjector *,AlgDataExtractor *)::$_2::__invoke;
  }
  else {
    uint64_t v6 = 0;
  }
  SABinaryParser::parseRunFrame((void *)(a1 + 8), (unsigned int (*)(void))v4, v5, v6);
}

void SABinaryParser::parseRunFrame(void *a1, unsigned int (*a2)(void), uint64_t (*a3)(uint64_t, unsigned __int8 *, char *), uint64_t (*a4)(uint64_t, unsigned __int8 *, char *))
{
  uint64_t v4 = a1[1];
  uint64_t v5 = a1[2];
  if ((unint64_t)(v4 - v5) >= 2)
  {
    a1[2] = v5 + 2;
    if ((unint64_t)(v4 - (v5 + 2)) >= 4)
    {
      uint64_t v8 = *a1 + v5 + 2;
      uint64_t v9 = v5 + 6;
      a1[2] = v9;
      unint64_t v10 = *(unsigned __int16 *)(v8 + 2);
      if (v4 - v9 >= v10)
      {
        a1[2] = v9 + v10;
        if (!a2 || a2(a1[3]))
        {
          SABinaryParser::parseInjExtData((uint64_t)a1, a3, a4, 0);
        }
      }
    }
  }
}

uint64_t StreamingParser::addPacket(uint64_t a1, uint64_t a2, int a3)
{
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_20();
  uint64_t result = v10(v5, v6, v7, v8, v9);
  if (a3 == 2)
  {
    if (result) {
      *(unsigned char *)(*(void *)(a1 + 32) + 2 * *(unsigned int *)(a1 + 20) - 2) = 1;
    }
  }
  return result;
}

uint64_t StreamingParser::parseRun(InjectionInfo *,AlgDataInjector *,AlgDataExtractor *)::$_0::__invoke(uint64_t *a1, unsigned __int16 *a2)
{
  uint64_t v2 = *a1;
  *(_DWORD *)uint64_t v2 = *a2;
  *(void *)(v2 + 8) = a2[1];
  *(void *)(v2 + 16) = a2 + 2;
  return 1;
}

void SABinaryParser::parseInjExtFrame(uint64_t *a1, unsigned int (*a2)(uint64_t, void), uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v6 = a1[1];
  uint64_t v5 = a1[2];
  if ((unint64_t)(v6 - v5) >= 2)
  {
    a1[2] = v5 + 2;
    if ((unint64_t)(v6 - (v5 + 2)) >= 8)
    {
      uint64_t v8 = *a1;
      a1[2] = v5 + 10;
      if (!a2 || a2(a1[3], *(void *)(v8 + v5 + 2)))
      {
        OUTLINED_FUNCTION_18();
        SABinaryParser::parseInjExtData(v9, v10, v11, a5);
      }
    }
  }
}

uint64_t StreamingParser::parseInjExt(unsigned long long *,AlgDataInjector *,AlgDataExtractor *,AlgDataExtractor *)::$_3::__invoke(uint64_t a1, uint64_t a2)
{
  return StreamingParser::addPoint(*(void *)(a1 + 24), a2);
}

uint64_t StreamingParser::parseInjExt(unsigned long long *,AlgDataInjector *,AlgDataExtractor *,AlgDataExtractor *)::$_0::__invoke(void **a1, uint64_t a2)
{
  **a1 = a2;
  return 1;
}

void StreamingParser::numberOfPackets(StreamingParser *this, unint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  long long v8 = *(_OWORD *)((char *)this + 24);
  long long v27 = *(_OWORD *)((char *)this + 8);
  long long v28 = v8;
  long long v29 = *(_OWORD *)((char *)this + 40);
  if (a2) {
    *a2 = 0;
  }
  if (a3) {
    *a3 = 0;
  }
  if (a4) {
    *a4 = 0;
  }
  char v24 = a2;
  uint64_t v25 = a3;
  char v26 = a4;
  *((void *)&v28 + 1) = &v24;
  if (*((void *)&v27 + 1) >= 2uLL && *(unsigned char *)v27 == 1)
  {
    switch(*(unsigned char *)(v27 + 1))
    {
      case 2:
        uint64_t v9 = OUTLINED_FUNCTION_33(0, (uint64_t)a2, (uint64_t)StreamingParser::numberOfPackets(unsigned long *,unsigned long *,unsigned long *)const::$_0::__invoke, (uint64_t)StreamingParser::numberOfPackets(unsigned long *,unsigned long *,unsigned long *)const::$_1::__invoke, a5, a6, a7, a8, v23, (uint64_t)v24, (uint64_t)v25, (uint64_t)v26, v27);
        SABinaryParser::parseRunFrame(v9, v10, v11, v12);
        break;
      case 3:
        int v13 = (uint64_t *)OUTLINED_FUNCTION_33(0, (uint64_t)a2, (uint64_t)StreamingParser::numberOfPackets(unsigned long *,unsigned long *,unsigned long *)const::$_0::__invoke, (uint64_t)StreamingParser::numberOfPackets(unsigned long *,unsigned long *,unsigned long *)const::$_1::__invoke, (uint64_t)StreamingParser::numberOfPackets(unsigned long *,unsigned long *,unsigned long *)const::$_2::__invoke, a6, a7, a8, v23, (uint64_t)v24, (uint64_t)v25, (uint64_t)v26, v27);
        SABinaryParser::parseInjExtFrame(v13, v14, v15, v16, v17);
        break;
      case 5:
        uint64_t v18 = (uint64_t *)OUTLINED_FUNCTION_33(0, (uint64_t)a2, (uint64_t)StreamingParser::numberOfPackets(unsigned long *,unsigned long *,unsigned long *)const::$_2::__invoke, (uint64_t)a4, a5, a6, a7, a8, v23, (uint64_t)v24, (uint64_t)v25, (uint64_t)v26, v27);
        SABinaryParser::parseConfigure(v18, v19, v20, 0);
        break;
      case 6:
        uint64_t v21 = (uint64_t *)OUTLINED_FUNCTION_33(0, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)StreamingParser::numberOfPackets(unsigned long *,unsigned long *,unsigned long *)const::$_2::__invoke, a6, a7, a8, v23, (uint64_t)v24, (uint64_t)v25, (uint64_t)v26, v27);
        SABinaryParser::parseInfo(v21, v22, 0, 0);
        break;
      default:
        return;
    }
  }
}

void SABinaryParser::parseConfigure(uint64_t *a1, unsigned int (*a2)(uint64_t, BOOL), uint64_t a3, unsigned int (*a4)(uint64_t, uint64_t))
{
  uint64_t v5 = a1[1];
  uint64_t v4 = a1[2];
  if ((unint64_t)(v5 - v4) < 2) {
    return;
  }
  a1[2] = v4 + 2;
  if (v5 == v4 + 2) {
    return;
  }
  uint64_t v8 = *a1;
  uint64_t v9 = (unsigned __int8 *)(*a1 + v4 + 2);
  uint64_t v10 = v4 + 3;
  a1[2] = v4 + 3;
  unsigned int v11 = *v9;
  int v12 = v9;
  if (v11 < 2) {
    goto LABEL_9;
  }
  if (v5 != v10)
  {
    int v12 = (unsigned char *)(v8 + v10);
    a1[2] = v4 + 4;
LABEL_9:
    if (a2 && v12 && !a2(a1[3], *v12 != 0)) {
      return;
    }
    goto LABEL_12;
  }
  if (v11 != 3) {
    return;
  }
LABEL_12:
  if (!a4 || (*v9 <= 2u ? (uint64_t v13 = 2) : (uint64_t v13 = *v9), a4(a1[3], v13)))
  {
    uint64_t v14 = OUTLINED_FUNCTION_41();
    SABinaryParser::parseInjExtData(v14, v15, v16, v17);
  }
}

void SABinaryParser::parseInfo(uint64_t *a1, unsigned int (*a2)(uint64_t, void, void, void, void), uint64_t (*a3)(uint64_t, const char *), unsigned int (*a4)(uint64_t, BOOL))
{
  uint64_t v4 = a1[1];
  uint64_t v5 = a1[2];
  if ((unint64_t)(v4 - v5) >= 2)
  {
    uint64_t v6 = v5 + 2;
    a1[2] = v6;
    if (v4 != v6) {
      SABinaryParser::parseInfoData(a1, a2, a3, a4);
    }
  }
}

uint64_t StreamingParser::numberOfPackets(unsigned long *,unsigned long *,unsigned long *)const::$_2::__invoke(uint64_t a1)
{
  unint64_t v1 = *(void **)(a1 + 16);
  if (v1) {
    ++*v1;
  }
  return 1;
}

uint64_t StreamingParser::numberOfPackets(unsigned long *,unsigned long *,unsigned long *)const::$_1::__invoke(uint64_t a1)
{
  unint64_t v1 = *(void **)(a1 + 8);
  if (v1) {
    ++*v1;
  }
  return 1;
}

uint64_t StreamingParser::numberOfPackets(unsigned long *,unsigned long *,unsigned long *)const::$_0::__invoke(void **a1)
{
  if (*a1) {
    ++**a1;
  }
  return 1;
}

uint64_t StreamingParser::parseConfigure(unsigned char *,BOOL *,AlgDataExtractor *)::$_2::__invoke(unsigned char **a1, char a2)
{
  return OUTLINED_FUNCTION_21(a2, *a1);
}

uint64_t StreamingParser::parseConfigure(unsigned char *,BOOL *,AlgDataExtractor *)::$_1::__invoke(uint64_t a1, uint64_t a2)
{
  return StreamingParser::addPoint(*(void *)(a1 + 16), a2);
}

uint64_t StreamingParser::parseConfigure(unsigned char *,BOOL *,AlgDataExtractor *)::$_0::__invoke(uint64_t a1, char a2)
{
  return OUTLINED_FUNCTION_21(a2, *(unsigned char **)(a1 + 8));
}

uint64_t StreamingParser::parseInfo(unsigned char *,unsigned int *,unsigned char *,unsigned char *,SAList<char const*> *,BOOL *,AlgDataExtractor *)::$_0::__invoke(uint64_t a1, char a2, int a3, char a4, char a5)
{
  if (*(void *)a1) {
    **(unsigned char **)a1 = a2;
  }
  uint64_t v5 = *(_DWORD **)(a1 + 8);
  if (v5) {
    _DWORD *v5 = a3;
  }
  uint64_t v6 = *(unsigned char **)(a1 + 16);
  if (v6) {
    unsigned char *v6 = a4;
  }
  uint64_t v7 = *(unsigned char **)(a1 + 24);
  if (v7) {
    *uint64_t v7 = a5;
  }
  return 1;
}

uint64_t StreamingParser::parseInfo(unsigned char *,unsigned int *,unsigned char *,unsigned char *,SAList<char const*> *,BOOL *,AlgDataExtractor *)::$_3::__invoke(uint64_t a1, uint64_t a2)
{
  return 1;
}

uint64_t StreamingParser::parseInfo(unsigned char *,unsigned int *,unsigned char *,unsigned char *,SAList<char const*> *,BOOL *,AlgDataExtractor *)::$_2::__invoke(uint64_t a1, char a2)
{
  return OUTLINED_FUNCTION_21(a2, *(unsigned char **)(a1 + 40));
}

uint64_t StreamingParser::parseInfo(unsigned char *,unsigned int *,unsigned char *,unsigned char *,SAList<char const*> *,BOOL *,AlgDataExtractor *)::$_1::__invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a2;
  SAList<char const*>::push_back(*(void *)(a1 + 32), &v3);
  return 1;
}

uint64_t StreamingParser::parseConfigureTranslation(unsigned int *,AlgDataExtractor *,AlgDataExtractor *)::$_1::__invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 8);
  if (v5) {
    uint64_t v6 = StreamingParser::addPoint(v5, a2);
  }
  else {
    uint64_t v6 = 1;
  }
  uint64_t v7 = *(void *)(a1 + 16);
  if (v7) {
    return v6 & StreamingParser::addPoint(v7, a3);
  }
  return v6;
}

uint64_t StreamingParser::parseConfigureTranslation(unsigned int *,AlgDataExtractor *,AlgDataExtractor *)::$_0::__invoke(_DWORD **a1, int a2)
{
  **a1 = a2;
  return 1;
}

uint64_t StreamingParser::parsePacketCache(unsigned char &,StreamingPacketCache &)::$_0::__invoke(uint64_t a1, char a2, unsigned int a3, const void *a4)
{
  **(unsigned char **)a1 = a2;
  uint64_t v6 = *(unsigned __int8 **)(a1 + 8);
  if (*((void *)v6 + 1)) {
    OUTLINED_FUNCTION_40();
  }
  unsigned __int8 *v6 = a3;
  uint64_t v7 = (void *)operator new(22 * a3, v6[16]);
  *((void *)v6 + 1) = v7;
  memcpy(v7, a4, 22 * *v6);
  return 1;
}

uint64_t SABinaryWriter::updateCacheSizes(uint64_t result, uint64_t a2)
{
  uint64_t v2 = result;
  uint64_t v3 = (_WORD *)(a2 + 20);
  if (result)
  {
    do
    {
      _WORD *v3 = (*v3 + 3) & 0xFFFC;
      v3 += 11;
      --v2;
    }
    while (v2);
  }
  return result;
}

uint64_t StreamingWriter::StreamingWriter(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 *a4)
{
  *(void *)a1 = a4;
  if (a4)
  {
    uint64_t v5 = *a4;
    uint64_t v6 = *((void *)a4 + 1);
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v6 = 0;
  }
  *(void *)(a1 + 8) = a2;
  *(void *)(a1 + 16) = a3;
  *(void *)(a1 + 24) = 0;
  *(unsigned char *)(a1 + 32) = 0;
  *(unsigned char *)(a1 + 34) = v5;
  *(void *)(a1 + 40) = v6;
  SABinaryWriter::updateCacheSizes(v5, v6);
  return a1;
}

uint64_t SABinaryWriter::writeHeader(uint64_t a1, char a2)
{
  if (*(unsigned char *)(a1 + 24)) {
    return 0;
  }
  *(void *)(a1 + 16) = 0;
  *(unsigned char *)(a1 + 24) = a2;
  v3[0] = 1;
  v3[1] = a2;
  return SABinaryWriter::write((SABinaryWriter *)a1, v3, 2uLL);
}

uint64_t SABinaryWriter::write(SABinaryWriter *this, const void *a2, size_t __n)
{
  if (*(void *)this)
  {
    uint64_t v5 = *((void *)this + 2);
    if (*((void *)this + 1) - v5 < __n)
    {
      uint64_t result = 0;
      *((unsigned char *)this + 24) = 0;
      return result;
    }
    memcpy((void *)(*(void *)this + v5), a2, __n);
  }
  *((void *)this + 2) += __n;
  return 1;
}

void StreamingWriter::writeResetOrInfo(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  *(unsigned char *)(a1 + 33) = 0;
  unsigned int v11 = (SABinaryWriter *)(a1 + 8);
  if (a2)
  {
    uint64_t v12 = OUTLINED_FUNCTION_26();
    if ((SABinaryWriter::writeHeader(v12, 1) & 1) == 0 || (uint64_t v13 = SABinaryWriter::write(v11, v28, 7uLL), (v13 & 1) == 0))
    {
LABEL_34:
      OUTLINED_FUNCTION_28();
      return;
    }
  }
  else
  {
    uint64_t v14 = OUTLINED_FUNCTION_26();
    if ((SABinaryWriter::writeHeader(v14, 6) & 1) == 0) {
      goto LABEL_34;
    }
    uint64_t v13 = SABinaryWriter::write(v11, v28, 7uLL);
    if (!v13) {
      goto LABEL_34;
    }
  }
  unint64_t v15 = 0;
  while (v15 < *(unsigned int *)(a7 + 12))
  {
    uint64_t v16 = *(unsigned char **)(*(void *)a7 + 8 * v15);
    int v17 = *(unsigned __int8 *)(a1 + 32);
    if (v17 == 1)
    {
      if (!v16) {
        goto LABEL_34;
      }
    }
    else
    {
      if (v16) {
        BOOL v18 = v17 == 6;
      }
      else {
        BOOL v18 = 0;
      }
      if (!v18) {
        goto LABEL_34;
      }
    }
    if (*v16)
    {
      size_t v19 = *(void *)(a1 + 16) + ~*(void *)(a1 + 24);
      size_t v20 = strnlen(*(const char **)(*(void *)a7 + 8 * v15), v19);
      if (v20 != v19)
      {
        unsigned __int8 v21 = v20 + 1;
        if (v20 + 1 <= 0xFF)
        {
          v28[0] = v20 + 1;
          if (OUTLINED_FUNCTION_27(v20, v28))
          {
            uint64_t v13 = SABinaryWriter::write(v11, v16, v21);
            ++v15;
            if (v13) {
              continue;
            }
          }
        }
      }
    }
    goto LABEL_34;
  }
  int v22 = *(unsigned __int8 *)(a1 + 32);
  if (v22 != 6 && v22 != 1) {
    goto LABEL_34;
  }
  if (*(unsigned char *)(a1 + 33)) {
    goto LABEL_34;
  }
  *(unsigned char *)(a1 + 33) = 1;
  v28[0] = 0;
  char v29 = a8;
  uint64_t v24 = OUTLINED_FUNCTION_27(v13, v28);
  if ((v24 & 1) == 0 || !OUTLINED_FUNCTION_27(v24, &v29)) {
    goto LABEL_34;
  }
  OUTLINED_FUNCTION_28();
  StreamingWriter::writeExtPoints(v25, v26);
}

uint64_t StreamingWriter::writeExtPoints(StreamingWriter *this, AlgDataExtractor *a2)
{
  uint64_t v4 = 1;
  if (a2)
  {
    OUTLINED_FUNCTION_29();
    uint64_t v5 = 0;
    uint64_t v7 = (SABinaryWriter *)(v6 + 8);
    uint64_t v8 = -1;
    while (++v8 < (unint64_t)*(unsigned int *)(v2 + 20))
    {
      uint64_t v9 = (long long *)(*(void *)(v2 + 8) + v5);
      long long v10 = *v9;
      int v11 = *((unsigned __int8 *)v9 + 33);
      int v12 = *(unsigned __int8 *)(v3 + 32);
      BOOL v13 = v12 == 3 || v12 == 5;
      if (v13 || *(unsigned char *)(v3 + 33))
      {
        v5 += 80;
        char v16 = 3;
        long long v17 = v10;
        char v14 = v11 == 1 ? 1 : 2;
        char v18 = v14;
        if (SABinaryWriter::write(v7, &v16, 0x12uLL)) {
          continue;
        }
      }
      return 0;
    }
    return 1;
  }
  return v4;
}

void StreamingWriter::writeInfo(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
}

void StreamingWriter::writeInjExtData(StreamingWriter *this, int a2, PacketCollection *a3, int a4)
{
  if (a3)
  {
    unint64_t v8 = 0;
    uint64_t v9 = (StreamingWriter *)((char *)this + 8);
    do
    {
      if (v8 >= *((unsigned int *)a3 + 5)) {
        break;
      }
      uint64_t v10 = *((void *)a3 + 1);
      uint64_t v11 = v10 + 80 * v8;
      if (a4)
      {
        int v12 = *(unsigned __int8 **)this;
        if (*(void *)this)
        {
          uint64_t v13 = *((void *)v12 + 1);
          if (v13)
          {
            uint64_t v14 = 0;
            uint64_t v15 = *v12;
            size_t v16 = (unsigned __int16)*(void *)(v11 + 24);
            __int16 v17 = *(void *)(v11 + 24) + 3;
            uint64_t v18 = v13 + 17;
            while (v15 != v14)
            {
              if (*(void *)(v18 - 16) == *(void *)v11
                && *(void *)(v18 - 8) == *(void *)(v11 + 8)
                && (*(unsigned char *)v18 != 1) != (*(unsigned char *)(v11 + 33) == 1)
                && (*(unsigned char *)(v18 - 17) != 1) != a2
                && *(_DWORD *)(v11 + 16) == *(unsigned __int16 *)(v18 + 1)
                && (unsigned __int16)(v17 ^ (*(_WORD *)(v18 + 3) + 3)) < 4u)
              {
                if ((*((unsigned char *)this + 32) & 0xFE) == 2)
                {
                  uint64_t v20 = *((void *)this + 5);
                  if (v20)
                  {
                    if (*((unsigned __int8 *)this + 34) > v14)
                    {
                      uint64_t v21 = v20 + 22 * v14;
                      int v23 = *(unsigned __int16 *)(v21 + 20);
                      int v22 = (unsigned __int16 *)(v21 + 20);
                      if ((v17 & 0xFFFC) == v23)
                      {
                        uint64_t v24 = *(const void **)(v10 + 80 * v8 + 56);
                        char v27 = v14 | 0x80;
                        int v26 = 0;
                        SABinaryWriter::write(v9, &v27, 1uLL);
                        OUTLINED_FUNCTION_34();
                        if (v25)
                        {
                          if (v24)
                          {
                            if (SABinaryWriter::write(v9, v24, v16)) {
                              SABinaryWriter::write(v9, &v26, *v22 - v16);
                            }
                          }
                        }
                      }
                    }
                  }
                }
                goto LABEL_17;
              }
              ++v14;
              v18 += 22;
            }
          }
        }
      }
      char v19 = SABinaryWriter::addInjExtData(v9, a2, *(void *)v11, *(void *)(v11 + 8), *(unsigned __int8 *)(v11 + 33) == 1, *(_WORD *)(v11 + 16), *(unsigned __int16 *)(v11 + 24), *(const void **)(v10 + 80 * v8++ + 56));
    }
    while ((v19 & 1) != 0);
LABEL_17:
    OUTLINED_FUNCTION_28();
  }
}

uint64_t SABinaryWriter::addInjExtData(SABinaryWriter *this, int a2, uint64_t a3, uint64_t a4, int a5, __int16 a6, unsigned int a7, const void *a8)
{
  if ((*((unsigned char *)this + 24) & 0xFE) != 2) {
    return 0;
  }
  if (a2) {
    char v12 = 1;
  }
  else {
    char v12 = 2;
  }
  char v15 = v12;
  uint64_t v16 = a3;
  uint64_t v17 = a4;
  if (a5) {
    char v13 = 1;
  }
  else {
    char v13 = 2;
  }
  char v18 = v13;
  uint64_t result = SABinaryWriter::write(this, &v15, 0x12uLL);
  if (result) {
    return SABinaryWriter::writeData(this, a6, a7, a8);
  }
  return result;
}

uint64_t SABinaryWriter::writeData(SABinaryWriter *this, __int16 a2, unsigned int a3, const void *a4)
{
  v11[0] = a2;
  unsigned __int16 v7 = (a3 + 3) & 0xFFFC;
  v11[1] = v7;
  int v10 = 0;
  SABinaryWriter::write(this, v11, 4uLL);
  uint64_t result = OUTLINED_FUNCTION_34();
  if (v9)
  {
    if (a4)
    {
      uint64_t result = SABinaryWriter::write(this, a4, a3);
      if (result) {
        return SABinaryWriter::write(this, &v10, v7 - (unint64_t)a3);
      }
    }
    else
    {
      return 1;
    }
  }
  return result;
}

uint64_t StreamingWriter::writeInjext(StreamingWriter *this, uint64_t a2, AlgDataInjector *a3, AlgDataExtractor *a4, AlgDataExtractor *a5, int a6)
{
  uint64_t v11 = (StreamingWriter *)((char *)this + 8);
  uint64_t v15 = a2;
  if ((SABinaryWriter::writeHeader((uint64_t)this + 8, 3) & 1) == 0) {
    return 0;
  }
  if (!SABinaryWriter::write(v11, &v15, 8uLL)) {
    return 0;
  }
  StreamingWriter::writeInjExtData(this, 1, a3, a6);
  if (!v12) {
    return 0;
  }
  StreamingWriter::writeInjExtData(this, 0, a4, a6);
  if (!v13) {
    return 0;
  }
  return StreamingWriter::writeExtPoints(this, a5);
}

uint64_t StreamingWriter::writeConfigure(StreamingWriter *this, char a2, AlgDataExtractor *a3, AlgDataExtractor *a4)
{
  char v11 = 3;
  uint64_t v7 = SABinaryWriter::writeHeader((uint64_t)this + 8, 5);
  if ((v7 & 1) == 0) {
    return 0;
  }
  uint64_t v8 = OUTLINED_FUNCTION_27(v7, &v11);
  if (!v8) {
    return 0;
  }
  char v10 = a2;
  if (!OUTLINED_FUNCTION_27(v8, &v10)) {
    return 0;
  }
  return StreamingWriter::writeExtPoints(this, a3);
}

uint64_t SABinaryWriter::addExtractionData(SABinaryWriter *this, uint64_t a2, uint64_t a3, int a4, __int16 a5, unsigned int a6, const void *a7)
{
  return SABinaryWriter::addInjExtData(this, 0, a2, a3, a4, a5, a6, a7);
}

uint64_t PacketCollection::reset(PacketCollection *this)
{
  uint64_t v1 = 0;
  for (unint64_t i = 0; ; ++i)
  {
    unint64_t v3 = *((unsigned int *)this + 5);
    if (i >= v3) {
      break;
    }
    uint64_t v4 = *((void *)this + 1) + v1;
    *(void *)(v4 + 24) = 0;
    *(_WORD *)(v4 + 32) = 0;
    *(void *)(v4 + 40) = 0;
    *(_DWORD *)(v4 + 48) = 0;
    *(void *)(v4 + 56) = 0;
    *(void *)uint64_t v4 = 0;
    *(void *)(v4 + 8) = 0;
    *(_DWORD *)(v4 + 16) = 0;
    v1 += 80;
  }
  for (int j = *((_DWORD *)this + 11); --j != -1; *((_DWORD *)this + 11) = j)
    ;
  for (int k = v3 - 1; k != -1; --k)
    *((_DWORD *)this + 5) = k;
  return SAList<unsigned char>::clear((uint64_t)this + 56);
}

uint64_t SAList<unsigned char>::clear(uint64_t result)
{
  for (int i = *(_DWORD *)(result + 12); --i != -1; *(_DWORD *)(result + 12) = i)
    ;
  return result;
}

uint64_t PacketCollection::add(PacketCollection *this, const AlgDataPacket *a2)
{
  uint64_t v3 = *((void *)a2 + 8);
  if (!v3)
  {
    while (80 * *((unsigned int *)this + 5) != v3)
    {
      uint64_t v5 = *((void *)this + 1);
      if (*(void *)a2 == *(void *)(v5 + v3))
      {
        uint64_t v6 = v5 + v3;
        if (*((void *)a2 + 1) == *(void *)(v6 + 8)
          && *((unsigned __int8 *)a2 + 33) == *(unsigned __int8 *)(v6 + 33))
        {
          return 0;
        }
      }
      v3 += 80;
    }
  }
  SAList<AlgDataPacket>::push_back((uint64_t)this + 8, a2);
  __int16 v9 = 0;
  SAList<PacketBookkeeper>::push_back((uint64_t)this + 32, &v9);
  char v8 = *((unsigned char *)this + 20) - 1;
  SAList<unsigned char>::push_back((uint64_t)this + 56, &v8);
  return 1;
}

void SAList<AlgDataPacket>::push_back(uint64_t a1, const void *a2)
{
  uint64_t v4 = OUTLINED_FUNCTION_3_0(a1);
  if (!v4)
  {
    uint64_t v4 = operator new(80 * *(unsigned int *)(v2 + 8), *(unsigned __int8 *)(v2 + 16));
    *(void *)uint64_t v2 = v4;
  }
  memcpy((void *)(v4 + 80 * *(unsigned int *)(v2 + 12)), a2, 0x50uLL);
  OUTLINED_FUNCTION_5_0();
}

void SAList<PacketBookkeeper>::push_back(uint64_t a1, _WORD *a2)
{
  uint64_t v4 = OUTLINED_FUNCTION_3_0(a1);
  if (!v4)
  {
    uint64_t v4 = operator new(2 * *(unsigned int *)(v2 + 8), *(unsigned __int8 *)(v2 + 16));
    *(void *)uint64_t v2 = v4;
  }
  *(_WORD *)(v4 + 2 * *(unsigned int *)(v2 + 12)) = *a2;
  OUTLINED_FUNCTION_5_0();
}

void SAList<unsigned char>::push_back(uint64_t a1, unsigned char *a2)
{
  uint64_t v4 = OUTLINED_FUNCTION_3_0(a1);
  if (!v4)
  {
    uint64_t v4 = operator new(*(unsigned int *)(v2 + 8), *(unsigned __int8 *)(v2 + 16));
    *(void *)uint64_t v2 = v4;
  }
  *(unsigned char *)(v4 + *(unsigned int *)(v2 + 12)) = *a2;
  OUTLINED_FUNCTION_5_0();
}

void AlgDataInjector::~AlgDataInjector(AlgDataInjector *this)
{
  PacketCollection::~PacketCollection(this);
  OUTLINED_FUNCTION_36();
  JUMPOUT(0x261178DD0);
}

uint64_t AlgDataExtractor::reset(AlgDataExtractor *this)
{
  unint64_t v2 = 0;
  uint64_t v3 = 1;
  uint64_t v4 = 56;
  while (v2 < *((unsigned int *)this + 11))
  {
    if (!*(unsigned char *)(*((void *)this + 4) + v3))
    {
      if (*(void *)(*((void *)this + 1) + v4)) {
        OUTLINED_FUNCTION_0_4();
      }
    }
    ++v2;
    v3 += 2;
    v4 += 80;
  }
  return PacketCollection::reset(this);
}

void AlgDataExtractor::~AlgDataExtractor(AlgDataExtractor *this)
{
  PacketCollection::~PacketCollection(this);
  OUTLINED_FUNCTION_36();
  JUMPOUT(0x261178DD0);
}

uint64_t AlgDataPacket::AlgDataPacket(uint64_t result, uint64_t a2, uint64_t a3, int a4, char a5, char a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10)
{
  *(void *)uint64_t result = a2;
  *(void *)(result + 8) = a3;
  *(_DWORD *)(result + 16) = a4;
  *(void *)(result + 24) = a8;
  *(unsigned char *)(result + 32) = a5;
  *(unsigned char *)(result + 33) = a6;
  *(_WORD *)(result + 34) = 0;
  *(void *)(result + 40) = a9;
  *(_DWORD *)(result + 48) = a10;
  *(void *)(result + 64) = 0;
  *(void *)(result + 72) = 0;
  *(void *)(result + 56) = a7;
  return result;
}

uint64_t PacketCollection::PacketCollection(uint64_t result, int a2, char a3)
{
  *(void *)uint64_t result = &unk_27096DAE8;
  *(void *)(result + 8) = 0;
  *(_DWORD *)(result + 16) = a2;
  *(_DWORD *)(result + 20) = 0;
  *(unsigned char *)(result + 24) = a3;
  *(void *)(result + 32) = 0;
  *(_DWORD *)(result + 40) = a2;
  *(_DWORD *)(result + 44) = 0;
  *(unsigned char *)(result + 48) = a3;
  *(void *)(result + 56) = 0;
  *(_DWORD *)(result + 64) = a2;
  *(_DWORD *)(result + 68) = 0;
  *(unsigned char *)(result + 72) = a3;
  return result;
}

void PacketCollection::append(PacketCollection *this, const PacketCollection *a2, unint64_t a3, unint64_t a4)
{
  OUTLINED_FUNCTION_29();
  uint64_t v11 = *(unsigned int *)(v10 + 20);
  if (v8 != -1) {
    uint64_t v11 = v8;
  }
  unint64_t v12 = v11 + v9;
  uint64_t v13 = v7 + 8;
  uint64_t v14 = v7 + 32;
  uint64_t v15 = v7 + 56;
  uint64_t v16 = 80 * v9;
  while (a4 < v12)
  {
    SAList<AlgDataPacket>::push_back(v13, (const void *)(*(void *)(v4 + 8) + v16));
    __int16 v18 = 0;
    SAList<PacketBookkeeper>::push_back(v14, &v18);
    char v17 = *(unsigned char *)(v5 + 20) - 1;
    SAList<unsigned char>::push_back(v15, &v17);
    ++a4;
    v16 += 80;
  }
  OUTLINED_FUNCTION_28();
}

uint64_t PacketCollection::at(PacketCollection *this, uint64_t a2)
{
  return *((void *)this + 1) + 80 * a2;
}

_DWORD *PacketCollection::popIterableAt(_DWORD *this, uint64_t a2)
{
  int v2 = this[17];
  uint64_t v3 = (v2 - 1);
  if (v3 == a2)
  {
    if (v2) {
      this[17] = v3;
    }
  }
  else
  {
    this[17] = v3;
    return memmove((void *)(*((void *)this + 7) + a2), (const void *)(*((void *)this + 7) + a2 + 1), v3 - a2);
  }
  return this;
}

uint64_t PacketCollection::getFor(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v4 = 0;
  uint64_t v5 = 0;
  uint64_t v6 = *(unsigned int *)(a1 + 20);
  while (1)
  {
    if (v6 == v5) {
      return 0;
    }
    uint64_t v7 = *(void *)(a1 + 8);
    BOOL v8 = *(void *)(v7 + v4) == a2 && *(void *)(v7 + v4 + 8) == a3;
    if (v8 && *(unsigned __int8 *)(v7 + v4 + 33) == a4) {
      break;
    }
    ++v5;
    v4 += 80;
  }
  uint64_t v10 = 0;
  if ((v5 & 0x80000000) == 0 && v6 > v5)
  {
    uint64_t v10 = v7 + 80 * v5;
    int v11 = *(unsigned __int8 *)(v10 + 32);
    BOOL v12 = v11 == 2 && *(unsigned char *)(*(void *)(a1 + 32) + 2 * v5) != 0;
    if (v11 == 1 || v12)
    {
      *(unsigned char *)(*(void *)(a1 + 32) + 2 * v5 + 1) = 1;
      return v10;
    }
    return 0;
  }
  return v10;
}

uint64_t AlgDataExtractor::callbackFor(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  if (!a4) {
    return 0;
  }
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_20();
  return v12(v4, v5, v6, v7, v8, v9, v10, v11, a2, a3);
}

void AlgsDevice::StreamingClient::finish(AlgsDevice::StreamingClient *this)
{
  if (*((_WORD *)this + 10) && *(void *)(*((void *)this + 4) + 104))
  {
    AlgsDevice::StreamingClient::saveTimestamp((uint64_t)this, 0x652B2D24D46);
    *(unsigned char *)(*((void *)this + 1) + 5) = *((unsigned char *)this + 20);
    uint64_t v2 = SABinaryWriter::addExtractionData((AlgsDevice::StreamingClient *)((char *)this + 48), 0x3779B8717A8905ELL, 0xC0246BF06F597652, 0, 39424, *((unsigned __int16 *)this + 8), *((const void **)this + 1));
    if (v2) {
      *((unsigned char *)this + 97) = 1;
    }
    else {
      OUTLINED_FUNCTION_2_1(v2);
    }
  }
  if (!*((unsigned char *)this + 97) && !*((void *)this + 11)) {
    OUTLINED_FUNCTION_2_1(0);
  }
  *((unsigned char *)this + 97) = 0;
}

uint64_t AlgsDevice::StreamingClient::saveTimestamp(uint64_t this, uint64_t a2)
{
  uint64_t v2 = *(void *)(this + 24);
  if (v2)
  {
    uint64_t v3 = this;
    uint64_t v4 = *(uint64_t (**)(void))(*(void *)(this + 32) + 104);
    if (v4)
    {
      unsigned int v6 = *(unsigned __int16 *)(this + 20);
      if (v6 == *(unsigned __int16 *)(this + 18))
      {
        AlgsDevice::StreamingClient::profileAlloc((AlgsDevice::StreamingClient *)this, 2 * (*(_WORD *)(this + 16) & 0x7FFF));
        unsigned int v6 = *(unsigned __int16 *)(v3 + 20);
        uint64_t v2 = *(void *)(v3 + 24);
        uint64_t v4 = *(uint64_t (**)(void))(*(void *)(v3 + 32) + 104);
      }
      *(void *)(v2 + 16 * v6) = a2;
      this = v4();
      uint64_t v7 = *(unsigned __int16 *)(v3 + 20);
      *(void *)(*(void *)(v3 + 24) + 16 * v7 + 8) = this;
      *(_WORD *)(v3 + 20) = v7 + 1;
    }
  }
  return this;
}

void AlgsDevice::StreamingClient::profileAlloc(AlgsDevice::StreamingClient *this, unsigned int a2)
{
  *((_WORD *)this + 8) = a2;
  *((_WORD *)this + 9) = (a2 + 1048568) >> 4;
  uint64_t v3 = *((void *)this + 1);
  uint64_t v4 = operator new(a2, *((unsigned __int8 *)this + 120));
  *((void *)this + 1) = v4;
  if (v3)
  {
    OUTLINED_FUNCTION_18();
    memcpy(v5, v6, v7);
    OUTLINED_FUNCTION_12_0();
  }
  else
  {
    *(_DWORD *)uint64_t v4 = 20488;
    *(unsigned char *)(v4 + 4) = 2;
    *(unsigned char *)(v4 + 6) = 2;
  }
  *((void *)this + 3) = *((void *)this + 1) + 8;
}

void AlgsDevice::StreamingClient::start(uint64_t a1, int *a2, PacketCollection *a3, AlgDataExtractor *a4)
{
  uint64_t v4 = a1 + 48;
  if (*(void *)(a1 + 48))
  {
    uint64_t v9 = (_OWORD *)(a1 + 40);
    *(_WORD *)(a1 + 20) = 0;
    AlgsDevice::StreamingClient::saveTimestamp(a1, 0x310E1E39B3);
    int v10 = *(unsigned __int8 *)(a1 + 96);
    *(unsigned char *)(a1 + 97) |= v10;
    if (!v10) {
      a3 = 0;
    }
    if (a2)
    {
      int v11 = *a2;
      uint64_t v13 = *((void *)a2 + 1);
      BOOL v12 = (const void *)*((void *)a2 + 2);
      if (SABinaryWriter::writeHeader(v4, 2))
      {
        if (SABinaryWriter::writeData((SABinaryWriter *)v4, v11, (unsigned __int16)v13, v12))
        {
          StreamingWriter::writeInjExtData((StreamingWriter *)(v4 - 8), 1, a3, 0);
          if (v14) {
            goto LABEL_11;
          }
        }
      }
    }
    else if (StreamingWriter::writeInjext((StreamingWriter *)(v4 - 8), *(void *)(a1 + 88), a3, 0, a4, 0))
    {
      goto LABEL_11;
    }
    SABinaryWriter::updateCacheSizes(0, 0);
    *(unsigned char *)(v4 + 24) = 0;
    _OWORD *v9 = 0u;
    *(_OWORD *)(v4 + 8) = 0u;
    *(unsigned char *)(a1 + 74) = 0;
    *(void *)(a1 + 80) = 0;
  }
LABEL_11:
  OUTLINED_FUNCTION_32();
}

void AlgsDevice::StreamingClient::reset(AlgsDevice::StreamingClient *this)
{
  if (*((void *)this + 6))
  {
    uint64_t v2 = (int *)*((void *)this + 4);
    unint64_t Info = AlgsDevice::getInfo((AlgsDevice *)v2);
    AlgDataExtractor::AlgDataExtractor((uint64_t)v4, v2[12], 1);
    AlgsDevice::getClientExtractor(*((void *)this + 4), (uint64_t)v4);
    StreamingWriter::writeResetOrInfo((uint64_t)this + 40, 1, BYTE5(Info), Info, BYTE4(Info), BYTE6(Info), *((void *)this + 4) + 80, *((unsigned char *)this + 96));
    PacketCollection::~PacketCollection((PacketCollection *)v4);
  }
}

void sub_25BF37870(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  PacketCollection::~PacketCollection((PacketCollection *)va);
  _Unwind_Resume(a1);
}

void AlgsDevice::StreamingClient::~StreamingClient(AlgsDevice::StreamingClient *this)
{
  AlgsDevice::StreamingClient::~StreamingClient(this);
  OUTLINED_FUNCTION_36();
  JUMPOUT(0x261178DD0);
}

{
  uint64_t v2;
  uint64_t v3;

  *(void *)this = &unk_27096DA58;
  if (*((void *)this + 13))
  {
    OUTLINED_FUNCTION_1_2();
    (*(void (**)(void))(v2 + 8))();
  }
  if (*((void *)this + 14))
  {
    OUTLINED_FUNCTION_1_2();
    (*(void (**)(void))(v3 + 8))();
  }
  OUTLINED_FUNCTION_12_0();
  StreamingPacketCache::~StreamingPacketCache((AlgsDevice::StreamingClient *)((char *)this + 128));
}

void AlgsDevice::StreamingClient::configure(AlgsDevice::StreamingClient *this, char a2, AlgDataExtractor *a3)
{
  *((unsigned char *)this + 96) = a2;
  OUTLINED_FUNCTION_12_0();
  uint64_t v5 = 0;
  unint64_t v6 = 0;
  *((void *)this + 1) = 0;
  *((void *)this + 3) = 0;
  while (v6 < *((unsigned int *)a3 + 5))
  {
    size_t v7 = (void *)(*((void *)a3 + 1) + v5);
    if (*v7 == 0x3779B8717A8905ELL && v7[1] == 0xC0246BF06F597652)
    {
      *((void *)a3 + 10) = AlgsDevice::StreamingClient::configure(BOOL,AlgDataExtractor &)::$_0::__invoke;
      *((void *)a3 + 11) = this;
      AlgsDevice::StreamingClient::profileAlloc(this, *((unsigned __int16 *)this + 8));
    }
    v7[8] = AlgsDevice::StreamingClient::extraction;
    v7[9] = this;
    ++v6;
    v5 += 80;
  }
  OUTLINED_FUNCTION_32();
  AlgsDevice::addClient(v9, v10, v11, v12);
}

double AlgsDevice::StreamingClient::extraction(__int16 *a1)
{
  uint64_t v1 = *(void *)a1;
  uint64_t v2 = (SABinaryWriter *)(*(void *)a1 + 48);
  if (*(void *)v2)
  {
    if (SABinaryWriter::addExtractionData((SABinaryWriter *)(*(void *)a1 + 48), *((void *)a1 + 1), *((void *)a1 + 2), *((unsigned __int8 *)a1 + 28) == 1, a1[12], (unsigned __int16)(*((_DWORD *)a1 + 12) + a1[16]), 0)&& SABinaryWriter::write(v2, *((const void **)a1 + 5), (unsigned __int16)a1[16])&& SABinaryWriter::write(v2, *((const void **)a1 + 7), (unsigned __int16)a1[24]))
    {
      *(unsigned char *)(v1 + 97) = 1;
    }
    else
    {
      SABinaryWriter::updateCacheSizes(0, 0);
      *(unsigned char *)(v1 + 72) = 0;
      double result = 0.0;
      *(_OWORD *)(v1 + 40) = 0u;
      *(_OWORD *)(v1 + 56) = 0u;
      *(unsigned char *)(v1 + 74) = 0;
      *(void *)(v1 + 80) = 0;
    }
  }
  return result;
}

uint64_t AlgsDevice::StreamingClient::writeTreeInfo(void)::$_0::__invoke(uint64_t a1, uint64_t *a2)
{
  if (*(unsigned char *)(a1 + 72) != 8) {
    return 0;
  }
  unint64_t v3 = 0;
  uint64_t v4 = (SABinaryWriter *)(a1 + 48);
  char v5 = *((unsigned char *)a2 + 16);
  uint64_t v6 = *a2;
  uint64_t v7 = a2[1];
  char v8 = *((unsigned char *)a2 + 17);
  uint64_t v9 = *(void *)(a1 + 48);
  uint64_t v10 = v9 + *(void *)(a1 + 64);
  unint64_t v11 = *(unsigned __int16 *)(v9 + 5);
  BOOL v12 = (void *)(v10 - 16 * v11);
  for (int i = v12; ; i += 2)
  {
    if (v11 == v3)
    {
      unint64_t v3 = *(unsigned __int16 *)(v9 + 5);
      __int16 v14 = *(_WORD *)(v9 + 5);
      goto LABEL_8;
    }
    if (*i == v6) {
      break;
    }
    ++v3;
  }
  __int16 v14 = v3;
LABEL_8:
  uint64_t v15 = *(unsigned __int16 *)(v9 + 3);
  unint64_t v16 = v9 + 7 + 4 * v15;
  if (v16 >= (unint64_t)v12) {
    return 0;
  }
  *(_WORD *)unint64_t v16 = v14;
  *(unsigned char *)(v16 + 2) = v8;
  *(unsigned char *)(v16 + 3) = v5;
  *(_WORD *)(v9 + 3) = v15 + 1;
  if (v3 >= v11)
  {
    v18[0] = v6;
    v18[1] = v7;
    uint64_t result = SABinaryWriter::write(v4, v18, 0x10uLL);
    if (!result) {
      return result;
    }
    ++*(_WORD *)(v9 + 5);
  }
  return 1;
}

void AlgDataExtractor::AlgDataExtractor(AlgDataExtractor *this)
{
  *((void *)this + 2) = 16;
  *((unsigned char *)this + 24) = 1;
  *((void *)this + 4) = 0;
  *((void *)this + 5) = 16;
  *((unsigned char *)this + 48) = 1;
  *((void *)this + 7) = 0;
  *((void *)this + 8) = 16;
  *((unsigned char *)this + 72) = 1;
  *(void *)this = &unk_27096DAB8;
  *((void *)this + 1) = 0;
  *((void *)this + 10) = 0;
  *((void *)this + 11) = 0;
}

uint64_t AlgsDevice::StreamingClient::configureStatus(AlgsDevice::StreamingClient *this)
{
  AlgDataExtractor::AlgDataExtractor((uint64_t)v5, *(_DWORD *)(*((void *)this + 4) + 48), 1);
  AlgsDevice::getClientExtractor(*((void *)this + 4), (uint64_t)v5);
  uint64_t v3 = StreamingWriter::writeConfigure((AlgsDevice::StreamingClient *)((char *)this + 40), *((unsigned char *)this + 96), (AlgDataExtractor *)v5, v2);
  PacketCollection::~PacketCollection((PacketCollection *)v5);
  return v3;
}

void sub_25BF37CC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void AlgsDevice::StreamingClient::translate(AlgsDevice::StreamingClient *this, PacketCollection *a2, PacketCollection *a3)
{
  OUTLINED_FUNCTION_11_0();
  uint64_t v6 = *(void *)(v3 + 104);
  if (v6)
  {
    uint64_t v7 = v3;
    if (*(void *)(v3 + 112))
    {
      uint64_t v8 = v5;
      uint64_t v9 = v4;
      uint64_t v10 = 0;
      for (unint64_t i = 0; i < *(unsigned int *)(v6 + 20); ++i)
      {
        uint64_t v12 = *(void *)(v7 + 112);
        if (i >= *(unsigned int *)(v12 + 20)) {
          break;
        }
        uint64_t v13 = *(void *)(v6 + 8);
        uint64_t v14 = *(void *)(v12 + 8);
        uint64_t v15 = PacketCollection::getFor(v8, *(void *)(v13 + v10), *(void *)(v13 + v10 + 8), *(unsigned __int8 *)(v13 + v10 + 33));
        if (v15
          || (uint64_t v15 = PacketCollection::getFor(v9, *(void *)(v13 + v10), *(void *)(v13 + v10 + 8), *(unsigned __int8 *)(v13 + v10 + 33))) != 0)
        {
          *(_OWORD *)uint64_t v15 = *(_OWORD *)(v14 + v10);
          *(unsigned char *)(v15 + 33) = *(unsigned char *)(v14 + v10 + 33);
          if (*(unsigned char *)(v15 + 32) == 2)
          {
            *(unsigned char *)(v15 + 32) = 1;
            OUTLINED_FUNCTION_19();
            (*(void (**)(uint64_t))(v16 + 16))(v9);
          }
        }
        uint64_t v6 = *(void *)(v7 + 104);
        v10 += 80;
      }
    }
  }
  OUTLINED_FUNCTION_13_0();
}

uint64_t AlgsDevice::StreamingClient::setBuffer(AlgsDevice::StreamingClient *this, void *a2, uint64_t a3)
{
  OUTLINED_FUNCTION_29();
  uint64_t result = SABinaryWriter::updateCacheSizes(0, 0);
  *(void *)(v4 + 40) = 0;
  *(void *)(v4 + 48) = v3;
  *(void *)(v4 + 56) = a3;
  *(void *)(v4 + 64) = 0;
  *(unsigned char *)(v4 + 72) = 0;
  *(unsigned char *)(v4 + 74) = 0;
  *(void *)(v4 + 80) = 0;
  return result;
}

uint64_t AlgsDevice::StreamingClient::resetBuffer(AlgsDevice::StreamingClient *this)
{
  uint64_t v1 = *((void *)this + 8);
  OUTLINED_FUNCTION_2_1(0);
  return v1;
}

void OUTLINED_FUNCTION_0_4()
{
  JUMPOUT(0x261178DC0);
}

double OUTLINED_FUNCTION_2_1(uint64_t a1)
{
  SABinaryWriter::updateCacheSizes(a1, 0);
  *(unsigned char *)(v1 + 72) = 0;
  double result = 0.0;
  *(_OWORD *)(v1 + 56) = 0u;
  *(_OWORD *)(v1 + 40) = 0u;
  *(unsigned char *)(v1 + 74) = 0;
  *(void *)(v1 + 80) = 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_3_0(uint64_t a1)
{
  return *(void *)a1;
}

void OUTLINED_FUNCTION_5_0()
{
  ++*(_DWORD *)(v0 + 12);
}

uint64_t OUTLINED_FUNCTION_9_0(uint64_t a1, uint64_t a2)
{
  return StreamingParser::addPacket(*(void *)(a1 + 8), a2, 1);
}

uint64_t OUTLINED_FUNCTION_10_0(uint64_t a1, uint64_t a2)
{
  return StreamingParser::addPacket(*(void *)(a1 + 16), a2, 2);
}

void OUTLINED_FUNCTION_12_0()
{
  JUMPOUT(0x261178DD0);
}

uint64_t OUTLINED_FUNCTION_14_0(uint64_t result, double a2)
{
  *(double *)(result + 16) = a2;
  *(unsigned char *)(result + 24) = 0;
  *(void *)(result + 32) = 0;
  *(double *)(result + 40) = a2;
  *(unsigned char *)(result + 48) = 0;
  *(void *)(result + 56) = 0;
  *(double *)(result + 64) = a2;
  *(unsigned char *)(result + 72) = 0;
  *(void *)(result + 80) = 0;
  *(double *)(result + 88) = a2;
  *(unsigned char *)(result + 96) = 0;
  return result;
}

BOOL OUTLINED_FUNCTION_15(uint64_t a1, unsigned int a2)
{
  return AlgWorkNode::extractDataIfOnList(a1, a2, v4, v3, v2);
}

_DWORD *OUTLINED_FUNCTION_16()
{
  *(unsigned char *)(*(void *)(v0 + 32) + 2 * *(unsigned __int8 *)(*(void *)(v0 + 56) - v2 + v1)) = v3;
  return PacketCollection::popIterableAt((_DWORD *)v0, v1 - v2);
}

void OUTLINED_FUNCTION_17(AlgWorkNode *this, AlgDataInjector *a2, AlgDataExtractor *a3)
{
  AlgWorkNode::runPrologue(this, a2, a3);
}

uint64_t OUTLINED_FUNCTION_21@<X0>(char a1@<W1>, unsigned char *a2@<X8>)
{
  *a2 = a1;
  return 1;
}

void OUTLINED_FUNCTION_23()
{
  AlgWorkNode::runEpilogue(v2, v1, v0);
}

uint64_t OUTLINED_FUNCTION_24(uint64_t result)
{
  *(_DWORD *)(result + 16) = 0;
  *(_DWORD *)(result + 24) = 0;
  *(_WORD *)(result + 20) = 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_25(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, char a20,char a21)
{
  if (v21) {
    char v25 = v23;
  }
  else {
    char v25 = v23 + 1;
  }
  a21 = v25;
  return SABinaryWriter::write(v22, &a18, 0x12uLL);
}

uint64_t OUTLINED_FUNCTION_26()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_27(uint64_t a1, const void *a2)
{
  return SABinaryWriter::write(v2, a2, 1uLL);
}

void *OUTLINED_FUNCTION_30()
{
  v0[5] = v1;
  v0[7] = v1 + v0[4];
  return v0;
}

uint64_t OUTLINED_FUNCTION_31(uint64_t a1)
{
  return *(void *)(a1 + 64);
}

char *OUTLINED_FUNCTION_33(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  return &a13;
}

uint64_t OUTLINED_FUNCTION_34()
{
  return 0;
}

void *OUTLINED_FUNCTION_37(uint64_t a1, int a2)
{
  return AlgDataExtractor::AlgDataExtractor(v2 - 184, a2, 1);
}

uint64_t OUTLINED_FUNCTION_38()
{
  return v0;
}

void OUTLINED_FUNCTION_40()
{
  JUMPOUT(0x261178DC0);
}

uint64_t OUTLINED_FUNCTION_41()
{
  return v0;
}

uint64_t IOHIDEventCreateForceStageEvent()
{
  return MEMORY[0x270EF4270]();
}

uint64_t IOHIDEventCreateTouchSensitiveButtonEventWithRadius()
{
  return MEMORY[0x270EF42D8]();
}

uint64_t IOHIDEventSetPhase()
{
  return MEMORY[0x270EF43D8]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void std::terminate(void)
{
}

void operator delete[]()
{
  while (1)
    ;
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

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x270ED7DA0](lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x270F98F10](a1);
}

void __cxa_guard_release(__guard *a1)
{
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

void bzero(void *a1, size_t a2)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x270EDA158]();
}

uint64_t mach_get_times()
{
  return MEMORY[0x270EDA170]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x270EDAA60](log);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x270EDB658](__s1, __n);
}