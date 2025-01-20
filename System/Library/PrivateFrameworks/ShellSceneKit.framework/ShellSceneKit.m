__CFString *SSKDisplayCloneMirroringModeDescription(uint64_t a1)
{
  __CFString *v1;

  v1 = @"<.Invalid>";
  if (a1 == 1) {
    v1 = @".Default";
  }
  if (a1 == 2) {
    return @".Disabled";
  }
  else {
    return v1;
  }
}

void sub_25C4476F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id _SSKActiveAssertion(void *a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v1 = a1;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    v4 = 0;
    uint64_t v5 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v1);
        }
        v7 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        v8 = [v1 objectForKey:v7];
        if ([v8 wantsControlOfDisplay])
        {
          unint64_t v9 = [v4 level];
          if (v9 < [v7 level])
          {
            id v10 = v7;

            v4 = v10;
          }
        }
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v3);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id _SSKDisplayControllerLoggingProem(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = _NSFullMethodName();
  uint64_t v6 = [v5 rangeOfString:@" "];
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = v6;
    if (v3)
    {
      v8 = [v3 description];
    }
    else
    {
      v8 = @"disconnected";
    }
    unint64_t v9 = NSString;
    id v10 = [v5 substringToIndex:v7];
    v11 = [v5 substringFromIndex:v7 + 1];
    uint64_t v12 = [v9 stringWithFormat:@"<%@:%p> [%@] %@", v10, v4, v8, v11];

    uint64_t v5 = (void *)v12;
  }

  return v5;
}

__CFString *SSKCADisplayDifferenceMaskDescription(uint64_t a1)
{
  if (a1)
  {
    if (a1 == -1)
    {
      uint64_t v2 = @"<invalid>";
    }
    else
    {
      id v3 = [MEMORY[0x263F089D8] stringWithString:@"["];
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      uint64_t v12 = __SSKCADisplayDifferenceMaskDescription_block_invoke;
      long long v13 = &unk_2654B17E0;
      id v4 = v3;
      id v14 = v4;
      long long v15 = @"[";
      uint64_t v5 = v11;
      char v16 = 0;
      uint8x8_t v6 = (uint8x8_t)vcnt_s8((int8x8_t)a1);
      v6.i16[0] = vaddlv_u8(v6);
      int v7 = v6.i32[0];
      if (v6.i32[0])
      {
        unint64_t v8 = 0;
        do
        {
          if (((1 << v8) & a1) != 0)
          {
            ((void (*)(void *))v12)(v5);
            if (v16) {
              break;
            }
            --v7;
          }
          if (v8 > 0x3E) {
            break;
          }
          ++v8;
        }
        while (v7 > 0);
      }

      [v4 appendString:@"]"];
      unint64_t v9 = v15;
      uint64_t v2 = (__CFString *)v4;
    }
  }
  else
  {
    uint64_t v2 = @"<none>";
  }
  return v2;
}

uint64_t __SSKCADisplayDifferenceMaskDescription_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) isEqualToString:*(void *)(a1 + 40)];
  if ((result & 1) == 0) {
    uint64_t result = [*(id *)(a1 + 32) appendString:@"|"];
  }
  uint64_t v5 = a2 - 1;
  if (unint64_t)(a2 - 1) <= 7 && ((0x8Bu >> v5))
  {
    uint8x8_t v6 = off_2654B1800[v5];
    int v7 = *(void **)(a1 + 32);
    return [v7 appendString:v6];
  }
  return result;
}

uint64_t SSKCADifferenceMaskCalculate(void *a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  id v10 = v8;
  if (!v10) {
    goto LABEL_10;
  }
  NSClassFromString(&cfstr_Cadisplaymode.isa);
  if (objc_opt_isKindOfClass())
  {

    if (v9)
    {
      v11 = [v7 currentMode];
      uint64_t v12 = BSEqualObjects() ^ 1;
      long long v13 = [v7 overscanAdjustment];
      if (!BSEqualStrings()) {
        v12 |= 2uLL;
      }
      [v7 logicalScale];
      if (BSFloatApproximatelyEqualToFloat())
      {
        if (!BSFloatApproximatelyEqualToFloat()) {
          v12 |= 4uLL;
        }
      }
      else
      {
        v12 |= 4uLL;
      }
      if ([v7 pointScale] == a4) {
        uint64_t v14 = v12;
      }
      else {
        uint64_t v14 = v12 | 8;
      }

      goto LABEL_16;
    }
LABEL_10:
    uint64_t v14 = -1;
LABEL_16:

    return v14;
  }
  char v16 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:CADisplayModeClass]"];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    SSKCADifferenceMaskCalculate_cold_1((uint64_t)v16);
  }
  [v16 UTF8String];
  uint64_t result = _bs_set_crash_log_message();
  __break(0);
  return result;
}

BOOL SSKCADisplayDifferenceMaskHasDifference(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 0xFFFFFFFFFFFFFFFELL;
}

void sub_25C45123C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t SSKDisplaysShareRoot(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = [a1 rootIdentity];
  uint64_t v5 = [v3 rootIdentity];

  uint64_t v6 = [v4 isEqual:v5];
  return v6;
}

void sub_25C452B5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void sub_25C452CE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id SSKExtractFromBuilder(void *a1)
{
  id v8 = 0;
  id v1 = [a1 buildConfigurationWithError:&v8];
  id v2 = v8;
  if (v2)
  {
    id v4 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"FBSDisplayConfiguration *SSKExtractFromBuilder(__strong id<SSKDisplayConfigurationBuilding>)"];
    [v4 handleFailureInFunction:v5, @"SSKRootDisplayDriver.m", 31, @"error building display: %@", v2 file lineNumber description];

    if (v1) {
      goto LABEL_3;
    }
  }
  else if (v1)
  {
    goto LABEL_3;
  }
  uint64_t v6 = [MEMORY[0x263F08690] currentHandler];
  id v7 = [NSString stringWithUTF8String:"FBSDisplayConfiguration *SSKExtractFromBuilder(__strong id<SSKDisplayConfigurationBuilding>)"];

LABEL_3:
  return v1;
}

id _SSKLoggingMethodProem(void *a1, int a2)
{
  id v3 = a1;
  id v4 = _NSFullMethodName();
  uint64_t v5 = v4;
  if (a2)
  {
    uint64_t v6 = [v4 rangeOfString:@" "];
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v7 = v6;
      id v8 = NSString;
      id v9 = [v5 substringToIndex:v6];
      id v10 = [v5 substringFromIndex:v7 + 1];
      uint64_t v11 = [v8 stringWithFormat:@"%@ (%p) %@", v9, v3, v10];

      uint64_t v5 = (void *)v11;
    }
  }

  return v5;
}

id SSKLogDisplayMonitor()
{
  if (SSKLogDisplayMonitor_onceToken != -1) {
    dispatch_once(&SSKLogDisplayMonitor_onceToken, &__block_literal_global_3);
  }
  v0 = (void *)SSKLogDisplayMonitor___logObj;
  return v0;
}

uint64_t __SSKLogDisplayMonitor_block_invoke()
{
  SSKLogDisplayMonitor___logObj = (uint64_t)os_log_create("com.apple.ShellSceneKit", "DisplayMonitor");
  return MEMORY[0x270F9A758]();
}

id SSKLogDisplayAssertions()
{
  if (SSKLogDisplayAssertions_onceToken != -1) {
    dispatch_once(&SSKLogDisplayAssertions_onceToken, &__block_literal_global_7);
  }
  v0 = (void *)SSKLogDisplayAssertions___logObj;
  return v0;
}

uint64_t __SSKLogDisplayAssertions_block_invoke()
{
  SSKLogDisplayAssertions___logObj = (uint64_t)os_log_create("com.apple.ShellSceneKit", "DisplayAssertions");
  return MEMORY[0x270F9A758]();
}

id SSKLogDisplayControlling()
{
  if (SSKLogDisplayControlling_onceToken != -1) {
    dispatch_once(&SSKLogDisplayControlling_onceToken, &__block_literal_global_10);
  }
  v0 = (void *)SSKLogDisplayControlling___logObj;
  return v0;
}

uint64_t __SSKLogDisplayControlling_block_invoke()
{
  SSKLogDisplayControlling___logObj = (uint64_t)os_log_create("com.apple.ShellSceneKit", "DisplayControlling");
  return MEMORY[0x270F9A758]();
}

id SSKLogDisplayTransforming()
{
  if (SSKLogDisplayTransforming_onceToken[0] != -1) {
    dispatch_once(SSKLogDisplayTransforming_onceToken, &__block_literal_global_13);
  }
  v0 = (void *)SSKLogDisplayTransforming___logObj;
  return v0;
}

uint64_t __SSKLogDisplayTransforming_block_invoke()
{
  SSKLogDisplayTransforming___logObj = (uint64_t)os_log_create("com.apple.ShellSceneKit", "DisplayTransforming");
  return MEMORY[0x270F9A758]();
}

id SSKLogRootDisplayDriver()
{
  if (SSKLogRootDisplayDriver_onceToken != -1) {
    dispatch_once(&SSKLogRootDisplayDriver_onceToken, &__block_literal_global_16);
  }
  v0 = (void *)SSKLogRootDisplayDriver___logObj;
  return v0;
}

uint64_t __SSKLogRootDisplayDriver_block_invoke()
{
  SSKLogRootDisplayDriver___logObj = (uint64_t)os_log_create("com.apple.ShellSceneKit", "RootDisplayDriver");
  return MEMORY[0x270F9A758]();
}

uint64_t sub_25C4549BC(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_25C4549D0(_OWORD *a1, uint64_t a2, uint64_t a3)
{
  id v3 = *(uint64_t (**)(_OWORD *))(a3 + 16);
  long long v4 = a1[1];
  v6[0] = *a1;
  v6[1] = v4;
  v6[2] = a1[2];
  return v3(v6);
}

uint64_t sub_25C454A14(_OWORD *a1, _OWORD *a2, uint64_t a3, uint64_t a4)
{
  long long v4 = *(uint64_t (**)(_OWORD *, _OWORD *))(a4 + 24);
  long long v5 = a1[1];
  v9[0] = *a1;
  v9[1] = v5;
  v9[2] = a1[2];
  long long v6 = a2[1];
  v8[0] = *a2;
  v8[1] = v6;
  v8[2] = a2[2];
  return v4(v9, v8);
}

uint64_t sub_25C454A6C(_OWORD *a1, uint64_t a2, uint64_t a3)
{
  id v3 = *(uint64_t (**)(_OWORD *))(a3 + 32);
  long long v4 = a1[1];
  v6[0] = *a1;
  v6[1] = v4;
  v6[2] = a1[2];
  return v3(v6);
}

uint64_t sub_25C454AB0(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

void type metadata accessor for DisplayPriority(uint64_t a1)
{
}

BOOL sub_25C454AD8(void *a1, void *a2)
{
  return *a1 == *a2;
}

void sub_25C454AEC(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_25C454AF4@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

BOOL sub_25C454B08(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_25C454B38(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_25C454B4C(void *result)
{
  *v1 &= *result;
  return result;
}

uint64_t sub_25C454B60()
{
  return MEMORY[0x270EF1CE0](*v0);
}

uint64_t sub_25C454B68(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = 0;
  char v7 = 1;
  uint64_t result = MEMORY[0x261185CF0](a1, &v6);
  uint64_t v4 = v6;
  char v5 = v7;
  if (v7) {
    uint64_t v4 = 0;
  }
  *(void *)a2 = v4;
  *(unsigned char *)(a2 + 8) = v5;
  return result;
}

uint64_t sub_25C454BBC(uint64_t a1, uint64_t a2)
{
  char v3 = sub_25C47ACC8();
  *(void *)a2 = 0;
  *(unsigned char *)(a2 + 8) = 1;
  return v3 & 1;
}

uint64_t sub_25C454C14@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25C47ACD8();
  *a1 = result;
  return result;
}

void *sub_25C454C3C@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_25C454C4C(void *a1@<X8>)
{
  *a1 = *v1;
}

void *sub_25C454C58@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_25C454C64()
{
  return sub_25C47AF78();
}

uint64_t sub_25C454D04()
{
  return sub_25C454D6C(&qword_26A5A8578);
}

uint64_t sub_25C454D38()
{
  return sub_25C454D6C(&qword_26A5A8580);
}

uint64_t sub_25C454D6C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for DisplayPriority(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_25C454DB0()
{
  return sub_25C454D6C((unint64_t *)&qword_26A5A8588);
}

uint64_t sub_25C454DE4()
{
  return MEMORY[0x270F9E010](*v0);
}

uint64_t sub_25C454DEC()
{
  return sub_25C47B078();
}

uint64_t sub_25C454E18(uint64_t a1)
{
  return MEMORY[0x270F9FC40](a1, *v1);
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
}

void sub_25C454E34(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_25C454EA8(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  v3[5] = sub_25C47ABD8();
  v3[6] = sub_25C47ABC8();
  uint64_t v5 = sub_25C47AB88();
  v3[7] = v5;
  v3[8] = v4;
  return MEMORY[0x270FA2498](sub_25C454F48, v5, v4);
}

uint64_t sub_25C454F48()
{
  uint64_t v1 = *(void *)(v0 + 32);
  long long v5 = *(_OWORD *)(v0 + 16);
  *(void *)(v0 + 72) = sub_25C47ABC8();
  uint64_t v2 = swift_task_alloc();
  *(void *)(v0 + 80) = v2;
  *(void *)(v2 + 16) = v1;
  *(_OWORD *)(v2 + 24) = v5;
  char v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 88) = v3;
  *char v3 = v0;
  v3[1] = sub_25C45505C;
  return MEMORY[0x270FA2360]();
}

uint64_t sub_25C45505C()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 96) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 56);
    uint64_t v4 = *(void *)(v2 + 64);
    long long v5 = sub_25C4551E4;
  }
  else
  {
    swift_release();
    swift_task_dealloc();
    uint64_t v3 = *(void *)(v2 + 56);
    uint64_t v4 = *(void *)(v2 + 64);
    long long v5 = sub_25C455180;
  }
  return MEMORY[0x270FA2498](v5, v3, v4);
}

uint64_t sub_25C455180()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25C4551E4()
{
  swift_release();
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25C45525C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v19 = a2;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A8668);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a3;
  *(void *)(v10 + 24) = a4;
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = sub_25C455578;
  *(void *)(v11 + 24) = v10;
  v24 = sub_25C455578;
  uint64_t v25 = v11;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v21 = 1107296256;
  v22 = sub_25C4555B0;
  v23 = &block_descriptor;
  uint64_t v12 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v7);
  unint64_t v13 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v14 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v14 + v13, (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
  v24 = sub_25C455774;
  uint64_t v25 = v14;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v21 = 1107296256;
  v22 = sub_25C4557F8;
  v23 = &block_descriptor_11;
  long long v15 = _Block_copy(&aBlock);
  swift_release();
  objc_msgSend(v19, sel_performUpdate_withCompletion_, v12, v15);
  _Block_release(v15);
  _Block_release(v12);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (isEscapingClosureAtFileLocation) {
    __break(1u);
  }
  return result;
}

uint64_t sub_25C455518(uint64_t a1)
{
  return sub_25C45525C(a1, *(void **)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32));
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_25C455568()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25C455578()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_25C4555A0()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_25C4555B0(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void (**)(id, id))(a1 + 32);
  id v6 = a2;
  id v5 = a3;
  v4(v6, v5);
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t sub_25C455634(char a1, id a2)
{
  if (a2)
  {
    id v2 = a2;
  }
  else
  {
    if (a1)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A8668);
      return sub_25C47ABA8();
    }
    sub_25C455870();
    swift_allocError();
    void *v4 = 0xD000000000000020;
    v4[1] = 0x800000025C47FEB0;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A8668);
  return sub_25C47AB98();
}

uint64_t sub_25C4556E0()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A8668);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_25C455774(char a1, void *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A8668);
  return sub_25C455634(a1, a2);
}

void sub_25C4557F8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

unint64_t sub_25C455870()
{
  unint64_t result = qword_26A5A8670[0];
  if (!qword_26A5A8670[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A5A8670);
  }
  return result;
}

void *_s16SceneUpdateErrorOwCP(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s16SceneUpdateErrorOwxx()
{
  return swift_bridgeObjectRelease();
}

void *_s16SceneUpdateErrorOwca(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *_s16SceneUpdateErrorOwta(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s16SceneUpdateErrorOwet(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t _s16SceneUpdateErrorOwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t sub_25C455A04()
{
  return 0;
}

ValueMetadata *_s16SceneUpdateErrorOMa()
{
  return &_s16SceneUpdateErrorON;
}

uint64_t sub_25C455A2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 40);
}

void *sub_25C455A34(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t sub_25C455A64()
{
  return swift_release();
}

void *sub_25C455A6C(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *sub_25C455AA8(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t sub_25C455ADC(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_25C455B24(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for HostingGroupControllerProvider()
{
  return swift_getGenericMetadata();
}

uint64_t sub_25C455B78()
{
  return swift_getWitnessTable();
}

uint64_t sub_25C455B98()
{
  return MEMORY[0x263F8D320];
}

uint64_t sub_25C455BA4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t sub_25C455BB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for DisplayActivationState(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for DisplayActivationState(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *__n128 result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x25C455D38);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *__n128 result = a2 + 2;
        break;
    }
  }
  return result;
}

uint64_t sub_25C455D60(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_25C455D68(unsigned char *result, char a2)
{
  *__n128 result = a2;
  return result;
}

ValueMetadata *type metadata accessor for DisplayActivationState()
{
  return &type metadata for DisplayActivationState;
}

unint64_t sub_25C455D84()
{
  unint64_t result = qword_26A5A86F8[0];
  if (!qword_26A5A86F8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A5A86F8);
  }
  return result;
}

BOOL sub_25C455DD8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_25C455DEC()
{
  return sub_25C47B098();
}

uint64_t sub_25C455E34()
{
  return sub_25C47B078();
}

uint64_t sub_25C455E60()
{
  return sub_25C47B098();
}

uint64_t sub_25C455EA4(char a1)
{
  return *(void *)&aActive_1[8 * a1];
}

uint64_t sub_25C455EC4()
{
  return sub_25C455EA4(*v0);
}

uint64_t sub_25C455ECC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 16) + **(int **)(a3 + 16));
  BOOL v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_25C455FD0;
  return v9(a1, a2, a3);
}

uint64_t sub_25C455FD0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_25C4560C8()
{
  return swift_initClassMetadata2();
}

uint64_t sub_25C456134()
{
  swift_release();

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_25C45616C()
{
  sub_25C456134();
  return MEMORY[0x270FA0228](v0, 56, 7);
}

uint64_t type metadata accessor for UISceneBinderPresenter()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_25C4561B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 8);
}

void **sub_25C4561C0(void **a1, void **a2)
{
  uint64_t v3 = *a2;
  *a1 = *a2;
  id v4 = v3;
  return a1;
}

void destroy for DefaultDisplayTransformerRegistry.RegistryError(id *a1)
{
}

void **sub_25C4561F8(void **a1, void **a2)
{
  uint64_t v3 = *a2;
  id v4 = *a1;
  *a1 = *a2;
  id v5 = v3;

  return a1;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *unint64_t result = *a2;
  return result;
}

void **sub_25C45623C(void **a1, void **a2)
{
  uint64_t v3 = *a1;
  *a1 = *a2;

  return a1;
}

uint64_t sub_25C456270(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 8)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  if ((v3 + 1) >= 2) {
    return v3;
  }
  else {
    return 0;
  }
}

uint64_t sub_25C4562C0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)unint64_t result = 0;
    *(_DWORD *)unint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)unint64_t result = a2;
    }
  }
  return result;
}

uint64_t sub_25C456314(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_25C45632C(void *result, int a2)
{
  if (a2 < 0)
  {
    unsigned int v2 = a2 ^ 0x80000000;
  }
  else
  {
    if (!a2) {
      return result;
    }
    unsigned int v2 = a2 - 1;
  }
  *unint64_t result = v2;
  return result;
}

uint64_t type metadata accessor for UISceneBinderPresenter.State()
{
  return __swift_instantiateGenericMetadata();
}

void sub_25C456364(void *a1)
{
  uint64_t v3 = *(void **)(v1 + 32);
  swift_beginAccess();
  if (v3)
  {
    id v4 = v3;
    id v5 = a1;
    sub_25C456E98(&v6, v5, &qword_26A5A8810, 0x263F3F4E0, (uint64_t *)&unk_26A5A9270);
    swift_endAccess();

    objc_msgSend(v4, sel_addScene_, v5);
  }
  else
  {
    sub_25C456E98(&v6, a1, &qword_26A5A8810, 0x263F3F4E0, (uint64_t *)&unk_26A5A9270);
    swift_endAccess();
  }
}

void sub_25C456464(void **a1)
{
}

void sub_25C45648C(void *a1)
{
  unsigned int v2 = v1;
  id v4 = (void *)v1[5];
  sub_25C457A30(0, (unint64_t *)&unk_26B350B90);
  id v5 = v4;
  char v6 = sub_25C47AD88();

  if ((v6 & 1) == 0)
  {
    BOOL v7 = (void *)v2[4];
    if (v7)
    {
      int v8 = (uint64_t (*)(void *))v2[2];
      id v9 = v7;
      uint64_t v10 = (void *)v8(a1);
      swift_beginAccess();
      uint64_t v11 = v2[6];
      v28 = v2;
      if ((v11 & 0xC000000000000001) != 0)
      {
        swift_bridgeObjectRetain();
        sub_25C47ADF8();
        sub_25C457A30(0, &qword_26A5A8810);
        sub_25C4579C0();
        sub_25C47AC88();
        uint64_t v11 = v32;
        v29 = v33;
        uint64_t v12 = v34;
        uint64_t v13 = v35;
        unint64_t v14 = v36;
      }
      else
      {
        uint64_t v16 = -1 << *(unsigned char *)(v11 + 32);
        v29 = (void *)(v11 + 56);
        uint64_t v12 = ~v16;
        uint64_t v17 = -v16;
        if (v17 < 64) {
          uint64_t v18 = ~(-1 << v17);
        }
        else {
          uint64_t v18 = -1;
        }
        unint64_t v14 = v18 & *(void *)(v11 + 56);
        swift_bridgeObjectRetain();
        uint64_t v13 = 0;
      }
      int64_t v19 = (unint64_t)(v12 + 64) >> 6;
      if (v11 < 0) {
        goto LABEL_15;
      }
      while (1)
      {
        if (v14)
        {
          uint64_t v20 = (v14 - 1) & v14;
          unint64_t v21 = __clz(__rbit64(v14)) | (v13 << 6);
          uint64_t v22 = v13;
        }
        else
        {
          int64_t v24 = v13 + 1;
          if (__OFADD__(v13, 1))
          {
            __break(1u);
            return;
          }
          if (v24 >= v19) {
            goto LABEL_35;
          }
          unint64_t v25 = v29[v24];
          uint64_t v22 = v13 + 1;
          if (!v25)
          {
            uint64_t v22 = v13 + 2;
            if (v13 + 2 >= v19) {
              goto LABEL_35;
            }
            unint64_t v25 = v29[v22];
            if (!v25)
            {
              uint64_t v22 = v13 + 3;
              if (v13 + 3 >= v19) {
                goto LABEL_35;
              }
              unint64_t v25 = v29[v22];
              if (!v25)
              {
                uint64_t v22 = v13 + 4;
                if (v13 + 4 >= v19) {
                  goto LABEL_35;
                }
                unint64_t v25 = v29[v22];
                if (!v25)
                {
                  uint64_t v26 = v13 + 5;
                  while (v19 != v26)
                  {
                    unint64_t v25 = v29[v26++];
                    if (v25)
                    {
                      uint64_t v22 = v26 - 1;
                      goto LABEL_31;
                    }
                  }
LABEL_35:
                  sub_25C457A28();
                  objc_msgSend(v9, sel_invalidate);

                  v27 = (void *)v28[4];
                  v28[4] = v10;

                  return;
                }
              }
            }
          }
LABEL_31:
          uint64_t v20 = (v25 - 1) & v25;
          unint64_t v21 = __clz(__rbit64(v25)) + (v22 << 6);
        }
        id v23 = *(id *)(*(void *)(v11 + 48) + 8 * v21);
        if (!v23) {
          goto LABEL_35;
        }
        while (1)
        {
          objc_msgSend(v10, sel_addScene_, v23);

          uint64_t v13 = v22;
          unint64_t v14 = v20;
          if ((v11 & 0x8000000000000000) == 0) {
            break;
          }
LABEL_15:
          if (sub_25C47AE28())
          {
            sub_25C457A30(0, &qword_26A5A8810);
            swift_unknownObjectRetain();
            swift_dynamicCast();
            id v23 = v31;
            swift_unknownObjectRelease();
            uint64_t v22 = v13;
            uint64_t v20 = v14;
            if (v31) {
              continue;
            }
          }
          goto LABEL_35;
        }
      }
    }
    id v30 = (id)v2[5];
    v2[5] = a1;
    id v15 = a1;
  }
}

uint64_t sub_25C456814(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  sub_25C47ABD8();
  v2[4] = sub_25C47ABC8();
  uint64_t v4 = sub_25C47AB88();
  return MEMORY[0x270FA2498](sub_25C4568AC, v4, v3);
}

uint64_t sub_25C4568AC()
{
  uint64_t v1 = *(void ***)(v0 + 16);
  swift_release();
  sub_25C45648C(*v1);
  unsigned int v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

void sub_25C456920(char a1, char a2)
{
  if (a2)
  {
    if (a2 == 1)
    {
      if (!a1)
      {
        uint64_t v3 = *(void **)(v2 + 32);
        if (v3)
        {
          objc_msgSend(v3, sel_invalidate);
          uint64_t v4 = *(void **)(v2 + 32);
          *(void *)(v2 + 32) = 0;
        }
      }
    }
    else
    {
      uint64_t v12 = *(void **)(v2 + 32);
      if (v12)
      {
        objc_msgSend(v12, sel_invalidate);
      }
    }
  }
  else if (a1 == 1)
  {
    id v5 = *(uint64_t (**)(void))(v2 + 16);
    id v6 = *(id *)(v2 + 40);
    BOOL v7 = (void *)v5();

    swift_beginAccess();
    uint64_t v8 = *(void *)(v2 + 48);
    if ((v8 & 0xC000000000000001) != 0)
    {
      swift_bridgeObjectRetain();
      sub_25C47ADF8();
      sub_25C457A30(0, &qword_26A5A8810);
      sub_25C4579C0();
      sub_25C47AC88();
      uint64_t v8 = v28;
      uint64_t v26 = v29;
      uint64_t v9 = v30;
      uint64_t v10 = v31;
      unint64_t v11 = v32;
    }
    else
    {
      uint64_t v13 = -1 << *(unsigned char *)(v8 + 32);
      uint64_t v26 = v8 + 56;
      uint64_t v9 = ~v13;
      uint64_t v14 = -v13;
      if (v14 < 64) {
        uint64_t v15 = ~(-1 << v14);
      }
      else {
        uint64_t v15 = -1;
      }
      unint64_t v11 = v15 & *(void *)(v8 + 56);
      swift_bridgeObjectRetain();
      uint64_t v10 = 0;
    }
    uint64_t v24 = v9;
    int64_t v25 = (unint64_t)(v9 + 64) >> 6;
    if (v8 < 0) {
      goto LABEL_22;
    }
    while (1)
    {
      if (v11)
      {
        uint64_t v16 = (v11 - 1) & v11;
        unint64_t v17 = __clz(__rbit64(v11)) | (v10 << 6);
        uint64_t v18 = v10;
      }
      else
      {
        int64_t v20 = v10 + 1;
        if (__OFADD__(v10, 1))
        {
          __break(1u);
          return;
        }
        if (v20 >= v25) {
          goto LABEL_42;
        }
        unint64_t v21 = *(void *)(v26 + 8 * v20);
        uint64_t v18 = v10 + 1;
        if (!v21)
        {
          uint64_t v18 = v10 + 2;
          if (v10 + 2 >= v25) {
            goto LABEL_42;
          }
          unint64_t v21 = *(void *)(v26 + 8 * v18);
          if (!v21)
          {
            uint64_t v18 = v10 + 3;
            if (v10 + 3 >= v25) {
              goto LABEL_42;
            }
            unint64_t v21 = *(void *)(v26 + 8 * v18);
            if (!v21)
            {
              uint64_t v18 = v10 + 4;
              if (v10 + 4 >= v25) {
                goto LABEL_42;
              }
              unint64_t v21 = *(void *)(v26 + 8 * v18);
              if (!v21)
              {
                uint64_t v22 = v10 + 5;
                while (v25 != v22)
                {
                  unint64_t v21 = *(void *)(v26 + 8 * v22++);
                  if (v21)
                  {
                    uint64_t v18 = v22 - 1;
                    goto LABEL_38;
                  }
                }
LABEL_42:
                sub_25C457A28();
                id v23 = *(void **)(v2 + 32);
                *(void *)(v2 + 32) = v7;

                return;
              }
            }
          }
        }
LABEL_38:
        uint64_t v16 = (v21 - 1) & v21;
        unint64_t v17 = __clz(__rbit64(v21)) + (v18 << 6);
      }
      id v19 = *(id *)(*(void *)(v8 + 48) + 8 * v17);
      if (!v19) {
        goto LABEL_42;
      }
      while (1)
      {
        objc_msgSend(v7, sel_addScene_, v19, v24);

        uint64_t v10 = v18;
        unint64_t v11 = v16;
        if ((v8 & 0x8000000000000000) == 0) {
          break;
        }
LABEL_22:
        if (sub_25C47AE28())
        {
          sub_25C457A30(0, &qword_26A5A8810);
          swift_unknownObjectRetain();
          swift_dynamicCast();
          id v19 = v27;
          swift_unknownObjectRelease();
          uint64_t v18 = v10;
          uint64_t v16 = v11;
          if (v27) {
            continue;
          }
        }
        goto LABEL_42;
      }
    }
  }
}

void sub_25C456CC4(char a1, char a2)
{
}

id sub_25C456CE8(void *a1)
{
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82B18]), sel_initWithDisplayConfiguration_, a1);
  objc_msgSend(v2, sel_setHidden_, 0);
  sub_25C47AE98();
  swift_bridgeObjectRelease();
  id v3 = objc_msgSend(a1, sel_identity, 0xD000000000000018, 0x800000025C47FF10);
  id v4 = objc_msgSend(v3, sel_description);
  sub_25C47AA88();

  sub_25C47AAB8();
  swift_bridgeObjectRelease();
  id v5 = objc_allocWithZone(MEMORY[0x263F82B20]);
  id v6 = (void *)sub_25C47AA78();
  swift_bridgeObjectRelease();
  id v7 = objc_msgSend(v5, sel_initWithIdentifier_priority_appearanceStyle_rootWindow_, v6, 0, 0, v2);

  return v7;
}

uint64_t sub_25C456E44(void *a1, void *a2)
{
  return sub_25C456E98(a1, a2, &qword_26A5A8810, 0x263F3F4E0, (uint64_t *)&unk_26A5A9270);
}

uint64_t sub_25C456E60(void *a1, void *a2)
{
  return sub_25C456E98(a1, a2, (unint64_t *)&unk_26B350B90, 0x263F3F6F0, &qword_26B350BA8);
}

uint64_t sub_25C456E7C(void *a1, void *a2)
{
  return sub_25C456E98(a1, a2, (unint64_t *)&unk_26A5A8B60, 0x263F3F708, &qword_26A5A8820);
}

uint64_t sub_25C456E98(void *a1, void *a2, unint64_t *a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v8 = v5;
  uint64_t v11 = *v5;
  if ((*v5 & 0xC000000000000001) != 0)
  {
    if (v11 < 0) {
      uint64_t v12 = *v5;
    }
    else {
      uint64_t v12 = v11 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain();
    id v13 = a2;
    uint64_t v14 = sub_25C47AE18();

    if (v14)
    {
      swift_bridgeObjectRelease();

      sub_25C457A30(0, a3);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v36;
      swift_unknownObjectRelease();
      return 0;
    }
    uint64_t result = sub_25C47AE08();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    uint64_t v26 = sub_25C457164(v12, result + 1, a5, a3);
    uint64_t v37 = v26;
    unint64_t v27 = *(void *)(v26 + 16);
    if (*(void *)(v26 + 24) <= v27)
    {
      uint64_t v32 = v27 + 1;
      id v33 = v13;
      sub_25C457368(v32, a5);
      uint64_t v28 = v37;
    }
    else
    {
      uint64_t v28 = v26;
      id v29 = v13;
    }
    sub_25C457604((uint64_t)v13, v28);
    uint64_t *v8 = v28;
    swift_bridgeObjectRelease();
    *a1 = v13;
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v16 = sub_25C47AD78();
    uint64_t v17 = -1 << *(unsigned char *)(v11 + 32);
    unint64_t v18 = v16 & ~v17;
    if ((*(void *)(v11 + 56 + ((v18 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v18))
    {
      sub_25C457A30(0, a3);
      id v19 = *(id *)(*(void *)(v11 + 48) + 8 * v18);
      char v20 = sub_25C47AD88();

      if (v20)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        uint64_t v24 = *(void **)(*(void *)(*v5 + 48) + 8 * v18);
        *a1 = v24;
        id v25 = v24;
        return 0;
      }
      uint64_t v21 = ~v17;
      while (1)
      {
        unint64_t v18 = (v18 + 1) & v21;
        if (((*(void *)(v11 + 56 + ((v18 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v18) & 1) == 0) {
          break;
        }
        id v22 = *(id *)(*(void *)(v11 + 48) + 8 * v18);
        char v23 = sub_25C47AD88();

        if (v23) {
          goto LABEL_12;
        }
      }
    }
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v38 = *v5;
    *id v5 = 0x8000000000000000;
    id v31 = a2;
    sub_25C457688((uint64_t)v31, v18, isUniquelyReferenced_nonNull_native, a5, a3);
    *id v5 = v38;
    swift_bridgeObjectRelease();
    *a1 = v31;
  }
  return 1;
}

uint64_t sub_25C457164(uint64_t a1, uint64_t a2, uint64_t *a3, unint64_t *a4)
{
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(a3);
    uint64_t v6 = sub_25C47AE78();
    uint64_t v19 = v6;
    sub_25C47ADF8();
    if (sub_25C47AE28())
    {
      sub_25C457A30(0, a4);
      do
      {
        swift_dynamicCast();
        uint64_t v6 = v19;
        unint64_t v13 = *(void *)(v19 + 16);
        if (*(void *)(v19 + 24) <= v13)
        {
          sub_25C457368(v13 + 1, a3);
          uint64_t v6 = v19;
        }
        uint64_t result = sub_25C47AD78();
        uint64_t v8 = v6 + 56;
        uint64_t v9 = -1 << *(unsigned char *)(v6 + 32);
        unint64_t v10 = result & ~v9;
        unint64_t v11 = v10 >> 6;
        if (((-1 << v10) & ~*(void *)(v6 + 56 + 8 * (v10 >> 6))) != 0)
        {
          unint64_t v12 = __clz(__rbit64((-1 << v10) & ~*(void *)(v6 + 56 + 8 * (v10 >> 6)))) | v10 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v14 = 0;
          unint64_t v15 = (unint64_t)(63 - v9) >> 6;
          do
          {
            if (++v11 == v15 && (v14 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v16 = v11 == v15;
            if (v11 == v15) {
              unint64_t v11 = 0;
            }
            v14 |= v16;
            uint64_t v17 = *(void *)(v8 + 8 * v11);
          }
          while (v17 == -1);
          unint64_t v12 = __clz(__rbit64(~v17)) + (v11 << 6);
        }
        *(void *)(v8 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
        *(void *)(*(void *)(v6 + 48) + 8 * v12) = v18;
        ++*(void *)(v6 + 16);
      }
      while (sub_25C47AE28());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x263F8EE88];
  }
  return v6;
}

uint64_t sub_25C457368(uint64_t a1, uint64_t *a2)
{
  id v3 = v2;
  uint64_t v4 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v5 = sub_25C47AE68();
  uint64_t v6 = v5;
  if (*(void *)(v4 + 16))
  {
    uint64_t v30 = v2;
    uint64_t v7 = 1 << *(unsigned char *)(v4 + 32);
    uint64_t v8 = (void *)(v4 + 56);
    if (v7 < 64) {
      uint64_t v9 = ~(-1 << v7);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v4 + 56);
    int64_t v11 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v12 = v5 + 56;
    uint64_t result = swift_retain();
    int64_t v14 = 0;
    while (1)
    {
      if (v10)
      {
        unint64_t v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v17 = v16 | (v14 << 6);
      }
      else
      {
        int64_t v18 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v18 >= v11) {
          goto LABEL_33;
        }
        unint64_t v19 = v8[v18];
        ++v14;
        if (!v19)
        {
          int64_t v14 = v18 + 1;
          if (v18 + 1 >= v11) {
            goto LABEL_33;
          }
          unint64_t v19 = v8[v14];
          if (!v19)
          {
            int64_t v14 = v18 + 2;
            if (v18 + 2 >= v11) {
              goto LABEL_33;
            }
            unint64_t v19 = v8[v14];
            if (!v19)
            {
              int64_t v20 = v18 + 3;
              if (v20 >= v11)
              {
LABEL_33:
                swift_release();
                id v3 = v30;
                uint64_t v29 = 1 << *(unsigned char *)(v4 + 32);
                if (v29 > 63) {
                  bzero((void *)(v4 + 56), ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v8 = -1 << v29;
                }
                *(void *)(v4 + 16) = 0;
                break;
              }
              unint64_t v19 = v8[v20];
              if (!v19)
              {
                while (1)
                {
                  int64_t v14 = v20 + 1;
                  if (__OFADD__(v20, 1)) {
                    goto LABEL_39;
                  }
                  if (v14 >= v11) {
                    goto LABEL_33;
                  }
                  unint64_t v19 = v8[v14];
                  ++v20;
                  if (v19) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v14 = v20;
            }
          }
        }
LABEL_23:
        unint64_t v10 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v14 << 6);
      }
      uint64_t v21 = *(void *)(*(void *)(v4 + 48) + 8 * v17);
      uint64_t result = sub_25C47AD78();
      uint64_t v22 = -1 << *(unsigned char *)(v6 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v12 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v15 = __clz(__rbit64((-1 << v23) & ~*(void *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v12 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v15 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      *(void *)(*(void *)(v6 + 48) + 8 * v15) = v21;
      ++*(void *)(v6 + 16);
    }
  }
  uint64_t result = swift_release();
  *id v3 = v6;
  return result;
}

unint64_t sub_25C457604(uint64_t a1, uint64_t a2)
{
  sub_25C47AD78();
  unint64_t result = sub_25C47ADE8();
  *(void *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(void *)(*(void *)(a2 + 48) + 8 * result) = a1;
  ++*(void *)(a2 + 16);
  return result;
}

void sub_25C457688(uint64_t a1, unint64_t a2, char a3, uint64_t *a4, unint64_t *a5)
{
  unint64_t v9 = *(void *)(*v5 + 16);
  unint64_t v10 = *(void *)(*v5 + 24);
  if (v10 > v9 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  uint64_t v11 = v9 + 1;
  if (a3)
  {
    sub_25C457368(v11, a4);
  }
  else
  {
    if (v10 > v9)
    {
      sub_25C45781C(a4);
      goto LABEL_14;
    }
    sub_25C457A6C(v11, a4);
  }
  uint64_t v12 = *v5;
  uint64_t v13 = sub_25C47AD78();
  uint64_t v14 = -1 << *(unsigned char *)(v12 + 32);
  a2 = v13 & ~v14;
  if ((*(void *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    sub_25C457A30(0, a5);
    id v15 = *(id *)(*(void *)(v12 + 48) + 8 * a2);
    char v16 = sub_25C47AD88();

    if (v16)
    {
LABEL_13:
      sub_25C47AFF8();
      __break(1u);
    }
    else
    {
      uint64_t v17 = ~v14;
      while (1)
      {
        a2 = (a2 + 1) & v17;
        if (((*(void *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        id v18 = *(id *)(*(void *)(v12 + 48) + 8 * a2);
        char v19 = sub_25C47AD88();

        if (v19) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v20 = *v5;
  *(void *)(*v5 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v20 + 48) + 8 * a2) = a1;
  uint64_t v21 = *(void *)(v20 + 16);
  BOOL v22 = __OFADD__(v21, 1);
  uint64_t v23 = v21 + 1;
  if (v22) {
    __break(1u);
  }
  else {
    *(void *)(v20 + 16) = v23;
  }
}

id sub_25C45781C(uint64_t *a1)
{
  id v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v3 = *v1;
  uint64_t v4 = sub_25C47AE58();
  uint64_t v5 = v4;
  if (!*(void *)(v3 + 16))
  {
LABEL_28:
    id result = (id)swift_release();
    *id v2 = v5;
    return result;
  }
  id result = (id)(v4 + 56);
  uint64_t v7 = v3 + 56;
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 56 + 8 * v8) {
    id result = memmove(result, (const void *)(v3 + 56), 8 * v8);
  }
  int64_t v10 = 0;
  *(void *)(v5 + 16) = *(void *)(v3 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v3 + 56);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    int64_t v19 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v19 >= v14) {
      goto LABEL_28;
    }
    unint64_t v20 = *(void *)(v7 + 8 * v19);
    ++v10;
    if (!v20)
    {
      int64_t v10 = v19 + 1;
      if (v19 + 1 >= v14) {
        goto LABEL_28;
      }
      unint64_t v20 = *(void *)(v7 + 8 * v10);
      if (!v20)
      {
        int64_t v10 = v19 + 2;
        if (v19 + 2 >= v14) {
          goto LABEL_28;
        }
        unint64_t v20 = *(void *)(v7 + 8 * v10);
        if (!v20) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v13 = (v20 - 1) & v20;
    unint64_t v16 = __clz(__rbit64(v20)) + (v10 << 6);
LABEL_12:
    uint64_t v17 = 8 * v16;
    id v18 = *(void **)(*(void *)(v3 + 48) + v17);
    *(void *)(*(void *)(v5 + 48) + v17) = v18;
    id result = v18;
  }
  int64_t v21 = v19 + 3;
  if (v21 >= v14) {
    goto LABEL_28;
  }
  unint64_t v20 = *(void *)(v7 + 8 * v21);
  if (v20)
  {
    int64_t v10 = v21;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v10 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_28;
    }
    unint64_t v20 = *(void *)(v7 + 8 * v10);
    ++v21;
    if (v20) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

unint64_t sub_25C4579C0()
{
  unint64_t result = qword_26A5A8818;
  if (!qword_26A5A8818)
  {
    sub_25C457A30(255, &qword_26A5A8810);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5A8818);
  }
  return result;
}

uint64_t sub_25C457A28()
{
  return swift_release();
}

uint64_t sub_25C457A30(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_25C457A6C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = v2;
  uint64_t v4 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v5 = sub_25C47AE68();
  uint64_t v6 = v5;
  if (!*(void *)(v4 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v3 = v6;
    return result;
  }
  uint64_t v29 = v2;
  uint64_t v7 = 1 << *(unsigned char *)(v4 + 32);
  uint64_t v8 = v4 + 56;
  if (v7 < 64) {
    uint64_t v9 = ~(-1 << v7);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v4 + 56);
  int64_t v11 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v12 = v5 + 56;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v17 = v16 | (v14 << 6);
      goto LABEL_24;
    }
    int64_t v18 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v18 >= v11) {
      goto LABEL_33;
    }
    unint64_t v19 = *(void *)(v8 + 8 * v18);
    ++v14;
    if (!v19)
    {
      int64_t v14 = v18 + 1;
      if (v18 + 1 >= v11) {
        goto LABEL_33;
      }
      unint64_t v19 = *(void *)(v8 + 8 * v14);
      if (!v19)
      {
        int64_t v14 = v18 + 2;
        if (v18 + 2 >= v11) {
          goto LABEL_33;
        }
        unint64_t v19 = *(void *)(v8 + 8 * v14);
        if (!v19) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v10 = (v19 - 1) & v19;
    unint64_t v17 = __clz(__rbit64(v19)) + (v14 << 6);
LABEL_24:
    id v21 = *(id *)(*(void *)(v4 + 48) + 8 * v17);
    uint64_t result = sub_25C47AD78();
    uint64_t v22 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v12 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v15 = __clz(__rbit64((-1 << v23) & ~*(void *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v27 = v24 == v26;
        if (v24 == v26) {
          unint64_t v24 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v12 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v15 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    *(void *)(*(void *)(v6 + 48) + 8 * v15) = v21;
    ++*(void *)(v6 + 16);
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v11)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v3 = v29;
    goto LABEL_35;
  }
  unint64_t v19 = *(void *)(v8 + 8 * v20);
  if (v19)
  {
    int64_t v14 = v20;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v14 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v14 >= v11) {
      goto LABEL_33;
    }
    unint64_t v19 = *(void *)(v8 + 8 * v14);
    ++v20;
    if (v19) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

unint64_t sub_25C457D1C()
{
  unint64_t result = qword_26A5A8828;
  if (!qword_26A5A8828)
  {
    sub_25C457A30(255, (unint64_t *)&unk_26A5A8830);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5A8828);
  }
  return result;
}

id sub_25C457D84()
{
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F15798]), sel_init);
  objc_msgSend(v1, sel_setConnectionSeed_, objc_msgSend(v0, sel_connectionSeed));
  id v2 = objc_msgSend(v0, sel_currentMode);
  objc_msgSend(v1, sel_setCurrentMode_, v2);

  objc_msgSend(v0, sel_logicalScale);
  objc_msgSend(v1, sel_setLogicalScale_);
  id v3 = objc_msgSend(v0, sel_overscanAdjustment);
  objc_msgSend(v1, sel_setOverscanAdjustment_, v3);

  objc_msgSend(v1, sel_setPointScale_, objc_msgSend(v0, sel_pointScale));
  return v1;
}

id sub_25C457E98(void *a1)
{
  id v2 = v1;
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F15798]), sel_init);
  id v5 = objc_msgSend(v1, sel_immutableCopy);
  id v6 = sub_25C457D84();
  sub_25C457A30(0, &qword_26A5A8850);
  id v7 = sub_25C458184(a1);
  id v8 = objc_msgSend(v5, sel_preferredModeWithCriteria_, v7);

  objc_msgSend(v4, sel_setCurrentMode_, v8);
  if (objc_msgSend(v2, sel_displayType) == (id)2 || (objc_msgSend(a1, sel_logicalScale), v10 == 0.0) && v9 == 0.0)
  {
    objc_msgSend(v6, sel_logicalScale);
  }
  else
  {
    objc_msgSend(a1, sel_logicalScale);
    objc_msgSend(v5, sel_minimumLogicalScale);
    double v12 = v11;
    objc_msgSend(v5, sel_maximumLogicalScale);
    if (v13 >= v12) {
      double v14 = v12;
    }
    else {
      double v14 = v13;
    }
    objc_msgSend(v5, sel_minimumLogicalScale);
    double v16 = v15;
    id result = objc_msgSend(v5, sel_maximumLogicalScale);
    if (v16 > v18) {
      double v19 = v16;
    }
    else {
      double v19 = v18;
    }
    if (v14 > v19) {
      goto LABEL_25;
    }
  }
  objc_msgSend(v4, sel_setLogicalScale_);
  objc_msgSend(a1, sel_pointScale);
  if (v20 != 0.0)
  {
    id result = objc_msgSend(a1, sel_pointScale);
    if ((~*(void *)&v22 & 0x7FF0000000000000) != 0)
    {
      if (v22 > -9.22337204e18)
      {
        if (v22 < 9.22337204e18)
        {
          id v21 = (id)(uint64_t)v22;
          goto LABEL_18;
        }
        goto LABEL_24;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
    return result;
  }
  id v21 = objc_msgSend(v6, sel_pointScale);
LABEL_18:
  objc_msgSend(v4, sel_setPointScale_, v21);
  if (objc_msgSend(a1, sel_overscanCompensation) == (id)-1)
  {
    id v23 = objc_msgSend(v6, sel_overscanAdjustment);
  }
  else
  {
    objc_msgSend(a1, sel_overscanCompensation);
    id v23 = (id)FBSDisplayOverscanCompensationToCADisplayOverscanAdjustment();
  }
  id v24 = v23;
  objc_msgSend(v4, sel_setOverscanAdjustment_, v24);

  objc_msgSend(v4, sel_setConnectionSeed_, objc_msgSend(v2, sel_connectionSeed));
  return v4;
}

id sub_25C458184(void *a1)
{
  id v2 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  objc_msgSend(a1, sel_nativePixelSize);
  objc_msgSend(v2, sel_setResolution_);
  objc_msgSend(a1, sel_refreshRate);
  objc_msgSend(v2, sel_setRefreshRate_);
  objc_msgSend(a1, sel_hdrMode);
  id v3 = (id)FBSDisplayHDRModeToCADisplayHDRMode();
  objc_msgSend(v2, sel_setHdrMode_, v3);

  return v2;
}

uint64_t sub_25C458244(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  v2[4] = sub_25C47ABD8();
  v2[5] = sub_25C47ABC8();
  uint64_t v4 = sub_25C47AB88();
  v2[6] = v4;
  v2[7] = v3;
  return MEMORY[0x270FA2498](sub_25C4582E0, v4, v3);
}

uint64_t sub_25C4582E0()
{
  id v1 = sub_25C457E98(*(void **)(v0 + 16));
  *(void *)(v0 + 64) = v1;
  id v2 = sub_25C457D84();
  sub_25C457A30(0, &qword_26A5A8848);
  char v3 = sub_25C47AD88();

  if (v3)
  {

    swift_release();
    uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
    return v4();
  }
  else
  {
    *(void *)(v0 + 72) = sub_25C47ABC8();
    uint64_t v7 = sub_25C47AB88();
    *(void *)(v0 + 80) = v7;
    *(void *)(v0 + 88) = v6;
    return MEMORY[0x270FA2498](sub_25C458404, v7, v6);
  }
}

uint64_t sub_25C458404()
{
  id v1 = *(void **)(v0 + 64);
  id v2 = *(void **)(v0 + 24);
  type metadata accessor for CADisplayActor();
  id v3 = v2;
  id v4 = v1;
  swift_initStaticObject();
  sub_25C45869C();
  uint64_t v6 = sub_25C47AB88();
  return MEMORY[0x270FA2498](sub_25C4584B4, v6, v5);
}

uint64_t sub_25C4584B4()
{
  objc_msgSend(*(id *)(v0 + 24), sel_setDisplayProperties_, *(void *)(v0 + 64));
  uint64_t v1 = *(void *)(v0 + 80);
  uint64_t v2 = *(void *)(v0 + 88);
  return MEMORY[0x270FA2498](sub_25C458524, v1, v2);
}

uint64_t sub_25C458524()
{
  uint64_t v1 = *(void **)(v0 + 24);

  swift_release();
  uint64_t v2 = *(void *)(v0 + 48);
  uint64_t v3 = *(void *)(v0 + 56);
  return MEMORY[0x270FA2498](sub_25C458598, v2, v3);
}

uint64_t sub_25C458598()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25C458604(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_25C455FD0;
  return sub_25C458244(v2);
}

unint64_t sub_25C45869C()
{
  unint64_t result = qword_26A5A9180;
  if (!qword_26A5A9180)
  {
    type metadata accessor for CADisplayActor();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5A9180);
  }
  return result;
}

uint64_t sub_25C4586F4()
{
  uint64_t v0 = sub_25C47AD38();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v3 = (char *)v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25C47AD48();
  MEMORY[0x270FA5388]();
  sub_25C47AA58();
  MEMORY[0x270FA5388]();
  sub_25C458AB8();
  sub_25C47AA48();
  v5[1] = MEMORY[0x263F8EE78];
  sub_25C458AF8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A8870);
  sub_25C458B50();
  sub_25C47ADD8();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F8F138], v0);
  uint64_t result = sub_25C47AD58();
  qword_26A5A8858 = result;
  return result;
}

id static CADisplayQueue.queue.getter()
{
  if (qword_26A5A8490 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_26A5A8858;
  return v0;
}

id CADisplayQueue.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id CADisplayQueue.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_init);
}

id CADisplayQueue.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for CADisplayQueue()
{
  return self;
}

unint64_t sub_25C458AB8()
{
  unint64_t result = qword_26A5A8860;
  if (!qword_26A5A8860)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A5A8860);
  }
  return result;
}

unint64_t sub_25C458AF8()
{
  unint64_t result = qword_26A5A8868;
  if (!qword_26A5A8868)
  {
    sub_25C47AD48();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5A8868);
  }
  return result;
}

unint64_t sub_25C458B50()
{
  unint64_t result = qword_26A5A8878[0];
  if (!qword_26A5A8878[0])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5A8870);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A5A8878);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_25C458BF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  double v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 24) + **(int **)(a3 + 24));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_25C45D99C;
  return v9(a1, a2, a3);
}

uint64_t sub_25C458CF8()
{
  uint64_t updated = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t v2 = swift_checkMetadataState();
    if (v3 > 0x3F)
    {
      return v2;
    }
    else
    {
      uint64_t v4 = swift_checkMetadataState();
      if (v5 > 0x3F)
      {
        return v4;
      }
      else
      {
        uint64_t v6 = swift_checkMetadataState();
        if (v7 > 0x3F)
        {
          return v6;
        }
        else
        {
          uint64_t updated = type metadata accessor for DisplayUpdater.UpdateContext();
          if (v8 <= 0x3F)
          {
            uint64_t updated = sub_25C47ADA8();
            if (v9 <= 0x3F) {
              return swift_initClassMetadata2();
            }
          }
        }
      }
    }
  }
  return updated;
}

uint64_t sub_25C458F48()
{
  uint64_t v0 = sub_25C47AA38();
  __swift_allocate_value_buffer(v0, qword_26A5AAC70);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A5AAC70);
  return sub_25C47AA28();
}

uint64_t sub_25C458FCC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  if (*a1 == *a2)
  {
    swift_getAssociatedTypeWitness();
    type metadata accessor for DisplayUpdater.UpdateContext();
    swift_getAssociatedConformanceWitness();
    char v2 = sub_25C47AA68();
  }
  else
  {
    char v2 = 0;
  }
  return v2 & 1;
}

uint64_t sub_25C4590EC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_25C458FCC(a1, a2) & 1;
}

uint64_t sub_25C459130()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A8990);
  MEMORY[0x270FA5388]();
  char v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25C47ABD8();
  sub_25C47ABC8();
  uint64_t v3 = sub_25C47ABF8();
  uint64_t v4 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56);
  swift_retain();
  v4(v2, 1, 1, v3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = &unk_26A5A89A0;
  *(void *)(v5 + 24) = v0;
  swift_retain();
  sub_25C47AC48();
  swift_release();
  sub_25C45D8AC((uint64_t)v2);
  swift_release();
  return swift_release();
}

uint64_t sub_25C459288()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25C45D99C;
  return sub_25C459318();
}

uint64_t sub_25C459318()
{
  v1[29] = v0;
  char v2 = *(void **)v0;
  uint64_t v3 = *(void *)(*(void *)v0 + 80);
  v1[30] = v3;
  uint64_t v4 = v2[11];
  v1[31] = v4;
  uint64_t v5 = v2[12];
  v1[32] = v5;
  uint64_t v6 = v2[13];
  v1[33] = v6;
  uint64_t v7 = v2[14];
  v1[34] = v7;
  uint64_t v8 = v2[15];
  v1[35] = v8;
  uint64_t v9 = v2[16];
  v1[36] = v9;
  uint64_t v10 = v2[17];
  v1[37] = v10;
  uint64_t v11 = v2[18];
  v1[38] = v11;
  v1[2] = v3;
  v1[3] = v4;
  v1[4] = v5;
  v1[5] = v6;
  v1[6] = v7;
  v1[7] = v8;
  v1[8] = v9;
  v1[9] = v10;
  v1[10] = v11;
  uint64_t updated = type metadata accessor for DisplayUpdater.UpdateContext();
  v1[39] = updated;
  uint64_t v13 = sub_25C47ADA8();
  v1[40] = v13;
  v1[41] = *(void *)(v13 - 8);
  v1[42] = swift_task_alloc();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v1[43] = AssociatedTypeWitness;
  v1[44] = *(void *)(AssociatedTypeWitness - 8);
  v1[45] = swift_task_alloc();
  uint64_t v15 = swift_getAssociatedTypeWitness();
  v1[46] = v15;
  uint64_t v16 = sub_25C47ADA8();
  v1[47] = v16;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v1[48] = TupleTypeMetadata2;
  v1[49] = *(void *)(TupleTypeMetadata2 - 8);
  v1[50] = swift_task_alloc();
  v1[51] = *(void *)(v16 - 8);
  v1[52] = swift_task_alloc();
  v1[53] = swift_task_alloc();
  v1[54] = swift_task_alloc();
  v1[55] = *(void *)(v15 - 8);
  v1[56] = swift_task_alloc();
  uint64_t v18 = sub_25C47AA38();
  v1[57] = v18;
  v1[58] = *(void *)(v18 - 8);
  v1[59] = swift_task_alloc();
  v1[60] = *(void *)(updated - 8);
  v1[61] = swift_task_alloc();
  v1[62] = swift_task_alloc();
  v1[63] = swift_task_alloc();
  v1[64] = swift_task_alloc();
  v1[65] = swift_task_alloc();
  v1[66] = swift_task_alloc();
  v1[67] = sub_25C47ABD8();
  v1[68] = sub_25C47ABC8();
  uint64_t v20 = sub_25C47AB88();
  v1[69] = v20;
  v1[70] = v19;
  return MEMORY[0x270FA2498](sub_25C4597F0, v20, v19);
}

uint64_t sub_25C4597F0()
{
  uint64_t v1 = v0[66];
  uint64_t v2 = v0[60];
  uint64_t v3 = v0[39];
  uint64_t v4 = v0[29];
  uint64_t v5 = *(void *)(*(void *)v4 + 192);
  v0[71] = v5;
  uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
  v0[72] = v6;
  v0[73] = (v2 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v6(v1, v4 + v5, v3);
  v0[74] = sub_25C47ABC8();
  v0[75] = sub_25C47ABC8();
  uint64_t v8 = sub_25C47AB88();
  v0[76] = v8;
  v0[77] = v7;
  return MEMORY[0x270FA2498](sub_25C4598D4, v8, v7);
}

uint64_t sub_25C4598D4()
{
  uint64_t v1 = sub_25C47ABC8();
  v0[78] = v1;
  uint64_t v2 = (void *)swift_task_alloc();
  v0[79] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_25C4599C4;
  uint64_t v3 = v0[74];
  uint64_t v4 = MEMORY[0x263F8F500];
  uint64_t v5 = MEMORY[0x263F8D4F8];
  return MEMORY[0x270FA2318](v0 + 96, v1, v4, 0xD000000000000010, 0x800000025C4801E0, sub_25C45D7C0, v3, v5);
}

uint64_t sub_25C4599C4()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 616);
  uint64_t v3 = *(void *)(v1 + 608);
  return MEMORY[0x270FA2498](sub_25C459B08, v3, v2);
}

uint64_t sub_25C459B08()
{
  swift_release();
  swift_release();
  *(unsigned char *)(v0 + 769) = *(unsigned char *)(v0 + 768);
  uint64_t v1 = *(void *)(v0 + 560);
  uint64_t v2 = *(void *)(v0 + 552);
  return MEMORY[0x270FA2498](sub_25C459B84, v2, v1);
}

uint64_t sub_25C459B84()
{
  uint64_t v78 = v0;
  if (*(unsigned char *)(v0 + 769) != 1)
  {
    swift_release();
    if (qword_26A5A8498 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(*(void *)(v0 + 456), (uint64_t)qword_26A5AAC70);
    swift_retain_n();
    uint64_t v11 = sub_25C47AA18();
    os_log_type_t v12 = sub_25C47AD08();
    BOOL v13 = os_log_type_enabled(v11, v12);
    uint64_t v14 = *(void *)(v0 + 528);
    uint64_t v15 = *(void *)(v0 + 480);
    uint64_t v16 = *(void *)(v0 + 312);
    uint64_t v17 = *(void *)(v0 + 232);
    if (v13)
    {
      uint64_t v75 = *(void *)(v0 + 528);
      uint64_t v71 = *(void *)(v0 + 312);
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      uint64_t v77 = v19;
      *(_DWORD *)uint64_t v18 = 136446210;
      uint64_t v20 = *(void *)(v17 + 16);
      unint64_t v21 = *(void *)(v17 + 24);
      swift_bridgeObjectRetain();
      *(void *)(v0 + 136) = sub_25C47596C(v20, v21, &v77);
      sub_25C47ADB8();
      swift_bridgeObjectRelease();
      swift_release_n();
      _os_log_impl(&dword_25C444000, v11, v12, "%{public}s somebody requested an update after us. short-circuiting.", v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x261186AD0](v19, -1, -1);
      MEMORY[0x261186AD0](v18, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v75, v71);
    }
    else
    {

      swift_release_n();
      (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v16);
    }
    goto LABEL_20;
  }
  uint64_t v1 = *(void *)(v0 + 232);
  uint64_t v2 = *(void *)(v0 + 480);
  uint64_t v3 = *(void *)(v0 + 312);
  uint64_t v4 = *(void *)(*(void *)v1 + 200);
  *(void *)(v0 + 640) = v4;
  uint64_t v5 = (unsigned __int8 *)(v1 + v4);
  swift_beginAccess();
  uint64_t v6 = *(uint64_t (**)(unsigned __int8 *, uint64_t, uint64_t))(v2 + 48);
  *(void *)(v0 + 648) = v6;
  *(void *)(v0 + 656) = (v2 + 48) & 0xFFFFFFFFFFFFLL | 0x60F0000000000000;
  int v7 = v6(v5, 1, v3);
  uint64_t v8 = *(unsigned __int8 **)(v0 + 528);
  if (v7)
  {
    uint64_t v9 = *v8;
    if (v9 == 1)
    {
LABEL_19:
      (*(void (**)(unsigned __int8 *, void))(*(void *)(v0 + 480) + 8))(v8, *(void *)(v0 + 312));
      swift_release();
LABEL_20:
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      v46 = *(uint64_t (**)(void))(v0 + 8);
      return v46();
    }
    uint64_t v10 = 1;
  }
  else
  {
    uint64_t v10 = *v5;
    uint64_t v9 = *v8;
    if (v10 == v9) {
      goto LABEL_17;
    }
  }
  if (sub_25C4706A4(v9, (uint64_t)&unk_2709A71E0))
  {
    uint64_t v22 = *(void *)(v0 + 296);
    uint64_t v23 = *(void *)(v0 + 264);
    swift_release();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v22 + 8))(v10, v9, v23, v22);
    if (qword_26A5A8498 != -1) {
      swift_once();
    }
    v72 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 576);
    uint64_t v24 = *(void *)(v0 + 528);
    uint64_t v25 = *(void *)(v0 + 520);
    uint64_t v27 = *(void *)(v0 + 464);
    uint64_t v26 = *(void *)(v0 + 472);
    uint64_t v28 = *(void *)(v0 + 456);
    uint64_t v29 = *(void *)(v0 + 312);
    uint64_t v30 = __swift_project_value_buffer(v28, (uint64_t)qword_26A5AAC70);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 16))(v26, v30, v28);
    v72(v25, v24, v29);
    swift_retain_n();
    id v31 = sub_25C47AA18();
    os_log_type_t v32 = sub_25C47AD28();
    if (os_log_type_enabled(v31, v32))
    {
      uint64_t v33 = *(void *)(v0 + 232);
      uint64_t v34 = swift_slowAlloc();
      uint64_t v73 = swift_slowAlloc();
      uint64_t v77 = v73;
      *(_DWORD *)uint64_t v34 = 136446722;
      uint64_t v35 = *(void *)(v33 + 16);
      unint64_t v36 = *(void *)(v33 + 24);
      swift_bridgeObjectRetain();
      *(void *)(v0 + 216) = sub_25C47596C(v35, v36, &v77);
      sub_25C47ADB8();
      swift_bridgeObjectRelease();
      swift_release_n();
      *(_WORD *)(v34 + 12) = 2082;
      uint64_t v37 = *(char **)(v0 + 520);
      uint64_t v38 = *(void *)(v0 + 480);
      uint64_t v39 = *(void *)(v0 + 312);
      *(void *)(v0 + 224) = sub_25C47596C(*(void *)&aActive_2[8 * (char)v10], *(void *)&aInactivediscon_0[8 * (char)v10 + 16], &v77);
      sub_25C47ADB8();
      swift_bridgeObjectRelease();
      *(_WORD *)(v34 + 22) = 2082;
      uint64_t v40 = *v37;
      v41 = *(void (**)(char *, uint64_t))(v38 + 8);
      v41(v37, v39);
      uint64_t v42 = *(void *)&aActive_2[8 * v40];
      unint64_t v43 = *(void *)&aInactivediscon_0[8 * v40 + 16];
      uint64_t v44 = *(void *)(v0 + 464);
      uint64_t v68 = *(void *)(v0 + 472);
      uint64_t v45 = *(void *)(v0 + 456);
      uint64_t v69 = *(void *)(v0 + 312);
      v70 = *(char **)(v0 + 528);
      *(void *)(v0 + 192) = sub_25C47596C(v42, v43, &v77);
      sub_25C47ADB8();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25C444000, v31, v32, "%{public}s transitioning from %{public}s to %{public}s. short-circuiting update and telling coordinator directly", (uint8_t *)v34, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x261186AD0](v73, -1, -1);
      MEMORY[0x261186AD0](v34, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v68, v45);
      v41(v70, v69);
    }
    else
    {
      uint64_t v62 = *(void *)(v0 + 528);
      uint64_t v63 = *(void *)(v0 + 472);
      uint64_t v64 = *(void *)(v0 + 456);
      uint64_t v65 = *(void *)(v0 + 464);
      uint64_t v66 = *(void *)(v0 + 312);
      v67 = *(void (**)(uint64_t, uint64_t))(*(void *)(v0 + 480) + 8);
      v67(*(void *)(v0 + 520), v66);

      swift_release_n();
      (*(void (**)(uint64_t, uint64_t))(v65 + 8))(v63, v64);
      v67(v62, v66);
    }
    goto LABEL_20;
  }
  LODWORD(v10) = v9;
LABEL_17:
  if (v10)
  {
    uint64_t v8 = *(unsigned __int8 **)(v0 + 528);
    goto LABEL_19;
  }
  uint64_t v49 = *(void *)(v0 + 440);
  uint64_t v48 = *(void *)(v0 + 448);
  uint64_t v50 = *(void *)(v0 + 368);
  uint64_t v51 = *(void *)(v0 + 312);
  uint64_t v52 = *(void *)(v0 + 288);
  uint64_t v76 = *(void *)(v0 + 272);
  uint64_t v53 = *(void *)(v0 + 256);
  uint64_t v54 = *(void *)(v0 + 232);
  uint64_t v55 = v54 + *(void *)(v0 + 568);
  *(void *)(v0 + 664) = *(void *)(*(void *)v54 + 176);
  (*(void (**)(uint64_t))(v52 + 24))(v53);
  uint64_t v56 = v55 + *(int *)(v51 + 92);
  v57 = *(void (**)(uint64_t, uint64_t, uint64_t))(v49 + 16);
  *(void *)(v0 + 672) = v57;
  *(void *)(v0 + 680) = (v49 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v57(v48, v56, v50);
  v74 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v76 + 24) + **(int **)(v76 + 24));
  v58 = (void *)swift_task_alloc();
  *(void *)(v0 + 688) = v58;
  void *v58 = v0;
  v58[1] = sub_25C45A444;
  uint64_t v59 = *(void *)(v0 + 448);
  uint64_t v60 = *(void *)(v0 + 272);
  uint64_t v61 = *(void *)(v0 + 240);
  return v74(v59, v61, v60);
}

uint64_t sub_25C45A444()
{
  uint64_t v1 = *(void **)v0;
  uint64_t v2 = *(void *)(*(void *)v0 + 448);
  uint64_t v3 = *(void *)(*(void *)v0 + 440);
  uint64_t v4 = *(void *)(*(void *)v0 + 368);
  swift_task_dealloc();
  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v1[87] = v5;
  v1[88] = (v3 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v5(v2, v4);
  uint64_t v6 = v1[70];
  uint64_t v7 = v1[69];
  return MEMORY[0x270FA2498](sub_25C45A5D4, v7, v6);
}

uint64_t sub_25C45A5D4()
{
  uint64_t v101 = v0;
  uint64_t v1 = *(unsigned __int8 **)(v0 + 528);
  uint64_t v2 = *(unsigned __int8 **)(v0 + 512);
  uint64_t v97 = *(void *)(v0 + 480);
  uint64_t v3 = *(void *)(v0 + 312);
  (*(void (**)(unsigned __int8 *, void, uint64_t))(v0 + 576))(v2, *(void *)(v0 + 232) + *(void *)(v0 + 568), v3);
  LOBYTE(v1) = sub_25C458FCC(v1, v2);
  uint64_t v4 = *(void (**)(unsigned __int8 *, uint64_t))(v97 + 8);
  *(void *)(v0 + 712) = v4;
  *(void *)(v0 + 720) = (v97 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v4(v2, v3);
  if ((v1 & 1) == 0)
  {
    swift_release();
    if (qword_26A5A8498 != -1) {
      swift_once();
    }
    uint64_t v29 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 576);
    uint64_t v30 = *(void *)(v0 + 528);
    uint64_t v31 = *(void *)(v0 + 488);
    uint64_t v32 = *(void *)(v0 + 312);
    __swift_project_value_buffer(*(void *)(v0 + 456), (uint64_t)qword_26A5AAC70);
    v29(v31, v30, v32);
    swift_retain_n();
    uint64_t v33 = sub_25C47AA18();
    os_log_type_t v34 = sub_25C47AD28();
    if (os_log_type_enabled(v33, v34))
    {
      v94 = *(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v0 + 576);
      os_log_type_t type = v34;
      uint64_t v35 = *(unsigned __int8 **)(v0 + 512);
      v89 = *(unsigned __int8 **)(v0 + 488);
      uint64_t v36 = *(void *)(v0 + 312);
      uint64_t v37 = *(void *)(v0 + 232);
      v90 = (unsigned __int8 *)(v37 + *(void *)(v0 + 568));
      uint64_t v38 = swift_slowAlloc();
      uint64_t v91 = swift_slowAlloc();
      *(_DWORD *)uint64_t v38 = 136446722;
      uint64_t v100 = v91;
      uint64_t v40 = *(void *)(v37 + 16);
      unint64_t v39 = *(void *)(v37 + 24);
      swift_bridgeObjectRetain();
      *(void *)(v0 + 144) = sub_25C47596C(v40, v39, &v100);
      sub_25C47ADB8();
      swift_bridgeObjectRelease();
      *(_WORD *)(v38 + 12) = 2082;
      v94(v35, v89, v36);
      v4(v89, v36);
      uint64_t v41 = sub_25C45D678();
      unint64_t v43 = v42;
      v4(v35, v36);
      *(void *)(v0 + 152) = sub_25C47596C(v41, v43, &v100);
      sub_25C47ADB8();
      swift_bridgeObjectRelease();
      *(_WORD *)(v38 + 22) = 2082;
      v94(v35, v90, v36);
      swift_release();
      uint64_t v44 = sub_25C45D678();
      unint64_t v46 = v45;
      v4(v35, v36);
      *(void *)(v0 + 160) = sub_25C47596C(v44, v46, &v100);
      sub_25C47ADB8();
      swift_bridgeObjectRelease();
      swift_release();
      _os_log_impl(&dword_25C444000, v33, type, "%{public}s early return post-display: updateContext changed from %{public}s to %{public}s", (uint8_t *)v38, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x261186AD0](v91, -1, -1);
      MEMORY[0x261186AD0](v38, -1, -1);
    }
    else
    {
      v4(*(unsigned __int8 **)(v0 + 488), *(void *)(v0 + 312));
      swift_release_n();
    }
    uint64_t v54 = *(unsigned __int8 **)(v0 + 528);
    uint64_t v55 = *(void *)(v0 + 312);
    (*(void (**)(void))(*(void *)(**(void **)(v0 + 232) + 128) + 32))(*(void *)(**(void **)(v0 + 232) + 96));
    v4(v54, v55);
    goto LABEL_27;
  }
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 648);
  uint64_t v6 = *(void *)(v0 + 432);
  uint64_t v7 = *(void *)(v0 + 440);
  uint64_t v8 = *(void *)(v0 + 368);
  uint64_t v9 = *(void *)(v0 + 312);
  uint64_t v10 = *(void *)(v0 + 232) + *(void *)(v0 + 640);
  (*(void (**)(uint64_t, void, uint64_t))(v0 + 672))(v6, *(void *)(v0 + 528) + *(int *)(v9 + 92), v8);
  v98 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56);
  v98(v6, 0, 1, v8);
  int v11 = v5(v10, 1, v9);
  uint64_t v12 = 1;
  if (!v11)
  {
    (*(void (**)(void, void, void))(v0 + 672))(*(void *)(v0 + 424), *(void *)(v0 + 232) + *(void *)(v0 + 640) + *(int *)(*(void *)(v0 + 312) + 92), *(void *)(v0 + 368));
    uint64_t v12 = 0;
  }
  uint64_t v13 = *(void *)(v0 + 432);
  uint64_t v14 = *(void *)(v0 + 440);
  uint64_t v15 = *(void *)(v0 + 424);
  uint64_t v16 = *(void *)(v0 + 400);
  uint64_t v17 = *(void *)(v0 + 408);
  uint64_t v19 = *(void *)(v0 + 376);
  uint64_t v18 = *(void *)(v0 + 384);
  uint64_t v20 = *(void *)(v0 + 368);
  v98(v15, v12, 1, v20);
  uint64_t v21 = v16 + *(int *)(v18 + 48);
  uint64_t v22 = *(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16);
  v22(v16, v13, v19);
  v22(v21, v15, v19);
  uint64_t v23 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v14 + 48);
  int v24 = v23(v16, 1, v20);
  uint64_t v25 = *(void *)(v0 + 368);
  uint64_t v26 = *(void *)(v0 + 376);
  if (v24 == 1)
  {
    uint64_t v27 = *(void *)(v0 + 432);
    uint64_t v28 = *(void (**)(uint64_t, uint64_t))(*(void *)(v0 + 408) + 8);
    v28(*(void *)(v0 + 424), *(void *)(v0 + 376));
    v28(v27, v26);
    if (v23(v21, 1, v25) == 1)
    {
      v28(*(void *)(v0 + 400), *(void *)(v0 + 376));
      goto LABEL_17;
    }
    goto LABEL_13;
  }
  v22(*(void *)(v0 + 416), *(void *)(v0 + 400), *(void *)(v0 + 376));
  int v47 = v23(v21, 1, v25);
  uint64_t v48 = *(void (**)(uint64_t, uint64_t))(v0 + 696);
  if (v47 == 1)
  {
    uint64_t v49 = *(void *)(v0 + 432);
    uint64_t v50 = *(void *)(v0 + 416);
    uint64_t v52 = *(void *)(v0 + 368);
    uint64_t v51 = *(void *)(v0 + 376);
    uint64_t v53 = *(void (**)(uint64_t, uint64_t))(*(void *)(v0 + 408) + 8);
    v53(*(void *)(v0 + 424), v51);
    v53(v49, v51);
    v48(v50, v52);
LABEL_13:
    (*(void (**)(void, void))(*(void *)(v0 + 392) + 8))(*(void *)(v0 + 400), *(void *)(v0 + 384));
    goto LABEL_19;
  }
  uint64_t v56 = *(void *)(v0 + 448);
  uint64_t v95 = *(void *)(v0 + 432);
  uint64_t v57 = *(void *)(v0 + 416);
  uint64_t typea = *(void *)(v0 + 424);
  uint64_t v58 = *(void *)(v0 + 408);
  uint64_t v99 = *(void *)(v0 + 400);
  uint64_t v60 = *(void *)(v0 + 368);
  uint64_t v59 = *(void *)(v0 + 376);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 + 440) + 32))(v56, v21, v60);
  swift_getAssociatedConformanceWitness();
  char v61 = sub_25C47AA68();
  v48(v56, v60);
  uint64_t v62 = *(void (**)(uint64_t, uint64_t))(v58 + 8);
  v62(typea, v59);
  v62(v95, v59);
  v48(v57, v60);
  v62(v99, v59);
  if (v61)
  {
LABEL_17:
    swift_release();
    uint64_t v63 = *(void *)(v0 + 312);
    uint64_t v64 = (unsigned __int8 *)(*(void *)(v0 + 232) + *(void *)(v0 + 640));
    int v65 = (*(uint64_t (**)(unsigned __int8 *, uint64_t, uint64_t))(v0 + 648))(v64, 1, v63);
    uint64_t v66 = *(void (**)(uint64_t, unsigned __int8 *, uint64_t))(v0 + 576);
    v67 = *(unsigned __int8 **)(v0 + 528);
    uint64_t v68 = *(void *)(v0 + 496);
    if (v65)
    {
      v66(v68, v67, v63);
    }
    else
    {
      int v75 = *v64;
      int v76 = *v67;
      ((void (*)(uint64_t))v66)(v68);
      if (v75 == v76)
      {
        (*(void (**)(void, void))(v0 + 712))(*(void *)(v0 + 496), *(void *)(v0 + 312));
LABEL_26:
        uint64_t v79 = *(void (**)(uint64_t, uint64_t))(v0 + 712);
        uint64_t v80 = *(void *)(v0 + 528);
        uint64_t v81 = *(void *)(v0 + 480);
        uint64_t v82 = *(void *)(v0 + 328);
        uint64_t v83 = *(void *)(v0 + 336);
        uint64_t v84 = *(void *)(v0 + 232);
        uint64_t v85 = v84 + *(void *)(v0 + 640);
        uint64_t v87 = *(void *)(v0 + 312);
        uint64_t v86 = *(void *)(v0 + 320);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 576))(v83, v80, v87);
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v81 + 56))(v83, 0, 1, v87);
        swift_beginAccess();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v82 + 40))(v85, v83, v86);
        swift_endAccess();
        (*(void (**)(void))(*(void *)(*(void *)v84 + 128) + 32))(*(void *)(*(void *)v84 + 96));
        v79(v80, v87);
LABEL_27:
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        v88 = *(uint64_t (**)(void))(v0 + 8);
        return v88();
      }
    }
    uint64_t v77 = *(unsigned __int8 **)(v0 + 496);
    int v78 = *v77;
    (*(void (**)(unsigned __int8 *, void, uint64_t))(v0 + 712))(v77, *(void *)(v0 + 312), v69);
    if (!v78) {
      (*(void (**)(uint64_t, void, void))(*(void *)(v0 + 296) + 8))(1, 0, *(void *)(v0 + 264));
    }
    goto LABEL_26;
  }
LABEL_19:
  v96 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)(v0 + 280) + 16)
                                                          + **(int **)(*(void *)(v0 + 280) + 16));
  v70 = (void *)swift_task_alloc();
  *(void *)(v0 + 728) = v70;
  void *v70 = v0;
  v70[1] = sub_25C45B140;
  uint64_t v71 = *(void *)(v0 + 360);
  uint64_t v72 = *(void *)(v0 + 280);
  uint64_t v73 = *(void *)(v0 + 248);
  return v96(v71, v73, v72);
}

uint64_t sub_25C45B140()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 560);
  uint64_t v3 = *(void *)(v1 + 552);
  return MEMORY[0x270FA2498](sub_25C45B260, v3, v2);
}

uint64_t sub_25C45B260()
{
  uint64_t v48 = v0;
  unint64_t v45 = *(void (**)(unsigned __int8 *, uint64_t))(v0 + 712);
  uint64_t v1 = *(unsigned __int8 **)(v0 + 528);
  uint64_t v2 = *(unsigned __int8 **)(v0 + 512);
  uint64_t v3 = *(void *)(v0 + 312);
  (*(void (**)(unsigned __int8 *, void, uint64_t))(v0 + 576))(v2, *(void *)(v0 + 232) + *(void *)(v0 + 568), v3);
  LOBYTE(v1) = sub_25C458FCC(v1, v2);
  v45(v2, v3);
  if (v1)
  {
    uint64_t v4 = *(void *)(*(void *)(v0 + 288) + 8);
    unint64_t v46 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 + 16) + **(int **)(v4 + 16));
    uint64_t v5 = (void *)swift_task_alloc();
    *(void *)(v0 + 736) = v5;
    *uint64_t v5 = v0;
    v5[1] = sub_25C45B8C4;
    uint64_t v6 = *(void *)(v0 + 360);
    uint64_t v7 = *(void *)(v0 + 256);
    return v46(v6, v7, v4);
  }
  else
  {
    swift_release();
    if (qword_26A5A8498 != -1) {
      swift_once();
    }
    uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 576);
    uint64_t v10 = *(void *)(v0 + 528);
    uint64_t v11 = *(void *)(v0 + 504);
    uint64_t v12 = *(void *)(v0 + 312);
    __swift_project_value_buffer(*(void *)(v0 + 456), (uint64_t)qword_26A5AAC70);
    v9(v11, v10, v12);
    swift_retain_n();
    uint64_t v13 = sub_25C47AA18();
    os_log_type_t v14 = sub_25C47AD28();
    BOOL v15 = os_log_type_enabled(v13, v14);
    uint64_t v16 = *(void (**)(uint64_t, uint64_t))(v0 + 712);
    if (v15)
    {
      uint64_t v37 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 576);
      os_log_type_t type = v14;
      uint64_t v17 = *(void *)(v0 + 512);
      uint64_t v36 = *(void *)(v0 + 504);
      uint64_t v44 = *(void *)(v0 + 360);
      uint64_t v42 = *(void *)(v0 + 352);
      uint64_t v43 = *(void *)(v0 + 344);
      uint64_t v18 = *(void *)(v0 + 312);
      uint64_t v19 = *(void *)(v0 + 232);
      uint64_t v38 = v19 + *(void *)(v0 + 568);
      log = v13;
      uint64_t v20 = swift_slowAlloc();
      uint64_t v40 = swift_slowAlloc();
      uint64_t v47 = v40;
      *(_DWORD *)uint64_t v20 = 136446722;
      uint64_t v21 = *(void *)(v19 + 16);
      unint64_t v22 = *(void *)(v19 + 24);
      swift_bridgeObjectRetain();
      *(void *)(v0 + 168) = sub_25C47596C(v21, v22, &v47);
      sub_25C47ADB8();
      swift_bridgeObjectRelease();
      swift_release();
      *(_WORD *)(v20 + 12) = 2082;
      v37(v17, v36, v18);
      v16(v36, v18);
      uint64_t v23 = sub_25C45D678();
      unint64_t v25 = v24;
      v16(v17, v18);
      *(void *)(v0 + 176) = sub_25C47596C(v23, v25, &v47);
      sub_25C47ADB8();
      swift_bridgeObjectRelease();
      *(_WORD *)(v20 + 22) = 2082;
      v37(v17, v38, v18);
      swift_release();
      uint64_t v26 = sub_25C45D678();
      unint64_t v28 = v27;
      v16(v17, v18);
      *(void *)(v0 + 184) = sub_25C47596C(v26, v28, &v47);
      sub_25C47ADB8();
      swift_bridgeObjectRelease();
      swift_release();
      _os_log_impl(&dword_25C444000, log, type, "%{public}s early return post-UpdateTransforms: updateContext changed from %{public}s to %{public}s", (uint8_t *)v20, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x261186AD0](v40, -1, -1);
      MEMORY[0x261186AD0](v20, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v44, v43);
    }
    else
    {
      uint64_t v30 = *(void *)(v0 + 352);
      uint64_t v29 = *(void *)(v0 + 360);
      uint64_t v31 = *(void *)(v0 + 344);
      v16(*(void *)(v0 + 504), *(void *)(v0 + 312));

      swift_release_n();
      (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v29, v31);
    }
    uint64_t v32 = *(void (**)(uint64_t, uint64_t))(v0 + 712);
    uint64_t v33 = *(void *)(v0 + 528);
    uint64_t v34 = *(void *)(v0 + 312);
    (*(void (**)(void))(*(void *)(**(void **)(v0 + 232) + 128) + 32))(*(void *)(**(void **)(v0 + 232) + 96));
    v32(v33, v34);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v35 = *(uint64_t (**)(void))(v0 + 8);
    return v35();
  }
}

uint64_t sub_25C45B8C4()
{
  uint64_t v2 = (void *)*v1;
  v2[93] = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = v2[70];
    uint64_t v4 = v2[69];
    return MEMORY[0x270FA2498](sub_25C45BF0C, v4, v3);
  }
  else
  {
    uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v2[38] + 16) + **(int **)(v2[38] + 16));
    uint64_t v5 = (void *)swift_task_alloc();
    v2[94] = v5;
    *uint64_t v5 = v2;
    v5[1] = sub_25C45BAB4;
    uint64_t v6 = v2[38];
    uint64_t v7 = v2[33];
    uint64_t v8 = v2[45];
    return v10(v8, v7, v6);
  }
}

uint64_t sub_25C45BAB4()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 760) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 560);
  uint64_t v4 = *(void *)(v2 + 552);
  if (v0) {
    uint64_t v5 = sub_25C45C478;
  }
  else {
    uint64_t v5 = sub_25C45BBF0;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_25C45BBF0()
{
  uint64_t v2 = *(void *)(v0 + 352);
  uint64_t v1 = *(void *)(v0 + 360);
  uint64_t v3 = *(void *)(v0 + 344);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  uint64_t v4 = *(void *)(v0 + 312);
  uint64_t v5 = (unsigned __int8 *)(*(void *)(v0 + 232) + *(void *)(v0 + 640));
  int v6 = (*(uint64_t (**)(unsigned __int8 *, uint64_t, uint64_t))(v0 + 648))(v5, 1, v4);
  uint64_t v7 = *(void (**)(uint64_t, unsigned __int8 *, uint64_t))(v0 + 576);
  uint64_t v8 = *(unsigned __int8 **)(v0 + 528);
  uint64_t v9 = *(void *)(v0 + 496);
  if (v6)
  {
    v7(v9, v8, v4);
  }
  else
  {
    int v10 = *v5;
    int v11 = *v8;
    ((void (*)(uint64_t))v7)(v9);
    if (v10 == v11)
    {
      (*(void (**)(void, void))(v0 + 712))(*(void *)(v0 + 496), *(void *)(v0 + 312));
      goto LABEL_7;
    }
  }
  int v12 = **(unsigned __int8 **)(v0 + 496);
  (*(void (**)(void))(v0 + 712))();
  if (!v12) {
    (*(void (**)(uint64_t, void, void))(*(void *)(v0 + 296) + 8))(1, 0, *(void *)(v0 + 264));
  }
LABEL_7:
  uint64_t v23 = *(void (**)(uint64_t, uint64_t))(v0 + 712);
  uint64_t v13 = *(void *)(v0 + 528);
  uint64_t v14 = *(void *)(v0 + 480);
  uint64_t v16 = *(void *)(v0 + 328);
  uint64_t v15 = *(void *)(v0 + 336);
  uint64_t v17 = *(void *)(v0 + 232);
  uint64_t v18 = v17 + *(void *)(v0 + 640);
  uint64_t v20 = *(void *)(v0 + 312);
  uint64_t v19 = *(void *)(v0 + 320);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 576))(v15, v13, v20);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v14 + 56))(v15, 0, 1, v20);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 40))(v18, v15, v19);
  swift_endAccess();
  (*(void (**)(void))(*(void *)(*(void *)v17 + 128) + 32))(*(void *)(*(void *)v17 + 96));
  v23(v13, v20);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v21 = *(uint64_t (**)(void))(v0 + 8);
  return v21();
}

uint64_t sub_25C45BF0C()
{
  uint64_t v42 = v0;
  uint64_t v1 = *(void **)(v0 + 744);
  swift_release();
  if (qword_26A5A8498 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(*(void *)(v0 + 456), (uint64_t)qword_26A5AAC70);
  swift_retain();
  id v2 = v1;
  swift_retain();
  id v3 = v1;
  uint64_t v4 = sub_25C47AA18();
  os_log_type_t v5 = sub_25C47AD18();
  BOOL v6 = os_log_type_enabled(v4, v5);
  uint64_t v8 = *(void *)(v0 + 352);
  uint64_t v7 = *(void *)(v0 + 360);
  uint64_t v9 = *(void *)(v0 + 344);
  uint64_t v10 = *(void *)(v0 + 232);
  if (v6)
  {
    os_log_type_t type = v5;
    uint64_t v11 = swift_slowAlloc();
    uint64_t v35 = (void *)swift_slowAlloc();
    uint64_t v37 = swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 136446466;
    uint64_t v40 = v9;
    uint64_t v41 = v37;
    uint64_t v38 = v7;
    uint64_t v12 = *(void *)(v10 + 16);
    unint64_t v13 = *(void *)(v10 + 24);
    swift_bridgeObjectRetain();
    *(void *)(v0 + 200) = sub_25C47596C(v12, v13, &v41);
    sub_25C47ADB8();
    swift_bridgeObjectRelease();
    swift_release_n();
    *(_WORD *)(v11 + 12) = 2112;
    id v14 = v1;
    uint64_t v15 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 208) = v15;
    sub_25C47ADB8();
    *uint64_t v35 = v15;

    _os_log_impl(&dword_25C444000, v4, type, "%{public}s failed updating blanker and coordinator: %@", (uint8_t *)v11, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A9190);
    swift_arrayDestroy();
    MEMORY[0x261186AD0](v35, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x261186AD0](v37, -1, -1);
    MEMORY[0x261186AD0](v11, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v38, v40);
  }
  else
  {

    swift_release_n();
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
  }
  uint64_t v16 = *(void *)(v0 + 312);
  uint64_t v17 = (unsigned __int8 *)(*(void *)(v0 + 232) + *(void *)(v0 + 640));
  int v18 = (*(uint64_t (**)(unsigned __int8 *, uint64_t, uint64_t))(v0 + 648))(v17, 1, v16);
  uint64_t v19 = *(void (**)(uint64_t, unsigned __int8 *, uint64_t))(v0 + 576);
  uint64_t v20 = *(unsigned __int8 **)(v0 + 528);
  uint64_t v21 = *(void *)(v0 + 496);
  if (v18)
  {
    v19(v21, v20, v16);
  }
  else
  {
    int v22 = *v17;
    int v23 = *v20;
    ((void (*)(uint64_t))v19)(v21);
    if (v22 == v23)
    {
      (*(void (**)(void, void))(v0 + 712))(*(void *)(v0 + 496), *(void *)(v0 + 312));
      goto LABEL_12;
    }
  }
  int v24 = **(unsigned __int8 **)(v0 + 496);
  (*(void (**)(void))(v0 + 712))();
  if (!v24) {
    (*(void (**)(uint64_t, void, void))(*(void *)(v0 + 296) + 8))(1, 0, *(void *)(v0 + 264));
  }
LABEL_12:
  unint64_t v39 = *(void (**)(uint64_t, uint64_t))(v0 + 712);
  uint64_t v25 = *(void *)(v0 + 528);
  uint64_t v26 = *(void *)(v0 + 480);
  uint64_t v28 = *(void *)(v0 + 328);
  uint64_t v27 = *(void *)(v0 + 336);
  uint64_t v29 = *(void *)(v0 + 232);
  uint64_t v30 = v29 + *(void *)(v0 + 640);
  uint64_t v32 = *(void *)(v0 + 312);
  uint64_t v31 = *(void *)(v0 + 320);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 576))(v27, v25, v32);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v26 + 56))(v27, 0, 1, v32);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v28 + 40))(v30, v27, v31);
  swift_endAccess();
  (*(void (**)(void))(*(void *)(*(void *)v29 + 128) + 32))(*(void *)(*(void *)v29 + 96));
  v39(v25, v32);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v33 = *(uint64_t (**)(void))(v0 + 8);
  return v33();
}

uint64_t sub_25C45C478()
{
  uint64_t v42 = v0;
  uint64_t v1 = *(void **)(v0 + 760);
  swift_release();
  if (qword_26A5A8498 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(*(void *)(v0 + 456), (uint64_t)qword_26A5AAC70);
  swift_retain();
  id v2 = v1;
  swift_retain();
  id v3 = v1;
  uint64_t v4 = sub_25C47AA18();
  os_log_type_t v5 = sub_25C47AD18();
  BOOL v6 = os_log_type_enabled(v4, v5);
  uint64_t v8 = *(void *)(v0 + 352);
  uint64_t v7 = *(void *)(v0 + 360);
  uint64_t v9 = *(void *)(v0 + 344);
  uint64_t v10 = *(void *)(v0 + 232);
  if (v6)
  {
    os_log_type_t type = v5;
    uint64_t v11 = swift_slowAlloc();
    uint64_t v35 = (void *)swift_slowAlloc();
    uint64_t v37 = swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 136446466;
    uint64_t v40 = v9;
    uint64_t v41 = v37;
    uint64_t v38 = v7;
    uint64_t v12 = *(void *)(v10 + 16);
    unint64_t v13 = *(void *)(v10 + 24);
    swift_bridgeObjectRetain();
    *(void *)(v0 + 200) = sub_25C47596C(v12, v13, &v41);
    sub_25C47ADB8();
    swift_bridgeObjectRelease();
    swift_release_n();
    *(_WORD *)(v11 + 12) = 2112;
    id v14 = v1;
    uint64_t v15 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 208) = v15;
    sub_25C47ADB8();
    *uint64_t v35 = v15;

    _os_log_impl(&dword_25C444000, v4, type, "%{public}s failed updating blanker and coordinator: %@", (uint8_t *)v11, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A9190);
    swift_arrayDestroy();
    MEMORY[0x261186AD0](v35, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x261186AD0](v37, -1, -1);
    MEMORY[0x261186AD0](v11, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v38, v40);
  }
  else
  {

    swift_release_n();
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
  }
  uint64_t v16 = *(void *)(v0 + 312);
  uint64_t v17 = (unsigned __int8 *)(*(void *)(v0 + 232) + *(void *)(v0 + 640));
  int v18 = (*(uint64_t (**)(unsigned __int8 *, uint64_t, uint64_t))(v0 + 648))(v17, 1, v16);
  uint64_t v19 = *(void (**)(uint64_t, unsigned __int8 *, uint64_t))(v0 + 576);
  uint64_t v20 = *(unsigned __int8 **)(v0 + 528);
  uint64_t v21 = *(void *)(v0 + 496);
  if (v18)
  {
    v19(v21, v20, v16);
  }
  else
  {
    int v22 = *v17;
    int v23 = *v20;
    ((void (*)(uint64_t))v19)(v21);
    if (v22 == v23)
    {
      (*(void (**)(void, void))(v0 + 712))(*(void *)(v0 + 496), *(void *)(v0 + 312));
      goto LABEL_12;
    }
  }
  int v24 = **(unsigned __int8 **)(v0 + 496);
  (*(void (**)(void))(v0 + 712))();
  if (!v24) {
    (*(void (**)(uint64_t, void, void))(*(void *)(v0 + 296) + 8))(1, 0, *(void *)(v0 + 264));
  }
LABEL_12:
  unint64_t v39 = *(void (**)(uint64_t, uint64_t))(v0 + 712);
  uint64_t v25 = *(void *)(v0 + 528);
  uint64_t v26 = *(void *)(v0 + 480);
  uint64_t v28 = *(void *)(v0 + 328);
  uint64_t v27 = *(void *)(v0 + 336);
  uint64_t v29 = *(void *)(v0 + 232);
  uint64_t v30 = v29 + *(void *)(v0 + 640);
  uint64_t v32 = *(void *)(v0 + 312);
  uint64_t v31 = *(void *)(v0 + 320);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 576))(v27, v25, v32);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v26 + 56))(v27, 0, 1, v32);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v28 + 40))(v30, v27, v31);
  swift_endAccess();
  (*(void (**)(void))(*(void *)(*(void *)v29 + 128) + 32))(*(void *)(*(void *)v29 + 96));
  v39(v25, v32);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v33 = *(uint64_t (**)(void))(v0 + 8);
  return v33();
}

uint64_t sub_25C45C9E4()
{
  uint64_t v1 = *(void **)v0;
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, void))(*(void *)(v1[10] - 8) + 8))(v0 + *(void *)(*(void *)v0 + 160), v1[10]);
  (*(void (**)(uint64_t, void))(*(void *)(v1[11] - 8) + 8))(v0 + *(void *)(*(void *)v0 + 168), v1[11]);
  (*(void (**)(uint64_t, void))(*(void *)(v1[12] - 8) + 8))(v0 + *(void *)(*(void *)v0 + 176), v1[12]);
  (*(void (**)(uint64_t, void))(*(void *)(v1[13] - 8) + 8))(v0 + *(void *)(*(void *)v0 + 184), v1[13]);
  uint64_t v2 = v0 + *(void *)(*(void *)v0 + 192);
  uint64_t updated = type metadata accessor for DisplayUpdater.UpdateContext();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(updated - 8) + 8))(v2, updated);
  uint64_t v4 = v0 + *(void *)(*(void *)v0 + 200);
  uint64_t v5 = sub_25C47ADA8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  return v0;
}

uint64_t sub_25C45CC90()
{
  sub_25C45C9E4();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t type metadata accessor for DisplayUpdater()
{
  return swift_getGenericMetadata();
}

uint64_t type metadata accessor for DisplayUpdater.UpdateContext()
{
  return swift_getGenericMetadata();
}

uint64_t sub_25C45CD18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 80);
}

uint64_t sub_25C45CD20()
{
  uint64_t result = swift_getAssociatedTypeWitness();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_25C45CDD0(uint64_t *a1, uint64_t *a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v6 = *(_DWORD *)(v5 + 80);
  uint64_t v7 = ~v6;
  if (v6 > 7
    || (*(_DWORD *)(v5 + 80) & 0x100000) != 0
    || ((v6 + 1) & (unint64_t)~v6) + *(void *)(*(void *)(AssociatedTypeWitness - 8) + 64) > 0x18)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v6 + 16) & v7));
    swift_retain();
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v5 + 16))(((unint64_t)a1 + v6 + 1) & v7, ((unint64_t)a2 + v6 + 1) & v7, AssociatedTypeWitness);
  }
  return a1;
}

uint64_t sub_25C45CED8(uint64_t a1)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v3 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v4 = *(uint64_t (**)(unint64_t, uint64_t))(v3 + 8);
  uint64_t v5 = AssociatedTypeWitness;
  unint64_t v6 = (a1 + *(unsigned __int8 *)(v3 + 80) + 1) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  return v4(v6, v5);
}

unsigned char *sub_25C45CF68(unsigned char *a1, unsigned char *a2)
{
  *a1 = *a2;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v5 + 16))((unint64_t)&a1[*(unsigned __int8 *)(v5 + 80) + 1] & ~(unint64_t)*(unsigned __int8 *)(v5 + 80), (unint64_t)&a2[*(unsigned __int8 *)(v5 + 80) + 1] & ~(unint64_t)*(unsigned __int8 *)(v5 + 80), AssociatedTypeWitness);
  return a1;
}

unsigned char *sub_25C45CFFC(unsigned char *a1, unsigned char *a2)
{
  *a1 = *a2;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v5 + 24))((unint64_t)&a1[*(unsigned __int8 *)(v5 + 80) + 1] & ~(unint64_t)*(unsigned __int8 *)(v5 + 80), (unint64_t)&a2[*(unsigned __int8 *)(v5 + 80) + 1] & ~(unint64_t)*(unsigned __int8 *)(v5 + 80), AssociatedTypeWitness);
  return a1;
}

unsigned char *sub_25C45D090(unsigned char *a1, unsigned char *a2)
{
  *a1 = *a2;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v5 + 32))((unint64_t)&a1[*(unsigned __int8 *)(v5 + 80) + 1] & ~(unint64_t)*(unsigned __int8 *)(v5 + 80), (unint64_t)&a2[*(unsigned __int8 *)(v5 + 80) + 1] & ~(unint64_t)*(unsigned __int8 *)(v5 + 80), AssociatedTypeWitness);
  return a1;
}

unsigned char *sub_25C45D124(unsigned char *a1, unsigned char *a2)
{
  *a1 = *a2;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v5 + 40))((unint64_t)&a1[*(unsigned __int8 *)(v5 + 80) + 1] & ~(unint64_t)*(unsigned __int8 *)(v5 + 80), (unint64_t)&a2[*(unsigned __int8 *)(v5 + 80) + 1] & ~(unint64_t)*(unsigned __int8 *)(v5 + 80), AssociatedTypeWitness);
  return a1;
}

uint64_t sub_25C45D1B8(unsigned __int8 *a1, unsigned int a2)
{
  uint64_t v4 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  uint64_t v5 = v4;
  unsigned int v6 = *(_DWORD *)(v4 + 84);
  if (v6 <= 0xFD) {
    unsigned int v7 = 253;
  }
  else {
    unsigned int v7 = *(_DWORD *)(v4 + 84);
  }
  uint64_t v8 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v9 = *(void *)(v4 + 64);
  if (!a2) {
    return 0;
  }
  if (a2 <= v7) {
    goto LABEL_23;
  }
  uint64_t v10 = ((v8 + 1) & ~v8) + v9;
  char v11 = 8 * v10;
  if (v10 <= 3)
  {
    unsigned int v14 = ((a2 - v7 + ~(-1 << v11)) >> v11) + 1;
    if (HIWORD(v14))
    {
      int v12 = *(_DWORD *)&a1[v10];
      if (!v12) {
        goto LABEL_23;
      }
      goto LABEL_15;
    }
    if (v14 > 0xFF)
    {
      int v12 = *(unsigned __int16 *)&a1[v10];
      if (!*(_WORD *)&a1[v10]) {
        goto LABEL_23;
      }
      goto LABEL_15;
    }
    if (v14 < 2)
    {
LABEL_23:
      if (v6 > 0xFD)
      {
        uint64_t v17 = *(uint64_t (**)(unint64_t))(v5 + 48);
        return v17((unint64_t)&a1[v8 + 1] & ~v8);
      }
      else
      {
        unsigned int v16 = *a1;
        if (v16 >= 3) {
          return v16 - 2;
        }
        else {
          return 0;
        }
      }
    }
  }
  int v12 = a1[v10];
  if (!a1[v10]) {
    goto LABEL_23;
  }
LABEL_15:
  int v15 = (v12 - 1) << v11;
  if (v10 > 3) {
    int v15 = 0;
  }
  if (v10)
  {
    if (v10 > 3) {
      LODWORD(v10) = 4;
    }
    switch((int)v10)
    {
      case 2:
        LODWORD(v10) = *(unsigned __int16 *)a1;
        break;
      case 3:
        LODWORD(v10) = *(unsigned __int16 *)a1 | (a1[2] << 16);
        break;
      case 4:
        LODWORD(v10) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v10) = *a1;
        break;
    }
  }
  return v7 + (v10 | v15) + 1;
}

void sub_25C45D3AC(unsigned char *a1, uint64_t a2, unsigned int a3)
{
  uint64_t v6 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  uint64_t v8 = *(unsigned __int8 *)(v6 + 80);
  if (v7 <= 0xFD) {
    unsigned int v9 = 253;
  }
  else {
    unsigned int v9 = *(_DWORD *)(v6 + 84);
  }
  size_t v10 = ((v8 + 1) & ~v8) + *(void *)(v6 + 64);
  if (a3 <= v9)
  {
    int v11 = 0;
  }
  else if (v10 <= 3)
  {
    unsigned int v14 = ((a3 - v9 + ~(-1 << (8 * v10))) >> (8 * v10)) + 1;
    if (HIWORD(v14))
    {
      int v11 = 4;
    }
    else if (v14 >= 0x100)
    {
      int v11 = 2;
    }
    else
    {
      int v11 = v14 > 1;
    }
  }
  else
  {
    int v11 = 1;
  }
  if (v9 < a2)
  {
    unsigned int v12 = ~v9 + a2;
    if (v10 < 4)
    {
      int v13 = (v12 >> (8 * v10)) + 1;
      if (v10)
      {
        int v15 = v12 & ~(-1 << (8 * v10));
        bzero(a1, v10);
        if (v10 == 3)
        {
          *(_WORD *)a1 = v15;
          a1[2] = BYTE2(v15);
        }
        else if (v10 == 2)
        {
          *(_WORD *)a1 = v15;
        }
        else
        {
          *a1 = v15;
        }
      }
    }
    else
    {
      bzero(a1, v10);
      *(_DWORD *)a1 = v12;
      int v13 = 1;
    }
    switch(v11)
    {
      case 1:
        a1[v10] = v13;
        return;
      case 2:
        *(_WORD *)&a1[v10] = v13;
        return;
      case 3:
        goto LABEL_39;
      case 4:
        *(_DWORD *)&a1[v10] = v13;
        return;
      default:
        return;
    }
  }
  switch(v11)
  {
    case 1:
      a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 2:
      *(_WORD *)&a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 3:
LABEL_39:
      __break(1u);
      JUMPOUT(0x25C45D628);
    case 4:
      *(_DWORD *)&a1[v10] = 0;
      goto LABEL_23;
    default:
LABEL_23:
      if (a2)
      {
LABEL_24:
        if (v7 > 0xFD)
        {
          unsigned int v16 = *(void (**)(unint64_t, uint64_t))(v6 + 56);
          v16((unint64_t)&a1[v8 + 1] & ~v8, a2);
        }
        else
        {
          *a1 = a2 + 2;
        }
      }
      return;
  }
}

uint64_t sub_25C45D650(uint64_t a1, uint64_t a2)
{
  return sub_25C45D6F8(a2);
}

uint64_t sub_25C45D678()
{
  return 91;
}

uint64_t sub_25C45D6F8(uint64_t result)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 192);
  if (*(unsigned __int8 *)(v1 + v2) != result)
  {
    *(unsigned char *)(v1 + v2) = result;
    return sub_25C459130();
  }
  return result;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_25C45D7C0(uint64_t a1)
{
  return sub_25C465FB8(a1);
}

uint64_t sub_25C45D7C8()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25C45D800(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_25C45D99C;
  return sub_25C465D28(a1, v4);
}

uint64_t sub_25C45D8AC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A8990);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25C45D90C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25C455FD0;
  return sub_25C459288();
}

uint64_t sub_25C45D9A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 40))();
}

uint64_t sub_25C45D9B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 48))();
}

id sub_25C45D9C8()
{
  return sub_25C45D9F0("%s: sendToFront", 1.79769313e308);
}

id sub_25C45D9DC()
{
  return sub_25C45D9F0("%s: sendToBack", -1.79769313e308);
}

id sub_25C45D9F0(const char *a1, double a2)
{
  if (qword_26A5A84E8 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_25C47AA38();
  __swift_project_value_buffer(v5, (uint64_t)qword_26A5AACC0);
  id v6 = v2;
  uint64_t v7 = sub_25C47AA18();
  os_log_type_t v8 = sub_25C47AD28();
  if (os_log_type_enabled(v7, v8))
  {
    unsigned int v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    uint64_t v15 = v10;
    *(_DWORD *)unsigned int v9 = 136315138;
    uint64_t v11 = sub_25C47AA98();
    uint64_t v14 = sub_25C47596C(v11, v12, &v15);
    sub_25C47ADB8();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25C444000, v7, v8, a1, v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x261186AD0](v10, -1, -1);
    MEMORY[0x261186AD0](v9, -1, -1);
  }
  else
  {
  }
  return objc_msgSend(v6, sel_setWindowLevel_, a2, v14, v15);
}

id sub_25C45DCA4(void *a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  v7.receiver = a1;
  v7.super_class = (Class)type metadata accessor for RootWindowDisplayBlanker.SSKRootBlankingWindow();
  return objc_msgSendSuper2(&v7, *a4, a3);
}

id sub_25C45DCF8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RootWindowDisplayBlanker.SSKRootBlankingWindow();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

BOOL sub_25C45DD30(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_25C45DD48()
{
  return MEMORY[0x270FA0228](v0, 40, 7);
}

uint64_t type metadata accessor for RootWindowDisplayBlanker()
{
  return self;
}

uint64_t type metadata accessor for RootWindowDisplayBlanker.SSKRootBlankingWindow()
{
  return self;
}

uint64_t getEnumTagSinglePayload for RootWindowDisplayBlanker.State(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for RootWindowDisplayBlanker.State(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *uint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x25C45DF2CLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

unsigned char *sub_25C45DF54(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for RootWindowDisplayBlanker.State()
{
  return &type metadata for RootWindowDisplayBlanker.State;
}

unint64_t sub_25C45DF74()
{
  unint64_t result = qword_26A5A89A8;
  if (!qword_26A5A89A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5A89A8);
  }
  return result;
}

void sub_25C45DFC8()
{
}

void sub_25C45DFEC()
{
}

void sub_25C45E010(char *a1, void (*a2)(void), char a3)
{
  uint64_t v7 = v3;
  if (qword_26A5A84E8 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_25C47AA38();
  __swift_project_value_buffer(v8, (uint64_t)qword_26A5AACC0);
  swift_retain_n();
  unsigned int v9 = sub_25C47AA18();
  os_log_type_t v10 = sub_25C47AD28();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = swift_slowAlloc();
    unint64_t v12 = (void *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 138412546;
    format = a1;
    uint64_t v14 = *(void **)(v7 + 24);
    uint64_t v20 = v13;
    id v15 = v14;
    sub_25C47ADB8();
    *unint64_t v12 = v14;
    swift_release_n();
    *(_WORD *)(v11 + 12) = 2080;
    uint64_t v16 = sub_25C47AA98();
    sub_25C47596C(v16, v17, &v20);
    sub_25C47ADB8();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25C444000, v9, v10, format, (uint8_t *)v11, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A9190);
    swift_arrayDestroy();
    MEMORY[0x261186AD0](v12, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x261186AD0](v13, -1, -1);
    MEMORY[0x261186AD0](v11, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  id v18 = *(id *)(v7 + 32);
  a2();

  *(unsigned char *)(v7 + 16) = a3;
}

void sub_25C45E278()
{
}

void sub_25C45E2BC()
{
}

uint64_t sub_25C45E300()
{
  return sub_25C45E324();
}

uint64_t sub_25C45E324()
{
  return 0;
}

uint64_t sub_25C45E420(uint64_t a1)
{
  v2[3] = a1;
  v2[4] = v1;
  sub_25C47ABD8();
  v2[5] = sub_25C47ABC8();
  uint64_t v4 = sub_25C47AB88();
  return MEMORY[0x270FA2498](sub_25C45E4B8, v4, v3);
}

void sub_25C45E4B8()
{
  uint64_t v1 = v0[4];
  swift_release();
  id v2 = objc_msgSend(*(id *)(v1 + 32), sel_screen);
  id v3 = objc_msgSend(v2, sel_displayConfiguration);

  if (v3)
  {
    uint64_t v4 = (void *)v0[3];
    unint64_t v5 = 0x2654B1000uLL;
    objc_msgSend(v3, sel_bounds);
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;

    objc_msgSend(v4, sel_bounds);
    v45.origin.x = v14;
    v45.origin.y = v15;
    v45.size.width = v16;
    v45.size.height = v17;
    v44.origin.x = v7;
    v44.origin.y = v9;
    v44.size.width = v11;
    v44.size.height = v13;
    if (!CGRectEqualToRect(v44, v45))
    {
      if (qword_26A5A84E8 != -1) {
        swift_once();
      }
      uint64_t v18 = sub_25C47AA38();
      __swift_project_value_buffer(v18, (uint64_t)qword_26A5AACC0);
      swift_retain_n();
      uint64_t v19 = sub_25C47AA18();
      os_log_type_t v20 = sub_25C47AD28();
      BOOL v21 = os_log_type_enabled(v19, v20);
      uint64_t v22 = v0[4];
      if (v21)
      {
        int v23 = (uint8_t *)swift_slowAlloc();
        uint64_t v42 = (void *)swift_slowAlloc();
        *(_DWORD *)int v23 = 138543362;
        int v24 = *(void **)(v22 + 24);
        v0[2] = v24;
        id v25 = v24;
        unint64_t v5 = 0x2654B1000;
        sub_25C47ADB8();
        *uint64_t v42 = v24;
        swift_release_n();
        _os_log_impl(&dword_25C444000, v19, v20, "[%{public}@] recreating blanking window", v23, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A9190);
        swift_arrayDestroy();
        MEMORY[0x261186AD0](v42, -1, -1);
        MEMORY[0x261186AD0](v23, -1, -1);
      }
      else
      {
        swift_release_n();
      }

      id v26 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for RootWindowDisplayBlanker.SSKRootBlankingWindow()), sel_initWithDisplay_, v0[3]);
      if (!v26)
      {
        sub_25C47AF18();
        return;
      }
      uint64_t v27 = v26;
      uint64_t v28 = (void *)v0[3];
      uint64_t v29 = v0[4];
      uint64_t v30 = self;
      id v31 = v27;
      id v32 = objc_msgSend(v30, sel_blackColor);
      objc_msgSend(v31, sel_setBackgroundColor_, v32);

      objc_msgSend(v31, sel_setHidden_, 0);
      objc_msgSend(v31, sel_setOpaque_, 1);
      sub_25C45D9DC();
      [v28 *(SEL *)(v5 + 3880)];
      id v37 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E00]), sel_initWithFrame_, v33, v34, v35, v36);
      id v38 = objc_msgSend(v30, sel_blackColor);
      objc_msgSend(v37, sel_setBackgroundColor_, v38);

      objc_msgSend(v37, sel_setOpaque_, 1);
      objc_msgSend(v37, sel_setAutoresizingMask_, 18);
      id v39 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E10]), sel_init);
      objc_msgSend(v39, sel_setView_, v37);
      objc_msgSend(v31, sel_setRootViewController_, v39);

      if (*(unsigned char *)(v29 + 16)) {
        sub_25C45D9DC();
      }
      else {
        sub_25C45D9C8();
      }
      uint64_t v40 = *(void **)(v1 + 32);
      *(void *)(v1 + 32) = v31;
    }
    uint64_t v41 = (void (*)(void))v0[1];
    v41();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_25C45E978(uint64_t *a1)
{
  uint64_t v2 = *a1;
  id v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *id v3 = v1;
  v3[1] = sub_25C455FD0;
  return sub_25C45E420(v2);
}

unint64_t sub_25C45EA10(uint64_t a1)
{
  unint64_t result = sub_25C45EA38();
  *(void *)(a1 + 16) = result;
  return result;
}

unint64_t sub_25C45EA38()
{
  unint64_t result = qword_26A5A89B8;
  if (!qword_26A5A89B8)
  {
    type metadata accessor for RootWindowDisplayBlanker();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_26A5A89B8);
  }
  return result;
}

void sub_25C45EA8C(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  double v6 = (void *)a4();
  uint64_t v7 = *a1 + 8;
  sub_25C47ADB8();
  *a1 = v7;
  double v8 = *a2;
  if (*a2)
  {
    void *v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {
  }
}

uint64_t sub_25C45EB44()
{
  return swift_initClassMetadata2();
}

uint64_t sub_25C45EB8C()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_25C45EBAC()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t type metadata accessor for DemuxingPresenter()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_25C45EBFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 32);
}

uint64_t initializeBufferWithCopyOfBuffer for SceneRequest(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_25C45EC38(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  return swift_bridgeObjectRelease();
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_25C45ECC0(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  *(void *)(a1 + 4sub_25C45E010("[%@] %s: blank", (void (*)(void))sub_25C45D9C8, 0) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t *sub_25C45ED28(uint64_t *a1, uint64_t *a2)
{
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        unint64_t result = (uint64_t *)swift_release();
        *uint64_t v3 = v12;
      }
      else
      {
        CGFloat v11 = *(uint64_t (**)(void))(v10 + 24);
        return (uint64_t *)v11();
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      uint64_t v6 = *(void *)(v4 - 8);
      uint64_t v7 = *(void *)(v5 - 8);
      uint64_t v8 = v7;
      int v9 = *(_DWORD *)(v7 + 80);
      if ((*(unsigned char *)(v6 + 82) & 2) != 0)
      {
        if ((v9 & 0x20000) != 0)
        {
          *unint64_t result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(unsigned char *, uint64_t *, uint64_t))(v6 + 32))(v13, result, v4);
        if ((v9 & 0x20000) != 0)
        {
          *uint64_t v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v13, v4);
      }
    }
  }
  return result;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t sub_25C45EFB0(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 4sub_25C45E010("[%@] %s: blank", (void (*)(void))sub_25C45D9C8, 0) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_25C45EFF4(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_25C45F03C(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 4sub_25C45E010("[%@] %s: blank", (void (*)(void))sub_25C45D9C8, 0) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 48) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for DemuxingPresenter.PresenterEntry()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_25C45F0A0(uint64_t a1)
{
  uint64_t v34 = a1;
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 88);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](a1);
  uint64_t v7 = (char *)v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  int v9 = (char *)v26 - v8;
  swift_beginAccess();
  v36[0] = v1[2];
  uint64_t v10 = v2;
  uint64_t v11 = v3;
  uint64_t v12 = *(void *)(v10 + 96);
  uint64_t v13 = type metadata accessor for DemuxingPresenter.PresenterEntry();
  uint64_t v14 = sub_25C47AB68();
  swift_getWitnessTable();
  uint64_t result = sub_25C47ACF8();
  unint64_t v16 = v39;
  if (v39 != v40)
  {
    uint64_t v33 = v12;
    if (v40 < v39)
    {
      __break(1u);
    }
    else if (v39 < v40)
    {
      uint64_t v17 = v14;
      id v31 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
      uint64_t v32 = v4 + 16;
      uint64_t v29 = v13 - 8;
      uint64_t v30 = (void (**)(char *, uint64_t))(v4 + 8);
      uint64_t v18 = 48 * v39 + 72;
      uint64_t v27 = v7;
      v26[1] = v17;
      int64_t v28 = v40;
      uint64_t v19 = v34;
      do
      {
        unint64_t v35 = v16 + 1;
        v31(v27, v19, v11);
        swift_beginAccess();
        sub_25C47AB28();
        sub_25C45FE7C(v16, v1[2]);
        sub_25C47AC98();
        sub_25C47AC78();
        swift_endAccess();
        (*v30)(v9, v11);
        swift_beginAccess();
        sub_25C47AB78();
        swift_endAccess();
        sub_25C45FED0((uint64_t)&v39, (uint64_t)v36);
        (*(void (**)(int64_t *, uint64_t))(*(void *)(v13 - 8) + 8))(&v39, v13);
        os_log_type_t v20 = v9;
        uint64_t v21 = v11;
        uint64_t v23 = v37;
        uint64_t v22 = v38;
        __swift_project_boxed_opaque_existential_1(v36, v37);
        int v24 = *(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 32);
        uint64_t v25 = v22;
        uint64_t v11 = v21;
        int v9 = v20;
        v24(v19, v23, v25);
        uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v36);
        v18 += 48;
        unint64_t v16 = v35;
      }
      while (v28 != v35);
      return result;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_25C45F42C(uint64_t a1)
{
  return sub_25C45F0A0(a1);
}

uint64_t sub_25C45F450(uint64_t a1, unsigned int a2)
{
  swift_beginAccess();
  uint64_t v4 = *(void *)(v2 + 16);
  uint64_t v5 = type metadata accessor for DemuxingPresenter.PresenterEntry();
  uint64_t v6 = swift_bridgeObjectRetain();
  if (!MEMORY[0x261185B90](v6, v5)) {
    return swift_bridgeObjectRelease();
  }
  uint64_t v7 = 0;
  for (uint64_t i = v4 + 32; ; i += 48)
  {
    char v9 = sub_25C47AB38();
    sub_25C47AB08();
    if ((v9 & 1) == 0) {
      break;
    }
    uint64_t v10 = *(void *)(v5 - 8);
    uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v10 + 16))(v19, i, v5);
    uint64_t v12 = v7 + 1;
    if (__OFADD__(v7, 1)) {
      goto LABEL_8;
    }
    sub_25C45FED0((uint64_t)v19, (uint64_t)v16);
    (*(void (**)(unsigned char *, uint64_t))(v10 + 8))(v19, v5);
    uint64_t v14 = v17;
    uint64_t v13 = v18;
    __swift_project_boxed_opaque_existential_1(v16, v17);
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v13 + 8) + 8))(a1, a2, v14);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
    ++v7;
    if (v12 == MEMORY[0x261185B90](v4, v5)) {
      return swift_bridgeObjectRelease();
    }
  }
  uint64_t result = sub_25C47AEB8();
  __break(1u);
LABEL_8:
  __break(1u);
  return result;
}

uint64_t sub_25C45F64C(uint64_t a1, unsigned int a2)
{
  return sub_25C45F450(a1, a2);
}

uint64_t sub_25C45F670(uint64_t a1)
{
  v2[16] = a1;
  v2[17] = v1;
  v2[18] = *v1;
  sub_25C47ABD8();
  v2[19] = sub_25C47ABC8();
  uint64_t v4 = sub_25C47AB88();
  v2[20] = v4;
  v2[21] = v3;
  return MEMORY[0x270FA2498](sub_25C45F730, v4, v3);
}

uint64_t sub_25C45F730()
{
  uint64_t v1 = v0[17];
  swift_beginAccess();
  v0[22] = *(void *)(v1 + 16);
  uint64_t v2 = type metadata accessor for DemuxingPresenter.PresenterEntry();
  v0[23] = v2;
  uint64_t v3 = swift_bridgeObjectRetain();
  if (MEMORY[0x261185B90](v3, v2))
  {
    char v4 = sub_25C47AB38();
    sub_25C47AB08();
    if (v4)
    {
      uint64_t v5 = *(void *)(v0[23] - 8);
      (*(void (**)(void *, uint64_t))(v5 + 16))(v0 + 2, v0[22] + 32);
      v0[24] = 1;
      uint64_t v6 = v0[23];
      sub_25C45FED0((uint64_t)(v0 + 2), (uint64_t)(v0 + 8));
      (*(void (**)(void *, uint64_t))(v5 + 8))(v0 + 2, v6);
      uint64_t v7 = v0[11];
      uint64_t v8 = v0[12];
      __swift_project_boxed_opaque_existential_1(v0 + 8, v7);
      uint64_t v9 = *(void *)(v8 + 16);
      uint64_t v14 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 + 16) + **(int **)(v9 + 16));
      uint64_t v10 = (void *)swift_task_alloc();
      v0[25] = v10;
      *uint64_t v10 = v0;
      v10[1] = sub_25C45F9B0;
      uint64_t v11 = v0[16];
      return v14(v11, v7, v9);
    }
    else
    {
      uint64_t result = sub_25C47AEB8();
      __break(1u);
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v13 = (uint64_t (*)(void))v0[1];
    return v13();
  }
  return result;
}

uint64_t sub_25C45F9B0()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 208) = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    uint64_t v3 = *(void *)(v2 + 160);
    uint64_t v4 = *(void *)(v2 + 168);
    uint64_t v5 = sub_25C45FD38;
  }
  else
  {
    uint64_t v3 = *(void *)(v2 + 160);
    uint64_t v4 = *(void *)(v2 + 168);
    uint64_t v5 = sub_25C45FACC;
  }
  return MEMORY[0x270FA2498](v5, v3, v4);
}

uint64_t sub_25C45FACC()
{
  uint64_t v1 = v0[23];
  uint64_t v2 = v0[24];
  uint64_t v3 = v0[22];
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 8));
  if (v2 == MEMORY[0x261185B90](v3, v1))
  {
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v4 = (uint64_t (*)(void))v0[1];
    return v4();
  }
  uint64_t v6 = v0[24];
  char v7 = sub_25C47AB38();
  sub_25C47AB08();
  if ((v7 & 1) == 0)
  {
    uint64_t result = sub_25C47AEB8();
    __break(1u);
    goto LABEL_11;
  }
  uint64_t v8 = *(void *)(v0[23] - 8);
  uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v8 + 16))(v0 + 2, v0[22] + 48 * v6 + 32);
  v0[24] = v6 + 1;
  if (__OFADD__(v6, 1))
  {
LABEL_11:
    __break(1u);
    return result;
  }
  uint64_t v9 = v0[23];
  sub_25C45FED0((uint64_t)(v0 + 2), (uint64_t)(v0 + 8));
  (*(void (**)(void *, uint64_t))(v8 + 8))(v0 + 2, v9);
  uint64_t v10 = v0[11];
  uint64_t v11 = v0[12];
  __swift_project_boxed_opaque_existential_1(v0 + 8, v10);
  uint64_t v12 = *(void *)(v11 + 16);
  uint64_t v15 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 + 16) + **(int **)(v12 + 16));
  uint64_t v13 = (void *)swift_task_alloc();
  v0[25] = v13;
  *uint64_t v13 = v0;
  v13[1] = sub_25C45F9B0;
  uint64_t v14 = v0[16];
  return v15(v14, v10, v12);
}

uint64_t sub_25C45FD38()
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 64);
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25C45FDA8(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_25C455FD0;
  return sub_25C45F670(a1);
}

uint64_t sub_25C45FE40(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t sub_25C45FE7C(unint64_t a1, uint64_t a2)
{
  uint64_t result = _swift_isClassOrObjCExistentialType();
  if ((a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_7:
    __break(1u);
    return result;
  }
  uint64_t v5 = a2 & 0xFFFFFFFFFFFFFF8;
  if ((result & 1) == 0) {
    uint64_t v5 = a2;
  }
  if (*(void *)(v5 + 16) <= a1) {
    goto LABEL_7;
  }
  return result;
}

uint64_t sub_25C45FED0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

id static DefaultDisplayTransformer.defaultRegistry.getter()
{
  if (qword_26B350B50 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_26B350B40;
  return v0;
}

id DefaultDisplayTransformer.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id DefaultDisplayTransformer.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t DefaultDisplayTransformer.transform(_:)(void *a1)
{
  if (qword_26B350B50 != -1) {
    swift_once();
  }
  objc_super v2 = (void *)qword_26B350B40;
  type metadata accessor for DefaultDisplayTransformerRegistry();
  swift_dynamicCastClassUnconditional();
  id v3 = v2;
  uint64_t v4 = sub_25C460128(a1);

  return v4;
}

uint64_t sub_25C460128(void *a1)
{
  uint64_t v10 = MEMORY[0x263F8EE88];
  uint64_t v11 = MEMORY[0x263F8EE88];
  id v3 = objc_msgSend(a1, sel_identity);
  uint64_t v4 = *(os_unfair_lock_s **)(v1
                            + OBJC_IVAR____TtC13ShellSceneKitP33_EE17DF9A05593657B985954F049B576633DefaultDisplayTransformerRegistry_lockState);
  uint64_t v5 = (id *)&v4[4];
  uint64_t v6 = v4 + 6;
  os_unfair_lock_lock(v4 + 6);
  sub_25C4607BC(v5, (uint64_t)a1, (uint64_t)v3, &v10);
  os_unfair_lock_unlock(v6);
  sub_25C456E60(v9, a1);

  uint64_t v7 = v11;
  swift_bridgeObjectRelease();
  return v7;
}

id sub_25C460328()
{
  id result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for DefaultDisplayTransformerRegistry()), sel_init);
  qword_26B350B40 = (uint64_t)result;
  return result;
}

uint64_t type metadata accessor for DefaultDisplayTransformerRegistry()
{
  return self;
}

uint64_t type metadata accessor for DefaultDisplayTransformer()
{
  return self;
}

id sub_25C4603A4(uint64_t a1)
{
  uint64_t v3 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  *(void *)(v4 + 24) = a1;
  id v5 = objc_allocWithZone(MEMORY[0x263F29CD8]);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_unknownObjectRetain();
  uint64_t v6 = (void *)sub_25C47AA78();
  swift_bridgeObjectRelease();
  uint64_t v7 = (void *)sub_25C47AA78();
  aBlock[4] = sub_25C461160;
  aBlock[5] = v4;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_25C461018;
  aBlock[3] = &block_descriptor_0;
  uint64_t v8 = _Block_copy(aBlock);
  id v9 = objc_msgSend(v5, sel_initWithIdentifier_forReason_invalidationBlock_, v6, v7, v8);

  _Block_release(v8);
  swift_release();
  swift_release();
  uint64_t v10 = *(os_unfair_lock_s **)(v1
                             + OBJC_IVAR____TtC13ShellSceneKitP33_EE17DF9A05593657B985954F049B576633DefaultDisplayTransformerRegistry_lockState);
  uint64_t v11 = (id *)&v10[4];
  uint64_t v12 = v10 + 6;
  os_unfair_lock_lock(v10 + 6);
  sub_25C461180(v11);
  os_unfair_lock_unlock(v12);
  return v9;
}

void sub_25C460594(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2 + 16;
  swift_beginAccess();
  uint64_t v3 = MEMORY[0x261186B80](v2);
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    uint64_t v5 = *(void *)(v3
                   + OBJC_IVAR____TtC13ShellSceneKitP33_EE17DF9A05593657B985954F049B576633DefaultDisplayTransformerRegistry_lockState);
    swift_retain();

    MEMORY[0x270FA5388](v6);
    os_unfair_lock_lock((os_unfair_lock_t)(v5 + 24));
    sub_25C4611F0((id *)(v5 + 16));
    os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 24));
    swift_release();
  }
  id v7 = objc_msgSend(self, sel_sharedInstance);
  objc_msgSend(v7, sel_updateTransformsWithCompletion_, 0);
}

id sub_25C46069C(id *a1, uint64_t a2)
{
  id v3 = *a1;
  if (!objc_msgSend(*a1, sel_containsObject_, a2)) {
    return objc_msgSend(v3, sel_addObject_, a2);
  }
  sub_25C46119C();
  swift_allocError();
  *(void *)uint64_t v4 = 0;
  *(unsigned char *)(v4 + 8) = 2;
  return (id)swift_willThrow();
}

void sub_25C4607BC(id *a1, uint64_t a2, uint64_t a3, void *a4)
{
  unint64_t v5 = v4;
  id v8 = objc_msgSend(*a1, sel_allObjects);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B350B80);
  unint64_t v9 = sub_25C47AAE8();

  unint64_t v10 = v9;
  unint64_t v59 = v9;
  if (v9 >> 62) {
    goto LABEL_59;
  }
  uint64_t v11 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v11) {
    goto LABEL_51;
  }
  while (1)
  {
    unint64_t v12 = 0;
    unint64_t v13 = v10 & 0xC000000000000001;
    uint64_t v53 = v10 & 0xFFFFFFFFFFFFFF8;
    unint64_t v52 = v5;
    uint64_t v14 = &selRef_descriptionForRootObject_;
    unint64_t v5 = 0x263F3F6F0uLL;
    uint64_t v56 = a3;
    uint64_t v57 = a4;
    unint64_t v54 = v10 & 0xC000000000000001;
    uint64_t v55 = v11;
LABEL_4:
    if (!v13) {
      break;
    }
    unint64_t v15 = v12;
    uint64_t v16 = (void *)MEMORY[0x261185F00](v12++, v10);
    if (!__OFADD__(v15, 1)) {
      goto LABEL_10;
    }
LABEL_58:
    __break(1u);
LABEL_59:
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_25C47AF28();
    swift_bridgeObjectRelease();
    unint64_t v10 = v59;
    if (!v11) {
      goto LABEL_51;
    }
  }
  if (v12 >= *(void *)(v53 + 16))
  {
    __break(1u);
    return;
  }
  uint64_t v16 = (void *)swift_unknownObjectRetain();
  if (__OFADD__(v12++, 1)) {
    goto LABEL_58;
  }
LABEL_10:
  id v18 = objc_msgSend(v16, v14[147], a2, v52);
  sub_25C457A30(0, (unint64_t *)&unk_26B350B90);
  sub_25C461080();
  uint64_t v19 = sub_25C47AC68();

  if ((v19 & 0xC000000000000001) != 0)
  {
    sub_25C47ADF8();
    sub_25C47AC88();
    uint64_t v19 = v64;
    uint64_t v62 = v65;
    uint64_t v20 = v66;
    uint64_t v21 = v67;
    unint64_t v5 = v68;
  }
  else
  {
    uint64_t v21 = 0;
    uint64_t v22 = -1 << *(unsigned char *)(v19 + 32);
    uint64_t v62 = v19 + 56;
    uint64_t v23 = ~v22;
    uint64_t v24 = -v22;
    if (v24 < 64) {
      uint64_t v25 = ~(-1 << v24);
    }
    else {
      uint64_t v25 = -1;
    }
    unint64_t v5 = v25 & *(void *)(v19 + 56);
    uint64_t v20 = v23;
  }
  int64_t v61 = (unint64_t)(v20 + 64) >> 6;
  uint64_t v63 = v19;
  while (v19 < 0)
  {
    if (!sub_25C47AE28()) {
      goto LABEL_50;
    }
    swift_unknownObjectRetain();
    swift_dynamicCast();
    id v33 = v69;
    swift_unknownObjectRelease();
    uint64_t v32 = v21;
    uint64_t v30 = v5;
    if (!v33) {
      goto LABEL_50;
    }
LABEL_40:
    id v37 = objc_msgSend(v33, sel_identity);
    sub_25C457A30(0, (unint64_t *)&unk_26A5A93A0);
    id v38 = objc_msgSend(v37, sel_rootIdentity);
    char v39 = sub_25C47AD88();

    if ((v39 & 1) == 0)
    {
      swift_bridgeObjectRelease();
      sub_25C46119C();
      swift_allocError();
      char v50 = 0;
      *(void *)uint64_t v49 = v33;
      goto LABEL_56;
    }
    uint64_t v40 = *a4;
    if ((*a4 & 0xC000000000000001) != 0)
    {
      swift_bridgeObjectRetain();
      id v26 = v37;
      char v27 = sub_25C47AE38();
      swift_bridgeObjectRelease();

      uint64_t v19 = v63;
      if ((v27 & 1) == 0) {
        goto LABEL_18;
      }
      swift_bridgeObjectRelease();
      goto LABEL_55;
    }
    if (!*(void *)(v40 + 16)) {
      goto LABEL_18;
    }
    id v60 = v33;
    swift_bridgeObjectRetain();
    uint64_t v41 = sub_25C47AD78();
    uint64_t v42 = -1 << *(unsigned char *)(v40 + 32);
    unint64_t v43 = v41 & ~v42;
    if ((*(void *)(v40 + 56 + ((v43 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v43))
    {
      sub_25C457A30(0, (unint64_t *)&unk_26A5A8B60);
      id v44 = *(id *)(*(void *)(v40 + 48) + 8 * v43);
      char v45 = sub_25C47AD88();

      if ((v45 & 1) == 0)
      {
        uint64_t v46 = ~v42;
        do
        {
          unint64_t v43 = (v43 + 1) & v46;
          if (((*(void *)(v40 + 56 + ((v43 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v43) & 1) == 0) {
            goto LABEL_49;
          }
          id v47 = *(id *)(*(void *)(v40 + 48) + 8 * v43);
          char v48 = sub_25C47AD88();
        }
        while ((v48 & 1) == 0);
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      id v33 = v60;
LABEL_55:
      sub_25C46119C();
      swift_allocError();
      *(void *)uint64_t v49 = v33;
      char v50 = 1;
LABEL_56:
      *(unsigned char *)(v49 + 8) = v50;
      id v51 = v33;
      swift_willThrow();

      swift_unknownObjectRelease();
      sub_25C457A28();
      return;
    }
LABEL_49:
    swift_bridgeObjectRelease();
    a3 = v56;
    a4 = v57;
    uint64_t v19 = v63;
    id v33 = v60;
LABEL_18:
    id v28 = v37;
    sub_25C456E7C(&v69, v28);

    id v29 = v33;
    sub_25C456E60(&v69, v29);

    uint64_t v21 = v32;
    unint64_t v5 = v30;
  }
  if (v5)
  {
    uint64_t v30 = (v5 - 1) & v5;
    unint64_t v31 = __clz(__rbit64(v5)) | (v21 << 6);
    uint64_t v32 = v21;
    goto LABEL_39;
  }
  int64_t v34 = v21 + 1;
  if (__OFADD__(v21, 1))
  {
    __break(1u);
    goto LABEL_58;
  }
  if (v34 >= v61) {
    goto LABEL_50;
  }
  unint64_t v35 = *(void *)(v62 + 8 * v34);
  uint64_t v32 = v21 + 1;
  if (v35) {
    goto LABEL_38;
  }
  uint64_t v32 = v21 + 2;
  if (v21 + 2 >= v61) {
    goto LABEL_50;
  }
  unint64_t v35 = *(void *)(v62 + 8 * v32);
  if (v35) {
    goto LABEL_38;
  }
  uint64_t v32 = v21 + 3;
  if (v21 + 3 >= v61) {
    goto LABEL_50;
  }
  unint64_t v35 = *(void *)(v62 + 8 * v32);
  if (v35) {
    goto LABEL_38;
  }
  uint64_t v32 = v21 + 4;
  if (v21 + 4 >= v61) {
    goto LABEL_50;
  }
  unint64_t v35 = *(void *)(v62 + 8 * v32);
  if (v35)
  {
LABEL_38:
    uint64_t v30 = (v35 - 1) & v35;
    unint64_t v31 = __clz(__rbit64(v35)) + (v32 << 6);
LABEL_39:
    id v33 = *(id *)(*(void *)(v19 + 48) + 8 * v31);
    if (!v33) {
      goto LABEL_50;
    }
    goto LABEL_40;
  }
  uint64_t v36 = v21 + 5;
  while (v61 != v36)
  {
    unint64_t v35 = *(void *)(v62 + 8 * v36++);
    if (v35)
    {
      uint64_t v32 = v36 - 1;
      goto LABEL_38;
    }
  }
LABEL_50:
  sub_25C457A28();
  swift_unknownObjectRelease();
  unint64_t v10 = v59;
  unint64_t v13 = v54;
  uint64_t v14 = &selRef_descriptionForRootObject_;
  unint64_t v5 = 0x263F3F6F0uLL;
  if (v12 != v55) {
    goto LABEL_4;
  }
LABEL_51:
  swift_bridgeObjectRelease();
}

id _s13ShellSceneKit25DefaultDisplayTransformerCfD_0()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_25C461018(uint64_t a1, void *a2)
{
  id v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

unint64_t sub_25C461080()
{
  unint64_t result = qword_26B350BA0;
  if (!qword_26B350BA0)
  {
    sub_25C457A30(255, (unint64_t *)&unk_26B350B90);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B350BA0);
  }
  return result;
}

uint64_t sub_25C4610E8()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_25C461120()
{
  swift_release();
  swift_unknownObjectRelease();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_25C461160(uint64_t a1)
{
  sub_25C460594(a1, *(void *)(v1 + 16));
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 4sub_25C45E010("[%@] %s: blank", (void (*)(void))sub_25C45D9C8, 0) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

id sub_25C461180(id *a1)
{
  return sub_25C46069C(a1, *(void *)(v1 + 16));
}

unint64_t sub_25C46119C()
{
  unint64_t result = qword_26A5A8B58;
  if (!qword_26A5A8B58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5A8B58);
  }
  return result;
}

id sub_25C4611F0(id *a1)
{
  return objc_msgSend(*a1, sel_removeObject_, *(void *)(v1 + 16));
}

uint64_t initializeBufferWithCopyOfBuffer for DefaultDisplayTransformerRegistry.RegistryError(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v4;
  id v5 = v3;
  return a1;
}

uint64_t assignWithCopy for DefaultDisplayTransformerRegistry.RegistryError(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v4;
  id v6 = v3;

  return a1;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)unint64_t result = v2;
  return result;
}

uint64_t assignWithTake for DefaultDisplayTransformerRegistry.RegistryError(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 8);
  char v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v3;

  return a1;
}

uint64_t getEnumTagSinglePayload for DefaultDisplayTransformerRegistry.RegistryError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 2) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for DefaultDisplayTransformerRegistry.RegistryError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)unint64_t result = a2 - 254;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_25C46137C(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 8) <= 1u) {
    return *(unsigned __int8 *)(a1 + 8);
  }
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t sub_25C461394(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(void *)unint64_t result = a2 - 2;
    LOBYTE(a2) = 2;
  }
  *(unsigned char *)(result + 8) = a2;
  return result;
}

ValueMetadata *type metadata accessor for DefaultDisplayTransformerRegistry.RegistryError()
{
  return &type metadata for DefaultDisplayTransformerRegistry.RegistryError;
}

uint64_t sub_25C4613C0()
{
  uint64_t v0 = sub_25C47AA38();
  __swift_allocate_value_buffer(v0, qword_26A5A8B70);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A5A8B70);
  return sub_25C47AA28();
}

void sub_25C461444(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](a1);
  id v38 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  unint64_t v12 = (char *)&v33 - v11;
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v16 = (char *)&v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26A5A84A8 != -1) {
    swift_once();
  }
  uint64_t v17 = sub_25C47AA38();
  __swift_project_value_buffer(v17, (uint64_t)qword_26A5A8B70);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v16, v3, a2);
  id v37 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v37(v12, a1, v6);
  id v18 = sub_25C47AA18();
  os_log_type_t v19 = sub_25C47AD28();
  int v20 = v19;
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v21 = swift_slowAlloc();
    int v35 = v20;
    uint64_t v22 = v21;
    uint64_t v36 = swift_slowAlloc();
    uint64_t v40 = v36;
    *(_DWORD *)uint64_t v22 = 136446466;
    id v33 = v12;
    os_log_t v34 = v18;
    uint64_t v23 = (uint64_t *)&v16[*(int *)(a2 + 36)];
    uint64_t v24 = v7;
    uint64_t v25 = v6;
    uint64_t v27 = *v23;
    unint64_t v26 = v23[1];
    swift_bridgeObjectRetain();
    uint64_t v39 = sub_25C47596C(v27, v26, &v40);
    sub_25C47ADB8();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, a2);
    *(_WORD *)(v22 + 12) = 2082;
    id v28 = v33;
    v37(v38, (uint64_t)v33, v25);
    uint64_t v29 = sub_25C47AA98();
    uint64_t v39 = sub_25C47596C(v29, v30, &v40);
    sub_25C47ADB8();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v24 + 8))(v28, v25);
    os_log_t v31 = v34;
    _os_log_impl(&dword_25C444000, v34, (os_log_type_t)v35, "%{public}s present %{public}s", (uint8_t *)v22, 0x16u);
    uint64_t v32 = v36;
    swift_arrayDestroy();
    MEMORY[0x261186AD0](v32, -1, -1);
    MEMORY[0x261186AD0](v22, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, a2);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
  }
}

uint64_t sub_25C46180C(uint64_t a1, uint64_t a2)
{
  v3[5] = a2;
  v3[6] = v2;
  v3[4] = a1;
  uint64_t v5 = *(void *)(a2 + 16);
  v3[7] = v5;
  v3[8] = *(void *)(v5 - 8);
  v3[9] = swift_task_alloc();
  v3[10] = swift_task_alloc();
  v3[11] = *(void *)(a2 - 8);
  v3[12] = swift_task_alloc();
  sub_25C47ABD8();
  v3[13] = sub_25C47ABC8();
  uint64_t v7 = sub_25C47AB88();
  return MEMORY[0x270FA2498](sub_25C461964, v7, v6);
}

uint64_t sub_25C461964()
{
  id v37 = v0;
  swift_release();
  if (qword_26A5A84A8 != -1) {
    swift_once();
  }
  uint64_t v35 = v0[4];
  uint64_t v2 = v0[11];
  uint64_t v1 = v0[12];
  uint64_t v3 = v0[10];
  uint64_t v5 = v0[7];
  uint64_t v4 = v0[8];
  uint64_t v7 = v0[5];
  uint64_t v6 = v0[6];
  uint64_t v8 = sub_25C47AA38();
  __swift_project_value_buffer(v8, (uint64_t)qword_26A5A8B70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v6, v7);
  uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  v9(v3, v35, v5);
  uint64_t v10 = sub_25C47AA18();
  os_log_type_t v11 = sub_25C47AD28();
  BOOL v12 = os_log_type_enabled(v10, v11);
  uint64_t v14 = v0[11];
  uint64_t v13 = v0[12];
  uint64_t v15 = v0[10];
  if (v12)
  {
    uint64_t v33 = v0[8];
    uint64_t v29 = v0[9];
    uint64_t v30 = v0[7];
    id v28 = v9;
    uint64_t v16 = v0[5];
    uint64_t v27 = v0[10];
    uint64_t v17 = swift_slowAlloc();
    uint64_t v34 = swift_slowAlloc();
    uint64_t v36 = v34;
    *(_DWORD *)uint64_t v17 = 136446466;
    id v18 = (uint64_t *)(v13 + *(int *)(v16 + 36));
    os_log_type_t type = v11;
    log = v10;
    uint64_t v19 = *v18;
    unint64_t v20 = v18[1];
    swift_bridgeObjectRetain();
    v0[2] = sub_25C47596C(v19, v20, &v36);
    sub_25C47ADB8();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v16);
    *(_WORD *)(v17 + 12) = 2082;
    v28(v29, v27, v30);
    uint64_t v21 = sub_25C47AA98();
    v0[3] = sub_25C47596C(v21, v22, &v36);
    sub_25C47ADB8();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v27, v30);
    _os_log_impl(&dword_25C444000, log, type, "%{public}s update %{public}s", (uint8_t *)v17, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x261186AD0](v34, -1, -1);
    MEMORY[0x261186AD0](v17, -1, -1);
  }
  else
  {
    uint64_t v23 = v0[7];
    uint64_t v24 = v0[8];
    (*(void (**)(void, void))(v14 + 8))(v0[12], v0[5]);
    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v15, v23);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v25 = (uint64_t (*)(void))v0[1];
  return v25();
}

uint64_t sub_25C461CBC(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_25C455FD0;
  return sub_25C46180C(a1, a2);
}

uint64_t sub_25C461D60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = *(void *)(a3 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_25C47AA38();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26A5A84A8 != -1) {
    swift_once();
  }
  uint64_t v15 = __swift_project_value_buffer(v11, (uint64_t)qword_26A5A8B70);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, v15, v11);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v4, a3);
  uint64_t v16 = sub_25C47AA18();
  os_log_type_t v17 = sub_25C47AD28();
  int v18 = v17;
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v19 = swift_slowAlloc();
    uint64_t v29 = a1;
    uint64_t v20 = v19;
    uint64_t v32 = swift_slowAlloc();
    uint64_t v35 = v32;
    *(_DWORD *)uint64_t v20 = 136446722;
    uint64_t v30 = a2;
    uint64_t v21 = (uint64_t *)&v10[*(int *)(a3 + 36)];
    uint64_t v33 = v11;
    int v31 = v18;
    uint64_t v22 = *v21;
    unint64_t v23 = v21[1];
    swift_bridgeObjectRetain();
    uint64_t v34 = sub_25C47596C(v22, v23, &v35);
    sub_25C47ADB8();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, a3);
    uint64_t v24 = 8 * (char)v29;
    uint64_t v25 = *(void *)&aActive_3[v24];
    *(_WORD *)(v20 + 12) = 2080;
    uint64_t v34 = sub_25C47596C(v25, *(void *)&aInactivediscon_1[v24 + 16], &v35);
    sub_25C47ADB8();
    swift_bridgeObjectRelease();
    *(_WORD *)(v20 + 22) = 2080;
    uint64_t v34 = sub_25C47596C(*(void *)&aActive_3[8 * (char)v30], *(void *)&aInactivediscon_1[8 * (char)v30 + 16], &v35);
    sub_25C47ADB8();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25C444000, v16, (os_log_type_t)v31, "%{public}s activation changed from %s to %s", (uint8_t *)v20, 0x20u);
    uint64_t v26 = v32;
    swift_arrayDestroy();
    MEMORY[0x261186AD0](v26, -1, -1);
    MEMORY[0x261186AD0](v20, -1, -1);

    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v33);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, a3);

    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
}

uint64_t sub_25C462128(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t sub_25C462164(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

uint64_t sub_25C46216C()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_25C462204(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  int v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 16 > 0x18)
  {
    uint64_t v9 = *a2;
    uint64_t *v4 = *a2;
    uint64_t v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
    swift_retain();
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    uint64_t v10 = (void *)(((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v11 = (void *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    *uint64_t v10 = *v11;
    v10[1] = v11[1];
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t sub_25C462308(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void))(*(void *)(*(void *)(a2 + 16) - 8) + 8))();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25C462378(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 16;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 48) + 7;
  int v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  void *v7 = *v8;
  v7[1] = v8[1];
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_25C462400(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 24;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 40) + 7;
  int v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  void *v7 = *v8;
  v7[1] = v8[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_25C462494(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 32;
  (*(void (**)(void))v5)();
  *(_OWORD *)((*(void *)(v5 + 32) + 7 + a1) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)((*(void *)(v5 + 32) + 7 + a2) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_25C462510(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 40;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 24) + 7;
  int v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  void *v7 = *v8;
  v7[1] = v8[1];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_25C46259C(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(void *)(v4 + 64);
  if (v5 <= 0x7FFFFFFF) {
    unsigned int v7 = 0x7FFFFFFF;
  }
  else {
    unsigned int v7 = *(_DWORD *)(v4 + 84);
  }
  if (!a2) {
    return 0;
  }
  if (v7 < a2)
  {
    unint64_t v8 = ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
    unsigned int v9 = a2 - v7;
    uint64_t v10 = v8 & 0xFFFFFFF8;
    if ((v8 & 0xFFFFFFF8) != 0) {
      unsigned int v11 = 2;
    }
    else {
      unsigned int v11 = v9 + 1;
    }
    if (v11 >= 0x10000) {
      unsigned int v12 = 4;
    }
    else {
      unsigned int v12 = 2;
    }
    if (v11 < 0x100) {
      unsigned int v12 = 1;
    }
    if (v11 >= 2) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = 0;
    }
    switch(v13)
    {
      case 1:
        int v14 = *((unsigned __int8 *)a1 + v8);
        if (!v14) {
          break;
        }
        goto LABEL_22;
      case 2:
        int v14 = *(unsigned __int16 *)((char *)a1 + v8);
        if (v14) {
          goto LABEL_22;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x25C4626E8);
      case 4:
        int v14 = *(_DWORD *)((char *)a1 + v8);
        if (!v14) {
          break;
        }
LABEL_22:
        int v16 = v14 - 1;
        if (v10)
        {
          int v16 = 0;
          LODWORD(v1sub_25C45E010("[%@] %s: blank", (void (*)(void))sub_25C45D9C8, 0) = *a1;
        }
        return v7 + (v10 | v16) + 1;
      default:
        break;
    }
  }
  if (v5 >= 0x7FFFFFFF) {
    return (*(uint64_t (**)(void))(v4 + 48))();
  }
  unint64_t v17 = *(void *)((((unint64_t)a1 + v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 8);
  if (v17 >= 0xFFFFFFFF) {
    LODWORD(v17) = -1;
  }
  return (v17 + 1);
}

void sub_25C4626FC(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v6 + 84);
  }
  uint64_t v9 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  unint64_t v10 = ((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  if (((v9 + 7) & 0xFFFFFFF8) == 0xFFFFFFF0) {
    unsigned int v11 = a3 - v8 + 1;
  }
  else {
    unsigned int v11 = 2;
  }
  if (v11 >= 0x10000) {
    int v12 = 4;
  }
  else {
    int v12 = 2;
  }
  if (v11 < 0x100) {
    int v12 = 1;
  }
  if (v11 >= 2) {
    unsigned int v13 = v12;
  }
  else {
    unsigned int v13 = 0;
  }
  if (v8 < a3) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = 0;
  }
  if (a2 > v8)
  {
    if (((v9 + 7) & 0xFFFFFFF8) == 0xFFFFFFF0) {
      int v15 = a2 - v8;
    }
    else {
      int v15 = 1;
    }
    if (((v9 + 7) & 0xFFFFFFF8) != 0xFFFFFFF0)
    {
      int v16 = ~v8 + a2;
      bzero(a1, ((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 16);
      *(_DWORD *)a1 = v16;
    }
    switch(v14)
    {
      case 1:
        a1[v10] = v15;
        return;
      case 2:
        *(_WORD *)&a1[v10] = v15;
        return;
      case 3:
        goto LABEL_43;
      case 4:
        *(_DWORD *)&a1[v10] = v15;
        return;
      default:
        return;
    }
  }
  switch(v14)
  {
    case 1:
      a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_33;
    case 2:
      *(_WORD *)&a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_33;
    case 3:
LABEL_43:
      __break(1u);
      JUMPOUT(0x25C4628DCLL);
    case 4:
      *(_DWORD *)&a1[v10] = 0;
      goto LABEL_32;
    default:
LABEL_32:
      if (a2)
      {
LABEL_33:
        if (v7 < 0x7FFFFFFF)
        {
          int v18 = (void *)((unint64_t)&a1[v9 + 7] & 0xFFFFFFFFFFFFFFF8);
          if ((a2 & 0x80000000) != 0)
          {
            *int v18 = a2 ^ 0x80000000;
            v18[1] = 0;
          }
          else
          {
            v18[1] = a2 - 1;
          }
        }
        else
        {
          unint64_t v17 = *(void (**)(void))(v6 + 56);
          v17();
        }
      }
      return;
  }
}

uint64_t type metadata accessor for LoggingPresenter()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_25C46291C()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for CADisplayActor()
{
  return self;
}

uint64_t sub_25C462954()
{
  if (qword_26A5A8490 != -1) {
    swift_once();
  }
  return sub_25C47AD68();
}

uint64_t sub_25C4629AC()
{
  type metadata accessor for CADisplayActor();
  return swift_initStaticObject();
}

uint64_t sub_25C4629DC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for CADisplayActor();
  return MEMORY[0x270FA2150](v3, a2);
}

void sub_25C462A14(uint64_t a1)
{
}

uint64_t SSKDisplayPriorityInvalid.getter()
{
  return sub_25C462AE8(&qword_26A5A84B0, &dword_26A5A8C18);
}

void sub_25C462A4C(uint64_t a1)
{
}

uint64_t SSKDisplayPriorityLowest.getter()
{
  return sub_25C462AE8(&qword_26A5A84B8, &dword_26A5A8C1C);
}

void sub_25C462A84(uint64_t a1)
{
}

void sub_25C462A98(uint64_t a1, uint64_t *a2, _DWORD *a3)
{
  uint64_t v3 = *a2;
  if (*a2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
  }
  else if (v3 <= 0x7FFFFFFF)
  {
    *a3 = v3;
    return;
  }
  __break(1u);
}

uint64_t SSKDisplayPriorityHighest.getter()
{
  return sub_25C462AE8(&qword_26A5A84C0, dword_26A5A8C20);
}

uint64_t sub_25C462AE8(void *a1, unsigned int *a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  return *a2;
}

BOOL static SSKDisplayPriority.< infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 < a2;
}

unint64_t sub_25C462B34()
{
  unint64_t result = qword_26A5A8588;
  if (!qword_26A5A8588)
  {
    type metadata accessor for DisplayPriority(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5A8588);
  }
  return result;
}

BOOL sub_25C462B8C(void *a1, void *a2)
{
  return *a1 < *a2;
}

BOOL sub_25C462BA0(void *a1, void *a2)
{
  return *a2 >= *a1;
}

BOOL sub_25C462BB4(void *a1, void *a2)
{
  return *a1 >= *a2;
}

BOOL sub_25C462BC8(void *a1, void *a2)
{
  return *a2 < *a1;
}

id UpdateDisplayTransformsAdapter.__allocating_init(displayConfiguration:displayTransformUpdater:)(uint64_t a1, uint64_t a2)
{
  unsigned int v5 = (char *)objc_allocWithZone(v2);
  *(void *)&v5[OBJC_IVAR___SSKUpdateDisplayTransformsAdapter_displayConfiguration] = a1;
  *(void *)&v5[OBJC_IVAR___SSKUpdateDisplayTransformsAdapter_displayTransformUpdater] = a2;
  v7.receiver = v5;
  v7.super_class = v2;
  return objc_msgSendSuper2(&v7, sel_init);
}

id UpdateDisplayTransformsAdapter.init(displayConfiguration:displayTransformUpdater:)(uint64_t a1, uint64_t a2)
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&v2[OBJC_IVAR___SSKUpdateDisplayTransformsAdapter_displayConfiguration] = a1;
  *(void *)&v2[OBJC_IVAR___SSKUpdateDisplayTransformsAdapter_displayTransformUpdater] = a2;
  v7.receiver = v2;
  v7.super_class = ObjectType;
  return objc_msgSendSuper2(&v7, sel_init);
}

id UpdateDisplayTransformsAdapter.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_25C462E08(uint64_t a1)
{
  uint64_t v3 = *v1;
  v2[2] = a1;
  v2[3] = v3;
  sub_25C47ABD8();
  v2[4] = sub_25C47ABC8();
  uint64_t v5 = sub_25C47AB88();
  v2[5] = v5;
  v2[6] = v4;
  return MEMORY[0x270FA2498](sub_25C462EA4, v5, v4);
}

uint64_t sub_25C462EA4()
{
  uint64_t ObjectType = swift_getObjectType();
  objc_super v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v2;
  *objc_super v2 = v0;
  v2[1] = sub_25C462F50;
  return sub_25C46D86C(ObjectType);
}

uint64_t sub_25C462F50()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 48);
  uint64_t v3 = *(void *)(v1 + 40);
  return MEMORY[0x270FA2498](sub_25C463070, v3, v2);
}

uint64_t sub_25C463070()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = (void *)v0[2];
  swift_release();
  uint64_t v3 = *(void **)(v1 + OBJC_IVAR___SSKUpdateDisplayTransformsAdapter_displayConfiguration);
  *uint64_t v2 = v3;
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  id v4 = v3;
  return v6();
}

void UpdateDisplayTransformsAdapter.update(displayConfiguration:)(void *a1)
{
  id v3 = *(id *)(v1 + OBJC_IVAR___SSKUpdateDisplayTransformsAdapter_displayConfiguration);
  *(void *)(v1 + OBJC_IVAR___SSKUpdateDisplayTransformsAdapter_displayConfiguration) = a1;
  id v2 = a1;
}

uint64_t sub_25C463140(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 16) + **(int **)(a3 + 16));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_25C455FD0;
  return v9(a1, a2, a3);
}

uint64_t type metadata accessor for UpdateDisplayTransformsAdapter()
{
  return self;
}

uint64_t method lookup function for UpdateDisplayTransformsAdapter(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for UpdateDisplayTransformsAdapter);
}

uint64_t dispatch thunk of UpdateDisplayTransformsAdapter.__allocating_init(displayConfiguration:displayTransformUpdater:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

id SSKDisplayProfile.init(configuration:)(long long *a1)
{
  long long v12 = *a1;
  uint64_t v1 = *((void *)a1 + 2);
  uint64_t v2 = *((void *)a1 + 3);
  char v3 = *((unsigned char *)a1 + 32);
  char v4 = *((unsigned char *)a1 + 33);
  id v5 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v6 = (objc_class *)type metadata accessor for DisplayProfileConfiguration_Box();
  uint64_t v7 = (char *)objc_allocWithZone(v6);
  unsigned int v8 = &v7[OBJC_IVAR___SSKDisplayProfileConfiguration_configuration];
  *(_OWORD *)unsigned int v8 = v12;
  *((void *)v8 + 2) = v1;
  *((void *)v8 + 3) = v2;
  v8[32] = v3;
  v8[33] = v4;
  v13.receiver = v7;
  v13.super_class = v6;
  id v9 = objc_msgSendSuper2(&v13, sel_init);
  id v10 = objc_msgSend(v5, sel_initWithSwiftConfiguration_delegate_, v9, 0);

  return v10;
}

uint64_t sub_25C4633A8()
{
  id v1 = objc_msgSend(*(id *)(v0 + 32), sel_identifier);
  sub_25C47AA88();

  sub_25C47AAB8();
  swift_bridgeObjectRelease();
  sub_25C47AAB8();
  return 0x20656E6563535BLL;
}

uint64_t sub_25C463444(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(void *)(v6 + 24) = a2;
  *(void *)(v6 + 32) = a1;
  *(_WORD *)(v6 + 16) = 256;
  *(void *)(v6 + 48) = a5;
  *(void *)(v6 + 56) = a6;
  id v11 = objc_allocWithZone((Class)type metadata accessor for FBScenePresentableObserver());
  id v12 = a1;
  id v13 = a2;
  swift_retain();
  uint64_t v14 = (char *)objc_msgSend(v11, sel_init);
  *(void *)(v6 + 4sub_25C45E010("[%@] %s: blank", (void (*)(void))sub_25C45D9C8, 0) = v14;
  int v15 = &v14[OBJC_IVAR____TtC13ShellSceneKit26FBScenePresentableObserver_displayConfigRequestHandler];
  uint64_t v16 = *(void *)&v14[OBJC_IVAR____TtC13ShellSceneKit26FBScenePresentableObserver_displayConfigRequestHandler];
  *(void *)int v15 = a3;
  *((void *)v15 + sub_25C45E010("[%@] %s: unblank", (void (*)(void))sub_25C45D9DC, 1) = a4;
  swift_retain();
  sub_25C4646CC(v16);
  uint64_t v17 = *(void *)(v6 + 40);
  uint64_t v18 = swift_allocObject();
  swift_weakInit();
  uint64_t v19 = (uint64_t (**)(double))(v17
                                        + OBJC_IVAR____TtC13ShellSceneKit26FBScenePresentableObserver_preferredSceneLevelHandler);
  uint64_t v20 = *(void *)(v17 + OBJC_IVAR____TtC13ShellSceneKit26FBScenePresentableObserver_preferredSceneLevelHandler);
  *uint64_t v19 = sub_25C4646C4;
  v19[1] = (uint64_t (*)(double))v18;
  sub_25C4646CC(v20);
  id v21 = *(id *)(v6 + 40);
  objc_msgSend(v12, sel_addObserver_, v21);

  swift_release();
  swift_release();
  return v6;
}

uint64_t sub_25C463598(double a1)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    id v3 = *(id *)(result + 32);
    swift_release();
    uint64_t v4 = swift_allocObject();
    *(double *)(v4 + 16) = a1;
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = sub_25C4646EC;
    *(void *)(v5 + 24) = v4;
    aBlock[4] = sub_25C46470C;
    aBlock[5] = v5;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_25C464554;
    aBlock[3] = &block_descriptor_33;
    uint64_t v6 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v3, sel_updateSettingsWithBlock_, v6);

    _Block_release(v6);
    LOBYTE(v3) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    uint64_t result = swift_release();
    if (v3) {
      __break(1u);
    }
  }
  return result;
}

id sub_25C463730(void *a1)
{
  return objc_msgSend(a1, sel_setForeground_, 0);
}

uint64_t sub_25C463740()
{
  swift_release();
  return MEMORY[0x270FA0228](v0, 64, 7);
}

uint64_t type metadata accessor for FBScenePresentable()
{
  return self;
}

uint64_t sub_25C4637B4()
{
  id v1 = *(void **)(v0 + 32);
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = sub_25C464D98;
  *(void *)(v2 + 24) = v0;
  v5[4] = sub_25C464DE0;
  v5[5] = v2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 1107296256;
  void v5[2] = sub_25C464554;
  v5[3] = &block_descriptor_66;
  id v3 = _Block_copy(v5);
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v1, sel_updateSettingsWithBlock_, v3);
  _Block_release(v3);
  LOBYTE(v3) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (v3)
  {
    __break(1u);
  }
  else
  {
    if ((*(unsigned char *)(v0 + 16) & 1) == 0)
    {
      (*(void (**)(void *))(v0 + 48))(v1);
      *(unsigned char *)(v0 + 16) = 1;
    }
    return swift_release();
  }
  return result;
}

uint64_t sub_25C463914(uint64_t result, char a2)
{
  if (!a2)
  {
LABEL_6:
    if (result == 1) {
      uint64_t result = sub_25C4637B4();
    }
    goto LABEL_9;
  }
  if (a2 != 1)
  {
    uint64_t result = (uint64_t)objc_msgSend(*(id *)(v2 + 32), sel_invalidate);
    goto LABEL_9;
  }
  if (!(_BYTE)result)
  {
    uint64_t v4 = *(void **)(v2 + 32);
    v6[4] = sub_25C463730;
    v6[5] = 0;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 1107296256;
    v6[2] = sub_25C464554;
    _OWORD v6[3] = &block_descriptor_1;
    uint64_t v5 = _Block_copy(v6);
    swift_release();
    objc_msgSend(v4, sel_updateSettingsWithBlock_, v5);
    _Block_release(v5);
    uint64_t result = swift_isEscapingClosureAtFileLocation();
    if (result)
    {
      __break(1u);
      goto LABEL_6;
    }
  }
LABEL_9:
  *(unsigned char *)(v2 + 17) = a2;
  return result;
}

uint64_t sub_25C463A38(uint64_t a1, char a2)
{
  return sub_25C463914(a1, a2);
}

uint64_t sub_25C463A5C(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  sub_25C47ABD8();
  v2[4] = sub_25C47ABC8();
  uint64_t v4 = sub_25C47AB88();
  v2[5] = v4;
  v2[6] = v3;
  return MEMORY[0x270FA2498](sub_25C463AF4, v4, v3);
}

uint64_t sub_25C463AF4()
{
  uint64_t v1 = (void *)v0[2];
  uint64_t v2 = v0[3];
  uint64_t v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = v1;
  id v4 = v1;

  if (*(unsigned char *)(v2 + 17))
  {
    swift_release();
    uint64_t v5 = (uint64_t (*)(void))v0[1];
    return v5();
  }
  else
  {
    uint64_t v7 = (void *)swift_task_alloc();
    v0[7] = v7;
    void *v7 = v0;
    v7[1] = sub_25C463BF8;
    uint64_t v8 = v0[3];
    return sub_25C454EA8((uint64_t)sub_25C46400C, v8);
  }
}

uint64_t sub_25C463BF8()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 64) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 48);
  uint64_t v4 = *(void *)(v2 + 40);
  if (v0) {
    uint64_t v5 = sub_25C463D98;
  }
  else {
    uint64_t v5 = sub_25C463D34;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_25C463D34()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25C463D98()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

id sub_25C463DFC(void *a1, uint64_t a2, uint64_t a3)
{
  objc_msgSend(a1, sel_setForeground_, 1);
  objc_msgSend(a1, sel_setDisplayConfiguration_, *(void *)(a3 + 24));
  objc_msgSend(*(id *)(a3 + 24), sel_bounds);
  return objc_msgSend(a1, sel_setFrame_);
}

uint64_t sub_25C463E70(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_25C455FD0;
  return sub_25C463A5C(v2);
}

id sub_25C463F08(void *a1, uint64_t a2)
{
  objc_msgSend(a1, sel_setForeground_, 1);
  objc_msgSend(a1, sel_setDisplayConfiguration_, *(void *)(a2 + 24));
  objc_msgSend(*(id *)(a2 + 24), sel_bounds);
  return objc_msgSend(a1, sel_setFrame_);
}

uint64_t sub_25C463F7C()
{
  sub_25C4646CC(*(void *)(v0 + 40));
  return MEMORY[0x270FA0228](v0, 56, 7);
}

uint64_t type metadata accessor for FBScenePresentableProvider()
{
  return self;
}

_UNKNOWN **sub_25C463FE8()
{
  return &off_26BC65BA8;
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 4sub_25C45E010("[%@] %s: blank", (void (*)(void))sub_25C45D9C8, 0) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

id sub_25C46400C(void *a1, uint64_t a2)
{
  return sub_25C463DFC(a1, a2, v2);
}

uint64_t sub_25C464014(void *a1, uint64_t a2)
{
  objc_msgSend(a1, sel_setClientIdentity_, *(void *)(a2 + 32));
  uint64_t v4 = (void *)sub_25C47AA78();
  objc_msgSend(a1, sel_setIdentifier_, v4);

  objc_msgSend(a1, sel_setSpecification_, *(void *)(a2 + 16));
  uint64_t result = (uint64_t)objc_msgSend(a1, sel_respondsToSelector_, sel_configureParameters_);
  if (result)
  {
    MEMORY[0x270FA5388](result);
    v8[2] = a2;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = sub_25C464B54;
    *(void *)(v6 + 24) = v8;
    aBlock[4] = sub_25C464DE0;
    aBlock[5] = v6;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_25C47858C;
    aBlock[3] = &block_descriptor_59;
    uint64_t v7 = _Block_copy(aBlock);
    swift_unknownObjectRetain();
    swift_retain();
    objc_msgSend(a1, sel_configureParameters_, v7);
    _Block_release(v7);
    swift_release();
    LOBYTE(v7) = swift_isEscapingClosureAtFileLocation();
    swift_unknownObjectRelease();
    uint64_t result = swift_release();
    if (v7) {
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_25C4641DC(void *a1, void *a2)
{
  uint64_t v5 = (void *)swift_allocObject();
  void v5[2] = a1;
  v5[3] = a2;
  v5[4] = v2;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = sub_25C464AF8;
  *(void *)(v6 + 24) = v5;
  v12[4] = sub_25C46470C;
  v12[5] = v6;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 1107296256;
  v12[2] = sub_25C47858C;
  v12[3] = &block_descriptor_52;
  uint64_t v7 = _Block_copy(v12);
  id v8 = a1;
  id v9 = a2;
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v8, sel_configureParameters_, v7);
  _Block_release(v7);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (isEscapingClosureAtFileLocation)
  {
    __break(1u);
  }
  else
  {
    sub_25C464B14();
    objc_msgSend(v8, sel_addExtension_, swift_getObjCClassFromMetadata());
    return swift_release();
  }
  return result;
}

id sub_25C464374(void *a1)
{
  return objc_msgSend(a1, sel_activate_, 0);
}

uint64_t sub_25C464388(void *a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a2;
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = sub_25C46464C;
  *(void *)(v5 + 24) = v4;
  void v8[4] = sub_25C464664;
  v8[5] = v5;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 1107296256;
  v8[2] = sub_25C464554;
  _OWORD v8[3] = &block_descriptor_21;
  uint64_t v6 = _Block_copy(v8);
  swift_unknownObjectRetain();
  swift_retain();
  swift_release();
  objc_msgSend(a1, sel_activate_, v6);
  _Block_release(v6);
  swift_release();
  LOBYTE(asub_25C45E010("[%@] %s: unblank", (void (*)(void))sub_25C45D9DC, 1) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (a1) {
    __break(1u);
  }
  return result;
}

void sub_25C4644E4(void *a1, id a2)
{
  id v3 = objc_msgSend(a2, sel_handle);
  objc_msgSend(a1, sel_setClientProcessHandle_, v3);
}

void sub_25C464554(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void (**)(void))(a1 + 32);
  id v3 = a2;
  v2();
}

uint64_t sub_25C4645A0(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void (**)(uint64_t))(a2 + 40);
  if (v2)
  {
    uint64_t v3 = result;
    swift_retain();
    v2(v3);
    return sub_25C4646CC((uint64_t)v2);
  }
  return result;
}

uint64_t sub_25C464614()
{
  swift_unknownObjectRelease();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_25C46464C(void *a1)
{
  sub_25C4644E4(a1, *(id *)(v1 + 16));
}

uint64_t sub_25C464654()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25C464664()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_25C46468C()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_25C4646C4(double a1)
{
  return sub_25C463598(a1);
}

uint64_t sub_25C4646CC(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_25C4646DC()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

id sub_25C4646EC(void *a1)
{
  return objc_msgSend(a1, sel_setLevel_, *(double *)(v1 + 16));
}

uint64_t sub_25C4646FC()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25C46470C(uint64_t a1)
{
  return sub_25C470F88(a1, *(uint64_t (**)(void))(v1 + 16));
}

void sub_25C464714(void *a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = sub_25C464A98;
  *(void *)(v9 + 24) = v8;
  v21[4] = sub_25C464DE0;
  v21[5] = v9;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 1107296256;
  v21[2] = sub_25C464554;
  v21[3] = &block_descriptor_43;
  id v10 = _Block_copy(v21);
  id v11 = a2;
  id v12 = a3;
  swift_retain();
  swift_release();
  objc_msgSend(a1, sel_updateSettingsWithBlock_, v10);
  _Block_release(v10);
  LOBYTE(asub_25C45E010("[%@] %s: unblank", (void (*)(void))sub_25C45D9DC, 1) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if ((a1 & 1) == 0)
  {
    id v13 = objc_msgSend(v11, sel_clientSettings);
    self;
    uint64_t v14 = swift_dynamicCastObjCClass();
    if (v14)
    {
      int v15 = (void *)v14;
      id v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82448]), sel_init);
      id v17 = objc_msgSend(self, sel_diffFromSettings_toSettings_, v16, v15);

      uint64_t v18 = (void *)sub_25C47AA78();
      unsigned int v19 = objc_msgSend(v17, sel_containsSettingNamed_, v18);

      if (!v19)
      {
        swift_release();

        goto LABEL_7;
      }
      id v20 = objc_msgSend(v15, sel_displayConfigurationRequest);

      id v13 = *(id *)(a4 + 32);
      *(void *)(a4 + 32) = v20;
    }
    swift_release();
LABEL_7:

    return;
  }
  __break(1u);
}

id sub_25C464988(void *a1, id a2, void *a3)
{
  id v5 = objc_msgSend(a2, sel_clientSettings);
  objc_msgSend(v5, sel_preferredLevel);
  double v7 = v6;

  objc_msgSend(a1, sel_setLevel_, v7);
  objc_msgSend(a1, sel_setForeground_, 0);
  objc_msgSend(a1, sel_setDisplayConfiguration_, a3);
  objc_msgSend(a3, sel_bounds);
  return objc_msgSend(a1, sel_setFrame_);
}

uint64_t sub_25C464A58()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

id sub_25C464A98(void *a1)
{
  return sub_25C464988(a1, *(id *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_25C464AA0()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25C464AB0()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_25C464AF8(void *a1)
{
  sub_25C464714(a1, *(void **)(v1 + 16), *(void **)(v1 + 24), *(void *)(v1 + 32));
}

uint64_t sub_25C464B04()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

unint64_t sub_25C464B14()
{
  unint64_t result = qword_26A5A8C60;
  if (!qword_26A5A8C60)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A5A8C60);
  }
  return result;
}

id sub_25C464B54(void *a1)
{
  return objc_msgSend(a1, sel_setClientSettings_, *(void *)(*(void *)(v1 + 16) + 24));
}

uint64_t sub_25C464B68()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_25C464B78(char a1)
{
  if (!a1)
  {
    sub_25C4637B4();
LABEL_9:
    *(unsigned char *)(v1 + 17) = a1;
    return;
  }
  if (a1 == 1)
  {
    if (qword_26A5A84F0 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_25C47AA38();
    __swift_project_value_buffer(v3, (uint64_t)qword_26A5AACD8);
    swift_retain_n();
    uint64_t v4 = sub_25C47AA18();
    os_log_type_t v5 = sub_25C47AD28();
    if (os_log_type_enabled(v4, v5))
    {
      double v6 = (uint8_t *)swift_slowAlloc();
      uint64_t v7 = swift_slowAlloc();
      uint64_t v10 = v7;
      *(_DWORD *)double v6 = 136446210;
      uint64_t v8 = sub_25C4633A8();
      sub_25C47596C(v8, v9, &v10);
      sub_25C47ADB8();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25C444000, v4, v5, "%{public}s: inactive. update settings later", v6, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x261186AD0](v7, -1, -1);
      MEMORY[0x261186AD0](v6, -1, -1);
    }
    else
    {

      swift_release_n();
    }
    goto LABEL_9;
  }
  sub_25C47AF18();
  __break(1u);
}

id sub_25C464D98(void *a1)
{
  return sub_25C463F08(a1, v1);
}

uint64_t sub_25C464DA0()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

id FBSScene.displayEndpoint.getter()
{
  sub_25C457A30(0, (unint64_t *)&qword_26A5A8C60);
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  sub_25C457A30(0, &qword_26A5A8C68);
  id result = objc_msgSend(v0, sel_componentForExtension_ofClass_, ObjCClassFromMetadata, swift_getObjCClassFromMetadata());
  if (result)
  {
    id result = (id)swift_dynamicCastObjCProtocolConditional();
    if (!result)
    {
      swift_unknownObjectRelease();
      return 0;
    }
  }
  return result;
}

uint64_t SceneRequest.sceneIdentifier.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SceneRequest.sceneIdentifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*SceneRequest.sceneIdentifier.modify())()
{
  return nullsub_1;
}

id SceneRequest.specification.getter()
{
  return *(id *)(v0 + 16);
}

void SceneRequest.specification.setter(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
}

uint64_t (*SceneRequest.specification.modify())()
{
  return nullsub_1;
}

void *SceneRequest.initialClientSettings.getter()
{
  uint64_t v1 = *(void **)(v0 + 24);
  id v2 = v1;
  return v1;
}

void SceneRequest.initialClientSettings.setter(uint64_t a1)
{
  *(void *)(v1 + 24) = a1;
}

uint64_t (*SceneRequest.initialClientSettings.modify())()
{
  return nullsub_1;
}

id SceneRequest.clientIdentity.getter()
{
  return *(id *)(v0 + 32);
}

void SceneRequest.clientIdentity.setter(uint64_t a1)
{
  *(void *)(v1 + 32) = a1;
}

uint64_t (*SceneRequest.clientIdentity.modify())()
{
  return nullsub_1;
}

uint64_t SceneRequest.init(sceneIdentifier:specification:initialClientSettings:clientIdentity:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void *a6@<X8>)
{
  *a6 = result;
  a6[1] = a2;
  a6[2] = a3;
  a6[3] = a4;
  a6[4] = a5;
  return result;
}

void SceneRequest.hash(into:)()
{
  id v2 = (void *)v0[2];
  uint64_t v1 = (void *)v0[3];
  uint64_t v3 = (void *)v0[4];
  swift_bridgeObjectRetain();
  sub_25C47AAA8();
  swift_bridgeObjectRelease();
  id v4 = v2;
  sub_25C47AD98();

  sub_25C47B088();
  if (v1)
  {
    id v5 = v1;
    sub_25C47AD98();
  }
  id v6 = v3;
  sub_25C47AD98();
}

uint64_t SceneRequest.hashValue.getter()
{
  id v2 = (void *)v0[2];
  uint64_t v1 = (void *)v0[3];
  uint64_t v3 = (void *)v0[4];
  sub_25C47B068();
  swift_bridgeObjectRetain();
  sub_25C47AAA8();
  swift_bridgeObjectRelease();
  id v4 = v2;
  sub_25C47AD98();

  sub_25C47B088();
  if (v1)
  {
    id v5 = v1;
    sub_25C47AD98();
  }
  id v6 = v3;
  sub_25C47AD98();

  return sub_25C47B098();
}

uint64_t sub_25C4651F8@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_25C46520C()
{
  uint64_t v2 = (void *)v0[2];
  uint64_t v1 = (void *)v0[3];
  uint64_t v3 = (void *)v0[4];
  sub_25C47B068();
  swift_bridgeObjectRetain();
  sub_25C47AAA8();
  swift_bridgeObjectRelease();
  id v4 = v2;
  sub_25C47AD98();

  sub_25C47B088();
  if (v1)
  {
    id v5 = v1;
    sub_25C47AD98();
  }
  id v6 = v3;
  sub_25C47AD98();

  return sub_25C47B098();
}

uint64_t _s13ShellSceneKit0B7RequestV2eeoiySbAC_ACtFZ_0(void *a1, void *a2)
{
  uint64_t v2 = (void *)a1[3];
  uint64_t v3 = (void *)a2[3];
  BOOL v4 = *a1 == *a2 && a1[1] == a2[1];
  if (v4 || (sub_25C47AFD8() & 1) != 0)
  {
    sub_25C457A30(0, (unint64_t *)&unk_26A5A93A0);
    if (sub_25C47AD88())
    {
      if (v2)
      {
        if (v3)
        {
          sub_25C457A30(0, &qword_26A5A8CD8);
          id v5 = v3;
          id v6 = v2;
          char v7 = sub_25C47AD88();

          if (v7) {
            return sub_25C47AD88() & 1;
          }
        }
      }
      else if (!v3)
      {
        return sub_25C47AD88() & 1;
      }
    }
  }
  return 0;
}

unint64_t sub_25C4653E4()
{
  unint64_t result = qword_26A5A8CD0;
  if (!qword_26A5A8CD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5A8CD0);
  }
  return result;
}

void destroy for SceneRequest(uint64_t a1)
{
  swift_bridgeObjectRelease();

  uint64_t v2 = *(void **)(a1 + 32);
}

void *initializeWithCopy for SceneRequest(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  BOOL v4 = (void *)a2[2];
  id v5 = (void *)a2[3];
  a1[2] = v4;
  a1[3] = v5;
  id v6 = (void *)a2[4];
  a1[4] = v6;
  swift_bridgeObjectRetain();
  id v7 = v4;
  id v8 = v5;
  id v9 = v6;
  return a1;
}

void *assignWithCopy for SceneRequest(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  BOOL v4 = (void *)a2[2];
  id v5 = (void *)a1[2];
  a1[2] = v4;
  id v6 = v4;

  id v7 = (void *)a1[3];
  id v8 = (void *)a2[3];
  a1[3] = v8;
  id v9 = v8;

  uint64_t v10 = (void *)a2[4];
  id v11 = (void *)a1[4];
  a1[4] = v10;
  id v12 = v10;

  return a1;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for SceneRequest(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  BOOL v4 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);

  id v5 = *(void **)(a1 + 32);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);

  return a1;
}

uint64_t getEnumTagSinglePayload for SceneRequest(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SceneRequest(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 4sub_25C45E010("[%@] %s: blank", (void (*)(void))sub_25C45D9C8, 0) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 4sub_25C45E010("[%@] %s: blank", (void (*)(void))sub_25C45D9C8, 0) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SceneRequest()
{
  return &type metadata for SceneRequest;
}

uint64_t sub_25C46567C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = a2;
  uint64_t v21 = a3;
  uint64_t v22 = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A8D50);
  uint64_t v4 = *(void *)(v3 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  id v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A8D40);
  uint64_t v8 = *(void *)(v7 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A8D58);
  uint64_t v11 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  id v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  int v15 = (char *)&v19 - v14;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A8D00);
  uint64_t v17 = *(void *)(v16 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56))(v15, 1, 1, v16);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v21, v3);
  unint64_t v23 = v15;
  sub_25C47AC38();
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 16))(v22, v10, v7);
  sub_25C4676F0((uint64_t)v15, (uint64_t)v13);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v17 + 48))(v13, 1, v16);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    (*(void (**)(uint64_t, char *, uint64_t))(v17 + 32))(v20, v13, v16);
    return sub_25C467758((uint64_t)v15);
  }
  return result;
}

uint64_t sub_25C465970(uint64_t a1, uint64_t a2)
{
  sub_25C467758(a2);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A8D00);
  uint64_t v7 = *(void *)(v4 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(a2, a1, v4);
  uint64_t v5 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v7 + 56);
  return v5(a2, 0, 1, v4);
}

uint64_t sub_25C465A4C()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A8D50);
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (uint64_t *)((char *)&v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A8D00);
  uint64_t v4 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  id v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A8D40);
  uint64_t v7 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = (int *)type metadata accessor for BatchingContext();
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  id v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_allocate_value_buffer(v11, qword_26A5A8CE0);
  uint64_t v14 = __swift_project_value_buffer((uint64_t)v10, (uint64_t)qword_26A5A8CE0);
  *(void *)&v13[v10[6]] = MEMORY[0x263F8EE78];
  v13[v10[7]] = 0;
  *uint64_t v3 = 1;
  (*(void (**)(void *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F8F570], v0);
  sub_25C46567C((uint64_t)v9, (uint64_t)v6, (uint64_t)v3);
  (*(void (**)(void *, uint64_t))(v1 + 8))(v3, v0);
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v13, v9, v16);
  (*(void (**)(char *, char *, uint64_t))(v4 + 32))(&v13[v10[5]], v6, v17);
  return sub_25C467684((uint64_t)v13, v14);
}

uint64_t sub_25C465D28(uint64_t a1, int *a2)
{
  v2[2] = sub_25C47ABD8();
  v2[3] = sub_25C47ABC8();
  id v6 = (uint64_t (*)(void))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  v2[4] = v4;
  void *v4 = v2;
  v4[1] = sub_25C465E1C;
  return v6();
}

uint64_t sub_25C465E1C()
{
  swift_task_dealloc();
  uint64_t v1 = sub_25C47AB88();
  return MEMORY[0x270FA2498](sub_25C465F58, v1, v0);
}

uint64_t sub_25C465F58()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25C465FB8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A8D00);
  uint64_t v34 = *(void *)(v2 - 8);
  uint64_t v35 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A8D08);
  uint64_t v32 = *(void *)(v5 - 8);
  uint64_t v33 = v5;
  MEMORY[0x270FA5388](v5);
  int v31 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A8D10);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A8990);
  MEMORY[0x270FA5388](v11 - 8);
  id v13 = (char *)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26A5A84C8 != -1) {
    swift_once();
  }
  uint64_t v14 = (int *)type metadata accessor for BatchingContext();
  uint64_t v15 = __swift_project_value_buffer((uint64_t)v14, (uint64_t)qword_26A5A8CE0);
  swift_beginAccess();
  uint64_t v16 = v14[7];
  if ((*(unsigned char *)(v15 + v16) & 1) == 0)
  {
    *(unsigned char *)(v15 + v16) = 1;
    uint64_t v17 = sub_25C47ABF8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v13, 1, 1, v17);
    uint64_t v18 = sub_25C47ABC8();
    uint64_t v19 = swift_allocObject();
    uint64_t v20 = MEMORY[0x263F8F500];
    *(void *)(v19 + 16) = v18;
    *(void *)(v19 + 24) = v20;
    sub_25C471004((uint64_t)v13, (uint64_t)&unk_26A5A8D20, v19);
    swift_release();
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a1, v7);
  swift_beginAccess();
  uint64_t v21 = v14[6];
  unint64_t v22 = *(void *)(v15 + v21);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(v15 + v2sub_25C45E010("[%@] %s: unblank", (void (*)(void))sub_25C45D9DC, 1) = v22;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    unint64_t v22 = sub_25C466DE0(0, *(void *)(v22 + 16) + 1, 1, v22);
    *(void *)(v15 + v2sub_25C45E010("[%@] %s: unblank", (void (*)(void))sub_25C45D9DC, 1) = v22;
  }
  unint64_t v25 = *(void *)(v22 + 16);
  unint64_t v24 = *(void *)(v22 + 24);
  if (v25 >= v24 >> 1)
  {
    unint64_t v22 = sub_25C466DE0(v24 > 1, v25 + 1, 1, v22);
    *(void *)(v15 + v2sub_25C45E010("[%@] %s: unblank", (void (*)(void))sub_25C45D9DC, 1) = v22;
  }
  *(void *)(v22 + 16) = v25 + 1;
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v22+ ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))+ *(void *)(v8 + 72) * v25, v10, v7);
  swift_endAccess();
  uint64_t v27 = v34;
  uint64_t v26 = v35;
  (*(void (**)(char *, uint64_t, uint64_t))(v34 + 16))(v4, v15 + v14[5], v35);
  uint64_t v28 = v31;
  sub_25C47AC08();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v4, v26);
  return (*(uint64_t (**)(char *, uint64_t))(v32 + 8))(v28, v33);
}

uint64_t type metadata accessor for BatchingContext()
{
  uint64_t result = qword_26A5A8D68;
  if (!qword_26A5A8D68) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25C466470()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A8D10);
  v0[5] = v1;
  v0[6] = *(void *)(v1 - 8);
  v0[7] = swift_task_alloc();
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A8D30);
  v0[8] = v2;
  v0[9] = *(void *)(v2 - 8);
  v0[10] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A8D38);
  v0[11] = swift_task_alloc();
  v0[12] = swift_task_alloc();
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A8D40);
  v0[13] = v3;
  v0[14] = *(void *)(v3 - 8);
  v0[15] = swift_task_alloc();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A8D48);
  v0[16] = v4;
  v0[17] = *(void *)(v4 - 8);
  v0[18] = swift_task_alloc();
  v0[19] = sub_25C47ABD8();
  v0[20] = sub_25C47ABC8();
  uint64_t v6 = sub_25C47AB88();
  v0[21] = v6;
  v0[22] = v5;
  return MEMORY[0x270FA2498](sub_25C4666C8, v6, v5);
}

uint64_t sub_25C4666C8()
{
  if (qword_26A5A84C8 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[14];
  uint64_t v1 = v0[15];
  uint64_t v3 = v0[13];
  uint64_t v4 = type metadata accessor for BatchingContext();
  v0[23] = v4;
  uint64_t v5 = __swift_project_value_buffer(v4, (uint64_t)qword_26A5A8CE0);
  v0[24] = v5;
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v5, v3);
  sub_25C47AC18();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  uint64_t v6 = sub_25C47ABC8();
  v0[25] = v6;
  uint64_t v7 = (void *)swift_task_alloc();
  v0[26] = v7;
  void *v7 = v0;
  v7[1] = sub_25C466858;
  uint64_t v8 = v0[16];
  uint64_t v9 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA1F68](v0 + 27, v6, v9, v8);
}

uint64_t sub_25C466858()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 176);
  uint64_t v3 = *(void *)(v1 + 168);
  return MEMORY[0x270FA2498](sub_25C46699C, v3, v2);
}

uint64_t sub_25C46699C()
{
  if (*(unsigned char *)(v0 + 216) == 1)
  {
    (*(void (**)(void, void))(*(void *)(v0 + 136) + 8))(*(void *)(v0 + 144), *(void *)(v0 + 128));
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
    return v1();
  }
  else
  {
    uint64_t v3 = *(void *)(v0 + 192);
    uint64_t v4 = *(int *)(*(void *)(v0 + 184) + 24);
    uint64_t v5 = *(void *)(v3 + v4);
    uint64_t v6 = v0 + 217;
    *(void *)(v3 + v4) = MEMORY[0x263F8EE78];
    unint64_t v7 = *(void *)(v5 + 16);
    uint64_t v8 = swift_bridgeObjectRetain();
    unint64_t i = 0;
    uint64_t v33 = v5;
    if (v7) {
      goto LABEL_7;
    }
LABEL_6:
    (*(void (**)(void, uint64_t, uint64_t, void))(*(void *)(v0 + 72) + 56))(*(void *)(v0 + 88), 1, 1, *(void *)(v0 + 64));
    for (unint64_t i = v7; ; ++i)
    {
      uint64_t v23 = *(void *)(v0 + 96);
      uint64_t v25 = *(void *)(v0 + 64);
      uint64_t v24 = *(void *)(v0 + 72);
      sub_25C46761C(*(void *)(v0 + 88), v23);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v24 + 48))(v23, 1, v25) == 1) {
        break;
      }
      uint64_t v26 = *(char **)(v0 + 96);
      uint64_t v27 = *(void *)(v0 + 56);
      uint64_t v29 = *(void *)(v0 + 40);
      uint64_t v28 = *(void *)(v0 + 48);
      uint64_t v30 = *(void *)v26;
      (*(void (**)(uint64_t, char *, uint64_t))(v28 + 32))(v27, &v26[*(int *)(*(void *)(v0 + 64) + 48)], v29);
      uint64_t v5 = v33;
      *(unsigned char *)(v0 + 217) = v30 == *(void *)(v33 + 16) - 1;
      sub_25C47ABA8();
      uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t))(v28 + 8))(v27, v29);
      if (i == v7) {
        goto LABEL_6;
      }
LABEL_7:
      if (i >= *(void *)(v5 + 16))
      {
        __break(1u);
        return MEMORY[0x270FA1F68](v8, v9, v10, v11);
      }
      id v13 = *(unint64_t **)(v0 + 88);
      uint64_t v15 = *(void *)(v0 + 64);
      uint64_t v14 = *(void *)(v0 + 72);
      uint64_t v16 = v6;
      uint64_t v18 = *(void *)(v0 + 40);
      uint64_t v17 = *(void *)(v0 + 48);
      unint64_t v19 = v5
          + ((*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80))
          + *(void *)(v17 + 72) * i;
      uint64_t v20 = *(void *)(v0 + 80) + *(int *)(v15 + 48);
      (*(void (**)(uint64_t, unint64_t, uint64_t))(v17 + 16))(v20, v19, v18);
      uint64_t v21 = (char *)v13 + *(int *)(v15 + 48);
      *id v13 = i;
      uint64_t v22 = v18;
      uint64_t v6 = v16;
      (*(void (**)(char *, uint64_t, uint64_t))(v17 + 32))(v21, v20, v22);
      (*(void (**)(unint64_t *, void, uint64_t, uint64_t))(v14 + 56))(v13, 0, 1, v15);
    }
    swift_bridgeObjectRelease_n();
    uint64_t v31 = sub_25C47ABC8();
    *(void *)(v0 + 20sub_25C45E010("[%@] %s: blank", (void (*)(void))sub_25C45D9C8, 0) = v31;
    uint64_t v32 = (void *)swift_task_alloc();
    *(void *)(v0 + 208) = v32;
    *uint64_t v32 = v0;
    v32[1] = sub_25C466858;
    uint64_t v11 = *(void *)(v0 + 128);
    uint64_t v10 = MEMORY[0x263F8F500];
    uint64_t v8 = v0 + 216;
    uint64_t v9 = v31;
    return MEMORY[0x270FA1F68](v8, v9, v10, v11);
  }
}

uint64_t sub_25C466CFC()
{
  swift_unknownObjectRelease();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25C466D34()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25C455FD0;
  return sub_25C466470();
}

uint64_t sub_25C466DE0(char a1, int64_t a2, char a3, unint64_t a4)
{
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v7 = a2;
      }
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    id v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A8D28);
  uint64_t v10 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A5A8D10) - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  id v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = sub_25C47AF08();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A5A8D10) - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (unint64_t)v13 + v17;
  if (a1)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(void *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_25C4674BC(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

void *sub_25C467050(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A5A9280);
      uint64_t v10 = (void *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 48);
      unint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[6 * v8 + 4]) {
          memmove(v12, a4 + 4, 48 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      unint64_t v12 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_25C4673AC(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_25C467178(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A9250);
      uint64_t v10 = (void *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
      unint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[5 * v8 + 4]) {
          memmove(v12, a4 + 4, 40 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      unint64_t v12 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_25C46729C(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_25C46729C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 40 * a1 + 32;
    unint64_t v6 = a3 + 40 * v4;
    if (v5 >= v6 || v5 + 40 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A8D60);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_25C47AF68();
  __break(1u);
  return result;
}

uint64_t sub_25C4673AC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 48 * a1 + 32;
    unint64_t v6 = a3 + 48 * v4;
    if (v5 >= v6 || v5 + 48 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A9200);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_25C47AF68();
  __break(1u);
  return result;
}

uint64_t sub_25C4674BC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A5A8D10) - 8);
    uint64_t v9 = a4 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v10 = *(void *)(v8 + 72);
    unint64_t v11 = v9 + v10 * a1;
    unint64_t v12 = a3 + v10 * v4;
    if (v11 >= v12 || v11 + v10 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v12;
    }
  }
  uint64_t result = sub_25C47AF68();
  __break(1u);
  return result;
}

uint64_t sub_25C46761C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A8D38);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25C467684(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for BatchingContext();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25C4676E8(uint64_t a1)
{
  return sub_25C465970(a1, *(void *)(v1 + 16));
}

uint64_t sub_25C4676F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A8D58);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25C467758(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A8D58);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *sub_25C4677B8(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *a1 = *a2;
    a1 = (void *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A8D40);
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A8D00);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    uint64_t v12 = a3[7];
    *(void *)((char *)a1 + a3[6]) = *(void *)((char *)a2 + a3[6]);
    *((unsigned char *)a1 + v12) = *((unsigned char *)a2 + v12);
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_25C4678E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A8D40);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A8D00);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  return swift_bridgeObjectRelease();
}

uint64_t sub_25C4679AC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A8D40);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A8D00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  uint64_t v11 = a3[7];
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  *(unsigned char *)(a1 + v1sub_25C45E010("[%@] %s: unblank", (void (*)(void))sub_25C45D9DC, 1) = *(unsigned char *)(a2 + v11);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_25C467A8C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A8D40);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A8D00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_25C467B7C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A8D40);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A8D00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  uint64_t v11 = a3[7];
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  *(unsigned char *)(a1 + v1sub_25C45E010("[%@] %s: unblank", (void (*)(void))sub_25C45D9DC, 1) = *(unsigned char *)(a2 + v11);
  return a1;
}

uint64_t sub_25C467C58(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A8D40);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A8D00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_25C467D40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25C467D54);
}

uint64_t sub_25C467D54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A8D40);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A8D00);
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 20);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  unint64_t v14 = *(void *)(a1 + *(int *)(a3 + 24));
  if (v14 >= 0xFFFFFFFF) {
    LODWORD(v14) = -1;
  }
  return (v14 + 1);
}

uint64_t sub_25C467E70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25C467E84);
}

uint64_t sub_25C467E84(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A8D40);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }
  else
  {
    uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A8D00);
    uint64_t v14 = *(void *)(result - 8);
    if (*(_DWORD *)(v14 + 84) != a3)
    {
      *(void *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
      return result;
    }
    uint64_t v10 = result;
    uint64_t v12 = a1 + *(int *)(a4 + 20);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

void sub_25C467F9C()
{
  sub_25C4680B4(319, &qword_26A5A8D78, MEMORY[0x263F8F5B8]);
  if (v0 <= 0x3F)
  {
    sub_25C4680B4(319, &qword_26A5A8D80, MEMORY[0x263F8F590]);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_25C4680B4(uint64_t a1, unint64_t *a2, uint64_t (*a3)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v4 = a3(0, MEMORY[0x263F8EE60] + 8);
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_25C468108(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t sub_25C46811C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t HostingGroup.id.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t static HostingGroup.default.getter@<X0>(void *a1@<X8>)
{
  if (qword_26B350B60 != -1) {
    swift_once();
  }
  uint64_t v2 = *(void *)algn_26B350D58;
  *a1 = qword_26B350D50;
  a1[1] = v2;
  a1[2] = 0;
  return swift_bridgeObjectRetain();
}

ShellSceneKit::HostingGroup __swiftcall HostingGroup.init(_:)(Swift::String a1)
{
  *uint64_t v1 = a1;
  v1[1]._countAndFlagsBits = 0;
  result.id = a1;
  return result;
}

uint64_t HostingGroup.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_25C47AAA8();
  return swift_bridgeObjectRelease();
}

uint64_t static HostingGroup.== infix(_:_:)(void *a1, void *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return 1;
  }
  else {
    return sub_25C47AFD8();
  }
}

uint64_t sub_25C468268(char a1)
{
  if (a1) {
    return 0xD000000000000014;
  }
  else {
    return 25705;
  }
}

uint64_t sub_25C468298()
{
  return sub_25C468268(*v0);
}

uint64_t sub_25C4682A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25C468D50(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25C4682C8()
{
  return 0;
}

void sub_25C4682D4(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_25C4682E0(uint64_t a1)
{
  unint64_t v2 = sub_25C468918();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25C46831C(uint64_t a1)
{
  unint64_t v2 = sub_25C468918();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t HostingGroup.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A8D88);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9[0] = *(void *)(v1 + 16);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25C468918();
  sub_25C47B0B8();
  char v11 = 0;
  uint64_t v7 = v9[1];
  sub_25C47AFA8();
  if (!v7)
  {
    char v10 = 1;
    sub_25C47AFB8();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t HostingGroup.hashValue.getter()
{
  return sub_25C47B098();
}

uint64_t HostingGroup.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A8D98);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25C468918();
  sub_25C47B0A8();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  char v16 = 0;
  uint64_t v9 = sub_25C47AF88();
  uint64_t v11 = v10;
  char v15 = 1;
  swift_bridgeObjectRetain();
  uint64_t v12 = sub_25C47AF98();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  *a2 = v9;
  a2[1] = v11;
  a2[2] = v12;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return swift_bridgeObjectRelease();
}

uint64_t sub_25C468708@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return HostingGroup.init(from:)(a1, a2);
}

uint64_t sub_25C468720(void *a1)
{
  return HostingGroup.encode(to:)(a1);
}

uint64_t sub_25C468738()
{
  return sub_25C47B098();
}

uint64_t sub_25C468794()
{
  swift_bridgeObjectRetain();
  sub_25C47AAA8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25C4687EC()
{
  return sub_25C47B098();
}

uint64_t sub_25C468844(void *a1, void *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return 1;
  }
  else {
    return sub_25C47AFD8();
  }
}

uint64_t HostingGroup.description.getter()
{
  return 0x3A70756F72675BLL;
}

void sub_25C4688F4()
{
  qword_26B350D50 = 0x746C7561666564;
  *(void *)algn_26B350D58 = 0xE700000000000000;
}

unint64_t sub_25C468918()
{
  unint64_t result = qword_26A5A8D90;
  if (!qword_26A5A8D90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5A8D90);
  }
  return result;
}

unint64_t sub_25C468970()
{
  unint64_t result = qword_26B350B30;
  if (!qword_26B350B30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B350B30);
  }
  return result;
}

void *sub_25C4689C8(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for HostingGroup(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

void *assignWithTake for HostingGroup(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  return a1;
}

uint64_t getEnumTagSinglePayload for HostingGroup(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HostingGroup(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HostingGroup()
{
  return &type metadata for HostingGroup;
}

unsigned char *storeEnumTagSinglePayload for HostingGroup.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *__n128 result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + sub_25C45E010("[%@] %s: unblank", (void (*)(void))sub_25C45D9DC, 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x25C468C10);
      case 4:
        *(_DWORD *)(result + sub_25C45E010("[%@] %s: unblank", (void (*)(void))sub_25C45D9DC, 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + sub_25C45E010("[%@] %s: unblank", (void (*)(void))sub_25C45D9DC, 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + sub_25C45E010("[%@] %s: unblank", (void (*)(void))sub_25C45D9DC, 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *__n128 result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HostingGroup.CodingKeys()
{
  return &type metadata for HostingGroup.CodingKeys;
}

unint64_t sub_25C468C4C()
{
  unint64_t result = qword_26A5A8DA0;
  if (!qword_26A5A8DA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5A8DA0);
  }
  return result;
}

unint64_t sub_25C468CA4()
{
  unint64_t result = qword_26A5A8DA8;
  if (!qword_26A5A8DA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5A8DA8);
  }
  return result;
}

unint64_t sub_25C468CFC()
{
  unint64_t result = qword_26A5A8DB0[0];
  if (!qword_26A5A8DB0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A5A8DB0);
  }
  return result;
}

uint64_t sub_25C468D50(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v3 || (sub_25C47AFD8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x800000025C480890)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_25C47AFD8();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_25C468E20()
{
  uint64_t AssociatedTypeWitness = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    if (v2 <= 0x3F)
    {
      uint64_t inited = swift_initClassMetadata2();
      if (inited) {
        return inited;
      }
      else {
        return 0;
      }
    }
  }
  return AssociatedTypeWitness;
}

uint64_t sub_25C468F2C()
{
  uint64_t v0 = sub_25C47AA38();
  __swift_allocate_value_buffer(v0, qword_26A5AAC90);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A5AAC90);
  return sub_25C47AA28();
}

uint64_t sub_25C468FAC()
{
  (*(void (**)(uint64_t, void))(*(void *)(*(void *)(*(void *)v0 + 80) - 8) + 8))(v0 + *(void *)(*(void *)v0 + 96), *(void *)(*(void *)v0 + 80));
  uint64_t v1 = v0 + *(void *)(*(void *)v0 + 104);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 8))(v1, AssociatedTypeWitness);
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_25C4690C4()
{
  sub_25C468FAC();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t type metadata accessor for HostingGroupCoordinator()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_25C469134(unsigned int a1, unsigned int a2)
{
  unsigned int v49 = a1;
  uint64_t v4 = *v2;
  uint64_t v5 = *(void *)(*v2 + 88);
  uint64_t v47 = *(void *)(*v2 + 80);
  uint64_t v48 = v5;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v7 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v9 = (char *)&v40 - v8;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v52 = sub_25C47ADA8();
  uint64_t v11 = *(void *)(v52 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v52);
  uint64_t v14 = (char *)&v40 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  char v16 = (char *)&v40 - v15;
  uint64_t v17 = *(void *)(v4 + 112);
  unsigned int v50 = a2;
  *((unsigned char *)v2 + v17) = a2;
  unint64_t v18 = (uint64_t *)((char *)v2 + *(void *)(*v2 + 120));
  swift_beginAccess();
  uint64_t v19 = *v18;
  uint64_t v20 = *(void *)(*v18 + 64);
  uint64_t v41 = *v18 + 64;
  uint64_t v21 = 1 << *(unsigned char *)(v19 + 32);
  uint64_t v22 = -1;
  if (v21 < 64) {
    uint64_t v22 = ~(-1 << v21);
  }
  unint64_t v23 = v22 & v20;
  uint64_t v51 = TupleTypeMetadata2 - 8;
  uint64_t v43 = v7 + 16;
  uint64_t v44 = v7;
  uint64_t v24 = (void (**)(char *, char *, uint64_t))(v11 + 32);
  uint64_t v45 = v19;
  uint64_t v46 = (void (**)(char *, char *, uint64_t))(v7 + 32);
  uint64_t v25 = (uint64_t (**)(char *, uint64_t))(v7 + 8);
  int64_t v42 = (unint64_t)(v21 + 63) >> 6;
  int64_t v40 = v42 - 1;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v53 = 0;
  if (!v23) {
    goto LABEL_6;
  }
LABEL_4:
  unint64_t v27 = __clz(__rbit64(v23));
  v23 &= v23 - 1;
  unint64_t v28 = v27 | (v53 << 6);
LABEL_5:
  uint64_t v29 = *(void *)(v45 + 56);
  uint64_t v30 = (uint64_t *)(*(void *)(v45 + 48) + 24 * v28);
  uint64_t v31 = *v30;
  uint64_t v32 = v30[1];
  uint64_t v33 = v30[2];
  *(void *)uint64_t v14 = v31;
  *((void *)v14 + sub_25C45E010("[%@] %s: unblank", (void (*)(void))sub_25C45D9DC, 1) = v32;
  *((void *)v14 + 2) = v33;
  (*(void (**)(char *, unint64_t, uint64_t))(v44 + 16))(&v14[*(int *)(TupleTypeMetadata2 + 48)], v29 + *(void *)(v44 + 72) * v28, AssociatedTypeWitness);
  uint64_t v34 = *(void *)(TupleTypeMetadata2 - 8);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v34 + 56))(v14, 0, 1, TupleTypeMetadata2);
  swift_bridgeObjectRetain();
  while (1)
  {
    (*v24)(v16, v14, v52);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48))(v16, 1, TupleTypeMetadata2) == 1) {
      return swift_release();
    }
    swift_bridgeObjectRelease();
    (*v46)(v9, &v16[*(int *)(TupleTypeMetadata2 + 48)], AssociatedTypeWitness);
    uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    (*(void (**)(void, void, uint64_t))(*(void *)(AssociatedConformanceWitness + 8) + 8))(v49, v50, AssociatedTypeWitness);
    uint64_t result = (*v25)(v9, AssociatedTypeWitness);
    if (v23) {
      goto LABEL_4;
    }
LABEL_6:
    int64_t v35 = v53 + 1;
    if (__OFADD__(v53, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v35 < v42)
    {
      unint64_t v36 = *(void *)(v41 + 8 * v35);
      if (v36) {
        goto LABEL_9;
      }
      int64_t v37 = v53 + 2;
      ++v53;
      if (v35 + 1 < v42)
      {
        unint64_t v36 = *(void *)(v41 + 8 * v37);
        if (v36)
        {
          ++v35;
LABEL_9:
          unint64_t v23 = (v36 - 1) & v36;
          unint64_t v28 = __clz(__rbit64(v36)) + (v35 << 6);
          int64_t v53 = v35;
          goto LABEL_5;
        }
        int64_t v38 = v35 + 2;
        int64_t v53 = v35 + 1;
        if (v35 + 2 < v42) {
          break;
        }
      }
    }
LABEL_21:
    uint64_t v34 = *(void *)(TupleTypeMetadata2 - 8);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v34 + 56))(v14, 1, 1, TupleTypeMetadata2);
    unint64_t v23 = 0;
  }
  unint64_t v36 = *(void *)(v41 + 8 * v38);
  if (v36)
  {
    v35 += 2;
    goto LABEL_9;
  }
  while (1)
  {
    int64_t v35 = v38 + 1;
    if (__OFADD__(v38, 1)) {
      break;
    }
    if (v35 >= v42)
    {
      int64_t v53 = v40;
      goto LABEL_21;
    }
    unint64_t v36 = *(void *)(v41 + 8 * v35);
    ++v38;
    if (v36) {
      goto LABEL_9;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_25C469670(unsigned int a1, unsigned int a2)
{
  return sub_25C469134(a1, a2);
}

uint64_t sub_25C469694(uint64_t a1)
{
  v2[5] = a1;
  v2[6] = v1;
  uint64_t v3 = *v1;
  v2[7] = *(void *)(*v1 + 88);
  v2[8] = *(void *)(v3 + 80);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v2[9] = AssociatedTypeWitness;
  v2[10] = *(void *)(AssociatedTypeWitness - 8);
  v2[11] = swift_task_alloc();
  v2[12] = swift_getTupleTypeMetadata2();
  uint64_t v5 = sub_25C47ADA8();
  v2[13] = v5;
  v2[14] = *(void *)(v5 - 8);
  v2[15] = swift_task_alloc();
  v2[16] = swift_task_alloc();
  sub_25C47ABD8();
  v2[17] = sub_25C47ABC8();
  uint64_t v7 = sub_25C47AB88();
  v2[18] = v7;
  v2[19] = v6;
  return MEMORY[0x270FA2498](sub_25C469868, v7, v6);
}

uint64_t sub_25C469868()
{
  uint64_t v1 = (uint64_t *)(*(void *)(v0 + 48) + *(void *)(**(void **)(v0 + 48) + 120));
  swift_beginAccess();
  uint64_t v2 = *v1;
  *(void *)(v0 + 16sub_25C45E010("[%@] %s: blank", (void (*)(void))sub_25C45D9C8, 0) = *v1;
  char v3 = *(unsigned char *)(v2 + 32);
  *(unsigned char *)(v0 + 20sub_25C45E010("[%@] %s: blank", (void (*)(void))sub_25C45D9C8, 0) = v3;
  uint64_t v4 = -1;
  uint64_t v5 = -1 << v3;
  if (-(-1 << v3) < 64) {
    uint64_t v4 = ~(-1 << -(char)v5);
  }
  unint64_t v6 = v4 & *(void *)(v2 + 64);
  uint64_t v7 = (void *)swift_bridgeObjectRetain();
  if (v6)
  {
    uint64_t v8 = 0;
    unint64_t v9 = __clz(__rbit64(v6));
    uint64_t v10 = (v6 - 1) & v6;
LABEL_5:
    uint64_t v11 = *(char **)(v0 + 120);
    uint64_t v12 = *(void *)(v0 + 96);
    uint64_t v13 = *(void *)(v0 + 72);
    uint64_t v14 = *(void *)(v0 + 80);
    uint64_t v15 = (uint64_t *)(v7[6] + 24 * v9);
    uint64_t v16 = *v15;
    uint64_t v17 = v15[1];
    uint64_t v18 = v15[2];
    *(void *)uint64_t v11 = v16;
    *((void *)v11 + sub_25C45E010("[%@] %s: unblank", (void (*)(void))sub_25C45D9DC, 1) = v17;
    *((void *)v11 + 2) = v18;
    (*(void (**)(char *, unint64_t, uint64_t))(v14 + 16))(&v11[*(int *)(v12 + 48)], v7[7] + *(void *)(v14 + 72) * v9, v13);
    uint64_t v19 = *(void *)(v12 - 8);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v11, 0, 1, v12);
    swift_bridgeObjectRetain();
    goto LABEL_12;
  }
  unint64_t v20 = 63 - v5;
  if ((unint64_t)(63 - v5) <= 0x7F)
  {
    uint64_t v8 = 0;
  }
  else
  {
    unint64_t v21 = v7[9];
    if (v21)
    {
      uint64_t v8 = 1;
LABEL_9:
      uint64_t v10 = (v21 - 1) & v21;
      unint64_t v9 = __clz(__rbit64(v21)) + (v8 << 6);
      goto LABEL_5;
    }
    if (v20 < 0xC0)
    {
      uint64_t v8 = 1;
    }
    else
    {
      unint64_t v21 = v7[10];
      if (v21)
      {
        uint64_t v8 = 2;
        goto LABEL_9;
      }
      if (v20 < 0x100)
      {
        uint64_t v8 = 2;
      }
      else
      {
        unint64_t v21 = v7[11];
        if (v21)
        {
          uint64_t v8 = 3;
          goto LABEL_9;
        }
        uint64_t v35 = 0;
        uint64_t v36 = v20 >> 6;
        uint64_t v37 = 4;
        if (v36 > 4) {
          uint64_t v37 = v36;
        }
        uint64_t v38 = v37 - 4;
        while (v38 != v35)
        {
          unint64_t v21 = v7[v35++ + 12];
          if (v21)
          {
            uint64_t v8 = v35 + 3;
            goto LABEL_9;
          }
        }
        uint64_t v8 = v36 - 1;
      }
    }
  }
  uint64_t v19 = *(void *)(*(void *)(v0 + 96) - 8);
  (*(void (**)(void, uint64_t, uint64_t))(v19 + 56))(*(void *)(v0 + 120), 1, 1);
  uint64_t v10 = 0;
LABEL_12:
  *(void *)(v0 + 168) = v8;
  *(void *)(v0 + 176) = v10;
  uint64_t v22 = *(void *)(v0 + 128);
  uint64_t v23 = *(void *)(v0 + 96);
  (*(void (**)(uint64_t, void, void))(*(void *)(v0 + 112) + 32))(v22, *(void *)(v0 + 120), *(void *)(v0 + 104));
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v19 + 48))(v22, 1, v23) == 1)
  {
    swift_release();
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v24 = *(uint64_t (**)(void))(v0 + 8);
    return v24();
  }
  else
  {
    uint64_t v26 = *(void *)(v0 + 128);
    uint64_t v27 = *(void *)(v0 + 88);
    uint64_t v28 = *(void *)(v0 + 96);
    uint64_t v29 = *(void *)(v0 + 72);
    uint64_t v30 = *(void *)(v0 + 80);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v30 + 32))(v27, v26 + *(int *)(v28 + 48), v29);
    uint64_t v31 = *(void *)(swift_getAssociatedConformanceWitness() + 16);
    uint64_t v39 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v31 + 16) + **(int **)(v31 + 16));
    uint64_t v32 = (void *)swift_task_alloc();
    *(void *)(v0 + 184) = v32;
    *uint64_t v32 = v0;
    v32[1] = sub_25C469CA8;
    uint64_t v33 = *(void *)(v0 + 72);
    uint64_t v34 = *(void *)(v0 + 40);
    return v39(v34, v33, v31);
  }
}

uint64_t sub_25C469CA8()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 192) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 152);
  uint64_t v4 = *(void *)(v2 + 144);
  if (v0) {
    uint64_t v5 = sub_25C46A1E0;
  }
  else {
    uint64_t v5 = sub_25C469DE4;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_25C469DE4()
{
  uint64_t result = (*(uint64_t (**)(void, void))(*(void *)(v0 + 80) + 8))(*(void *)(v0 + 88), *(void *)(v0 + 72));
  int64_t v3 = *(void *)(v0 + 168);
  unint64_t v2 = *(void *)(v0 + 176);
  if (v2)
  {
    uint64_t v4 = (v2 - 1) & v2;
    unint64_t v5 = __clz(__rbit64(v2)) | (v3 << 6);
    uint64_t v6 = *(void *)(v0 + 160);
LABEL_3:
    uint64_t v7 = *(char **)(v0 + 120);
    uint64_t v8 = *(void *)(v0 + 96);
    uint64_t v9 = *(void *)(v0 + 72);
    uint64_t v10 = *(void *)(v0 + 80);
    uint64_t v11 = (uint64_t *)(*(void *)(v6 + 48) + 24 * v5);
    uint64_t v12 = *v11;
    uint64_t v13 = v11[1];
    uint64_t v14 = v11[2];
    *(void *)uint64_t v7 = v12;
    *((void *)v7 + sub_25C45E010("[%@] %s: unblank", (void (*)(void))sub_25C45D9DC, 1) = v13;
    *((void *)v7 + 2) = v14;
    (*(void (**)(char *, unint64_t, uint64_t))(v10 + 16))(&v7[*(int *)(v8 + 48)], *(void *)(v6 + 56) + *(void *)(v10 + 72) * v5, v9);
    uint64_t v15 = *(void *)(v8 - 8);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v7, 0, 1, v8);
    swift_bridgeObjectRetain();
    goto LABEL_19;
  }
  int64_t v16 = v3 + 1;
  if (__OFADD__(v3, 1))
  {
    __break(1u);
    goto LABEL_27;
  }
  int64_t v17 = (unint64_t)((1 << *(unsigned char *)(v0 + 200)) + 63) >> 6;
  if (v16 < v17)
  {
    uint64_t v6 = *(void *)(v0 + 160);
    uint64_t v18 = v6 + 64;
    unint64_t v19 = *(void *)(v6 + 64 + 8 * v16);
    if (v19)
    {
LABEL_7:
      uint64_t v4 = (v19 - 1) & v19;
      unint64_t v5 = __clz(__rbit64(v19)) + (v16 << 6);
      int64_t v3 = v16;
      goto LABEL_3;
    }
    int64_t v20 = v3 + 2;
    ++v3;
    if (v16 + 1 < v17)
    {
      unint64_t v19 = *(void *)(v18 + 8 * v20);
      if (v19)
      {
        ++v16;
        goto LABEL_7;
      }
      int64_t v21 = v16 + 2;
      int64_t v3 = v16 + 1;
      if (v16 + 2 < v17)
      {
        unint64_t v19 = *(void *)(v18 + 8 * v21);
        if (v19)
        {
          v16 += 2;
          goto LABEL_7;
        }
        while (1)
        {
          int64_t v16 = v21 + 1;
          if (__OFADD__(v21, 1)) {
            break;
          }
          if (v16 >= v17)
          {
            int64_t v3 = v17 - 1;
            goto LABEL_18;
          }
          unint64_t v19 = *(void *)(v18 + 8 * v16);
          ++v21;
          if (v19) {
            goto LABEL_7;
          }
        }
LABEL_27:
        __break(1u);
        return result;
      }
    }
  }
LABEL_18:
  uint64_t v15 = *(void *)(*(void *)(v0 + 96) - 8);
  (*(void (**)(void, uint64_t, uint64_t))(v15 + 56))(*(void *)(v0 + 120), 1, 1);
  uint64_t v4 = 0;
LABEL_19:
  *(void *)(v0 + 168) = v3;
  *(void *)(v0 + 176) = v4;
  uint64_t v22 = *(void *)(v0 + 128);
  uint64_t v23 = *(void *)(v0 + 96);
  (*(void (**)(uint64_t, void, void))(*(void *)(v0 + 112) + 32))(v22, *(void *)(v0 + 120), *(void *)(v0 + 104));
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v15 + 48))(v22, 1, v23) == 1)
  {
    swift_release();
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v24 = *(uint64_t (**)(void))(v0 + 8);
    return v24();
  }
  else
  {
    uint64_t v25 = *(void *)(v0 + 128);
    uint64_t v26 = *(void *)(v0 + 88);
    uint64_t v27 = *(void *)(v0 + 96);
    uint64_t v28 = *(void *)(v0 + 72);
    uint64_t v29 = *(void *)(v0 + 80);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v29 + 32))(v26, v25 + *(int *)(v27 + 48), v28);
    uint64_t v30 = *(void *)(swift_getAssociatedConformanceWitness() + 16);
    uint64_t v34 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v30 + 16) + **(int **)(v30 + 16));
    uint64_t v31 = (void *)swift_task_alloc();
    *(void *)(v0 + 184) = v31;
    void *v31 = v0;
    v31[1] = sub_25C469CA8;
    uint64_t v32 = *(void *)(v0 + 72);
    uint64_t v33 = *(void *)(v0 + 40);
    return v34(v33, v32, v30);
  }
}

uint64_t sub_25C46A1E0()
{
  uint64_t v2 = v0[10];
  uint64_t v1 = v0[11];
  uint64_t v3 = v0[9];
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_25C46A29C(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_25C455FD0;
  return sub_25C469694(a1);
}

uint64_t sub_25C46A334()
{
  uint64_t result = swift_getAssociatedTypeWitness();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_checkMetadataState();
    if (v2 <= 0x3F) {
      return swift_initClassMetadata2();
    }
  }
  return result;
}

uint64_t sub_25C46A448()
{
  uint64_t v0 = sub_25C47AA38();
  __swift_allocate_value_buffer(v0, qword_26A5AACA8);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A5AACA8);
  return sub_25C47AA28();
}

uint64_t sub_25C46A4C0()
{
  uint64_t v1 = v0 + *(void *)(*(void *)v0 + 112);
  uint64_t v2 = *(void *)(*(void *)v0 + 80);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 8))(v1, AssociatedTypeWitness);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v0 + *(void *)(*(void *)v0 + 144), v2);
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_25C46A61C()
{
  sub_25C46A4C0();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t type metadata accessor for HostingGroupController()
{
  return swift_getGenericMetadata();
}

uint64_t sub_25C46A68C(uint64_t a1)
{
  unsigned int v22 = a1;
  unint64_t v19 = *(void **)v1;
  uint64_t v2 = v19[11];
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v17 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](a1);
  uint64_t v5 = (char *)&v17 - v4;
  uint64_t v7 = *(void *)(v6 + 120);
  unsigned int v23 = v8;
  *(unsigned char *)(v1 + v7) = v8;
  uint64_t v9 = *(void *)(*(void *)v1 + 152);
  uint64_t v18 = v1;
  uint64_t v10 = (uint64_t *)(v1 + v9);
  swift_beginAccess();
  uint64_t v11 = *v10;
  uint64_t v12 = swift_bridgeObjectRetain();
  if (!MEMORY[0x261185B90](v12, v2))
  {
LABEL_11:
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(void, void, void))(*(void *)(v19[12] + 8) + 8))(v22, v23, v19[10]);
  }
  uint64_t v13 = 0;
  uint64_t v21 = *(void *)(v19[13] + 8);
  int64_t v20 = *(void (**)(void, void, uint64_t, uint64_t))(v21 + 8);
  while (1)
  {
    char v14 = sub_25C47AB38();
    sub_25C47AB08();
    if (v14)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, v11+ ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80))+ *(void *)(v3 + 72) * v13, v2);
      uint64_t v15 = v13 + 1;
      if (__OFADD__(v13, 1)) {
        goto LABEL_10;
      }
      goto LABEL_5;
    }
    uint64_t result = sub_25C47AEB8();
    if (v17 != 8) {
      break;
    }
    uint64_t v24 = result;
    (*(void (**)(char *, uint64_t *, uint64_t))(v3 + 16))(v5, &v24, v2);
    swift_unknownObjectRelease();
    uint64_t v15 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_10:
      __break(1u);
      goto LABEL_11;
    }
LABEL_5:
    v20(v22, v23, v2, v21);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    ++v13;
    if (v15 == MEMORY[0x261185B90](v11, v2)) {
      goto LABEL_11;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_25C46A958(uint64_t a1)
{
  return sub_25C46A68C(a1);
}

uint64_t sub_25C46A97C(uint64_t a1)
{
  v2[5] = a1;
  v2[6] = v1;
  v2[7] = *v1;
  v2[8] = sub_25C47ABD8();
  v2[9] = sub_25C47ABC8();
  uint64_t v4 = sub_25C47AB88();
  v2[10] = v4;
  v2[11] = v3;
  return MEMORY[0x270FA2498](sub_25C46AA40, v4, v3);
}

uint64_t sub_25C46AA40()
{
  uint64_t v1 = v0[5];
  uint64_t v2 = v0[6];
  uint64_t v3 = v2 + *(void *)(*(void *)v2 + 112);
  swift_beginAccess();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 24))(v3, v1, AssociatedTypeWitness);
  swift_endAccess();
  v0[12] = sub_25C47ABC8();
  uint64_t v5 = swift_task_alloc();
  v0[13] = v5;
  *(void *)(v5 + 16) = v2;
  *(void *)(v5 + 24) = v1;
  uint64_t v6 = (void *)swift_task_alloc();
  v0[14] = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_25C46ABD8;
  return MEMORY[0x270FA2158]();
}

uint64_t sub_25C46ABD8()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 88);
  uint64_t v3 = *(void *)(v1 + 80);
  return MEMORY[0x270FA2498](sub_25C46AD38, v3, v2);
}

uint64_t sub_25C46AD38()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25C46AD9C(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  v4[14] = a3;
  v4[15] = a4;
  v4[13] = a2;
  uint64_t v5 = (void *)*a3;
  v4[16] = *a3;
  uint64_t v6 = v5[11];
  v4[17] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v4[18] = v7;
  v4[19] = *(void *)(v7 + 64);
  v4[20] = swift_task_alloc();
  v4[21] = swift_task_alloc();
  v4[22] = v5[12];
  v4[23] = v5[10];
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v4[24] = AssociatedTypeWitness;
  uint64_t v9 = *(void *)(AssociatedTypeWitness - 8);
  v4[25] = v9;
  v4[26] = *(void *)(v9 + 64);
  v4[27] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A8990);
  v4[28] = swift_task_alloc();
  v4[29] = swift_task_alloc();
  v4[30] = swift_task_alloc();
  v4[31] = sub_25C47ABD8();
  v4[32] = sub_25C47ABC8();
  uint64_t v11 = sub_25C47AB88();
  v4[33] = v11;
  v4[34] = v10;
  return MEMORY[0x270FA2498](sub_25C46AFE4, v11, v10);
}

uint64_t sub_25C46AFE4()
{
  uint64_t v1 = *(void *)(v0 + 240);
  uint64_t v2 = *(void *)(v0 + 216);
  uint64_t v4 = *(void *)(v0 + 192);
  uint64_t v3 = *(void *)(v0 + 200);
  uint64_t v67 = *(void *)(v0 + 184);
  uint64_t v69 = *(void *)(v0 + 176);
  uint64_t v5 = *(void *)(v0 + 136);
  uint64_t v65 = *(void *)(v0 + 128);
  uint64_t v7 = *(void *)(v0 + 112);
  uint64_t v6 = *(void *)(v0 + 120);
  uint64_t v8 = sub_25C47ABF8();
  uint64_t v63 = *(void *)(v8 - 8);
  uint64_t v59 = v8;
  uint64_t v58 = *(void (**)(void))(v63 + 56);
  ((void (*)(uint64_t, uint64_t, uint64_t))v58)(v1, 1, 1);
  uint64_t v57 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v57(v2, v6, v4);
  unint64_t v9 = (*(unsigned __int8 *)(v3 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v60 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v10 = (char *)swift_allocObject();
  *((void *)v10 + 2) = 0;
  *((void *)v10 + 3) = 0;
  *((void *)v10 + 4) = v67;
  *((void *)v10 + 5) = v5;
  *((void *)v10 + 6) = v69;
  uint64_t v56 = *(void *)(v65 + 104);
  *((void *)v10 + 7) = v56;
  *((void *)v10 + 8) = v7;
  uint64_t v55 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 32);
  v55(&v10[v9], v2, v4);
  swift_retain();
  sub_25C46BDAC(v1, (uint64_t)&unk_26A5A8EF0, (uint64_t)v10);
  sub_25C45D8AC(v1);
  uint64_t v11 = (uint64_t *)(v7 + *(void *)(*(void *)v7 + 152));
  swift_beginAccess();
  uint64_t v12 = *v11;
  uint64_t v13 = swift_bridgeObjectRetain();
  if (MEMORY[0x261185B90](v13, v5))
  {
    uint64_t v14 = 0;
    uint64_t v15 = *(void *)(v0 + 144);
    unint64_t v54 = (void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16);
    uint64_t v48 = *(void *)(v0 + 152);
    uint64_t v51 = *(void *)(v0 + 208) + 7;
    unsigned int v50 = (uint64_t (**)(uint64_t, uint64_t, uint64_t))(v63 + 48);
    unsigned int v49 = (void (**)(uint64_t, uint64_t))(v63 + 8);
    uint64_t v53 = v12;
    uint64_t v52 = v15;
    do
    {
      char v19 = sub_25C47AB38();
      sub_25C47AB08();
      if (v19)
      {
        (*(void (**)(void, unint64_t, void))(v15 + 16))(*(void *)(v0 + 168), v12+ ((*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80))+ *(void *)(v15 + 72) * v14, *(void *)(v0 + 136));
        uint64_t v20 = v14 + 1;
        if (__OFADD__(v14, 1)) {
          goto LABEL_16;
        }
      }
      else
      {
        uint64_t v39 = sub_25C47AEB8();
        if (v48 != 8)
        {
          __break(1u);
          return MEMORY[0x270FA1E50](v39, v40, v41);
        }
        uint64_t v42 = v39;
        uint64_t v43 = *(void *)(v0 + 168);
        uint64_t v44 = *(void *)(v0 + 136);
        *(void *)(v0 + 96) = v42;
        (*v54)(v43, v0 + 96, v44);
        swift_unknownObjectRelease();
        uint64_t v20 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_16:
          __break(1u);
          break;
        }
      }
      uint64_t v71 = v20;
      uint64_t v72 = v14;
      uint64_t v21 = *(void *)(v0 + 216);
      uint64_t v22 = *(void *)(v0 + 192);
      uint64_t v61 = v22;
      uint64_t v62 = *(void *)(v0 + 184);
      uint64_t v23 = *(void *)(v0 + 168);
      uint64_t v64 = *(void *)(v0 + 176);
      uint64_t v66 = *(void *)(v0 + 232);
      uint64_t v24 = *(void *)(v0 + 160);
      uint64_t v25 = *(void *)(v0 + 136);
      uint64_t v26 = *(void *)(v0 + 120);
      uint64_t v68 = *(void *)(v0 + 112);
      uint64_t v70 = *(void *)(v0 + 224);
      v58();
      uint64_t v27 = *(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 32);
      v27(v24, v23, v25);
      v57(v21, v26, v22);
      unint64_t v28 = (*(unsigned __int8 *)(v15 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
      unint64_t v29 = (v48 + v60 + v28) & ~v60;
      uint64_t v30 = (void *)swift_allocObject();
      v30[2] = 0;
      uint64_t v31 = v30 + 2;
      v30[3] = 0;
      v30[4] = v62;
      v30[5] = v25;
      v30[6] = v64;
      v30[7] = v56;
      v27((uint64_t)v30 + v28, v24, v25);
      v55((char *)v30 + v29, v21, v61);
      *(void *)((char *)v30 + ((v51 + v29) & 0xFFFFFFFFFFFFFFF8)) = v68;
      sub_25C46CDC8(v66, v70);
      LODWORD(v24) = (*v50)(v70, 1, v59);
      swift_retain();
      uint64_t v32 = *(void *)(v0 + 224);
      if (v24 == 1)
      {
        sub_25C45D8AC(*(void *)(v0 + 224));
        if (!*v31) {
          goto LABEL_10;
        }
      }
      else
      {
        sub_25C47ABE8();
        (*v49)(v32, v59);
        if (!*v31)
        {
LABEL_10:
          uint64_t v33 = 0;
          uint64_t v35 = 0;
          goto LABEL_11;
        }
      }
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v33 = sub_25C47AB88();
      uint64_t v35 = v34;
      swift_unknownObjectRelease();
LABEL_11:
      uint64_t v15 = v52;
      uint64_t v36 = **(void **)(v0 + 104);
      uint64_t v37 = swift_allocObject();
      *(void *)(v37 + 16) = &unk_26A5A8F08;
      *(void *)(v37 + 24) = v30;
      uint64_t v38 = v35 | v33;
      if (v35 | v33)
      {
        uint64_t v38 = v0 + 16;
        *(void *)(v0 + 16) = 0;
        *(void *)(v0 + 24) = 0;
        *(void *)(v0 + 32) = v33;
        *(void *)(v0 + 4sub_25C45E010("[%@] %s: blank", (void (*)(void))sub_25C45D9C8, 0) = v35;
      }
      uint64_t v16 = *(void *)(v0 + 232);
      uint64_t v17 = *(void *)(v0 + 136);
      *(void *)(v0 + 72) = 1;
      *(void *)(v0 + 8sub_25C45E010("[%@] %s: blank", (void (*)(void))sub_25C45D9C8, 0) = v38;
      *(void *)(v0 + 88) = v36;
      swift_task_create();
      swift_release();
      sub_25C45D8AC(v16);
      uint64_t v12 = v53;
      uint64_t v18 = MEMORY[0x261185B90](v53, v17);
      uint64_t v14 = v72 + 1;
    }
    while (v71 != v18);
  }
  swift_bridgeObjectRelease();
  uint64_t v45 = sub_25C47ABC8();
  *(void *)(v0 + 28sub_25C45E010("[%@] %s: blank", (void (*)(void))sub_25C45D9C8, 0) = v45;
  uint64_t v46 = (void *)swift_task_alloc();
  *(void *)(v0 + 288) = v46;
  uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A91E0);
  *uint64_t v46 = v0;
  v46[1] = sub_25C46B668;
  uint64_t v40 = MEMORY[0x263F8F500];
  uint64_t v39 = v45;
  return MEMORY[0x270FA1E50](v39, v40, v41);
}

uint64_t sub_25C46B668()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 272);
  uint64_t v3 = *(void *)(v1 + 264);
  return MEMORY[0x270FA2498](sub_25C46B7AC, v3, v2);
}

uint64_t sub_25C46B7AC()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25C46B858(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 32) = a4;
  uint64_t v7 = *(void *)(*(void *)(*(void *)a4 + 96) + 16);
  uint64_t v8 = *(void *)(*(void *)a4 + 80);
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 + 16) + **(int **)(v7 + 16));
  unint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v5 + 4sub_25C45E010("[%@] %s: blank", (void (*)(void))sub_25C45D9C8, 0) = v9;
  *unint64_t v9 = v5;
  v9[1] = sub_25C46B9A8;
  return v11(a5, v8, v7);
}

uint64_t sub_25C46B9A8()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 48) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_25C46BADC, 0, 0);
  }
  else
  {
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_25C46BADC()
{
  uint64_t v23 = v0;
  if (qword_26A5A84E0 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[6];
  uint64_t v2 = sub_25C47AA38();
  __swift_project_value_buffer(v2, (uint64_t)qword_26A5AACA8);
  id v3 = v1;
  id v4 = v1;
  swift_retain();
  uint64_t v5 = sub_25C47AA18();
  os_log_type_t v6 = sub_25C47AD18();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v8 = (void *)v0[6];
  uint64_t v9 = v0[4];
  if (v7)
  {
    os_log_type_t type = v6;
    uint64_t v10 = swift_slowAlloc();
    char v19 = (void *)swift_slowAlloc();
    uint64_t v21 = swift_slowAlloc();
    uint64_t v22 = v21;
    *(_DWORD *)uint64_t v10 = 136446466;
    uint64_t v11 = (uint64_t *)(v9 + *(void *)(*(void *)v9 + 136));
    log = v5;
    uint64_t v12 = *v11;
    unint64_t v13 = v11[1];
    swift_bridgeObjectRetain();
    v0[2] = sub_25C47596C(v12, v13, &v22);
    sub_25C47ADB8();
    swift_bridgeObjectRelease();
    swift_release();
    *(_WORD *)(v10 + 12) = 2114;
    id v14 = v8;
    uint64_t v15 = _swift_stdlib_bridgeErrorToNSError();
    v0[3] = v15;
    sub_25C47ADB8();
    *char v19 = v15;

    _os_log_impl(&dword_25C444000, log, type, "%{public}s: error updating presenter: %{public}@", (uint8_t *)v10, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A9190);
    swift_arrayDestroy();
    MEMORY[0x261186AD0](v19, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x261186AD0](v21, -1, -1);
    MEMORY[0x261186AD0](v10, -1, -1);
  }
  else
  {

    swift_release();
  }
  uint64_t v16 = (uint64_t (*)(void))v0[1];
  return v16();
}

uint64_t sub_25C46BDAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = v3;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A8990);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25C46CDC8(a1, (uint64_t)v10);
  uint64_t v11 = sub_25C47ABF8();
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_25C45D8AC((uint64_t)v10);
    if (*(void *)(a3 + 16))
    {
LABEL_3:
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v13 = sub_25C47AB88();
      uint64_t v15 = v14;
      swift_unknownObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    sub_25C47ABE8();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v10, v11);
    if (*(void *)(a3 + 16)) {
      goto LABEL_3;
    }
  }
  uint64_t v13 = 0;
  uint64_t v15 = 0;
LABEL_6:
  uint64_t v16 = *v4;
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = a2;
  *(void *)(v17 + 24) = a3;
  uint64_t v18 = (void *)(v15 | v13);
  if (v15 | v13)
  {
    v21[0] = 0;
    v21[1] = 0;
    uint64_t v18 = v21;
    v21[2] = v13;
    v21[3] = v15;
  }
  v20[1] = 1;
  v20[2] = v18;
  v20[3] = v16;
  swift_task_create();
  return swift_release();
}

uint64_t sub_25C46BFA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(void *)(v6 + 32) = a6;
  uint64_t v8 = *(void *)(*(void *)(*(void *)a6 + 104) + 16);
  uint64_t v9 = *(void *)(*(void *)a6 + 88);
  uint64_t v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 + 16) + **(int **)(v8 + 16));
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v6 + 4sub_25C45E010("[%@] %s: blank", (void (*)(void))sub_25C45D9C8, 0) = v10;
  *uint64_t v10 = v6;
  v10[1] = sub_25C46C0E4;
  return v12(a5, v9, v8);
}

uint64_t sub_25C46C0E4()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 48) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_25C46C218, 0, 0);
  }
  else
  {
    id v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_25C46C218()
{
  uint64_t v23 = v0;
  if (qword_26A5A84E0 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[6];
  uint64_t v2 = sub_25C47AA38();
  __swift_project_value_buffer(v2, (uint64_t)qword_26A5AACA8);
  id v3 = v1;
  id v4 = v1;
  swift_retain();
  uint64_t v5 = sub_25C47AA18();
  os_log_type_t v6 = sub_25C47AD18();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v8 = (void *)v0[6];
  uint64_t v9 = v0[4];
  if (v7)
  {
    os_log_type_t type = v6;
    uint64_t v10 = swift_slowAlloc();
    char v19 = (void *)swift_slowAlloc();
    uint64_t v21 = swift_slowAlloc();
    uint64_t v22 = v21;
    *(_DWORD *)uint64_t v10 = 136446466;
    uint64_t v11 = (uint64_t *)(v9 + *(void *)(*(void *)v9 + 136));
    log = v5;
    uint64_t v12 = *v11;
    unint64_t v13 = v11[1];
    swift_bridgeObjectRetain();
    v0[2] = sub_25C47596C(v12, v13, &v22);
    sub_25C47ADB8();
    swift_bridgeObjectRelease();
    swift_release();
    *(_WORD *)(v10 + 12) = 2114;
    id v14 = v8;
    uint64_t v15 = _swift_stdlib_bridgeErrorToNSError();
    v0[3] = v15;
    sub_25C47ADB8();
    *char v19 = v15;

    _os_log_impl(&dword_25C444000, log, type, "%{public}s: error updating presentable: %{public}@", (uint8_t *)v10, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A9190);
    swift_arrayDestroy();
    MEMORY[0x261186AD0](v19, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x261186AD0](v21, -1, -1);
    MEMORY[0x261186AD0](v10, -1, -1);
  }
  else
  {

    swift_release();
  }
  uint64_t v16 = (uint64_t (*)(void))v0[1];
  return v16();
}

uint64_t sub_25C46C4E8(uint64_t a1)
{
  id v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *id v3 = v1;
  v3[1] = sub_25C455FD0;
  return sub_25C46A97C(a1);
}

uint64_t sub_25C46C580(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 104);
}

uint64_t sub_25C46C588(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t sub_25C46C5C4(void (*a1)(void))
{
  a1();
  return _swift_stdlib_bridgeErrorToNSError();
}

uint64_t sub_25C46C5FC(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_25C46C624(uint64_t a1, int *a2)
{
  os_log_type_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  id v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_25C46C700;
  return v6(a1);
}

uint64_t sub_25C46C700()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_25C46C7F8(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *(void **)(v2 + 16);
  uint64_t v6 = *(void *)(v2 + 24);
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v8;
  void *v8 = v3;
  v8[1] = sub_25C455FD0;
  return sub_25C46AD9C(a1, a2, v7, v6);
}

uint64_t sub_25C46C8AC()
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v2 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 72) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, AssociatedTypeWitness);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_25C46C99C(uint64_t a1)
{
  uint64_t v4 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = v1[8];
  uint64_t v8 = (uint64_t)v1 + ((*(unsigned __int8 *)(v4 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_25C45D99C;
  return sub_25C46B858(a1, v5, v6, v7, v8);
}

uint64_t sub_25C46CAB4()
{
  uint64_t v1 = *(void *)(v0 + 40);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 64) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v7 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = (v5 + v8) & ~v8;
  uint64_t v10 = v3 | v8 | 7;
  unint64_t v11 = ((*(void *)(v7 + 64) + v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v9, AssociatedTypeWitness);
  swift_release();
  return MEMORY[0x270FA0238](v0, v11, v10);
}

uint64_t sub_25C46CC30(uint64_t a1)
{
  uint64_t v3 = v2;
  unint64_t v5 = (*(unsigned __int8 *)(*(void *)(v1[5] - 8) + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v1[5] - 8) + 80);
  unint64_t v6 = v5 + *(void *)(*(void *)(v1[5] - 8) + 64);
  uint64_t v7 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  unint64_t v8 = (v6 + *(unsigned __int8 *)(v7 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = v1[2];
  uint64_t v10 = v1[3];
  uint64_t v11 = (uint64_t)v1 + v5;
  uint64_t v12 = (uint64_t)v1 + v8;
  uint64_t v13 = *(void *)((char *)v1 + ((*(void *)(v7 + 64) + v8 + 7) & 0xFFFFFFFFFFFFFFF8));
  id v14 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v14;
  *id v14 = v3;
  v14[1] = sub_25C45D99C;
  return sub_25C46BFA4(a1, v9, v10, v11, v12, v13);
}

uint64_t sub_25C46CDC8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A8990);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25C46CE30()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25C46CE68(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *unint64_t v5 = v2;
  v5[1] = sub_25C45D99C;
  unint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_26A5A8F00 + dword_26A5A8F00);
  return v6(a1, v4);
}

uint64_t sub_25C46CF20(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *unint64_t v5 = v2;
  v5[1] = sub_25C455FD0;
  unint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_26A5A8F00 + dword_26A5A8F00);
  return v6(a1, v4);
}

uint64_t sub_25C46CFDC()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_25C46D07C()
{
  (*(void (**)(uint64_t))(*(void *)(*(void *)(*(void *)v0 + 80) - 8) + 8))(v0 + *(void *)(*(void *)v0 + 96));
  return v0;
}

uint64_t sub_25C46D0EC()
{
  (*(void (**)(uint64_t))(*(void *)(*(void *)(*(void *)v0 + 80) - 8) + 8))(v0 + *(void *)(*(void *)v0 + 96));
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t type metadata accessor for RecursiveDisplayBlanker()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_25C46D1B0()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 104);
  uint64_t v3 = *(uint64_t *)((char *)v0 + v2);
  BOOL v4 = __OFADD__(v3, 1);
  uint64_t v5 = v3 + 1;
  if (v4)
  {
    __break(1u);
  }
  else
  {
    *(uint64_t *)((char *)v0 + v2) = v5;
    if (v5 == 1) {
      return (*(uint64_t (**)(void))(*(void *)(v1 + 88) + 24))(*(void *)(v1 + 80));
    }
  }
  return result;
}

uint64_t sub_25C46D258()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 104);
  uint64_t v3 = *(uint64_t *)((char *)v0 + v2);
  BOOL v4 = __OFSUB__(v3, 1);
  uint64_t v5 = v3 - 1;
  if (v4)
  {
    __break(1u);
    goto LABEL_7;
  }
  *(uint64_t *)((char *)v0 + v2) = v5;
  if (v5 < 0)
  {
LABEL_7:
    uint64_t result = sub_25C47AF18();
    __break(1u);
    return result;
  }
  if (!v5) {
    return (*(uint64_t (**)(void))(*(void *)(v1 + 88) + 32))(*(void *)(v1 + 80));
  }
  return result;
}

uint64_t sub_25C46D354(uint64_t a1)
{
  uint64_t v4 = *v1;
  v2[2] = sub_25C47ABD8();
  v2[3] = sub_25C47ABC8();
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)(*(void *)(v4 + 88) + 8);
  uint64_t v7 = *(void *)(v5 + 80);
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 + 16) + **(int **)(v6 + 16));
  uint64_t v8 = (void *)swift_task_alloc();
  v2[4] = v8;
  void *v8 = v2;
  v8[1] = sub_25C46D4BC;
  return v10(a1, v7, v6);
}

uint64_t sub_25C46D4BC()
{
  *(void *)(*(void *)v1 + 4sub_25C45E010("[%@] %s: blank", (void (*)(void))sub_25C45D9C8, 0) = v0;
  swift_task_dealloc();
  uint64_t v3 = sub_25C47AB88();
  if (v0) {
    uint64_t v4 = sub_25C46D67C;
  }
  else {
    uint64_t v4 = sub_25C46D618;
  }
  return MEMORY[0x270FA2498](v4, v3, v2);
}

uint64_t sub_25C46D618()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25C46D67C()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25C46D6E0()
{
  return sub_25C46D1B0();
}

uint64_t sub_25C46D704()
{
  return sub_25C46D258();
}

uint64_t sub_25C46D728()
{
  return sub_25C4785BC();
}

uint64_t sub_25C46D774(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_25C455FD0;
  return sub_25C46D354(a1);
}

uint64_t sub_25C46D80C(uint64_t a1)
{
  *(void *)(a1 + 8) = swift_getWitnessTable();
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t sub_25C46D86C(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  v2[4] = sub_25C47ABD8();
  v2[5] = sub_25C47ABC8();
  uint64_t v4 = sub_25C47AB88();
  v2[6] = v4;
  v2[7] = v3;
  return MEMORY[0x270FA2498](sub_25C46D908, v4, v3);
}

uint64_t sub_25C46D908()
{
  long long v7 = *(_OWORD *)(v0 + 16);
  uint64_t v1 = sub_25C47ABC8();
  *(void *)(v0 + 64) = v1;
  uint64_t v2 = swift_task_alloc();
  *(void *)(v0 + 72) = v2;
  *(_OWORD *)(v2 + 16) = v7;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 8sub_25C45E010("[%@] %s: blank", (void (*)(void))sub_25C45D9C8, 0) = v3;
  *uint64_t v3 = v0;
  uint64_t v4 = MEMORY[0x263F8EE60];
  v3[1] = sub_25C46DA18;
  uint64_t v5 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA2318](v3, v1, v5, 0xD000000000000012, 0x800000025C4809B0, sub_25C46DD80, v2, v4 + 8);
}

uint64_t sub_25C46DA18()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 56);
  uint64_t v3 = *(void *)(v1 + 48);
  return MEMORY[0x270FA2498](sub_25C46DB78, v3, v2);
}

uint64_t sub_25C46DB78()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void sub_25C46DBD8(uint64_t a1, void *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A8FB8);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v4);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
  unint64_t v7 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v8 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v8 + v7, (char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  aBlock[4] = sub_25C46DE1C;
  aBlock[5] = v8;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_25C46DE84;
  aBlock[3] = &block_descriptor_2;
  uint64_t v9 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(a2, sel_updateTransformsWithCompletion_, v9);
  _Block_release(v9);
}

void sub_25C46DD80(uint64_t a1)
{
  sub_25C46DBD8(a1, *(void **)(v1 + 24));
}

uint64_t sub_25C46DD88()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A8FB8);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_25C46DE1C()
{
  return sub_25C47ABA8();
}

uint64_t sub_25C46DE84(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 4sub_25C45E010("[%@] %s: blank", (void (*)(void))sub_25C45D9C8, 0) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t sub_25C46DEE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 8sub_25C45E010("[%@] %s: blank", (void (*)(void))sub_25C45D9C8, 0) = 0;
  *(void *)(v5 + 88) = 0;
  sub_25C47AE98();
  sub_25C47AAB8();
  sub_25C457A30(0, &qword_26A5A9228);
  sub_25C47AEF8();
  sub_25C47AAB8();
  *(void *)(v5 + 16) = 0;
  *(void *)(v5 + 24) = 0xE000000000000000;
  *(void *)(v5 + 32) = a1;
  *(void *)(v5 + 4sub_25C45E010("[%@] %s: blank", (void (*)(void))sub_25C45D9C8, 0) = a2;
  *(void *)(v5 + 48) = a3;
  *(void *)(v5 + 56) = a4;
  *(unsigned char *)(v5 + 64) = 1;
  *(void *)(v5 + 72) = a5;
  return v5;
}

uint64_t sub_25C46DFE0()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25C45D99C;
  return sub_25C46E070();
}

uint64_t sub_25C46E070()
{
  v1[17] = v0;
  uint64_t v2 = sub_25C47AA38();
  v1[18] = v2;
  v1[19] = *(void *)(v2 - 8);
  v1[20] = swift_task_alloc();
  v1[21] = sub_25C47ABD8();
  v1[22] = sub_25C47ABC8();
  uint64_t v4 = sub_25C47AB88();
  v1[23] = v4;
  v1[24] = v3;
  return MEMORY[0x270FA2498](sub_25C46E168, v4, v3);
}

uint64_t sub_25C46E168()
{
  uint64_t v1 = *(void *)(v0 + 136);
  *(unsigned char *)(v0 + 449) = *(unsigned char *)(v1 + 64);
  uint64_t v2 = *(void **)(v1 + 72);
  *(void *)(v0 + 20sub_25C45E010("[%@] %s: blank", (void (*)(void))sub_25C45D9C8, 0) = v2;
  id v3 = v2;
  *(void *)(v0 + 208) = sub_25C47ABC8();
  *(void *)(v0 + 216) = sub_25C47ABC8();
  uint64_t v5 = sub_25C47AB88();
  *(void *)(v0 + 224) = v5;
  *(void *)(v0 + 232) = v4;
  return MEMORY[0x270FA2498](sub_25C46E214, v5, v4);
}

uint64_t sub_25C46E214()
{
  uint64_t v1 = sub_25C47ABC8();
  v0[30] = v1;
  uint64_t v2 = (void *)swift_task_alloc();
  v0[31] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_25C46E304;
  uint64_t v3 = v0[26];
  uint64_t v4 = MEMORY[0x263F8F500];
  uint64_t v5 = MEMORY[0x263F8D4F8];
  return MEMORY[0x270FA2318](v0 + 56, v1, v4, 0xD000000000000010, 0x800000025C4801E0, sub_25C45D7C0, v3, v5);
}

uint64_t sub_25C46E304()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 232);
  uint64_t v3 = *(void *)(v1 + 224);
  return MEMORY[0x270FA2498](sub_25C46E448, v3, v2);
}

uint64_t sub_25C46E448()
{
  swift_release();
  swift_release();
  *(unsigned char *)(v0 + 45sub_25C45E010("[%@] %s: blank", (void (*)(void))sub_25C45D9C8, 0) = *(unsigned char *)(v0 + 448);
  uint64_t v1 = *(void *)(v0 + 184);
  uint64_t v2 = *(void *)(v0 + 192);
  return MEMORY[0x270FA2498](sub_25C46E4BC, v1, v2);
}

uint64_t sub_25C46E4BC()
{
  uint64_t v57 = v0;
  if (*(unsigned char *)(v0 + 450) != 1)
  {
    swift_release();
    if (qword_26A5A8498 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(*(void *)(v0 + 144), (uint64_t)qword_26A5AAC70);
    swift_retain_n();
    uint64_t v7 = sub_25C47AA18();
    os_log_type_t v8 = sub_25C47AD08();
    BOOL v9 = os_log_type_enabled(v7, v8);
    uint64_t v10 = *(void **)(v0 + 200);
    uint64_t v11 = *(void *)(v0 + 136);
    if (v9)
    {
      unint64_t v54 = *(void **)(v0 + 200);
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      uint64_t v13 = swift_slowAlloc();
      uint64_t v56 = v13;
      *(_DWORD *)uint64_t v12 = 136446210;
      uint64_t v15 = *(void *)(v11 + 16);
      unint64_t v14 = *(void *)(v11 + 24);
      swift_bridgeObjectRetain();
      *(void *)(v0 + 4sub_25C45E010("[%@] %s: blank", (void (*)(void))sub_25C45D9C8, 0) = sub_25C47596C(v15, v14, &v56);
      sub_25C47ADB8();
      swift_bridgeObjectRelease();
      swift_release_n();
      _os_log_impl(&dword_25C444000, v7, v8, "%{public}s somebody requested an update after us. short-circuiting.", v12, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x261186AD0](v13, -1, -1);
      MEMORY[0x261186AD0](v12, -1, -1);
    }
    else
    {

      swift_release_n();
    }
    goto LABEL_19;
  }
  uint64_t v1 = *(void *)(v0 + 136);
  uint64_t v2 = swift_beginAccess();
  LODWORD(v5) = *(unsigned __int8 *)(v0 + 449);
  if (*(void *)(v1 + 88))
  {
    uint64_t v6 = *(unsigned __int8 *)(v1 + 80);
    if (v6 == v5) {
      goto LABEL_17;
    }
  }
  else
  {
    if (v5 == 1)
    {
LABEL_18:

      swift_release();
LABEL_19:
      swift_task_dealloc();
      uint64_t v39 = *(uint64_t (**)(void))(v0 + 8);
      return v39();
    }
    uint64_t v6 = 1;
  }
  uint64_t v2 = sub_25C4706A4(*(unsigned __int8 *)(v0 + 449), (uint64_t)&unk_2709A71B8);
  uint64_t v5 = *(unsigned __int8 *)(v0 + 449);
  if (v2)
  {
    swift_release();
    sub_25C471618(v6, v5);
    if (qword_26A5A8498 != -1) {
      swift_once();
    }
    uint64_t v16 = *(void **)(v0 + 200);
    uint64_t v18 = *(void *)(v0 + 152);
    uint64_t v17 = *(void *)(v0 + 160);
    uint64_t v19 = *(void *)(v0 + 144);
    uint64_t v20 = __swift_project_value_buffer(v19, (uint64_t)qword_26A5AAC70);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16))(v17, v20, v19);
    id v21 = v16;
    swift_retain_n();
    id v22 = v21;
    uint64_t v23 = sub_25C47AA18();
    os_log_type_t v24 = sub_25C47AD28();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = *(void *)(v0 + 136);
      uint64_t v26 = swift_slowAlloc();
      uint64_t v55 = swift_slowAlloc();
      uint64_t v56 = v55;
      *(_DWORD *)uint64_t v26 = 136446722;
      uint64_t v28 = *(void *)(v25 + 16);
      unint64_t v27 = *(void *)(v25 + 24);
      swift_bridgeObjectRetain();
      *(void *)(v0 + 12sub_25C45E010("[%@] %s: blank", (void (*)(void))sub_25C45D9C8, 0) = sub_25C47596C(v28, v27, &v56);
      sub_25C47ADB8();
      swift_bridgeObjectRelease();
      swift_release_n();
      uint64_t v29 = 8 * (char)v6;
      uint64_t v30 = *(void *)&aActive_4[v29];
      *(_WORD *)(v26 + 12) = 2082;
      uint64_t v31 = *(void **)(v0 + 200);
      uint64_t v32 = *(char *)(v0 + 449);
      *(void *)(v0 + 128) = sub_25C47596C(v30, *(void *)&aInactivediscon_2[v29 + 16], &v56);
      sub_25C47ADB8();
      swift_bridgeObjectRelease();
      *(_WORD *)(v26 + 22) = 2082;

      uint64_t v33 = *(void *)&aActive_4[8 * v32];
      unint64_t v34 = *(void *)&aInactivediscon_2[8 * v32 + 16];
      uint64_t v35 = *(void **)(v0 + 200);
      uint64_t v37 = *(void *)(v0 + 152);
      uint64_t v36 = *(void *)(v0 + 160);
      uint64_t v38 = *(void *)(v0 + 144);
      *(void *)(v0 + 88) = sub_25C47596C(v33, v34, &v56);
      sub_25C47ADB8();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_25C444000, v23, v24, "%{public}s transitioning from %{public}s to %{public}s. short-circuiting update and telling coordinator directly", (uint8_t *)v26, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x261186AD0](v55, -1, -1);
      MEMORY[0x261186AD0](v26, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v36, v38);
    }
    else
    {
      unsigned int v50 = *(void **)(v0 + 200);
      uint64_t v52 = *(void *)(v0 + 152);
      uint64_t v51 = *(void *)(v0 + 160);
      uint64_t v53 = *(void *)(v0 + 144);

      swift_release_n();
      (*(void (**)(uint64_t, uint64_t))(v52 + 8))(v51, v53);
    }
    goto LABEL_19;
  }
LABEL_17:
  if (v5) {
    goto LABEL_18;
  }
  uint64_t v41 = *(void *)(*(void *)(v0 + 136) + 48);
  *(void *)(v0 + 256) = v41;
  uint64_t v42 = *(void *)(v41 + 24);
  BOOL v43 = __OFADD__(v42, 1);
  uint64_t v44 = v42 + 1;
  if (v43)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v41 + 24) = v44;
    if (v44 == 1) {
      sub_25C45DFC8();
    }
    uint64_t v45 = *(void *)(v0 + 136);
    uint64_t v46 = *(void **)(v45 + 72);
    *(void *)(v0 + 264) = v46;
    *(void *)(v0 + 272) = *(void *)(v45 + 32);
    id v47 = v46;
    *(void *)(v0 + 28sub_25C45E010("[%@] %s: blank", (void (*)(void))sub_25C45D9C8, 0) = sub_25C47ABC8();
    uint64_t v48 = sub_25C47AB88();
    uint64_t v4 = v49;
    *(void *)(v0 + 288) = v48;
    *(void *)(v0 + 296) = v49;
    uint64_t v2 = (uint64_t)sub_25C46EAEC;
    uint64_t v3 = v48;
  }
  return MEMORY[0x270FA2498](v2, v3, v4);
}

uint64_t sub_25C46EAEC()
{
  id v1 = sub_25C457E98(*(void **)(v0 + 264));
  *(void *)(v0 + 304) = v1;
  id v2 = sub_25C457D84();
  sub_25C457A30(0, &qword_26A5A8848);
  char v3 = sub_25C47AD88();

  if (v3)
  {

    swift_release();
    uint64_t v4 = *(void *)(v0 + 184);
    uint64_t v5 = *(void *)(v0 + 192);
    uint64_t v6 = sub_25C46EE08;
  }
  else
  {
    *(void *)(v0 + 312) = sub_25C47ABC8();
    uint64_t v7 = sub_25C47AB88();
    uint64_t v5 = v8;
    *(void *)(v0 + 32sub_25C45E010("[%@] %s: blank", (void (*)(void))sub_25C45D9C8, 0) = v7;
    *(void *)(v0 + 328) = v8;
    uint64_t v6 = sub_25C46EBFC;
    uint64_t v4 = v7;
  }
  return MEMORY[0x270FA2498](v6, v4, v5);
}

uint64_t sub_25C46EBFC()
{
  id v1 = *(void **)(v0 + 304);
  id v2 = *(void **)(v0 + 272);
  type metadata accessor for CADisplayActor();
  id v3 = v2;
  id v4 = v1;
  swift_initStaticObject();
  sub_25C45869C();
  uint64_t v6 = sub_25C47AB88();
  return MEMORY[0x270FA2498](sub_25C46ECAC, v6, v5);
}

uint64_t sub_25C46ECAC()
{
  objc_msgSend(*(id *)(v0 + 272), sel_setDisplayProperties_, *(void *)(v0 + 304));
  uint64_t v1 = *(void *)(v0 + 320);
  uint64_t v2 = *(void *)(v0 + 328);
  return MEMORY[0x270FA2498](sub_25C46ED1C, v1, v2);
}

uint64_t sub_25C46ED1C()
{
  uint64_t v1 = *(void **)(v0 + 272);

  swift_release();
  uint64_t v2 = *(void *)(v0 + 288);
  uint64_t v3 = *(void *)(v0 + 296);
  return MEMORY[0x270FA2498](sub_25C46ED90, v2, v3);
}

uint64_t sub_25C46ED90()
{
  swift_release();
  uint64_t v1 = *(void *)(v0 + 184);
  uint64_t v2 = *(void *)(v0 + 192);
  return MEMORY[0x270FA2498](sub_25C46EE08, v1, v2);
}

uint64_t sub_25C46EE08()
{
  uint64_t v48 = v0;
  uint64_t v1 = *(void *)(v0 + 136);
  if (*(unsigned char *)(v1 + 64)
    || (uint64_t v2 = *(void **)(v1 + 72),
        *(void *)(v0 + 336) = sub_25C457A30(0, (unint64_t *)&unk_26A5A8830),
        id v3 = v2,
        char v4 = sub_25C47AD88(),
        v3,
        (v4 & 1) == 0))
  {
    swift_release();
    if (qword_26A5A8498 != -1) {
      swift_once();
    }
    id v22 = *(void **)(v0 + 200);
    __swift_project_value_buffer(*(void *)(v0 + 144), (uint64_t)qword_26A5AAC70);
    swift_retain_n();
    id v23 = v22;
    os_log_type_t v24 = sub_25C47AA18();
    os_log_type_t v25 = sub_25C47AD28();
    BOOL v26 = os_log_type_enabled(v24, v25);
    unint64_t v27 = *(void **)(v0 + 200);
    uint64_t v28 = *(void *)(v0 + 136);
    if (v26)
    {
      os_log_type_t type = v25;
      uint64_t v29 = swift_slowAlloc();
      uint64_t v46 = swift_slowAlloc();
      uint64_t v47 = v46;
      *(_DWORD *)uint64_t v29 = 136446722;
      uint64_t v31 = *(void *)(v28 + 16);
      unint64_t v30 = *(void *)(v28 + 24);
      swift_bridgeObjectRetain();
      *(void *)(v0 + 56) = sub_25C47596C(v31, v30, &v47);
      sub_25C47ADB8();
      swift_bridgeObjectRelease();
      *(_WORD *)(v29 + 12) = 2082;
      uint64_t v32 = sub_25C476C08();
      *(void *)(v0 + 64) = sub_25C47596C(v32, v33, &v47);
      sub_25C47ADB8();
      swift_bridgeObjectRelease();

      *(_WORD *)(v29 + 22) = 2082;
      id v34 = *(id *)(v28 + 72);
      swift_release();
      uint64_t v35 = sub_25C476C08();
      unint64_t v37 = v36;

      *(void *)(v0 + 72) = sub_25C47596C(v35, v37, &v47);
      sub_25C47ADB8();
      swift_bridgeObjectRelease();
      swift_release();
      _os_log_impl(&dword_25C444000, v24, type, "%{public}s early return post-display: updateContext changed from %{public}s to %{public}s", (uint8_t *)v29, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x261186AD0](v46, -1, -1);
      MEMORY[0x261186AD0](v29, -1, -1);
    }
    else
    {
      swift_release_n();
    }
    uint64_t v38 = *(void *)(v0 + 256);
    uint64_t v39 = *(void *)(v38 + 24);
    BOOL v19 = __OFSUB__(v39, 1);
    uint64_t v40 = v39 - 1;
    if (!v19)
    {
      *(void *)(v38 + 24) = v40;
      if ((v40 & 0x8000000000000000) == 0)
      {
        if (!v40) {
          goto LABEL_11;
        }
LABEL_20:
        id v21 = *(void **)(v0 + 200);
        goto LABEL_21;
      }
      return sub_25C47AF18();
    }
    __break(1u);
    goto LABEL_30;
  }
  uint64_t v5 = *(void *)(v0 + 136);
  uint64_t v6 = *(void **)(v5 + 88);
  if (!v6)
  {
LABEL_26:
    *(void *)(v0 + 344) = *(void *)(v5 + 40);
    *(void *)(v0 + 352) = sub_25C47ABC8();
    uint64_t v43 = sub_25C47AB88();
    uint64_t v17 = v44;
    *(void *)(v0 + 36sub_25C45E010("[%@] %s: blank", (void (*)(void))sub_25C45D9C8, 0) = v43;
    *(void *)(v0 + 368) = v44;
    uint64_t v15 = sub_25C46F2DC;
    uint64_t v16 = v43;
    return MEMORY[0x270FA2498](v15, v16, v17);
  }
  id v7 = *(id *)(v0 + 200);
  id v8 = v6;
  char v9 = sub_25C47AD88();

  if ((v9 & 1) == 0)
  {
    uint64_t v5 = *(void *)(v0 + 136);
    goto LABEL_26;
  }
  swift_release();
  uint64_t v10 = *(void *)(v0 + 136);
  uint64_t v11 = *(void **)(v10 + 88);
  if (!v11 || *(unsigned char *)(v10 + 80))
  {
    sub_25C471618(1, 0);
    uint64_t v11 = *(void **)(v10 + 88);
    uint64_t v10 = *(void *)(v0 + 136);
  }
  uint64_t v12 = *(void *)(v0 + 256);
  uint64_t v13 = *(void **)(v0 + 200);
  *(void *)(v10 + 8sub_25C45E010("[%@] %s: blank", (void (*)(void))sub_25C45D9C8, 0) = 0;
  *(void *)(v10 + 88) = v13;
  id v14 = v13;

  uint64_t v18 = *(void *)(v12 + 24);
  BOOL v19 = __OFSUB__(v18, 1);
  uint64_t v20 = v18 - 1;
  if (v19)
  {
LABEL_30:
    __break(1u);
    return MEMORY[0x270FA2498](v15, v16, v17);
  }
  *(void *)(*(void *)(v0 + 256) + 24) = v20;
  if (v20 < 0) {
    return sub_25C47AF18();
  }
  if (v20) {
    goto LABEL_20;
  }
LABEL_11:
  id v21 = *(void **)(v0 + 200);
  sub_25C45DFEC();
LABEL_21:

  swift_task_dealloc();
  uint64_t v41 = *(uint64_t (**)(void))(v0 + 8);
  return v41();
}

uint64_t sub_25C46F2DC()
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 376) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_25C46F388;
  return sub_25C46D86C(ObjectType);
}

uint64_t sub_25C46F388()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 368);
  uint64_t v3 = *(void *)(v1 + 360);
  return MEMORY[0x270FA2498](sub_25C46F4A8, v3, v2);
}

uint64_t sub_25C46F4A8()
{
  uint64_t v1 = v0[43];
  swift_release();
  uint64_t v2 = *(void **)(v1 + OBJC_IVAR___SSKUpdateDisplayTransformsAdapter_displayConfiguration);
  v0[48] = v2;
  uint64_t v3 = v0[23];
  uint64_t v4 = v0[24];
  id v5 = v2;
  return MEMORY[0x270FA2498](sub_25C46F534, v3, v4);
}

uint64_t sub_25C46F534()
{
  unint64_t v36 = v0;
  uint64_t v1 = v0[17];
  if (!*(unsigned char *)(v1 + 64))
  {
    id v2 = *(id *)(v1 + 72);
    char v3 = sub_25C47AD88();

    if (v3)
    {
      v0[49] = sub_25C47ABC8();
      uint64_t v4 = sub_25C47AB88();
      uint64_t v6 = v5;
      v0[50] = v4;
      v0[51] = v5;
      uint64_t v7 = sub_25C46F958;
      uint64_t v8 = v4;
      return MEMORY[0x270FA2498](v7, v8, v6);
    }
  }
  swift_release();
  if (qword_26A5A8498 != -1) {
    swift_once();
  }
  char v9 = (void *)v0[25];
  __swift_project_value_buffer(v0[18], (uint64_t)qword_26A5AAC70);
  swift_retain_n();
  id v10 = v9;
  uint64_t v11 = sub_25C47AA18();
  os_log_type_t v12 = sub_25C47AD28();
  BOOL v13 = os_log_type_enabled(v11, v12);
  id v14 = (void *)v0[48];
  uint64_t v15 = (void *)v0[25];
  uint64_t v16 = v0[17];
  if (v13)
  {
    id v34 = (void *)v0[48];
    uint64_t v17 = swift_slowAlloc();
    uint64_t v33 = swift_slowAlloc();
    uint64_t v35 = v33;
    *(_DWORD *)uint64_t v17 = 136446722;
    uint64_t v18 = *(void *)(v16 + 16);
    unint64_t v19 = *(void *)(v16 + 24);
    swift_bridgeObjectRetain();
    v0[10] = sub_25C47596C(v18, v19, &v35);
    sub_25C47ADB8();
    swift_bridgeObjectRelease();
    swift_release();
    *(_WORD *)(v17 + 12) = 2082;
    uint64_t v20 = sub_25C476C08();
    v0[6] = sub_25C47596C(v20, v21, &v35);
    sub_25C47ADB8();
    swift_bridgeObjectRelease();

    *(_WORD *)(v17 + 22) = 2082;
    id v22 = *(id *)(v16 + 72);
    swift_release();
    uint64_t v23 = sub_25C476C08();
    unint64_t v25 = v24;

    v0[12] = sub_25C47596C(v23, v25, &v35);
    sub_25C47ADB8();
    swift_bridgeObjectRelease();
    swift_release();
    _os_log_impl(&dword_25C444000, v11, v12, "%{public}s early return post-UpdateTransforms: updateContext changed from %{public}s to %{public}s", (uint8_t *)v17, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x261186AD0](v33, -1, -1);
    MEMORY[0x261186AD0](v17, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  uint64_t v26 = v0[32];
  uint64_t v27 = *(void *)(v26 + 24);
  BOOL v28 = __OFSUB__(v27, 1);
  uint64_t v29 = v27 - 1;
  if (v28)
  {
    __break(1u);
    return MEMORY[0x270FA2498](v7, v8, v6);
  }
  *(void *)(v26 + 24) = v29;
  if (v29 < 0) {
    return sub_25C47AF18();
  }
  unint64_t v30 = (void *)v0[25];
  if (!v29) {
    sub_25C45DFEC();
  }

  swift_task_dealloc();
  uint64_t v32 = (uint64_t (*)(void))v0[1];
  return v32();
}

uint64_t sub_25C46F958()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 416) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25C46F9F4;
  uint64_t v2 = *(void *)(v0 + 384);
  return sub_25C45E420(v2);
}

uint64_t sub_25C46F9F4()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 424) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 408);
  uint64_t v4 = *(void *)(v2 + 400);
  if (v0) {
    uint64_t v5 = sub_25C46FD80;
  }
  else {
    uint64_t v5 = sub_25C46FB30;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_25C46FB30()
{
  swift_release();
  uint64_t v1 = *(void *)(v0 + 184);
  uint64_t v2 = *(void *)(v0 + 192);
  return MEMORY[0x270FA2498](sub_25C46FB94, v1, v2);
}

uint64_t sub_25C46FB94()
{
  uint64_t v4 = (uint64_t (*)(uint64_t))((char *)&dword_26A5A9198 + dword_26A5A9198);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 432) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25C46FC44;
  uint64_t v2 = *(void *)(v0 + 384);
  return v4(v2);
}

uint64_t sub_25C46FC44()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 44sub_25C45E010("[%@] %s: blank", (void (*)(void))sub_25C45D9C8, 0) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 192);
  uint64_t v4 = *(void *)(v2 + 184);
  if (v0) {
    uint64_t v5 = sub_25C4702EC;
  }
  else {
    uint64_t v5 = sub_25C47019C;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_25C46FD80()
{
  swift_release();
  uint64_t v1 = *(void *)(v0 + 184);
  uint64_t v2 = *(void *)(v0 + 192);
  return MEMORY[0x270FA2498](sub_25C46FDE4, v1, v2);
}

void sub_25C46FDE4()
{
  BOOL v28 = v0;
  uint64_t v1 = (void *)v0[53];
  swift_release();
  if (qword_26A5A8498 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v0[18], (uint64_t)qword_26A5AAC70);
  swift_retain();
  id v2 = v1;
  swift_retain();
  id v3 = v1;
  uint64_t v4 = sub_25C47AA18();
  os_log_type_t v5 = sub_25C47AD18();
  BOOL v6 = os_log_type_enabled(v4, v5);
  uint64_t v7 = (void *)v0[48];
  uint64_t v8 = v0[17];
  if (v6)
  {
    uint64_t v26 = (void *)v0[48];
    uint64_t v9 = swift_slowAlloc();
    id v10 = (void *)swift_slowAlloc();
    uint64_t v25 = swift_slowAlloc();
    uint64_t v27 = v25;
    *(_DWORD *)uint64_t v9 = 136446466;
    uint64_t v12 = *(void *)(v8 + 16);
    unint64_t v11 = *(void *)(v8 + 24);
    swift_bridgeObjectRetain();
    v0[13] = sub_25C47596C(v12, v11, &v27);
    sub_25C47ADB8();
    swift_bridgeObjectRelease();
    swift_release_n();
    *(_WORD *)(v9 + 12) = 2112;
    id v13 = v1;
    uint64_t v14 = _swift_stdlib_bridgeErrorToNSError();
    v0[14] = v14;
    sub_25C47ADB8();
    *id v10 = v14;

    _os_log_impl(&dword_25C444000, v4, v5, "%{public}s failed updating blanker and coordinator: %@", (uint8_t *)v9, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A9190);
    swift_arrayDestroy();
    MEMORY[0x261186AD0](v10, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x261186AD0](v25, -1, -1);
    MEMORY[0x261186AD0](v9, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  uint64_t v15 = v0[17];
  uint64_t v16 = *(void **)(v15 + 88);
  if (!v16 || *(unsigned char *)(v15 + 80))
  {
    sub_25C471618(1, 0);
    uint64_t v16 = *(void **)(v15 + 88);
    uint64_t v15 = v0[17];
  }
  uint64_t v17 = v0[32];
  uint64_t v18 = (void *)v0[25];
  *(void *)(v15 + 8sub_25C45E010("[%@] %s: blank", (void (*)(void))sub_25C45D9C8, 0) = 0;
  *(void *)(v15 + 88) = v18;
  id v19 = v18;

  uint64_t v20 = *(void *)(v17 + 24);
  BOOL v21 = __OFSUB__(v20, 1);
  uint64_t v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v0[32] + 24) = v22;
    if (v22 < 0)
    {
      sub_25C47AF18();
    }
    else
    {
      uint64_t v23 = (void *)v0[25];
      if (!v22) {
        sub_25C45DFEC();
      }

      swift_task_dealloc();
      unint64_t v24 = (void (*)(void))v0[1];
      v24();
    }
  }
}

void sub_25C47019C()
{
  uint64_t v1 = (void *)v0[48];
  swift_release();

  uint64_t v2 = v0[17];
  id v3 = *(void **)(v2 + 88);
  if (!v3 || *(unsigned char *)(v2 + 80))
  {
    sub_25C471618(1, 0);
    id v3 = *(void **)(v2 + 88);
    uint64_t v2 = v0[17];
  }
  uint64_t v4 = v0[32];
  os_log_type_t v5 = (void *)v0[25];
  *(void *)(v2 + 8sub_25C45E010("[%@] %s: blank", (void (*)(void))sub_25C45D9C8, 0) = 0;
  *(void *)(v2 + 88) = v5;
  id v6 = v5;

  uint64_t v7 = *(void *)(v4 + 24);
  BOOL v8 = __OFSUB__(v7, 1);
  uint64_t v9 = v7 - 1;
  if (v8)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v0[32] + 24) = v9;
    if (v9 < 0)
    {
      sub_25C47AF18();
    }
    else
    {
      id v10 = (void *)v0[25];
      if (!v9) {
        sub_25C45DFEC();
      }

      swift_task_dealloc();
      unint64_t v11 = (void (*)(void))v0[1];
      v11();
    }
  }
}

void sub_25C4702EC()
{
  BOOL v28 = v0;
  uint64_t v1 = (void *)v0[55];
  swift_release();
  if (qword_26A5A8498 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v0[18], (uint64_t)qword_26A5AAC70);
  swift_retain();
  id v2 = v1;
  swift_retain();
  id v3 = v1;
  uint64_t v4 = sub_25C47AA18();
  os_log_type_t v5 = sub_25C47AD18();
  BOOL v6 = os_log_type_enabled(v4, v5);
  uint64_t v7 = (void *)v0[48];
  uint64_t v8 = v0[17];
  if (v6)
  {
    uint64_t v26 = (void *)v0[48];
    uint64_t v9 = swift_slowAlloc();
    id v10 = (void *)swift_slowAlloc();
    uint64_t v25 = swift_slowAlloc();
    uint64_t v27 = v25;
    *(_DWORD *)uint64_t v9 = 136446466;
    uint64_t v12 = *(void *)(v8 + 16);
    unint64_t v11 = *(void *)(v8 + 24);
    swift_bridgeObjectRetain();
    v0[13] = sub_25C47596C(v12, v11, &v27);
    sub_25C47ADB8();
    swift_bridgeObjectRelease();
    swift_release_n();
    *(_WORD *)(v9 + 12) = 2112;
    id v13 = v1;
    uint64_t v14 = _swift_stdlib_bridgeErrorToNSError();
    v0[14] = v14;
    sub_25C47ADB8();
    *id v10 = v14;

    _os_log_impl(&dword_25C444000, v4, v5, "%{public}s failed updating blanker and coordinator: %@", (uint8_t *)v9, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A9190);
    swift_arrayDestroy();
    MEMORY[0x261186AD0](v10, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x261186AD0](v25, -1, -1);
    MEMORY[0x261186AD0](v9, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  uint64_t v15 = v0[17];
  uint64_t v16 = *(void **)(v15 + 88);
  if (!v16 || *(unsigned char *)(v15 + 80))
  {
    sub_25C471618(1, 0);
    uint64_t v16 = *(void **)(v15 + 88);
    uint64_t v15 = v0[17];
  }
  uint64_t v17 = v0[32];
  uint64_t v18 = (void *)v0[25];
  *(void *)(v15 + 8sub_25C45E010("[%@] %s: blank", (void (*)(void))sub_25C45D9C8, 0) = 0;
  *(void *)(v15 + 88) = v18;
  id v19 = v18;

  uint64_t v20 = *(void *)(v17 + 24);
  BOOL v21 = __OFSUB__(v20, 1);
  uint64_t v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v0[32] + 24) = v22;
    if (v22 < 0)
    {
      sub_25C47AF18();
    }
    else
    {
      uint64_t v23 = (void *)v0[25];
      if (!v22) {
        sub_25C45DFEC();
      }

      swift_task_dealloc();
      unint64_t v24 = (void (*)(void))v0[1];
      v24();
    }
  }
}

BOOL sub_25C4706A4(BOOL result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 0;
  }
  int v3 = result;
  if (*(unsigned char *)(a2 + 32) == result) {
    return 1;
  }
  if (v2 == 1) {
    return 0;
  }
  for (uint64_t i = 33; ; ++i)
  {
    uint64_t v5 = i - 31;
    if (__OFADD__(i - 32, 1)) {
      break;
    }
    int v6 = *(unsigned __int8 *)(a2 + i);
    uint64_t result = v6 == v3;
    if (v6 == v3 || v5 == v2) {
      return result;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_25C470704(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  int v3 = *(void **)v1;
  int64_t v4 = *(void *)(*(void *)v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  char isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    if (*(void *)(a1 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
  if (v4 <= v5) {
    int64_t v14 = v4 + v2;
  }
  else {
    int64_t v14 = v4;
  }
  int v3 = sub_25C467178(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(void *)(a1 + 16))
  {
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
LABEL_5:
  uint64_t v8 = v3[2];
  if ((v3[3] >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v9 = (unint64_t)&v3[5 * v8 + 4];
  if (a1 + 32 < v9 + 40 * v2 && v9 < a1 + 32 + 40 * v2) {
    goto LABEL_24;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A8D60);
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)uint64_t v1 = v3;
    return result;
  }
  uint64_t v11 = v3[2];
  BOOL v12 = __OFADD__(v11, v2);
  uint64_t v13 = v11 + v2;
  if (!v12)
  {
    v3[2] = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_25C47AF68();
  __break(1u);
  return result;
}

void sub_25C470870(void *a1)
{
  uint64_t v16 = a1;
  uint64_t v2 = v1 + 16;
  swift_beginAccess();
  uint64_t v3 = *(void *)(*(void *)(v1 + 16) + 16);
  if (v3)
  {
    unint64_t v4 = 0;
    for (uint64_t i = 72; ; i += 48)
    {
      int v6 = v16;
      swift_beginAccess();
      uint64_t v7 = *(void **)v2;
      id v8 = v6;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *(void *)uint64_t v2 = v7;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        uint64_t v7 = sub_25C47619C(v7);
        *(void *)uint64_t v2 = v7;
      }
      if (v4 >= v7[2]) {
        break;
      }
      sub_25C456E44(&v15, v8);
      swift_endAccess();

      if (v4 >= *(void *)(*(void *)v2 + 16)) {
        goto LABEL_10;
      }
      ++v4;
      sub_25C45FED0(*(void *)v2 + i - 40, (uint64_t)v12);
      uint64_t v10 = v13;
      uint64_t v11 = v14;
      __swift_project_boxed_opaque_existential_1(v12, v13);
      (*(void (**)(void **, uint64_t, uint64_t))(v11 + 32))(&v16, v10, v11);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
      if (v3 == v4) {
        return;
      }
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
}

uint64_t sub_25C4709C8(uint64_t a1)
{
  v2[16] = a1;
  v2[17] = v1;
  sub_25C47ABD8();
  v2[18] = sub_25C47ABC8();
  uint64_t v4 = sub_25C47AB88();
  v2[19] = v4;
  v2[20] = v3;
  return MEMORY[0x270FA2498](sub_25C470A60, v4, v3);
}

uint64_t sub_25C470A60()
{
  uint64_t v1 = v0[17];
  swift_beginAccess();
  uint64_t v2 = *(void *)(v1 + 16);
  v0[21] = v2;
  uint64_t v3 = *(void *)(v2 + 16);
  v0[22] = v3;
  if (v3)
  {
    v0[23] = 0;
    uint64_t v4 = v2 + 32;
    swift_bridgeObjectRetain();
    sub_25C47833C(v4, (uint64_t)(v0 + 2), &qword_26A5A9200);
    sub_25C45FED0((uint64_t)(v0 + 2), (uint64_t)(v0 + 8));
    sub_25C4783A0((uint64_t)(v0 + 2), &qword_26A5A9200);
    uint64_t v5 = v0[11];
    uint64_t v6 = v0[12];
    __swift_project_boxed_opaque_existential_1(v0 + 8, v5);
    uint64_t v7 = *(void *)(v6 + 16);
    uint64_t v11 = (uint64_t (*)(void *, uint64_t, uint64_t))(*(void *)(v7 + 16) + **(int **)(v7 + 16));
    id v8 = (void *)swift_task_alloc();
    v0[24] = v8;
    void *v8 = v0;
    v8[1] = sub_25C470C2C;
    return v11(v0 + 16, v5, v7);
  }
  else
  {
    swift_release();
    uint64_t v10 = (uint64_t (*)(void))v0[1];
    return v10();
  }
}

uint64_t sub_25C470C2C()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 20sub_25C45E010("[%@] %s: blank", (void (*)(void))sub_25C45D9C8, 0) = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    uint64_t v3 = *(void *)(v2 + 152);
    uint64_t v4 = *(void *)(v2 + 160);
    uint64_t v5 = sub_25C470F18;
  }
  else
  {
    uint64_t v3 = *(void *)(v2 + 152);
    uint64_t v4 = *(void *)(v2 + 160);
    uint64_t v5 = sub_25C470D48;
  }
  return MEMORY[0x270FA2498](v5, v3, v4);
}

uint64_t sub_25C470D48()
{
  uint64_t v1 = v0[22];
  uint64_t v2 = v0[23] + 1;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 8));
  if (v2 == v1)
  {
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v3 = (uint64_t (*)(void))v0[1];
    return v3();
  }
  else
  {
    uint64_t v5 = v0[23] + 1;
    v0[23] = v5;
    sub_25C47833C(v0[21] + 48 * v5 + 32, (uint64_t)(v0 + 2), &qword_26A5A9200);
    sub_25C45FED0((uint64_t)(v0 + 2), (uint64_t)(v0 + 8));
    sub_25C4783A0((uint64_t)(v0 + 2), &qword_26A5A9200);
    uint64_t v6 = v0[11];
    uint64_t v7 = v0[12];
    __swift_project_boxed_opaque_existential_1(v0 + 8, v6);
    uint64_t v8 = *(void *)(v7 + 16);
    uint64_t v10 = (uint64_t (*)(void *, uint64_t, uint64_t))(*(void *)(v8 + 16) + **(int **)(v8 + 16));
    unint64_t v9 = (void *)swift_task_alloc();
    v0[24] = v9;
    *unint64_t v9 = v0;
    v9[1] = sub_25C470C2C;
    return v10(v0 + 16, v6, v8);
  }
}

uint64_t sub_25C470F18()
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 64);
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25C470F88(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t sub_25C470FB0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_unknownObjectRetain();
  v3(a2);
  return swift_unknownObjectRelease();
}

uint64_t sub_25C471004(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25C47ABF8();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_25C47ABE8();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_25C4783A0(a1, &qword_26A5A8990);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_25C47AB88();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

unint64_t sub_25C4711B0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A5A9238);
  uint64_t v2 = (void *)sub_25C47AF58();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    uint64_t v5 = *(v4 - 3);
    uint64_t v6 = *(v4 - 2);
    uint64_t v8 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_retain();
    unint64_t result = sub_25C4761B0(v5, v6, v8);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 24 * result);
    uint64_t *v11 = v5;
    v11[1] = v6;
    void v11[2] = v8;
    *(void *)(v2[7] + 8 * result) = v7;
    uint64_t v12 = v2[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v2[2] = v14;
    v4 += 4;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_25C4712E8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A9138);
  uint64_t v2 = (void *)sub_25C47AF58();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    uint64_t v5 = *(v4 - 3);
    uint64_t v6 = *(v4 - 2);
    uint64_t v8 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_25C4761B0(v5, v6, v8);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 24 * result);
    uint64_t *v11 = v5;
    v11[1] = v6;
    void v11[2] = v8;
    *(void *)(v2[7] + 8 * result) = v7;
    uint64_t v12 = v2[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v2[2] = v14;
    v4 += 4;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_25C471420(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void (*v10)(uint64_t *__return_ptr, id *);
  char v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v17;
  id v18[3];
  uint64_t v19;

  swift_beginAccess();
  if (!*(void *)(*(void *)(v4 + 48) + 16)) {
    goto LABEL_5;
  }
  swift_bridgeObjectRetain();
  sub_25C4761B0(a2, a3, a4);
  if ((v9 & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    swift_endAccess();
    uint64_t v17 = a1;
    char v10 = *(void (**)(uint64_t *__return_ptr, id *))(v4 + 16);
    uint64_t v11 = *(unsigned char *)(v4 + 40);
    v18[0] = *(id *)(v4 + 32);
    uint64_t v12 = v18[0];
    v10(&v19, v18);
    BOOL v13 = v19;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A9078);
    swift_allocObject();
    swift_bridgeObjectRetain();
    uint64_t v14 = sub_25C47733C(a2, a3, a4, v12, v11, v13);
    swift_bridgeObjectRelease();

    a1 = v17;
    swift_release();
    swift_beginAccess();
    swift_bridgeObjectRetain();
    swift_retain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    id v19 = *(void *)(v4 + 48);
    *(void *)(v4 + 48) = 0x8000000000000000;
    sub_25C47667C(v14, a2, a3, a4, isUniquelyReferenced_nonNull_native);
    *(void *)(v4 + 48) = v19;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    goto LABEL_6;
  }
  swift_endAccess();
  swift_retain();
  swift_bridgeObjectRelease();
LABEL_6:
  sub_25C472314(a1);
  return swift_release();
}

uint64_t sub_25C471618(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a2;
  *(unsigned char *)(v2 + 4sub_25C45E010("[%@] %s: blank", (void (*)(void))sub_25C45D9C8, 0) = a2;
  swift_beginAccess();
  uint64_t v5 = *(void *)(v2 + 48);
  uint64_t v40 = v5 + 64;
  uint64_t v6 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & *(void *)(v5 + 64);
  int64_t v41 = (unint64_t)(v6 + 63) >> 6;
  uint64_t v42 = v5;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v10 = 0;
  uint64_t v11 = &qword_26A5A9200;
  unsigned int v46 = v3;
  while (1)
  {
    if (v8)
    {
      unint64_t v12 = __clz(__rbit64(v8));
      uint64_t v13 = (v8 - 1) & v8;
      int64_t v44 = v10;
      unint64_t v14 = v12 | (v10 << 6);
    }
    else
    {
      int64_t v15 = v10 + 1;
      if (__OFADD__(v10, 1)) {
        goto LABEL_49;
      }
      if (v15 >= v41) {
        return swift_release();
      }
      unint64_t v16 = *(void *)(v40 + 8 * v15);
      int64_t v17 = v10 + 1;
      if (!v16)
      {
        int64_t v17 = v10 + 2;
        if (v10 + 2 >= v41) {
          return swift_release();
        }
        unint64_t v16 = *(void *)(v40 + 8 * v17);
        if (!v16)
        {
          int64_t v17 = v10 + 3;
          if (v10 + 3 >= v41) {
            return swift_release();
          }
          unint64_t v16 = *(void *)(v40 + 8 * v17);
          if (!v16)
          {
            uint64_t v18 = v10 + 4;
            if (v10 + 4 >= v41) {
              return swift_release();
            }
            unint64_t v16 = *(void *)(v40 + 8 * v18);
            if (!v16)
            {
              while (1)
              {
                int64_t v17 = v18 + 1;
                if (__OFADD__(v18, 1)) {
                  goto LABEL_50;
                }
                if (v17 >= v41) {
                  return swift_release();
                }
                unint64_t v16 = *(void *)(v40 + 8 * v17);
                ++v18;
                if (v16) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v17 = v10 + 4;
          }
        }
      }
LABEL_21:
      uint64_t v13 = (v16 - 1) & v16;
      int64_t v44 = v17;
      unint64_t v14 = __clz(__rbit64(v16)) + (v17 << 6);
    }
    uint64_t v19 = *(void *)(*(void *)(v42 + 56) + 8 * v14);
    uint64_t v45 = v19;
    swift_retain();
    *(unsigned char *)(v19 + 24) = v3;
    swift_beginAccess();
    unint64_t v20 = *(void *)(v19 + 80);
    unint64_t v43 = v13;
    if (v20 >> 62) {
      break;
    }
    uint64_t v21 = *(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v21) {
      goto LABEL_24;
    }
LABEL_41:
    swift_bridgeObjectRelease();
    uint64_t v34 = *(void *)(v45 + 72);
    swift_beginAccess();
    uint64_t v35 = *(void *)(v34 + 16);
    uint64_t v36 = *(void *)(v35 + 16);
    if (v36)
    {
      uint64_t v37 = v35 + 32;
      swift_bridgeObjectRetain();
      do
      {
        sub_25C47833C(v37, (uint64_t)&aBlock, v11);
        sub_25C45FED0((uint64_t)&aBlock, (uint64_t)v50);
        sub_25C4783A0((uint64_t)&aBlock, v11);
        uint64_t v39 = v51;
        uint64_t v38 = v52;
        __swift_project_boxed_opaque_existential_1(v50, v51);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v38 + 8) + 8))(a1, v3, v39);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v50);
        v37 += 48;
        --v36;
      }
      while (v36);
      swift_release();
      uint64_t result = swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t result = swift_release();
    }
    unint64_t v8 = v43;
    int64_t v10 = v44;
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_25C47AF28();
  uint64_t v21 = result;
  if (!result) {
    goto LABEL_41;
  }
LABEL_24:
  if (v21 < 1) {
    goto LABEL_48;
  }
  uint64_t v22 = 0;
  unint64_t v23 = v20 & 0xC000000000000001;
  unint64_t v48 = v20;
  unint64_t v49 = v20 & 0xC000000000000001;
  uint64_t v47 = v21;
  while (2)
  {
    if (v23)
    {
      uint64_t v24 = MEMORY[0x261185F00](v22, v20);
      int v25 = v3;
      if ((_BYTE)v3)
      {
LABEL_30:
        if (v25 == 1)
        {
          if (!(_BYTE)a1)
          {
            uint64_t v26 = *(void **)(v24 + 32);
            uint64_t v57 = sub_25C463730;
            uint64_t v58 = 0;
            uint64_t aBlock = MEMORY[0x263EF8330];
            uint64_t v54 = 1107296256;
            uint64_t v55 = sub_25C464554;
            uint64_t v56 = &block_descriptor_94;
            uint64_t v27 = _Block_copy(&aBlock);
            swift_release();
            BOOL v28 = v26;
            unint64_t v23 = v49;
            objc_msgSend(v28, sel_updateSettingsWithBlock_, v27);
            _Block_release(v27);
            uint64_t result = swift_isEscapingClosureAtFileLocation();
            if (result) {
              goto LABEL_47;
            }
          }
        }
        else
        {
          objc_msgSend(*(id *)(v24 + 32), sel_invalidate);
        }
        goto LABEL_27;
      }
    }
    else
    {
      uint64_t v24 = *(void *)(v20 + 8 * v22 + 32);
      swift_retain();
      int v25 = v3;
      if ((_BYTE)v3) {
        goto LABEL_30;
      }
    }
    if (a1 != 1)
    {
LABEL_27:
      ++v22;
      *(unsigned char *)(v24 + 17) = v3;
      swift_release();
      if (v21 == v22) {
        goto LABEL_41;
      }
      continue;
    }
    break;
  }
  uint64_t v29 = v11;
  unint64_t v30 = *(void **)(v24 + 32);
  uint64_t v31 = swift_allocObject();
  *(void *)(v31 + 16) = sub_25C464D98;
  *(void *)(v31 + 24) = v24;
  uint64_t v57 = sub_25C478590;
  uint64_t v58 = v31;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v54 = 1107296256;
  uint64_t v55 = sub_25C464554;
  uint64_t v56 = &block_descriptor_102;
  uint64_t v32 = _Block_copy(&aBlock);
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v30, sel_updateSettingsWithBlock_, v32);
  _Block_release(v32);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) == 0)
  {
    if (*(unsigned char *)(v24 + 16) != 1)
    {
      (*(void (**)(void *))(v24 + 48))(v30);
      unint64_t v23 = v49;
      *(unsigned char *)(v24 + 16) = 1;
    }
    swift_release();
    uint64_t v11 = v29;
    uint64_t v3 = v46;
    uint64_t v21 = v47;
    unint64_t v20 = v48;
    goto LABEL_27;
  }
  __break(1u);
LABEL_47:
  __break(1u);
LABEL_48:
  __break(1u);
LABEL_49:
  __break(1u);
LABEL_50:
  __break(1u);
  return result;
}

uint64_t sub_25C471BB8(uint64_t a1)
{
  v2[9] = a1;
  v2[10] = v1;
  v2[11] = sub_25C47ABD8();
  v2[12] = sub_25C47ABC8();
  uint64_t v4 = sub_25C47AB88();
  v2[13] = v4;
  v2[14] = v3;
  return MEMORY[0x270FA2498](sub_25C471C54, v4, v3);
}

uint64_t sub_25C471C54()
{
  uint64_t v1 = *(void *)(v0 + 80);
  swift_beginAccess();
  uint64_t v2 = *(void *)(v1 + 48);
  *(void *)(v0 + 12sub_25C45E010("[%@] %s: blank", (void (*)(void))sub_25C45D9C8, 0) = v2;
  char v3 = *(unsigned char *)(v2 + 32);
  *(unsigned char *)(v0 + 20sub_25C45E010("[%@] %s: blank", (void (*)(void))sub_25C45D9C8, 0) = v3;
  uint64_t v4 = -1;
  uint64_t v5 = -1 << v3;
  if (-(-1 << v3) < 64) {
    uint64_t v4 = ~(-1 << -(char)v5);
  }
  unint64_t v6 = v4 & *(void *)(v2 + 64);
  uint64_t v7 = (void *)swift_bridgeObjectRetain();
  if (v6)
  {
    uint64_t v8 = 0;
    unint64_t v9 = __clz(__rbit64(v6));
    uint64_t v10 = (v6 - 1) & v6;
LABEL_5:
    *(void *)(v0 + 128) = v8;
    *(void *)(v0 + 136) = v10;
    uint64_t v11 = *(void *)(v0 + 72);
    *(void *)(v0 + 144) = *(void *)(v7[7] + 8 * v9);
    swift_retain();
    *(void *)(v0 + 64) = v11;
    *(void *)(v0 + 152) = sub_25C47ABC8();
    uint64_t v13 = sub_25C47AB88();
    *(void *)(v0 + 16sub_25C45E010("[%@] %s: blank", (void (*)(void))sub_25C45D9C8, 0) = v13;
    *(void *)(v0 + 168) = v12;
    return MEMORY[0x270FA2498](sub_25C471E58, v13, v12);
  }
  unint64_t v14 = 63 - v5;
  if ((unint64_t)(63 - v5) > 0x7F)
  {
    unint64_t v15 = v7[9];
    if (v15)
    {
      uint64_t v8 = 1;
LABEL_11:
      uint64_t v10 = (v15 - 1) & v15;
      unint64_t v9 = __clz(__rbit64(v15)) + (v8 << 6);
      goto LABEL_5;
    }
    if (v14 >= 0xC0)
    {
      unint64_t v15 = v7[10];
      if (v15)
      {
        uint64_t v8 = 2;
        goto LABEL_11;
      }
      if (v14 >= 0x100)
      {
        unint64_t v15 = v7[11];
        if (v15)
        {
          uint64_t v8 = 3;
          goto LABEL_11;
        }
        if (v14 >= 0x140)
        {
          unint64_t v15 = v7[12];
          if (v15)
          {
            uint64_t v8 = 4;
            goto LABEL_11;
          }
          uint64_t v16 = 0;
          uint64_t v17 = v14 >> 6;
          if (v17 <= 5) {
            uint64_t v17 = 5;
          }
          uint64_t v18 = v17 - 5;
          while (v18 != v16)
          {
            unint64_t v15 = v7[v16++ + 13];
            if (v15)
            {
              uint64_t v8 = v16 + 4;
              goto LABEL_11;
            }
          }
        }
      }
    }
  }
  swift_release();
  swift_release();
  uint64_t v19 = *(uint64_t (**)(void))(v0 + 8);
  return v19();
}

uint64_t sub_25C471E58()
{
  uint64_t v1 = v0[18];
  swift_beginAccess();
  uint64_t v2 = (void *)v0[8];
  char v3 = *(void **)(v1 + 16);
  *(void *)(v1 + 16) = v2;
  id v4 = v2;

  v0[22] = sub_25C47ABC8();
  uint64_t v5 = swift_task_alloc();
  v0[23] = v5;
  *(void *)(v5 + 16) = v1;
  *(void *)(v5 + 24) = v0 + 8;
  unint64_t v6 = (void *)swift_task_alloc();
  v0[24] = v6;
  *unint64_t v6 = v0;
  v6[1] = sub_25C471F84;
  return MEMORY[0x270FA2158]();
}

uint64_t sub_25C471F84()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 168);
  uint64_t v3 = *(void *)(v1 + 160);
  return MEMORY[0x270FA2498](sub_25C4720E4, v3, v2);
}

uint64_t sub_25C4720E4()
{
  swift_release();
  uint64_t v1 = *(void *)(v0 + 104);
  uint64_t v2 = *(void *)(v0 + 112);
  return MEMORY[0x270FA2498](sub_25C472148, v1, v2);
}

uint64_t sub_25C472148()
{
  uint64_t v1 = (uint64_t (*)(int, int, int, int, int, int, int, int, char))swift_release();
  int64_t v4 = *(void *)(v0 + 128);
  unint64_t v5 = *(void *)(v0 + 136);
  if (v5)
  {
    uint64_t v6 = (v5 - 1) & v5;
    unint64_t v7 = __clz(__rbit64(v5)) | (v4 << 6);
    uint64_t v1 = *(uint64_t (**)(int, int, int, int, int, int, int, int, char))(v0 + 120);
    goto LABEL_3;
  }
  int64_t v11 = v4 + 1;
  if (__OFADD__(v4, 1))
  {
    __break(1u);
    goto LABEL_24;
  }
  int64_t v12 = (unint64_t)((1 << *(unsigned char *)(v0 + 200)) + 63) >> 6;
  uint64_t v1 = *(uint64_t (**)(int, int, int, int, int, int, int, int, char))(v0 + 120);
  if (v11 < v12)
  {
    uint64_t v13 = (char *)v1 + 64;
    unint64_t v14 = *((void *)v1 + v11 + 8);
    ++v4;
    if (v14)
    {
LABEL_9:
      uint64_t v6 = (v14 - 1) & v14;
      unint64_t v7 = __clz(__rbit64(v14)) + (v4 << 6);
LABEL_3:
      *(void *)(v0 + 128) = v4;
      *(void *)(v0 + 136) = v6;
      uint64_t v8 = *(void *)(v0 + 72);
      *(void *)(v0 + 144) = *(void *)(*((void *)v1 + 7) + 8 * v7);
      swift_retain();
      *(void *)(v0 + 64) = v8;
      *(void *)(v0 + 152) = sub_25C47ABC8();
      uint64_t v9 = sub_25C47AB88();
      uint64_t v3 = v10;
      *(void *)(v0 + 16sub_25C45E010("[%@] %s: blank", (void (*)(void))sub_25C45D9C8, 0) = v9;
      *(void *)(v0 + 168) = v10;
      uint64_t v1 = sub_25C471E58;
      uint64_t v2 = v9;
      return MEMORY[0x270FA2498](v1, v2, v3);
    }
    int64_t v4 = v11 + 1;
    if (v11 + 1 < v12)
    {
      unint64_t v14 = *(void *)&v13[8 * v4];
      if (v14) {
        goto LABEL_9;
      }
      int64_t v4 = v11 + 2;
      if (v11 + 2 < v12)
      {
        unint64_t v14 = *(void *)&v13[8 * v4];
        if (v14) {
          goto LABEL_9;
        }
        int64_t v15 = v11 + 3;
        if (v15 < v12)
        {
          unint64_t v14 = *(void *)&v13[8 * v15];
          if (v14)
          {
            int64_t v4 = v15;
            goto LABEL_9;
          }
          while (1)
          {
            int64_t v4 = v15 + 1;
            if (__OFADD__(v15, 1)) {
              break;
            }
            if (v4 >= v12) {
              goto LABEL_20;
            }
            unint64_t v14 = *(void *)&v13[8 * v4];
            ++v15;
            if (v14) {
              goto LABEL_9;
            }
          }
LABEL_24:
          __break(1u);
          return MEMORY[0x270FA2498](v1, v2, v3);
        }
      }
    }
  }
LABEL_20:
  swift_release();
  swift_release();
  uint64_t v16 = *(uint64_t (**)(void))(v0 + 8);
  return v16();
}

void sub_25C472314(uint64_t a1)
{
  uint64_t v2 = v1;
  swift_beginAccess();
  uint64_t v4 = swift_retain();
  MEMORY[0x261185B10](v4);
  if (*(void *)((*(void *)(v1 + 80) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)(v1 + 80) & 0xFFFFFFFFFFFFFF8)
                                                                                     + 0x18) >> 1)
    sub_25C47AB18();
  sub_25C47AB48();
  sub_25C47AAF8();
  swift_endAccess();
  swift_beginAccess();
  char v5 = *(unsigned char *)(v1 + 24);
  id v6 = *(id *)(v2 + 16);
  sub_25C464B78(v5);

  id v7 = *(id *)(a1 + 32);
  sub_25C470870(v7);
}

uint64_t sub_25C4723FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[13] = a3;
  v4[14] = a4;
  v4[12] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A8990);
  v4[15] = swift_task_alloc();
  v4[16] = swift_task_alloc();
  v4[17] = swift_task_alloc();
  v4[18] = sub_25C47ABD8();
  v4[19] = sub_25C47ABC8();
  uint64_t v6 = sub_25C47AB88();
  v4[20] = v6;
  v4[21] = v5;
  return MEMORY[0x270FA2498](sub_25C4724E8, v6, v5);
}

uint64_t sub_25C4724E8()
{
  uint64_t v1 = *(void *)(v0 + 136);
  uint64_t v3 = *(void *)(v0 + 104);
  uint64_t v2 = *(void **)(v0 + 112);
  uint64_t v4 = sub_25C47ABF8();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v39 = v4;
  uint64_t v38 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 56);
  v38(v1, 1, 1);
  uint64_t v6 = (void *)swift_allocObject();
  v6[2] = 0;
  _OWORD v6[3] = 0;
  v6[4] = v3;
  v6[5] = v2;
  id v7 = v2;
  swift_retain();
  sub_25C46BDAC(v1, (uint64_t)&unk_26A5A91C0, (uint64_t)v6);
  sub_25C4783A0(v1, &qword_26A5A8990);
  swift_beginAccess();
  unint64_t v8 = *(void *)(v3 + 80);
  if (v8 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_25C47AF28();
    uint64_t v9 = v10;
    if (v10) {
      goto LABEL_3;
    }
LABEL_17:
    swift_bridgeObjectRelease();
    uint64_t v30 = sub_25C47ABC8();
    *(void *)(v0 + 176) = v30;
    uint64_t v31 = (void *)swift_task_alloc();
    *(void *)(v0 + 184) = v31;
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A91E0);
    void *v31 = v0;
    v31[1] = sub_25C47294C;
    uint64_t v11 = MEMORY[0x263F8F500];
    uint64_t v10 = v30;
    return MEMORY[0x270FA1E50](v10, v11, v12);
  }
  uint64_t v9 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v10 = swift_bridgeObjectRetain();
  if (!v9) {
    goto LABEL_17;
  }
LABEL_3:
  if (v9 >= 1)
  {
    uint64_t v13 = 0;
    unint64_t v35 = v8 & 0xC000000000000001;
    uint64_t v34 = (uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
    uint64_t v33 = (void (**)(uint64_t, uint64_t))(v5 + 8);
    uint64_t v36 = v9;
    unint64_t v37 = v8;
    while (1)
    {
      if (v35)
      {
        uint64_t v15 = MEMORY[0x261185F00](v13, v8);
      }
      else
      {
        uint64_t v15 = *(void *)(v8 + 8 * v13 + 32);
        swift_retain();
      }
      uint64_t v17 = *(void *)(v0 + 120);
      uint64_t v16 = *(void *)(v0 + 128);
      uint64_t v19 = *(void *)(v0 + 104);
      uint64_t v18 = *(void **)(v0 + 112);
      ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v38)(v16, 1, 1, v39);
      unint64_t v20 = (void *)swift_allocObject();
      v20[2] = 0;
      uint64_t v21 = v20 + 2;
      v20[3] = 0;
      void v20[4] = v15;
      v20[5] = v18;
      v20[6] = v19;
      sub_25C47833C(v16, v17, &qword_26A5A8990);
      LODWORD(v16) = (*v34)(v17, 1, v39);
      id v22 = v18;
      swift_retain();
      uint64_t v23 = *(void *)(v0 + 120);
      if (v16 == 1)
      {
        sub_25C4783A0(*(void *)(v0 + 120), &qword_26A5A8990);
        if (!*v21) {
          goto LABEL_13;
        }
      }
      else
      {
        sub_25C47ABE8();
        (*v33)(v23, v39);
        if (!*v21)
        {
LABEL_13:
          uint64_t v24 = 0;
          uint64_t v26 = 0;
          goto LABEL_14;
        }
      }
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v24 = sub_25C47AB88();
      uint64_t v26 = v25;
      swift_unknownObjectRelease();
LABEL_14:
      uint64_t v27 = **(void **)(v0 + 96);
      uint64_t v28 = swift_allocObject();
      *(void *)(v28 + 16) = &unk_26A5A91D0;
      *(void *)(v28 + 24) = v20;
      uint64_t v29 = v26 | v24;
      if (v26 | v24)
      {
        uint64_t v29 = v0 + 16;
        *(void *)(v0 + 16) = 0;
        *(void *)(v0 + 24) = 0;
        *(void *)(v0 + 32) = v24;
        *(void *)(v0 + 4sub_25C45E010("[%@] %s: blank", (void (*)(void))sub_25C45D9C8, 0) = v26;
      }
      ++v13;
      uint64_t v14 = *(void *)(v0 + 128);
      *(void *)(v0 + 72) = 1;
      *(void *)(v0 + 8sub_25C45E010("[%@] %s: blank", (void (*)(void))sub_25C45D9C8, 0) = v29;
      *(void *)(v0 + 88) = v27;
      swift_task_create();
      swift_release();
      sub_25C4783A0(v14, &qword_26A5A8990);
      unint64_t v8 = v37;
      if (v36 == v13) {
        goto LABEL_17;
      }
    }
  }
  __break(1u);
  return MEMORY[0x270FA1E50](v10, v11, v12);
}

uint64_t sub_25C47294C()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 168);
  uint64_t v3 = *(void *)(v1 + 160);
  return MEMORY[0x270FA2498](sub_25C472A90, v3, v2);
}

uint64_t sub_25C472A90()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25C472B18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 32) = a4;
  *(void *)(v5 + 4sub_25C45E010("[%@] %s: blank", (void (*)(void))sub_25C45D9C8, 0) = a5;
  return MEMORY[0x270FA2498](sub_25C472B38, 0, 0);
}

uint64_t sub_25C472B38()
{
  uint64_t v4 = (uint64_t (*)(uint64_t))((char *)&dword_26A5A91F8 + dword_26A5A91F8);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 48) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25C472BE8;
  uint64_t v2 = *(void *)(v0 + 40);
  return v4(v2);
}

uint64_t sub_25C472BE8()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 56) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_25C472D1C, 0, 0);
  }
  else
  {
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_25C472D1C()
{
  id v22 = v0;
  if (qword_26A5A84E0 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[7];
  uint64_t v2 = sub_25C47AA38();
  __swift_project_value_buffer(v2, (uint64_t)qword_26A5AACA8);
  id v3 = v1;
  id v4 = v1;
  swift_retain();
  uint64_t v5 = sub_25C47AA18();
  os_log_type_t v6 = sub_25C47AD18();
  BOOL v7 = os_log_type_enabled(v5, v6);
  unint64_t v8 = (void *)v0[7];
  uint64_t v9 = v0[4];
  if (v7)
  {
    os_log_type_t type = v6;
    uint64_t v10 = swift_slowAlloc();
    uint64_t v18 = (void *)swift_slowAlloc();
    uint64_t v20 = swift_slowAlloc();
    uint64_t v21 = v20;
    *(_DWORD *)uint64_t v10 = 136446466;
    log = v5;
    uint64_t v11 = *(void *)(v9 + 56);
    unint64_t v12 = *(void *)(v9 + 64);
    swift_bridgeObjectRetain();
    v0[2] = sub_25C47596C(v11, v12, &v21);
    sub_25C47ADB8();
    swift_bridgeObjectRelease();
    swift_release();
    *(_WORD *)(v10 + 12) = 2114;
    id v13 = v8;
    uint64_t v14 = _swift_stdlib_bridgeErrorToNSError();
    v0[3] = v14;
    sub_25C47ADB8();
    *uint64_t v18 = v14;

    _os_log_impl(&dword_25C444000, log, type, "%{public}s: error updating presenter: %{public}@", (uint8_t *)v10, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A9190);
    swift_arrayDestroy();
    MEMORY[0x261186AD0](v18, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x261186AD0](v20, -1, -1);
    MEMORY[0x261186AD0](v10, -1, -1);
  }
  else
  {

    swift_release();
  }
  uint64_t v15 = (uint64_t (*)(void))v0[1];
  return v15();
}

uint64_t sub_25C472FD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[5] = a5;
  void v6[6] = a6;
  v6[4] = a4;
  sub_25C47ABD8();
  v6[7] = sub_25C47ABC8();
  uint64_t v8 = sub_25C47AB88();
  v6[8] = v8;
  v6[9] = v7;
  return MEMORY[0x270FA2498](sub_25C473070, v8, v7);
}

uint64_t sub_25C473070()
{
  uint64_t v2 = v0[4];
  uint64_t v1 = (void *)v0[5];
  id v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = v1;
  id v4 = v1;

  if (*(unsigned char *)(v2 + 17))
  {
    swift_release();
    uint64_t v5 = (uint64_t (*)(void))v0[1];
    return v5();
  }
  else
  {
    uint64_t v7 = (void *)swift_task_alloc();
    v0[10] = v7;
    void *v7 = v0;
    v7[1] = sub_25C473170;
    uint64_t v8 = v0[4];
    return sub_25C454EA8((uint64_t)sub_25C46400C, v8);
  }
}

uint64_t sub_25C473170()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 88) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 72);
  uint64_t v4 = *(void *)(v2 + 64);
  if (v0) {
    uint64_t v5 = sub_25C47330C;
  }
  else {
    uint64_t v5 = sub_25C4732AC;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_25C4732AC()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25C47330C()
{
  swift_release();
  return MEMORY[0x270FA2498](sub_25C473374, 0, 0);
}

uint64_t sub_25C473374()
{
  uint64_t v20 = v0;
  if (qword_26A5A84E0 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[11];
  uint64_t v2 = sub_25C47AA38();
  __swift_project_value_buffer(v2, (uint64_t)qword_26A5AACA8);
  id v3 = v1;
  id v4 = v1;
  swift_retain();
  uint64_t v5 = sub_25C47AA18();
  os_log_type_t v6 = sub_25C47AD18();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v8 = (void *)v0[11];
  uint64_t v9 = v0[6];
  if (v7)
  {
    uint64_t v10 = swift_slowAlloc();
    uint64_t v17 = (void *)swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    uint64_t v19 = v18;
    *(_DWORD *)uint64_t v10 = 136446466;
    uint64_t v12 = *(void *)(v9 + 56);
    unint64_t v11 = *(void *)(v9 + 64);
    swift_bridgeObjectRetain();
    v0[2] = sub_25C47596C(v12, v11, &v19);
    sub_25C47ADB8();
    swift_bridgeObjectRelease();
    swift_release();
    *(_WORD *)(v10 + 12) = 2114;
    id v13 = v8;
    uint64_t v14 = _swift_stdlib_bridgeErrorToNSError();
    v0[3] = v14;
    sub_25C47ADB8();
    *uint64_t v17 = v14;

    _os_log_impl(&dword_25C444000, v5, v6, "%{public}s: error updating presentable: %{public}@", (uint8_t *)v10, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A9190);
    swift_arrayDestroy();
    MEMORY[0x261186AD0](v17, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x261186AD0](v18, -1, -1);
    MEMORY[0x261186AD0](v10, -1, -1);
  }
  else
  {

    swift_release();
  }
  uint64_t v15 = (uint64_t (*)(void))v0[1];
  return v15();
}

char *SceneHostingDisplayControllerAdapter.__allocating_init(boxedConfiguration:display:displayConfiguration:updateTransformsAdapter:)(unsigned char *a1, void *a2, void *a3, void *a4)
{
  id v9 = objc_allocWithZone(v4);
  return SceneHostingDisplayControllerAdapter.init(boxedConfiguration:display:displayConfiguration:updateTransformsAdapter:)(a1, a2, a3, a4);
}

char *SceneHostingDisplayControllerAdapter.init(boxedConfiguration:display:displayConfiguration:updateTransformsAdapter:)(unsigned char *a1, void *a2, void *a3, void *a4)
{
  void (*v73)(uint64_t *__return_ptr, long long *);
  char v74;
  id v75;
  uint64_t v76;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  id v82;
  uint64_t v83;
  id v84;
  uint64_t v85;
  NSObject *v86;
  os_log_type_t v87;
  uint64_t v88;
  uint64_t v89;
  unint64_t v90;
  uint64_t v91;
  id v92;
  void *v93;
  uint64_t v94;
  id v95;
  id v96;
  id v97;
  id v98;
  char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  unsigned __int8 *v104;
  id v105;
  uint64_t v106;
  id v107;
  id v109;
  uint64_t v110;
  uint64_t v111;
  int64_t v112;
  unint64_t v113;
  int64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t ObjCClassFromMetadata;
  void *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  unsigned __int8 *v125;
  char *v126;
  objc_super v127;
  uint64_t v128;
  long long aBlock;
  uint64_t v130;
  long long *v131;
  uint64_t (*v132)();
  char **v133;
  _OWORD v134[2];
  uint64_t v135;

  *(void *)&v4[OBJC_IVAR___SSKSceneHostingDisplayControllerAdapter_caDisplayObservation] = 0;
  v4[OBJC_IVAR___SSKSceneHostingDisplayControllerAdapter_activationState] = 1;
  uint64_t v8 = *(char ***)&a1[OBJC_IVAR___SSKDisplayProfileConfiguration_configuration];
  uint64_t v7 = *(void *)&a1[OBJC_IVAR___SSKDisplayProfileConfiguration_configuration + 8];
  uint64_t v10 = *(void *)&a1[OBJC_IVAR___SSKDisplayProfileConfiguration_configuration + 16];
  p_uint64_t aBlock = *(long long **)&a1[OBJC_IVAR___SSKDisplayProfileConfiguration_configuration + 24];
  LOBYTE(v1sub_25C45E010("[%@] %s: unblank", (void (*)(void))sub_25C45D9DC, 1) = a1[OBJC_IVAR___SSKDisplayProfileConfiguration_configuration + 32];
  char v12 = a1[OBJC_IVAR___SSKDisplayProfileConfiguration_configuration + 33];
  id v13 = &v4[OBJC_IVAR___SSKSceneHostingDisplayControllerAdapter_profileConfiguration];
  *(void *)id v13 = v8;
  *((void *)v13 + sub_25C45E010("[%@] %s: unblank", (void (*)(void))sub_25C45D9DC, 1) = v7;
  *((void *)v13 + 2) = v10;
  *((void *)v13 + 3) = p_aBlock;
  v13[32] = (char)v11;
  LOBYTE(v123) = v12;
  v13[33] = v12;
  *(void *)&v4[OBJC_IVAR___SSKSceneHostingDisplayControllerAdapter_display] = a2;
  swift_bridgeObjectRetain();
  v126 = v4;
  v109 = a2;
  swift_bridgeObjectRetain();
  id v14 = objc_msgSend(a3, sel_CADisplay);
  if (!v14) {
    goto LABEL_56;
  }
  uint64_t v15 = v14;
  *(void *)&v126[OBJC_IVAR___SSKSceneHostingDisplayControllerAdapter_caDisplay] = v14;
  type metadata accessor for RootWindowDisplayBlanker();
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 24) = a3;
  p_uint64_t aBlock = (long long *)objc_allocWithZone((Class)type metadata accessor for RootWindowDisplayBlanker.SSKRootBlankingWindow());
  id v16 = a3;
  v107 = v15;
  id v17 = objc_msgSend(p_aBlock, sel_initWithDisplay_, v16);
  if (!v17) {
    goto LABEL_55;
  }
  uint64_t v18 = v17;
  uint64_t v19 = self;
  id v20 = v18;
  id v21 = objc_msgSend(v19, sel_blackColor);
  objc_msgSend(v20, sel_setBackgroundColor_, v21);

  objc_msgSend(v20, sel_setHidden_, 0);
  uint64_t v8 = &selRef_descriptionForRootObject_;
  uint64_t v10 = 1;
  objc_msgSend(v20, sel_setOpaque_, 1);
  sub_25C45D9DC();
  objc_msgSend(v16, sel_bounds);
  id v26 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E00]), sel_initWithFrame_, v22, v23, v24, v25);
  id v27 = objc_msgSend(v19, sel_blackColor);
  objc_msgSend(v26, sel_setBackgroundColor_, v27);

  objc_msgSend(v26, sel_setOpaque_, 1);
  objc_msgSend(v26, sel_setAutoresizingMask_, 18);
  uint64_t v28 = (SEL *)&selRef_descriptionForRootObject_;
  id v29 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E10]), sel_init);
  objc_msgSend(v29, sel_setView_, v26);
  objc_msgSend(v20, sel_setRootViewController_, v29);

  *(void *)(v7 + 32) = v20;
  *(unsigned char *)(v7 + 16) = 1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A8FE8);
  uint64_t v30 = swift_allocObject();
  *(void *)(v30 + 16) = v7;
  *(void *)(v30 + 24) = 0;
  v106 = v30;
  *(void *)&v126[OBJC_IVAR___SSKSceneHostingDisplayControllerAdapter_updateTransformsAdapter] = a4;
  v105 = a4;
  sub_25C47AE98();
  swift_bridgeObjectRelease();
  *(void *)&uint64_t aBlock = 0xD000000000000021;
  *((void *)&aBlock + sub_25C45E010("[%@] %s: unblank", (void (*)(void))sub_25C45D9DC, 1) = 0x800000025C480A50;
  id v31 = objc_msgSend(v109, sel_description);
  sub_25C47AA88();

  p_uint64_t aBlock = &aBlock;
  sub_25C47AAB8();
  swift_bridgeObjectRelease();
  id v32 = objc_allocWithZone(MEMORY[0x263F3F500]);
  uint64_t v33 = (void *)sub_25C47AA78();
  swift_bridgeObjectRelease();
  unint64_t v11 = (unsigned __int8 *)objc_msgSend(v32, sel_initWithIdentifier_, v33);

  uint64_t v34 = *(void *)v13;
  type metadata accessor for FBScenePresentableProvider();
  unint64_t v35 = (void *)swift_allocObject();
  v35[5] = 0;
  v35[6] = 0;
  v35[3] = v34;
  v35[4] = 0;
  v35[2] = v11;
  v116 = OBJC_IVAR___SSKSceneHostingDisplayControllerAdapter_presentableProvider;
  *(void *)&v126[OBJC_IVAR___SSKSceneHostingDisplayControllerAdapter_presentableProvider] = v35;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A9000);
  uint64_t v36 = swift_allocObject();
  unint64_t v37 = v16;
  v104 = v11;
  *(void *)(v36 + 48) = sub_25C4711B0(MEMORY[0x263F8EE78]);
  *(void *)(v36 + 16) = sub_25C4747F4;
  *(void *)(v36 + 24) = 0;
  *(void *)(v36 + 32) = v37;
  *(unsigned char *)(v36 + 4sub_25C45E010("[%@] %s: blank", (void (*)(void))sub_25C45D9C8, 0) = 1;
  v115 = OBJC_IVAR___SSKSceneHostingDisplayControllerAdapter_hostingGroupCoordinator;
  *(void *)&v126[OBJC_IVAR___SSKSceneHostingDisplayControllerAdapter_hostingGroupCoordinator] = v36;
  uint64_t v38 = *((void *)v13 + 1);
  uint64_t v39 = *(void *)(v38 + 64);
  v111 = v38 + 64;
  uint64_t v40 = 1 << *(unsigned char *)(v38 + 32);
  uint64_t v41 = -1;
  if (v40 < 64) {
    uint64_t v41 = ~(-1 << v40);
  }
  unint64_t v42 = v41 & v39;
  v112 = (unint64_t)(v40 + 63) >> 6;
  uint64_t v43 = swift_bridgeObjectRetain();
  int64_t v44 = 0;
  uint64_t v7 = (uint64_t)"";
  v119 = v37;
  v110 = v43;
LABEL_7:
  while (v42)
  {
    unint64_t v45 = __clz(__rbit64(v42));
    v42 &= v42 - 1;
    unint64_t v46 = v45 | (v44 << 6);
LABEL_23:
    uint64_t v10 = *(void *)(*(void *)(v43 + 56) + 8 * v46);
    unint64_t v11 = *(unsigned __int8 **)(v10 + 16);
    if (v11)
    {
      v113 = v42;
      v114 = v44;
      unsigned int v50 = (uint64_t *)(*(void *)(v43 + 48) + 24 * v46);
      uint64_t v51 = v50[1];
      v121 = v50[2];
      v122 = *v50;
      sub_25C457A30(0, (unint64_t *)&qword_26A5A8C60);
      uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
      v120 = v51;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v52 = 32;
      v117 = v10;
      while (1)
      {
        v123 = v52;
        v125 = v11;
        uint64_t v54 = v10 + v52;
        long long v55 = *(_OWORD *)(v10 + v52);
        long long v56 = *(_OWORD *)(v10 + v52 + 16);
        v135 = *(void *)(v10 + v52 + 32);
        v134[0] = v55;
        v134[1] = v56;
        unint64_t v37 = *(void **)&v126[v116];
        uint64_t v57 = (void *)v37[2];
        uint64_t v58 = swift_allocObject();
        uint64_t v59 = *(void *)(v54 + 32);
        long long v60 = *(_OWORD *)(v54 + 16);
        *(_OWORD *)(v58 + 16) = *(_OWORD *)v54;
        *(_OWORD *)(v58 + 32) = v60;
        *(void *)(v58 + 48) = v59;
        uint64_t v61 = swift_allocObject();
        *(void *)(v61 + 16) = sub_25C477264;
        *(void *)(v61 + 24) = v58;
        v132 = sub_25C464664;
        v133 = (char **)v61;
        *(void *)&uint64_t aBlock = MEMORY[0x263EF8330];
        *((void *)&aBlock + sub_25C45E010("[%@] %s: unblank", (void (*)(void))sub_25C45D9DC, 1) = 1107296256;
        v130 = (uint64_t)sub_25C470FB0;
        v131 = (long long *)&block_descriptor_3;
        uint64_t v28 = (SEL *)_Block_copy(&aBlock);
        sub_25C477294((uint64_t)v134);
        sub_25C477294((uint64_t)v134);
        swift_retain();
        swift_release();
        id v62 = objc_msgSend(v57, sel_createScene_, v28);
        _Block_release(v28);
        LOBYTE(v57) = swift_isEscapingClosureAtFileLocation();
        swift_release();
        if (v57)
        {
          __break(1u);
LABEL_49:
          __break(1u);
LABEL_50:
          v92 = [objc_allocWithZone(MEMORY[0x263F3F758]) v28[43]];
          objc_msgSend(v37, sel_pointScale);
          objc_msgSend(v92, sel_setPointScale_);
          goto LABEL_51;
        }
        uint64_t v63 = (void *)swift_allocObject();
        v63[2] = v62;
        v63[3] = v119;
        v63[4] = v37;
        uint64_t v64 = swift_allocObject();
        *(void *)(v64 + 16) = sub_25C464AF8;
        *(void *)(v64 + 24) = v63;
        v132 = sub_25C478590;
        v133 = (char **)v64;
        *(void *)&uint64_t aBlock = MEMORY[0x263EF8330];
        *((void *)&aBlock + sub_25C45E010("[%@] %s: unblank", (void (*)(void))sub_25C45D9DC, 1) = 1107296256;
        v130 = (uint64_t)sub_25C47858C;
        v131 = (long long *)&block_descriptor_12;
        uint64_t v65 = _Block_copy(&aBlock);
        uint64_t v8 = v133;
        uint64_t v28 = v119;
        id v62 = v62;
        swift_retain();
        swift_retain();
        swift_release();
        objc_msgSend(v62, sel_configureParameters_, v65);
        _Block_release(v65);
        char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
        swift_release();
        if (isEscapingClosureAtFileLocation) {
          goto LABEL_49;
        }
        objc_msgSend(v62, sel_addExtension_, ObjCClassFromMetadata);
        swift_release();
        type metadata accessor for FBScenePresentable();
        swift_allocObject();
        uint64_t v67 = v28;
        swift_retain();
        uint64_t v68 = sub_25C463444(v62, v67, (uint64_t)sub_25C477334, (uint64_t)v37, (uint64_t)sub_25C464374, 0);
        swift_release();
        uint64_t v69 = *(void *)&v126[v115];
        swift_beginAccess();
        uint64_t v70 = *(void *)(v69 + 48);
        if (!*(void *)(v70 + 16)) {
          goto LABEL_33;
        }
        swift_bridgeObjectRetain();
        unint64_t v71 = sub_25C4761B0(v122, v120, v121);
        if ((v72 & 1) == 0) {
          break;
        }
        unint64_t v11 = *(unsigned __int8 **)(*(void *)(v70 + 56) + 8 * v71);
        swift_endAccess();
        swift_retain();
        swift_bridgeObjectRelease();
LABEL_34:
        uint64_t v7 = 0xD000000000000018;
        swift_beginAccess();
        int v78 = swift_retain();
        MEMORY[0x261185B10](v78);
        p_uint64_t aBlock = *(long long **)((*((void *)v11 + 10) & 0xFFFFFFFFFFFFFF8) + 0x10);
        if ((unint64_t)p_aBlock >= *(void *)((*((void *)v11 + 10) & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_25C47AB18();
        }
        sub_25C47AB48();
        sub_25C47AAF8();
        swift_endAccess();
        swift_beginAccess();
        uint64_t v79 = (void *)*((void *)v11 + 2);
        uint64_t v10 = v11[24];
        if (v11[24])
        {
          if (v10 != 1) {
            goto LABEL_55;
          }
          uint64_t v83 = qword_26A5A84F0;
          uint64_t v84 = v79;
          if (v83 != -1) {
            swift_once();
          }
          uint64_t v85 = sub_25C47AA38();
          __swift_project_value_buffer(v85, (uint64_t)qword_26A5AACD8);
          swift_retain_n();
          uint64_t v86 = sub_25C47AA18();
          uint64_t v87 = sub_25C47AD28();
          if (os_log_type_enabled(v86, v87))
          {
            p_uint64_t aBlock = (long long *)swift_slowAlloc();
            v88 = swift_slowAlloc();
            *(void *)&uint64_t aBlock = v88;
            *(_DWORD *)p_uint64_t aBlock = 136446210;
            uint64_t v8 = (char **)((char *)p_aBlock + 4);
            v89 = sub_25C4633A8();
            v128 = sub_25C47596C(v89, v90, (uint64_t *)&aBlock);
            sub_25C47ADB8();
            swift_release_n();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_25C444000, v86, v87, "%{public}s: inactive. update settings later", (uint8_t *)p_aBlock, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x261186AD0](v88, -1, -1);
            MEMORY[0x261186AD0](p_aBlock, -1, -1);
          }
          else
          {

            swift_release_n();
          }
        }
        else
        {
          uint64_t v80 = *(void **)(v68 + 32);
          p_uint64_t aBlock = (long long *)swift_allocObject();
          *((void *)p_aBlock + 2) = sub_25C464D98;
          *((void *)p_aBlock + 3) = v68;
          v132 = sub_25C478590;
          v133 = (char **)p_aBlock;
          *(void *)&uint64_t aBlock = MEMORY[0x263EF8330];
          *((void *)&aBlock + sub_25C45E010("[%@] %s: unblank", (void (*)(void))sub_25C45D9DC, 1) = 1107296256;
          v130 = (uint64_t)sub_25C464554;
          v131 = (long long *)&block_descriptor_18;
          uint64_t v81 = _Block_copy(&aBlock);
          swift_retain();
          uint64_t v82 = v79;
          swift_retain();
          swift_release();
          objc_msgSend(v80, sel_updateSettingsWithBlock_, v81);
          _Block_release(v81);
          uint64_t v7 = swift_isEscapingClosureAtFileLocation();
          swift_release();
          if (v7)
          {
            __break(1u);
LABEL_53:
            __break(1u);
LABEL_54:
            __break(1u);
            while (1)
            {
LABEL_55:
              sub_25C47AF18();
              __break(1u);
LABEL_56:
              *(void *)&uint64_t aBlock = 0;
              *((void *)&aBlock + sub_25C45E010("[%@] %s: unblank", (void (*)(void))sub_25C45D9DC, 1) = 0xE000000000000000;
              sub_25C47AE98();
              v134[0] = aBlock;
              sub_25C47AAB8();
              *(void *)&uint64_t aBlock = v8;
              *((void *)&aBlock + sub_25C45E010("[%@] %s: unblank", (void (*)(void))sub_25C45D9DC, 1) = v7;
              v130 = v10;
              v131 = p_aBlock;
              LOBYTE(v132) = (_BYTE)v11;
              BYTE1(v132) = v123;
              sub_25C47AEF8();
            }
          }
          if (*(unsigned char *)(v68 + 16) != 1)
          {
            (*(void (**)(void *))(v68 + 48))(v80);
            *(unsigned char *)(v68 + 16) = 1;
          }
          swift_release();
        }
        *(unsigned char *)(v68 + 17) = v10;

        id v53 = *(id *)(v68 + 32);
        sub_25C470870(v53);
        swift_release();

        sub_25C47749C((uint64_t)v134);
        swift_release();
        uint64_t v52 = v123 + 40;
        unint64_t v11 = v125 - 1;
        uint64_t v7 = (uint64_t)"";
        uint64_t v10 = v117;
        if (v125 == (unsigned __int8 *)1)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v28 = (SEL *)&selRef_descriptionForRootObject_;
          unint64_t v37 = v119;
          uint64_t v43 = v110;
          unint64_t v42 = v113;
          int64_t v44 = v114;
          goto LABEL_7;
        }
      }
      swift_bridgeObjectRelease();
LABEL_33:
      swift_endAccess();
      uint64_t v73 = *(void (**)(uint64_t *__return_ptr, long long *))(v69 + 16);
      v74 = *(unsigned char *)(v69 + 40);
      *(void *)&uint64_t aBlock = *(void *)(v69 + 32);
      int v75 = (id)aBlock;
      v73(&v128, &aBlock);
      int v76 = v128;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A9078);
      swift_allocObject();
      swift_bridgeObjectRetain();
      uint64_t v8 = (char **)v121;
      unint64_t v11 = (unsigned __int8 *)sub_25C47733C(v122, v120, v121, v75, v74, v76);
      swift_bridgeObjectRelease();

      swift_release();
      swift_beginAccess();
      swift_bridgeObjectRetain();
      swift_retain();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v128 = *(void *)(v69 + 48);
      *(void *)(v69 + 48) = 0x8000000000000000;
      sub_25C47667C((uint64_t)v11, v122, v120, v121, isUniquelyReferenced_nonNull_native);
      *(void *)(v69 + 48) = v128;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_endAccess();
      goto LABEL_34;
    }
  }
  int64_t v47 = v44 + 1;
  if (__OFADD__(v44, 1)) {
    goto LABEL_53;
  }
  if (v47 >= v112) {
    goto LABEL_46;
  }
  unint64_t v48 = *(void *)(v111 + 8 * v47);
  ++v44;
  if (v48) {
    goto LABEL_22;
  }
  int64_t v44 = v47 + 1;
  if (v47 + 1 >= v112) {
    goto LABEL_46;
  }
  unint64_t v48 = *(void *)(v111 + 8 * v44);
  if (v48) {
    goto LABEL_22;
  }
  int64_t v44 = v47 + 2;
  if (v47 + 2 >= v112) {
    goto LABEL_46;
  }
  unint64_t v48 = *(void *)(v111 + 8 * v44);
  if (v48)
  {
LABEL_22:
    unint64_t v42 = (v48 - 1) & v48;
    unint64_t v46 = __clz(__rbit64(v48)) + (v44 << 6);
    goto LABEL_23;
  }
  int64_t v49 = v47 + 3;
  if (v49 >= v112) {
    goto LABEL_46;
  }
  unint64_t v48 = *(void *)(v111 + 8 * v49);
  if (v48)
  {
    int64_t v44 = v49;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v44 = v49 + 1;
    if (__OFADD__(v49, 1)) {
      goto LABEL_54;
    }
    if (v44 >= v112) {
      break;
    }
    unint64_t v48 = *(void *)(v111 + 8 * v44);
    ++v49;
    if (v48) {
      goto LABEL_22;
    }
  }
LABEL_46:
  swift_release();
  uint64_t v91 = *(void *)&v126[v116];
  id v62 = *(id *)(v91 + 32);
  if (!v62) {
    goto LABEL_50;
  }
  v92 = *(id *)(v91 + 32);
LABEL_51:
  v93 = v37;
  v94 = *(void *)&v126[v115];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A9080);
  swift_allocObject();
  uint64_t v95 = v107;
  v96 = v105;
  uint64_t v97 = v62;
  swift_retain();
  swift_retain();
  v98 = v92;
  *(void *)&v126[OBJC_IVAR___SSKSceneHostingDisplayControllerAdapter_displayUpdater] = sub_25C46DEE0((uint64_t)v95, (uint64_t)v96, v106, v94, (uint64_t)v98);

  v127.receiver = v126;
  v127.super_class = (Class)type metadata accessor for SceneHostingDisplayControllerAdapter();
  uint64_t v99 = (char *)objc_msgSendSuper2(&v127, v28[43]);
  objc_msgSend(v104, sel_setDelegate_, v99);

  swift_release();
  uint64_t v100 = *(void *)&v99[OBJC_IVAR___SSKSceneHostingDisplayControllerAdapter_presentableProvider];
  uint64_t v101 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v102 = *(void *)(v100 + 40);
  *(void *)(v100 + 4sub_25C45E010("[%@] %s: blank", (void (*)(void))sub_25C45D9C8, 0) = sub_25C477550;
  *(void *)(v100 + 48) = v101;
  sub_25C4646CC(v102);
  return v99;
}

uint64_t sub_25C4747F4@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  v19[5] = *MEMORY[0x263EF8340];
  id v3 = *a1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A9248);
  uint64_t v5 = (void *)swift_allocObject();
  id v6 = v3;
  if ((MEMORY[0x263F8EE78] & 0xC000000000000000) != 0 && sub_25C47AF28()) {
    sub_25C476C7C(MEMORY[0x263F8EE78]);
  }
  else {
    uint64_t v7 = MEMORY[0x263F8EE88];
  }
  v5[5] = v6;
  void v5[6] = v7;
  v5[3] = 0;
  v5[4] = 0;
  void v5[2] = sub_25C456CE8;
  id v8 = v6;
  id v9 = sub_25C477148(v8);
  uint64_t v11 = v10;
  uint64_t v13 = v12;

  v19[3] = v4;
  v19[4] = &off_26BC656F0;
  v19[0] = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A9250);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25C47E130;
  *(void *)(inited + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A9258);
  *(void *)(inited + 64) = sub_25C4784E0();
  *(void *)(inited + 32) = v9;
  *(void *)(inited + 4sub_25C45E010("[%@] %s: blank", (void (*)(void))sub_25C45D9C8, 0) = v11;
  *(void *)(inited + 48) = v13;
  uint64_t v15 = swift_initStackObject();
  *(_OWORD *)(v15 + 16) = xmmword_25C47E130;
  sub_25C45FED0((uint64_t)v19, v15 + 32);
  swift_retain();
  id v16 = v9;
  swift_bridgeObjectRetain();
  sub_25C470704(inited);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A9268);
  swift_allocObject();
  uint64_t v17 = sub_25C476FD8(v15);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);

  swift_release();
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v17;
  return result;
}

void sub_25C4749F8(void *a1, uint64_t a2)
{
  uint64_t v3 = a2 + 16;
  swift_beginAccess();
  uint64_t v4 = MEMORY[0x261186B80](v3);
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    sub_25C474A54(a1);
  }
}

void sub_25C474A54(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A8990);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void *)(v1 + OBJC_IVAR___SSKSceneHostingDisplayControllerAdapter_displayUpdater);
  uint64_t v7 = *(void **)(v6 + 72);
  sub_25C457A30(0, (unint64_t *)&unk_26A5A8830);
  id v8 = v7;
  char v9 = sub_25C47AD88();

  if ((v9 & 1) == 0)
  {
    uint64_t v10 = *(void **)(v6 + 72);
    *(void *)(v6 + 72) = a1;
    id v11 = a1;

    sub_25C47ABD8();
    sub_25C47ABC8();
    uint64_t v12 = sub_25C47ABF8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v5, 1, 1, v12);
    uint64_t v13 = swift_allocObject();
    *(void *)(v13 + 16) = &unk_26A5A9218;
    *(void *)(v13 + 24) = v6;
    swift_retain_n();
    sub_25C47AC48();
    swift_release();
    sub_25C4783A0((uint64_t)v5, &qword_26A5A8990);
    swift_release();
    swift_release();
  }
}

id SceneHostingDisplayControllerAdapter.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SceneHostingDisplayControllerAdapter();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_25C474DD4()
{
  return 1;
}

uint64_t sub_25C474DDC()
{
  return sub_25C47B098();
}

uint64_t sub_25C474E20()
{
  return sub_25C47B078();
}

uint64_t sub_25C474E48()
{
  return sub_25C47B098();
}

void SceneHostingDisplayControllerAdapter.workspace(_:didReceiveSceneRequestWith:from:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void, void *))
{
  sub_25C477558();
  uint64_t v5 = (void *)swift_allocError();
  a4(0, v5);
}

uint64_t SceneHostingDisplayControllerAdapter.workspace(_:didReceive:with:from:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_25C4775AC(a2, a4);
}

Swift::Void __swiftcall SceneHostingDisplayControllerAdapter.gainedControl()()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A8990);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v0[OBJC_IVAR___SSKSceneHostingDisplayControllerAdapter_activationState] = 0;
  uint64_t v4 = *(void *)&v0[OBJC_IVAR___SSKSceneHostingDisplayControllerAdapter_displayUpdater];
  if (*(unsigned char *)(v4 + 64))
  {
    *(unsigned char *)(v4 + 64) = 0;
    sub_25C47ABD8();
    sub_25C47ABC8();
    uint64_t v5 = sub_25C47ABF8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v3, 1, 1, v5);
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = &unk_26A5A90A8;
    *(void *)(v6 + 24) = v4;
    swift_retain_n();
    sub_25C47AC48();
    swift_release();
    sub_25C4783A0((uint64_t)v3, &qword_26A5A8990);
    swift_release();
    swift_release();
  }
  v10[1] = v0;
  swift_getKeyPath();
  *(void *)(swift_allocObject() + 16) = v0;
  uint64_t v7 = v0;
  uint64_t v8 = sub_25C47A9D8();
  swift_release();
  swift_release();
  char v9 = *(void **)&v7[OBJC_IVAR___SSKSceneHostingDisplayControllerAdapter_caDisplayObservation];
  *(void *)&v7[OBJC_IVAR___SSKSceneHostingDisplayControllerAdapter_caDisplayObservation] = v8;
}

uint64_t sub_25C47530C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A8990);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_25C47ABF8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  sub_25C47ABD8();
  id v8 = a3;
  uint64_t v9 = sub_25C47ABC8();
  uint64_t v10 = (void *)swift_allocObject();
  uint64_t v11 = MEMORY[0x263F8F500];
  void v10[2] = v9;
  v10[3] = v11;
  v10[4] = v8;
  sub_25C471004((uint64_t)v6, (uint64_t)&unk_26A5A9148, (uint64_t)v10);
  return swift_release();
}

uint64_t sub_25C475424(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[2] = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A8990);
  v4[3] = swift_task_alloc();
  v4[4] = sub_25C47ABD8();
  v4[5] = sub_25C47ABC8();
  uint64_t v6 = sub_25C47AB88();
  return MEMORY[0x270FA2498](sub_25C4754F0, v6, v5);
}

uint64_t sub_25C4754F0()
{
  uint64_t v2 = v0[2];
  uint64_t v1 = v0[3];
  swift_release();
  uint64_t v3 = *(void *)(v2 + OBJC_IVAR___SSKSceneHostingDisplayControllerAdapter_displayUpdater);
  sub_25C47ABC8();
  uint64_t v4 = sub_25C47ABF8();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v1, 1, 1, v4);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = &unk_26A5A9160;
  *(void *)(v5 + 24) = v3;
  swift_retain_n();
  sub_25C47AC48();
  swift_release();
  sub_25C4783A0(v1, &qword_26A5A8990);
  swift_release();
  swift_release();
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

Swift::Void __swiftcall SceneHostingDisplayControllerAdapter.lostControl()()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A8990);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(unsigned char *)(v0 + OBJC_IVAR___SSKSceneHostingDisplayControllerAdapter_activationState) = 1;
  uint64_t v5 = *(void *)(v0 + OBJC_IVAR___SSKSceneHostingDisplayControllerAdapter_displayUpdater);
  if (*(unsigned char *)(v5 + 64) != 1)
  {
    *(unsigned char *)(v5 + 64) = 1;
    sub_25C47ABD8();
    sub_25C47ABC8();
    uint64_t v6 = sub_25C47ABF8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v4, 1, 1, v6);
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = &unk_26A5A90B8;
    *(void *)(v7 + 24) = v5;
    swift_retain_n();
    sub_25C47AC48();
    swift_release();
    sub_25C4783A0((uint64_t)v4, &qword_26A5A8990);
    swift_release();
    swift_release();
  }
  uint64_t v8 = OBJC_IVAR___SSKSceneHostingDisplayControllerAdapter_caDisplayObservation;
  uint64_t v9 = *(void **)(v0 + OBJC_IVAR___SSKSceneHostingDisplayControllerAdapter_caDisplayObservation);
  if (v9)
  {
    id v10 = v9;
    sub_25C47A9B8();
    uint64_t v11 = *(void **)(v1 + v8);
    *(void *)(v1 + v8) = 0;
  }
}

uint64_t sub_25C475880(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_25C475890(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_25C4758CC(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_25C4758F4(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_25C47596C(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_25C47ADB8();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_25C47596C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_25C475A40(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_25C478484((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_25C478484((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_25C475A40(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_25C47ADC8();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_25C475BFC(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_25C47AED8();
  if (!v8)
  {
    sub_25C47AF08();
    __break(1u);
LABEL_17:
    uint64_t result = sub_25C47AF68();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_25C475BFC(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_25C475C94(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_25C475E74(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_25C475E74(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_25C475C94(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_25C475E0C(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_25C47AEA8();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_25C47AF08();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_25C47AAC8();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_25C47AF68();
    __break(1u);
LABEL_14:
    uint64_t result = sub_25C47AF08();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_25C475E0C(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A9230);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_25C475E74(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A9230);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_25C47AF68();
  __break(1u);
  return result;
}

unsigned char **sub_25C475FC4(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  unsigned char *v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t sub_25C475FD4(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25C475FF4(a1, a2, a3, (void *)*v3);
  *unint64_t v3 = result;
  return result;
}

uint64_t sub_25C475FF4(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A5A9280);
    uint64_t v10 = (void *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    void v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 48);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  unint64_t v12 = (unint64_t)(v10 + 4);
  unint64_t v13 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v12 >= v13 + 48 * v8) {
      memmove(v10 + 4, a4 + 4, 48 * v8);
    }
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= v12 + 48 * v8 || v12 >= v13 + 48 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A9200);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_25C47AF68();
  __break(1u);
  return result;
}

void *sub_25C47619C(void *a1)
{
  return sub_25C467050(0, a1[2], 0, a1);
}

unint64_t sub_25C4761B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25C47B068();
  swift_bridgeObjectRetain();
  sub_25C47AAA8();
  swift_bridgeObjectRelease();
  uint64_t v6 = sub_25C47B098();
  return sub_25C476248(a1, a2, a3, v6);
}

unint64_t sub_25C476248(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4 + 64;
  uint64_t v6 = -1 << *(unsigned char *)(v4 + 32);
  unint64_t i = a4 & ~v6;
  if ((*(void *)(v4 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    uint64_t v10 = *(void *)(v4 + 48);
    size_t v11 = (void *)(v10 + 24 * i);
    if ((*v11 != a1 || v11[1] != a2) && (sub_25C47AFD8() & 1) == 0)
    {
      uint64_t v13 = ~v6;
      for (unint64_t i = (i + 1) & v13; ((*(void *)(v5 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v13)
      {
        uint64_t v14 = (void *)(v10 + 24 * i);
        if (*v14 == a1 && v14[1] == a2) {
          break;
        }
        if (sub_25C47AFD8()) {
          break;
        }
      }
    }
  }
  return i;
}

uint64_t sub_25C476354(uint64_t a1, char a2)
{
  unint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A5A9238);
  char v36 = a2;
  uint64_t v6 = sub_25C47AF48();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    unint64_t v35 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v34 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v11 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    while (1)
    {
      if (v10)
      {
        unint64_t v19 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v20 = v19 | (v13 << 6);
      }
      else
      {
        int64_t v21 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v21 >= v34) {
          goto LABEL_33;
        }
        unint64_t v22 = v35[v21];
        ++v13;
        if (!v22)
        {
          int64_t v13 = v21 + 1;
          if (v21 + 1 >= v34) {
            goto LABEL_33;
          }
          unint64_t v22 = v35[v13];
          if (!v22)
          {
            int64_t v23 = v21 + 2;
            if (v23 >= v34)
            {
LABEL_33:
              swift_release();
              unint64_t v3 = v2;
              if (v36)
              {
                uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
                if (v33 >= 64) {
                  bzero(v35, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *unint64_t v35 = -1 << v33;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v22 = v35[v23];
            if (!v22)
            {
              while (1)
              {
                int64_t v13 = v23 + 1;
                if (__OFADD__(v23, 1)) {
                  goto LABEL_40;
                }
                if (v13 >= v34) {
                  goto LABEL_33;
                }
                unint64_t v22 = v35[v13];
                ++v23;
                if (v22) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v13 = v23;
          }
        }
LABEL_30:
        unint64_t v10 = (v22 - 1) & v22;
        unint64_t v20 = __clz(__rbit64(v22)) + (v13 << 6);
      }
      uint64_t v28 = (uint64_t *)(*(void *)(v5 + 48) + 24 * v20);
      uint64_t v30 = *v28;
      uint64_t v29 = v28[1];
      uint64_t v31 = v28[2];
      uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
      if ((v36 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        swift_retain();
      }
      sub_25C47B068();
      swift_bridgeObjectRetain();
      sub_25C47AAA8();
      swift_bridgeObjectRelease();
      uint64_t result = sub_25C47B098();
      uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v15 = result & ~v14;
      unint64_t v16 = v15 >> 6;
      if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
      {
        unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          BOOL v26 = v16 == v25;
          if (v16 == v25) {
            unint64_t v16 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v11 + 8 * v16);
        }
        while (v27 == -1);
        unint64_t v17 = __clz(__rbit64(~v27)) + (v16 << 6);
      }
      *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      uint64_t v18 = (void *)(*(void *)(v7 + 48) + 24 * v17);
      *uint64_t v18 = v30;
      v18[1] = v29;
      v18[2] = v31;
      *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *unint64_t v3 = v7;
  return result;
}

uint64_t sub_25C47667C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v6 = v5;
  uint64_t v12 = *v5;
  unint64_t v14 = sub_25C4761B0(a2, a3, a4);
  uint64_t v15 = *(void *)(v12 + 16);
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v18 = v13;
  uint64_t v19 = *(void *)(v12 + 24);
  if (v19 >= v17 && (a5 & 1) != 0) {
    goto LABEL_7;
  }
  if (v19 >= v17 && (a5 & 1) == 0)
  {
    sub_25C47680C();
LABEL_7:
    unint64_t v20 = (void *)*v6;
    if (v18)
    {
LABEL_8:
      uint64_t v21 = v20[7];
      uint64_t result = swift_release();
      *(void *)(v21 + 8 * v14) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_25C476354(v17, a5 & 1);
  unint64_t v23 = sub_25C4761B0(a2, a3, a4);
  if ((v18 & 1) != (v24 & 1))
  {
LABEL_17:
    uint64_t result = sub_25C47B008();
    __break(1u);
    return result;
  }
  unint64_t v14 = v23;
  unint64_t v20 = (void *)*v6;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  v20[(v14 >> 6) + 8] |= 1 << v14;
  unint64_t v25 = (uint64_t *)(v20[6] + 24 * v14);
  *unint64_t v25 = a2;
  v25[1] = a3;
  v25[2] = a4;
  *(void *)(v20[7] + 8 * v14) = a1;
  uint64_t v26 = v20[2];
  BOOL v27 = __OFADD__(v26, 1);
  uint64_t v28 = v26 + 1;
  if (v27)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v20[2] = v28;
  return swift_bridgeObjectRetain();
}

void *sub_25C47680C()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A5A9238);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25C47AF38();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v24 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v24 >= v13) {
      goto LABEL_26;
    }
    unint64_t v25 = *(void *)(v6 + 8 * v24);
    ++v9;
    if (!v25)
    {
      int64_t v9 = v24 + 1;
      if (v24 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v25 = *(void *)(v6 + 8 * v9);
      if (!v25) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v25 - 1) & v25;
    unint64_t v15 = __clz(__rbit64(v25)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 24 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 24 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = v17[2];
    uint64_t v21 = 8 * v15;
    uint64_t v22 = *(void *)(*(void *)(v2 + 56) + v21);
    unint64_t v23 = (void *)(*(void *)(v4 + 48) + v16);
    void *v23 = v19;
    v23[1] = v18;
    v23[2] = v20;
    *(void *)(*(void *)(v4 + 56) + v2sub_25C45E010("[%@] %s: unblank", (void (*)(void))sub_25C45D9DC, 1) = v22;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_retain();
  }
  int64_t v26 = v24 + 2;
  if (v26 >= v13) {
    goto LABEL_26;
  }
  unint64_t v25 = *(void *)(v6 + 8 * v26);
  if (v25)
  {
    int64_t v9 = v26;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v26 + 1;
    if (__OFADD__(v26, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v25 = *(void *)(v6 + 8 * v9);
    ++v26;
    if (v25) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_25C4769D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v8 = *a4;
  int64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *int64_t v9 = v4;
  v9[1] = sub_25C45D99C;
  return sub_25C4723FC(a1, a2, a3, v8);
}

uint64_t sub_25C476A88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v7 = *a5;
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v8;
  void *v8 = v5;
  v8[1] = sub_25C45D99C;
  void v8[4] = a4;
  v8[5] = v7;
  return MEMORY[0x270FA2498](sub_25C472B38, 0, 0);
}

uint64_t sub_25C476B38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t *a5, uint64_t a6)
{
  uint64_t v11 = *a4;
  uint64_t v12 = *a5;
  int64_t v13 = (void *)swift_task_alloc();
  *(void *)(v6 + 16) = v13;
  *int64_t v13 = v6;
  v13[1] = sub_25C45D99C;
  return sub_25C472FD4(a1, a2, a3, v11, v12, a6);
}

uint64_t sub_25C476C08()
{
  return 91;
}

void sub_25C476C7C(unint64_t a1)
{
  unint64_t v1 = a1;
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_25C47AF28();
    swift_bridgeObjectRelease();
    if (v6)
    {
LABEL_3:
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A5A9270);
      uint64_t v3 = sub_25C47AE88();
      uint64_t v4 = v1 & 0xFFFFFFFFFFFFFF8;
      if (!v2) {
        goto LABEL_4;
      }
LABEL_8:
      swift_bridgeObjectRetain();
      uint64_t v5 = sub_25C47AF28();
      swift_bridgeObjectRelease();
      if (!v5) {
        return;
      }
      goto LABEL_9;
    }
  }
  else if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  uint64_t v3 = MEMORY[0x263F8EE88];
  uint64_t v4 = v1 & 0xFFFFFFFFFFFFFF8;
  if (v2) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v5 = *(void *)(v4 + 16);
  if (!v5) {
    return;
  }
LABEL_9:
  uint64_t v7 = v3 + 56;
  uint64_t v43 = v5;
  if ((v1 & 0xC000000000000001) != 0)
  {
    uint64_t v8 = 0;
    unint64_t v41 = v1;
    while (1)
    {
      while (1)
      {
        uint64_t v9 = MEMORY[0x261185F00](v8, v1);
        BOOL v10 = __OFADD__(v8++, 1);
        if (v10)
        {
          __break(1u);
          goto LABEL_36;
        }
        uint64_t v11 = v9;
        uint64_t v12 = sub_25C47AD78();
        uint64_t v13 = -1 << *(unsigned char *)(v3 + 32);
        unint64_t v14 = v12 & ~v13;
        unint64_t v15 = v14 >> 6;
        uint64_t v16 = *(void *)(v7 + 8 * (v14 >> 6));
        uint64_t v17 = 1 << v14;
        if (((1 << v14) & v16) != 0) {
          break;
        }
LABEL_20:
        *(void *)(v7 + 8 * v15) = v17 | v16;
        *(void *)(*(void *)(v3 + 48) + 8 * v14) = v11;
        uint64_t v23 = *(void *)(v3 + 16);
        BOOL v10 = __OFADD__(v23, 1);
        uint64_t v24 = v23 + 1;
        if (v10) {
          goto LABEL_37;
        }
        *(void *)(v3 + 16) = v24;
        if (v8 == v5) {
          return;
        }
      }
      sub_25C457A30(0, &qword_26A5A8810);
      id v18 = *(id *)(*(void *)(v3 + 48) + 8 * v14);
      char v19 = sub_25C47AD88();

      if ((v19 & 1) == 0)
      {
        uint64_t v20 = ~v13;
        while (1)
        {
          unint64_t v14 = (v14 + 1) & v20;
          unint64_t v15 = v14 >> 6;
          uint64_t v16 = *(void *)(v7 + 8 * (v14 >> 6));
          uint64_t v17 = 1 << v14;
          if ((v16 & (1 << v14)) == 0) {
            break;
          }
          id v21 = *(id *)(*(void *)(v3 + 48) + 8 * v14);
          char v22 = sub_25C47AD88();

          if (v22) {
            goto LABEL_11;
          }
        }
        unint64_t v1 = v41;
        uint64_t v5 = v43;
        goto LABEL_20;
      }
LABEL_11:
      swift_unknownObjectRelease();
      unint64_t v1 = v41;
      uint64_t v5 = v43;
      if (v8 == v43) {
        return;
      }
    }
  }
  uint64_t v25 = 0;
  unint64_t v40 = v1 + 32;
  uint64_t v42 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v25 != v42)
  {
    id v26 = *(id *)(v40 + 8 * v25);
    uint64_t v27 = sub_25C47AD78();
    uint64_t v28 = -1 << *(unsigned char *)(v3 + 32);
    unint64_t v29 = v27 & ~v28;
    unint64_t v30 = v29 >> 6;
    uint64_t v31 = *(void *)(v7 + 8 * (v29 >> 6));
    uint64_t v32 = 1 << v29;
    if (((1 << v29) & v31) != 0)
    {
      sub_25C457A30(0, &qword_26A5A8810);
      id v33 = *(id *)(*(void *)(v3 + 48) + 8 * v29);
      char v34 = sub_25C47AD88();

      if (v34)
      {
LABEL_24:

        goto LABEL_25;
      }
      uint64_t v35 = ~v28;
      while (1)
      {
        unint64_t v29 = (v29 + 1) & v35;
        unint64_t v30 = v29 >> 6;
        uint64_t v31 = *(void *)(v7 + 8 * (v29 >> 6));
        uint64_t v32 = 1 << v29;
        if ((v31 & (1 << v29)) == 0) {
          break;
        }
        id v36 = *(id *)(*(void *)(v3 + 48) + 8 * v29);
        char v37 = sub_25C47AD88();

        if (v37) {
          goto LABEL_24;
        }
      }
    }
    *(void *)(v7 + 8 * v3sub_25C45E010("[%@] %s: blank", (void (*)(void))sub_25C45D9C8, 0) = v32 | v31;
    *(void *)(*(void *)(v3 + 48) + 8 * v29) = v26;
    uint64_t v38 = *(void *)(v3 + 16);
    BOOL v10 = __OFADD__(v38, 1);
    uint64_t v39 = v38 + 1;
    if (v10) {
      goto LABEL_38;
    }
    *(void *)(v3 + 16) = v39;
LABEL_25:
    if (++v25 == v43) {
      return;
    }
  }
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
}

uint64_t sub_25C476FD8(uint64_t a1)
{
  uint64_t v2 = v1;
  int64_t v3 = *(void *)(a1 + 16);
  unint64_t v4 = MEMORY[0x263F8EE78];
  if (v3)
  {
    uint64_t v20 = MEMORY[0x263F8EE78];
    sub_25C475FD4(0, v3, 0);
    uint64_t v6 = a1 + 32;
    uint64_t v7 = MEMORY[0x263F8EE88];
    do
    {
      sub_25C45FED0(v6, (uint64_t)v17);
      sub_25C45FED0((uint64_t)v17, (uint64_t)v16);
      uint64_t v8 = v7;
      if ((v4 & 0xC000000000000000) != 0)
      {
        if (sub_25C47AF28()) {
          sub_25C476C7C(v4);
        }
        else {
          uint64_t v8 = v7;
        }
      }
      *((void *)&v19 + sub_25C45E010("[%@] %s: unblank", (void (*)(void))sub_25C45D9DC, 1) = v8;
      sub_25C47853C(v16, (uint64_t)v18);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
      uint64_t v9 = v20;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_25C475FD4(0, *(void *)(v9 + 16) + 1, 1);
        uint64_t v9 = v20;
      }
      unint64_t v11 = *(void *)(v9 + 16);
      unint64_t v10 = *(void *)(v9 + 24);
      if (v11 >= v10 >> 1)
      {
        sub_25C475FD4(v10 > 1, v11 + 1, 1);
        uint64_t v9 = v20;
      }
      *(void *)(v9 + 16) = v11 + 1;
      uint64_t v12 = (_OWORD *)(v9 + 48 * v11);
      long long v13 = v18[0];
      long long v14 = v19;
      uint64_t v12[3] = v18[1];
      v12[4] = v14;
      v12[2] = v13;
      v6 += 40;
      --v3;
    }
    while (v3);
  }
  else
  {
    uint64_t v9 = MEMORY[0x263F8EE78];
  }
  *(void *)(v2 + 16) = v9;
  return v2;
}

id sub_25C477148(void *a1)
{
  id v1 = a1;
  sub_25C47AE98();
  swift_bridgeObjectRelease();
  sub_25C457A30(0, (unint64_t *)&unk_26B350B90);
  id v2 = v1;
  sub_25C47AA98();
  sub_25C47AAB8();
  swift_bridgeObjectRelease();
  sub_25C47AAB8();
  return v2;
}

uint64_t sub_25C477214()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_25C477264(void *a1)
{
  return sub_25C464014(a1, v1 + 16);
}

uint64_t sub_25C47726C()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 4sub_25C45E010("[%@] %s: blank", (void (*)(void))sub_25C45D9C8, 0) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

uint64_t sub_25C477294(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
  int64_t v3 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 24);
  id v5 = v3;
  swift_bridgeObjectRetain();
  id v6 = v2;
  return a1;
}

uint64_t sub_25C4772DC()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_25C477324()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25C477334(uint64_t a1)
{
  return sub_25C464384(a1, v1);
}

uint64_t sub_25C47733C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, char a5, uint64_t a6)
{
  uint64_t v8 = MEMORY[0x263F8EE78];
  *(void *)(v6 + 32) = a1;
  *(void *)(v6 + 4sub_25C45E010("[%@] %s: blank", (void (*)(void))sub_25C45D9C8, 0) = a2;
  *(void *)(v6 + 48) = a3;
  *(void *)(v6 + 16) = a4;
  *(void *)(v6 + 72) = a6;
  *(void *)(v6 + 8sub_25C45E010("[%@] %s: blank", (void (*)(void))sub_25C45D9C8, 0) = v8;
  *(unsigned char *)(v6 + 24) = a5;
  swift_bridgeObjectRetain_n();
  id v9 = a4;
  swift_retain();
  sub_25C47AAB8();
  swift_bridgeObjectRelease();
  sub_25C47AAB8();
  sub_25C47AAB8();
  swift_bridgeObjectRelease();
  sub_25C47AAB8();
  sub_25C457A30(0, (unint64_t *)&unk_26B350B90);
  id v10 = v9;
  sub_25C47AA98();
  sub_25C47AAB8();
  swift_bridgeObjectRelease();
  sub_25C47AAB8();
  *(void *)(v6 + 56) = 0x204343485BLL;
  *(void *)(v6 + 64) = 0xE500000000000000;
  return v6;
}

uint64_t sub_25C47749C(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
  int64_t v3 = *(void **)(a1 + 24);

  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_25C4774E4()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t type metadata accessor for SceneHostingDisplayControllerAdapter()
{
  return self;
}

uint64_t sub_25C477518()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_25C477550(void *a1)
{
  sub_25C4749F8(a1, v1);
}

unint64_t sub_25C477558()
{
  unint64_t result = qword_26A5A9090;
  if (!qword_26A5A9090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5A9090);
  }
  return result;
}

uint64_t sub_25C4775AC(void *a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(v2 + OBJC_IVAR___SSKSceneHostingDisplayControllerAdapter_presentableProvider);
  id v6 = objc_retain(*(id *)(*(void *)(v2 + OBJC_IVAR___SSKSceneHostingDisplayControllerAdapter_hostingGroupCoordinator)
                         + 32));
  sub_25C4641DC(a1, v6);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  type metadata accessor for FBScenePresentable();
  swift_allocObject();
  swift_unknownObjectRetain();
  id v8 = a1;
  swift_retain();
  uint64_t v9 = sub_25C463444(v8, v6, (uint64_t)sub_25C477334, v5, (uint64_t)sub_25C47847C, v7);
  if (qword_26B350B60 != -1) {
    swift_once();
  }
  uint64_t v10 = qword_26B350D50;
  uint64_t v11 = *(void *)algn_26B350D58;
  swift_bridgeObjectRetain();
  sub_25C471420(v9, v10, v11, 0);
  swift_release();
  return swift_bridgeObjectRelease();
}

void _s13ShellSceneKit0B31HostingDisplayControllerAdapterC19displayDisconnectedyySo18FBSDisplayIdentityCF_0()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A8990);
  MEMORY[0x270FA5388](v2 - 8);
  id v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(unsigned char *)(v0 + OBJC_IVAR___SSKSceneHostingDisplayControllerAdapter_activationState) = 2;
  uint64_t v5 = *(void *)(v0 + OBJC_IVAR___SSKSceneHostingDisplayControllerAdapter_displayUpdater);
  if (*(unsigned char *)(v5 + 64) != 2)
  {
    *(unsigned char *)(v5 + 64) = 2;
    sub_25C47ABD8();
    sub_25C47ABC8();
    uint64_t v6 = sub_25C47ABF8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v4, 1, 1, v6);
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = &unk_26A5A9208;
    *(void *)(v7 + 24) = v5;
    swift_retain_n();
    sub_25C47AC48();
    swift_release();
    sub_25C4783A0((uint64_t)v4, &qword_26A5A8990);
    swift_release();
    swift_release();
  }
  uint64_t v8 = OBJC_IVAR___SSKSceneHostingDisplayControllerAdapter_caDisplayObservation;
  uint64_t v9 = *(void **)(v0 + OBJC_IVAR___SSKSceneHostingDisplayControllerAdapter_caDisplayObservation);
  if (v9)
  {
    id v10 = v9;
    sub_25C47A9B8();
    uint64_t v11 = *(void **)(v1 + v8);
    *(void *)(v1 + v8) = 0;
  }
}

uint64_t sub_25C477B60()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25C45D99C;
  return sub_25C46DFE0();
}

char *keypath_get_selector_caDisplay()
{
  return sel_caDisplay;
}

id sub_25C477BFC@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_caDisplay);
  *a2 = result;
  return result;
}

char *keypath_get_selector_preferences()
{
  return sel_preferences;
}

id sub_25C477C44@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_preferences);
  *a2 = result;
  return result;
}

id sub_25C477C80(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setPreferences_, *a1);
}

uint64_t sub_25C477C94()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_25C477CCC(uint64_t a1, uint64_t a2)
{
  return sub_25C47530C(a1, a2, *(void **)(v2 + 16));
}

uint64_t method lookup function for SceneHostingDisplayControllerAdapter(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SceneHostingDisplayControllerAdapter);
}

uint64_t dispatch thunk of SceneHostingDisplayControllerAdapter.__allocating_init(boxedConfiguration:display:displayConfiguration:updateTransformsAdapter:)()
{
  return (*(uint64_t (**)(void))(v0 + 200))();
}

uint64_t getEnumTagSinglePayload for SceneHostingDisplayControllerAdapter.WorkspaceDelegateError(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *storeEnumTagSinglePayload for SceneHostingDisplayControllerAdapter.WorkspaceDelegateError(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *id result = a2;
        return result;
      case 2:
        *(_WORD *)id result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)id result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *id result = 0;
      break;
    case 2:
      *(_WORD *)id result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x25C477DF0);
    case 4:
      *(_DWORD *)id result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for SceneHostingDisplayControllerAdapter.WorkspaceDelegateError()
{
  return &type metadata for SceneHostingDisplayControllerAdapter.WorkspaceDelegateError;
}

unint64_t sub_25C477E2C()
{
  unint64_t result = qword_26A5A9130;
  if (!qword_26A5A9130)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5A9130);
  }
  return result;
}

uint64_t sub_25C477E80()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_25C477EC0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_25C455FD0;
  return sub_25C475424(a1, v4, v5, v6);
}

uint64_t sub_25C477F74(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_25C45D99C;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_26A5A9150 + dword_26A5A9150);
  return v6(a1, v4);
}

uint64_t sub_25C47802C(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *(void *)(v2 + 16);
  uint64_t v6 = *(uint64_t **)(v2 + 24);
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v8;
  void *v8 = v3;
  v8[1] = sub_25C45D99C;
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t *))((char *)&dword_26A5A91A0 + dword_26A5A91A0);
  return v9(a1, a2, v7, v6);
}

uint64_t sub_25C4780F4()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_25C47813C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_25C45D99C;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t *))((char *)&dword_26A5A91B8 + dword_26A5A91B8);
  return v8(a1, v4, v5, v6, v1 + 5);
}

uint64_t sub_25C47820C()
{
  swift_unknownObjectRelease();
  swift_release();

  swift_release();
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_25C47825C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1 + 4;
  uint64_t v7 = v1 + 5;
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_25C45D99C;
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t *, uint64_t *, uint64_t))((char *)&dword_26A5A91C8
                                                                                         + dword_26A5A91C8);
  return v10(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_25C47833C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_25C4783A0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_25C4783FC()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25C47840C()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25C478444()
{
  swift_unknownObjectRelease();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_25C47847C(void *a1)
{
  return sub_25C464388(a1, *(void *)(v1 + 16));
}

uint64_t sub_25C478484(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_25C4784E0()
{
  unint64_t result = qword_26A5A9260;
  if (!qword_26A5A9260)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5A9258);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5A9260);
  }
  return result;
}

uint64_t sub_25C47853C(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_25C478594(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t sub_25C4785A8(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t sub_25C4785BC()
{
  return 0;
}

uint64_t sub_25C478698()
{
  uint64_t v0 = sub_25C47AA38();
  __swift_allocate_value_buffer(v0, qword_26A5AACC0);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A5AACC0);
  return sub_25C47AA28();
}

uint64_t type metadata accessor for FBScenePresentableObserver()
{
  return self;
}

void sub_25C478860(void *a1)
{
  id v2 = objc_msgSend(a1, sel_settings);
  if (!v2) {
    goto LABEL_21;
  }
  long long v3 = v2;
  self;
  uint64_t v4 = swift_dynamicCastObjCClass();
  if (!v4)
  {

LABEL_21:
    sub_25C47AE98();
    sub_25C47AAB8();
    id v23 = objc_msgSend(a1, sel_description);
    sub_25C47AA88();

    sub_25C47AAB8();
    swift_bridgeObjectRelease();
    goto LABEL_22;
  }
  uint64_t v5 = (void *)v4;
  id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F3F7B0]), sel_init);
  uint64_t v7 = self;
  id v25 = objc_msgSend(v7, sel_diffFromSettings_toSettings_, v6, v5);

  uint64_t v8 = (void *)sub_25C47AA78();
  unsigned int v9 = objc_msgSend(v25, sel_containsSettingNamed_, v8);

  if (v9)
  {
    uint64_t v10 = *(void (**)(id))(v24
                                    + OBJC_IVAR____TtC13ShellSceneKit26FBScenePresentableObserver_preferredSceneLevelHandler);
    if (v10)
    {
      swift_retain();
      v10(objc_msgSend(v5, sel_preferredLevel));
      sub_25C4646CC((uint64_t)v10);
    }
  }
  id v11 = objc_msgSend(a1, sel_settings);
  if (v11)
  {
    uint64_t v12 = v11;
    self;
    uint64_t v13 = swift_dynamicCastObjCClass();
    if (!v13)
    {
      char v22 = v12;
      id v16 = v3;
      id v20 = v25;
      goto LABEL_16;
    }
    long long v14 = (void *)v13;
    id v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82448]), sel_init);
    id v16 = objc_msgSend(v7, sel_diffFromSettings_toSettings_, v15, v14);

    uint64_t v17 = (void *)sub_25C47AA78();
    unsigned int v18 = objc_msgSend(v16, sel_containsSettingNamed_, v17);

    if (!v18)
    {

      char v22 = v16;
      goto LABEL_15;
    }
    id v19 = objc_msgSend(v14, sel_displayConfigurationRequest);
    if (v19)
    {
      id v20 = v19;
      id v21 = *(void (**)(id))(v24
                                      + OBJC_IVAR____TtC13ShellSceneKit26FBScenePresentableObserver_displayConfigRequestHandler);
      if (v21)
      {
        swift_retain();
        v21(v20);

        sub_25C4646CC((uint64_t)v21);
        char v22 = v25;
LABEL_16:

        long long v3 = v16;
        id v25 = v20;
        goto LABEL_17;
      }

      char v22 = v20;
LABEL_15:
      id v16 = v12;
      id v20 = v3;
      goto LABEL_16;
    }
    while (1)
    {
LABEL_22:
      sub_25C47AF18();
      __break(1u);
    }
  }
LABEL_17:
}

uint64_t DisplayProfileConfiguration.priority.getter()
{
  return *(void *)v0;
}

uint64_t sub_25C478C34(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v4 = *(void *)(a2 + 8);
  if (v3)
  {
    if (v4)
    {
      char v5 = *(unsigned char *)(a2 + 16);
      char v6 = *(unsigned char *)(a1 + 16);
      BOOL v7 = *(void *)a1 == *(void *)a2 && v3 == v4;
      if (v7 || (v8 = sub_25C47AFD8(), char v9 = 0, (v8 & 1) != 0)) {
        char v9 = v5 ^ ((v6 & 1) == 0);
      }
    }
    else
    {
      char v9 = 0;
    }
  }
  else
  {
    char v9 = v4 == 0;
  }
  return v9 & 1;
}

uint64_t DisplayProfileConfiguration.supportsCloning.getter()
{
  return *(unsigned __int8 *)(v0 + 33);
}

uint64_t DisplayProfileConfiguration.supportsCloning.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 33) = result;
  return result;
}

uint64_t (*DisplayProfileConfiguration.supportsCloning.modify())()
{
  return nullsub_1;
}

uint64_t DisplayProfileConfiguration.init(identifier:behavesAsMainDisplay:priority:sceneRequestsByGroup:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  *(void *)a6 = a4;
  *(void *)(a6 + 8) = a5;
  *(void *)(a6 + 16) = result;
  *(void *)(a6 + 24) = a2;
  *(unsigned char *)(a6 + 32) = a3;
  *(unsigned char *)(a6 + 33) = 0;
  return result;
}

uint64_t DisplayProfileConfiguration.init(priority:sceneRequestsByGroup:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)a3 = result;
  *(void *)(a3 + 8) = a2;
  *(void *)(a3 + 16) = 0;
  *(void *)(a3 + 24) = 0;
  *(_WORD *)(a3 + 32) = 0;
  return result;
}

uint64_t sub_25C478D10(uint64_t result, uint64_t a2)
{
  if (result == a2) {
    return 1;
  }
  uint64_t v2 = result;
  if (*(void *)(result + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  int64_t v3 = 0;
  uint64_t v4 = result + 64;
  uint64_t v5 = 1 << *(unsigned char *)(result + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(result + 64);
  int64_t v8 = (unint64_t)(v5 + 63) >> 6;
  while (1)
  {
    if (v7)
    {
      unint64_t v9 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v10 = v9 | (v3 << 6);
      goto LABEL_24;
    }
    int64_t v11 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_31;
    }
    if (v11 >= v8) {
      return 1;
    }
    unint64_t v12 = *(void *)(v4 + 8 * v11);
    ++v3;
    if (!v12)
    {
      int64_t v3 = v11 + 1;
      if (v11 + 1 >= v8) {
        return 1;
      }
      unint64_t v12 = *(void *)(v4 + 8 * v3);
      if (!v12)
      {
        int64_t v3 = v11 + 2;
        if (v11 + 2 >= v8) {
          return 1;
        }
        unint64_t v12 = *(void *)(v4 + 8 * v3);
        if (!v12)
        {
          int64_t v3 = v11 + 3;
          if (v11 + 3 >= v8) {
            return 1;
          }
          unint64_t v12 = *(void *)(v4 + 8 * v3);
          if (!v12) {
            break;
          }
        }
      }
    }
LABEL_23:
    unint64_t v7 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v3 << 6);
LABEL_24:
    long long v14 = (uint64_t *)(*(void *)(v2 + 48) + 24 * v10);
    uint64_t v15 = *v14;
    uint64_t v16 = v14[1];
    uint64_t v17 = v14[2];
    uint64_t v18 = *(void *)(*(void *)(v2 + 56) + 8 * v10);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_25C4761B0(v15, v16, v17);
    LOBYTE(v17) = v19;
    swift_bridgeObjectRelease();
    if ((v17 & 1) == 0)
    {
      swift_bridgeObjectRelease();
      return 0;
    }
    uint64_t v20 = swift_bridgeObjectRetain();
    char v21 = sub_25C4798A0(v20, v18);
    swift_bridgeObjectRelease();
    unint64_t result = swift_bridgeObjectRelease();
    if ((v21 & 1) == 0) {
      return 0;
    }
  }
  int64_t v13 = v11 + 4;
  if (v13 >= v8) {
    return 1;
  }
  unint64_t v12 = *(void *)(v4 + 8 * v13);
  if (v12)
  {
    int64_t v3 = v13;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v3 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      break;
    }
    if (v3 >= v8) {
      return 1;
    }
    unint64_t v12 = *(void *)(v4 + 8 * v3);
    ++v13;
    if (v12) {
      goto LABEL_23;
    }
  }
LABEL_31:
  __break(1u);
  return result;
}

uint64_t sub_25C478F14()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR___SSKDisplayProfileConfiguration_configuration + 33);
}

uint64_t sub_25C478F98()
{
  if (*(void *)(v0 + OBJC_IVAR___SSKDisplayProfileConfiguration_configuration + 24)) {
    uint64_t v1 = *(void *)(v0 + OBJC_IVAR___SSKDisplayProfileConfiguration_configuration + 16);
  }
  else {
    uint64_t v1 = 0;
  }
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_25C47900C()
{
  if (*(void *)(v0 + OBJC_IVAR___SSKDisplayProfileConfiguration_configuration + 24)) {
    return *(unsigned char *)(v0 + OBJC_IVAR___SSKDisplayProfileConfiguration_configuration + 32) & 1;
  }
  else {
    return 0;
  }
}

uint64_t sub_25C479044()
{
  return *(void *)(v0 + OBJC_IVAR___SSKDisplayProfileConfiguration_configuration);
}

void DisplayProfileConfiguration_Box.init()()
{
}

id DisplayProfileConfiguration_Box.__deallocating_deinit()
{
  return sub_25C479818(type metadata accessor for DisplayProfileConfiguration_Box);
}

uint64_t sub_25C479114(uint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_25C47AA08();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  unint64_t v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(v3 + OBJC_IVAR___SSKLegacyDisplayProfileBuilder_priority) = a1;
  sub_25C47A9F8();
  uint64_t v10 = sub_25C47A9E8();
  uint64_t v12 = v11;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  int64_t v13 = self;
  id v14 = a2;
  id v15 = objc_msgSend(v13, sel_localIdentity);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A9310);
  uint64_t inited = swift_initStackObject();
  long long v22 = xmmword_25C47E130;
  *(_OWORD *)(inited + 16) = xmmword_25C47E130;
  if (qword_26B350B60 != -1) {
    swift_once();
  }
  uint64_t v17 = *(void *)algn_26B350D58;
  *(void *)(inited + 32) = qword_26B350D50;
  *(void *)(inited + 4sub_25C45E010("[%@] %s: blank", (void (*)(void))sub_25C45D9C8, 0) = v17;
  *(void *)(inited + 48) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5A9318);
  uint64_t v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = v22;
  *(void *)(v18 + 32) = v10;
  *(void *)(v18 + 4sub_25C45E010("[%@] %s: blank", (void (*)(void))sub_25C45D9C8, 0) = v12;
  *(void *)(v18 + 48) = v14;
  *(void *)(v18 + 56) = 0;
  *(void *)(v18 + 64) = v15;
  *(void *)(inited + 56) = v18;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v19 = v14;
  id v20 = v15;
  *(void *)(v3 + OBJC_IVAR___SSKLegacyDisplayProfileBuilder_requestsByGroup) = sub_25C4712E8(inited);

  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25C4793A0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)(v2 + OBJC_IVAR___SSKLegacyDisplayProfileBuilder_identifier);
  *uint64_t v3 = a1;
  v3[1] = a2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25C47943C(uint64_t result)
{
  *(unsigned char *)(v1 + OBJC_IVAR___SSKLegacyDisplayProfileBuilder_behavesAsMainDisplay) = result;
  return result;
}

uint64_t sub_25C47945C(uint64_t result)
{
  *(unsigned char *)(v1 + OBJC_IVAR___SSKLegacyDisplayProfileBuilder_supportsCloning) = result;
  return result;
}

id sub_25C479480()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_25C47AA08();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void *)(v0 + OBJC_IVAR___SSKLegacyDisplayProfileBuilder_priority);
  uint64_t v7 = *(void *)(v0 + OBJC_IVAR___SSKLegacyDisplayProfileBuilder_requestsByGroup);
  uint64_t v8 = OBJC_IVAR___SSKLegacyDisplayProfileBuilder_behavesAsMainDisplay;
  char v9 = *(unsigned char *)(v0 + OBJC_IVAR___SSKLegacyDisplayProfileBuilder_behavesAsMainDisplay);
  uint64_t v10 = (uint64_t *)(v0 + OBJC_IVAR___SSKLegacyDisplayProfileBuilder_identifier);
  uint64_t v11 = *(void *)(v0 + OBJC_IVAR___SSKLegacyDisplayProfileBuilder_identifier + 8);
  if ((v9 & 1) == 0)
  {
    if (!v11)
    {
      swift_bridgeObjectRetain();
      uint64_t v12 = 0;
      char v9 = 0;
      goto LABEL_8;
    }
    goto LABEL_5;
  }
  if (v11)
  {
LABEL_5:
    uint64_t v12 = *v10;
    swift_bridgeObjectRetain();
    goto LABEL_6;
  }
  swift_bridgeObjectRetain();
  sub_25C47A9F8();
  uint64_t v12 = sub_25C47A9E8();
  uint64_t v11 = v13;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  char v9 = *(unsigned char *)(v1 + v8);
LABEL_6:
  swift_bridgeObjectRetain();
LABEL_8:
  char v14 = *(unsigned char *)(v1 + OBJC_IVAR___SSKLegacyDisplayProfileBuilder_supportsCloning);
  id v15 = (objc_class *)type metadata accessor for DisplayProfileConfiguration_Box();
  uint64_t v16 = (char *)objc_allocWithZone(v15);
  uint64_t v17 = &v16[OBJC_IVAR___SSKDisplayProfileConfiguration_configuration];
  *(void *)uint64_t v17 = v6;
  *((void *)v17 + sub_25C45E010("[%@] %s: unblank", (void (*)(void))sub_25C45D9DC, 1) = v7;
  *((void *)v17 + 2) = v12;
  *((void *)v17 + 3) = v11;
  v17[32] = v9;
  v17[33] = v14;
  v19.receiver = v16;
  v19.super_class = v15;
  return objc_msgSendSuper2(&v19, sel_init);
}

id LegacyDisplayProfileBuilder.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id LegacyDisplayProfileBuilder.init()()
{
  id v1 = &v0[OBJC_IVAR___SSKLegacyDisplayProfileBuilder_identifier];
  *(void *)id v1 = 0;
  *((void *)v1 + sub_25C45E010("[%@] %s: unblank", (void (*)(void))sub_25C45D9DC, 1) = 0;
  *(void *)&v0[OBJC_IVAR___SSKLegacyDisplayProfileBuilder_priority] = 0;
  uint64_t v2 = OBJC_IVAR___SSKLegacyDisplayProfileBuilder_requestsByGroup;
  uint64_t v3 = v0;
  *(void *)&v0[v2] = sub_25C4712E8(MEMORY[0x263F8EE78]);
  v3[OBJC_IVAR___SSKLegacyDisplayProfileBuilder_behavesAsMainDisplay] = 0;
  v3[OBJC_IVAR___SSKLegacyDisplayProfileBuilder_supportsCloning] = 0;

  v5.receiver = v3;
  v5.super_class = (Class)type metadata accessor for LegacyDisplayProfileBuilder();
  return objc_msgSendSuper2(&v5, sel_init);
}

id LegacyDisplayProfileBuilder.__deallocating_deinit()
{
  return sub_25C479818(type metadata accessor for LegacyDisplayProfileBuilder);
}

id sub_25C479818(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t sub_25C4798A0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (v2 && a1 != a2)
  {
    objc_super v3 = (void **)(a2 + 64);
    uint64_t v4 = (void **)(a1 + 64);
    do
    {
      objc_super v5 = *(v4 - 2);
      uint64_t v6 = *(v4 - 1);
      uint64_t v7 = *v4;
      uint64_t v8 = *(v3 - 1);
      uint64_t v27 = *(v3 - 2);
      char v9 = *v3;
      BOOL v10 = *(v4 - 4) == *(v3 - 4) && *(v4 - 3) == *(v3 - 3);
      if (!v10 && (sub_25C47AFD8() & 1) == 0) {
        return 0;
      }
      uint64_t v24 = v2;
      sub_25C457A30(0, (unint64_t *)&unk_26A5A93A0);
      uint64_t v11 = v8;
      id v12 = v8;
      id v26 = v9;
      swift_bridgeObjectRetain();
      id v13 = v5;
      id v14 = v6;
      id v25 = v7;
      swift_bridgeObjectRetain();
      id v15 = v27;
      if ((sub_25C47AD88() & 1) == 0) {
        goto LABEL_19;
      }
      uint64_t v28 = v15;
      if (v6)
      {
        if (!v11)
        {
LABEL_19:
          long long v22 = v25;
          id v23 = v26;
          goto LABEL_21;
        }
        sub_25C457A30(0, &qword_26A5A8CD8);
        uint64_t v16 = v12;
        id v17 = v12;
        id v18 = v14;
        char v19 = sub_25C47AD88();

        if ((v19 & 1) == 0)
        {
          id v14 = v18;
          id v12 = v17;
LABEL_20:
          long long v22 = v25;
          id v23 = v26;
          id v15 = v28;
LABEL_21:

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          return 0;
        }
      }
      else
      {
        uint64_t v16 = v12;
        if (v11) {
          goto LABEL_20;
        }
      }
      char v20 = sub_25C47AD88();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v20 & 1) == 0) {
        return 0;
      }
      v4 += 5;
      v3 += 5;
      uint64_t v2 = v24 - 1;
    }
    while (v24 != 1);
  }
  return 1;
}

uint64_t _s13ShellSceneKit27DisplayProfileConfigurationV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  if (*(void *)a1 != *(void *)a2) {
    return 0;
  }
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t v2 = *(void *)(a1 + 24);
  int v4 = *(unsigned __int8 *)(a1 + 32);
  int v5 = *(unsigned __int8 *)(a1 + 33);
  uint64_t v7 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  int v8 = *(unsigned __int8 *)(a2 + 32);
  int v9 = *(unsigned __int8 *)(a2 + 33);
  if ((sub_25C478D10(*(void *)(a1 + 8), *(void *)(a2 + 8)) & 1) == 0) {
    return 0;
  }
  if (!v2)
  {
    if (!v6) {
      return v5 ^ v9 ^ 1u;
    }
    return 0;
  }
  if (!v6) {
    return 0;
  }
  if (v3 == v7 && v2 == v6)
  {
    if (((v4 ^ v8) & 1) == 0) {
      return v5 ^ v9 ^ 1u;
    }
    return 0;
  }
  char v11 = sub_25C47AFD8();
  uint64_t result = 0;
  if ((v11 & 1) != 0 && ((v4 ^ v8) & 1) == 0) {
    return v5 ^ v9 ^ 1u;
  }
  return result;
}

uint64_t type metadata accessor for DisplayProfileConfiguration_Box()
{
  return self;
}

uint64_t type metadata accessor for LegacyDisplayProfileBuilder()
{
  return self;
}

uint64_t destroy for DisplayProfileConfiguration()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for DisplayProfileConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(_WORD *)(a1 + 32) = *(_WORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for DisplayProfileConfiguration(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(unsigned char *)(a1 + 33) = *(unsigned char *)(a2 + 33);
  return a1;
}

__n128 __swift_memcpy34_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_WORD *)(a1 + 32) = *(_WORD *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for DisplayProfileConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(unsigned char *)(a1 + 33) = *(unsigned char *)(a2 + 33);
  return a1;
}

uint64_t getEnumTagSinglePayload for DisplayProfileConfiguration(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 34)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DisplayProfileConfiguration(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(_WORD *)(result + 32) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 34) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 34) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DisplayProfileConfiguration()
{
  return &type metadata for DisplayProfileConfiguration;
}

uint64_t method lookup function for DisplayProfileConfiguration_Box(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DisplayProfileConfiguration_Box);
}

uint64_t dispatch thunk of DisplayProfileConfiguration_Box.supportsCloning.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x70))();
}

uint64_t dispatch thunk of DisplayProfileConfiguration_Box.derivedIdentifier.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of DisplayProfileConfiguration_Box.isMainLike.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of DisplayProfileConfiguration_Box.priority.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x88))();
}

uint64_t method lookup function for LegacyDisplayProfileBuilder(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for LegacyDisplayProfileBuilder);
}

uint64_t dispatch thunk of LegacyDisplayProfileBuilder.setPriorityLevel(_:sceneSpecification:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of LegacyDisplayProfileBuilder.derive(withIdentifier:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of LegacyDisplayProfileBuilder.setMainLike(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x100))();
}

uint64_t dispatch thunk of LegacyDisplayProfileBuilder.setCloningSupported(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x108))();
}

uint64_t dispatch thunk of LegacyDisplayProfileBuilder.setDeactivationReasonsWhenActive(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x110))();
}

uint64_t dispatch thunk of LegacyDisplayProfileBuilder.createDisplayProfileConfiguration()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x118))();
}

uint64_t sub_25C47A05C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for DisplayProfileConfiguration.DerivingMethod(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for DisplayProfileConfiguration.DerivingMethod(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for DisplayProfileConfiguration.DerivingMethod(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  if ((v3 + 1) >= 2) {
    return v3;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for DisplayProfileConfiguration.DerivingMethod(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)__n128 result = 0;
    *(void *)(result + 8) = 0;
    *(unsigned char *)(result + 16) = 0;
    *(_DWORD *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

uint64_t sub_25C47A1E8(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(vsub_25C45E010("[%@] %s: unblank", (void (*)(void))sub_25C45D9DC, 1) = -1;
  }
  return (v1 + 1);
}

uint64_t sub_25C47A200(uint64_t result, int a2)
{
  if (a2 < 0)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
  }
  else if (a2)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for DisplayProfileConfiguration.DerivingMethod()
{
  return &type metadata for DisplayProfileConfiguration.DerivingMethod;
}

id DisplayProfileConfiguration_Box.transformPhysicalDisplay(with:)(id a1)
{
  uint64_t v3 = v1 + OBJC_IVAR___SSKDisplayProfileConfiguration_configuration;
  if (*(void *)(v1 + OBJC_IVAR___SSKDisplayProfileConfiguration_configuration + 24))
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = (void *)sub_25C47AA78();
    swift_bridgeObjectRelease();
    objc_msgSend(a1, sel_setUniqueIdentifier_, v4);

    if (*(void *)(v3 + 24))
    {
      if (*(unsigned char *)(v3 + 32)) {
        objc_msgSend(a1, sel_setUIKitMainLike);
      }
    }
  }
  uint64_t v5 = *(unsigned __int8 *)(v3 + 33);
  return objc_msgSend(a1, sel_setCloningSupported_, v5);
}

BOOL DisplayProfileConfiguration_Box.derivesDisplays.getter()
{
  return *(void *)(v0 + OBJC_IVAR___SSKDisplayProfileConfiguration_configuration + 24) != 0;
}

uint64_t DisplayProfileConfiguration_Box.shouldTransformConnectingDisplays.getter()
{
  return (*(void *)(v0 + OBJC_IVAR___SSKDisplayProfileConfiguration_configuration + 24) != 0) | *(unsigned char *)(v0 + OBJC_IVAR___SSKDisplayProfileConfiguration_configuration + 33) & 1u;
}

void sub_25C47A3F4(void *a1)
{
  id v2 = (id)sub_25C47AA78();
  objc_msgSend(a1, sel_setUniqueIdentifier_, v2);
}

id MirroredDisplayTransformer.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id MirroredDisplayTransformer.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MirroredDisplayTransformer();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for MirroredDisplayTransformer()
{
  return self;
}

id MirroredDisplayTransformer.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MirroredDisplayTransformer();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for MirroredDisplayTransformer(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for MirroredDisplayTransformer);
}

uint64_t dispatch thunk of MirroredDisplayTransformer.transformPhysicalDisplay(with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x50))();
}

uint64_t dispatch thunk of MirroredDisplayTransformer.derivesDisplays.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x58))();
}

uint64_t dispatch thunk of MirroredDisplayTransformer.shouldTransformConnectingDisplays.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x60))();
}

uint64_t sub_25C47A6B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 32))();
}

uint64_t sub_25C47A6CC(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t sub_25C47A6E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t sub_25C47A6F4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t sub_25C47A708(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t sub_25C47A71C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 48))();
}

uint64_t sub_25C47A730()
{
  uint64_t v0 = sub_25C47AA38();
  __swift_allocate_value_buffer(v0, qword_26A5AACD8);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A5AACD8);
  return sub_25C47AA28();
}

void SSKCADifferenceMaskCalculate_cold_1(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  objc_super v2 = objc_msgSend(NSString, "stringWithUTF8String:", "SSKCADisplayDifferenceMask SSKCADifferenceMaskCalculate(CADisplay *__strong _Nonnull, CADisplayMode *__strong _Nonnull, NSString *__strong _Nonnull, CGSize, NSUInteger)");
  int v3 = 138544130;
  uint64_t v4 = v2;
  __int16 v5 = 2114;
  uint64_t v6 = @"SSKDisplayControllerUtilties.m";
  __int16 v7 = 1024;
  int v8 = 59;
  __int16 v9 = 2114;
  uint64_t v10 = a1;
  _os_log_error_impl(&dword_25C444000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", (uint8_t *)&v3, 0x26u);
}

uint64_t sub_25C47A9B8()
{
  return MEMORY[0x270EEF760]();
}

uint64_t sub_25C47A9C8()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_25C47A9D8()
{
  return MEMORY[0x270EEFA78]();
}

uint64_t sub_25C47A9E8()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_25C47A9F8()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_25C47AA08()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_25C47AA18()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_25C47AA28()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_25C47AA38()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_25C47AA48()
{
  return MEMORY[0x270FA0A00]();
}

uint64_t sub_25C47AA58()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_25C47AA68()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_25C47AA78()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_25C47AA88()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_25C47AA98()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_25C47AAA8()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_25C47AAB8()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_25C47AAC8()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_25C47AAD8()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_25C47AAE8()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_25C47AAF8()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_25C47AB08()
{
  return MEMORY[0x270F9DBD0]();
}

uint64_t sub_25C47AB18()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_25C47AB28()
{
  return MEMORY[0x270F9DC08]();
}

uint64_t sub_25C47AB38()
{
  return MEMORY[0x270F9DC30]();
}

uint64_t sub_25C47AB48()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_25C47AB58()
{
  return MEMORY[0x270F9DCA8]();
}

uint64_t sub_25C47AB68()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_25C47AB78()
{
  return MEMORY[0x270F9DD28]();
}

uint64_t sub_25C47AB88()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_25C47AB98()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_25C47ABA8()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_25C47ABC8()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_25C47ABD8()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_25C47ABE8()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_25C47ABF8()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_25C47AC08()
{
  return MEMORY[0x270FA1F40]();
}

uint64_t sub_25C47AC18()
{
  return MEMORY[0x270FA1F60]();
}

uint64_t sub_25C47AC38()
{
  return MEMORY[0x270FA1F90]();
}

uint64_t sub_25C47AC48()
{
  return MEMORY[0x270FA1FC8]();
}

uint64_t sub_25C47AC58()
{
  return MEMORY[0x270EF1C98]();
}

uint64_t sub_25C47AC68()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_25C47AC78()
{
  return MEMORY[0x270F9DF58]();
}

uint64_t sub_25C47AC88()
{
  return MEMORY[0x270F9DF80]();
}

uint64_t sub_25C47AC98()
{
  return MEMORY[0x270F9DFD0]();
}

uint64_t sub_25C47ACB8()
{
  return MEMORY[0x270EF1CF0]();
}

uint64_t sub_25C47ACC8()
{
  return MEMORY[0x270EF1CF8]();
}

uint64_t sub_25C47ACD8()
{
  return MEMORY[0x270EF1D08]();
}

uint64_t sub_25C47ACF8()
{
  return MEMORY[0x270F9E070]();
}

uint64_t sub_25C47AD08()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_25C47AD18()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_25C47AD28()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_25C47AD38()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_25C47AD48()
{
  return MEMORY[0x270FA0F30]();
}

uint64_t sub_25C47AD58()
{
  return MEMORY[0x270FA0F48]();
}

uint64_t sub_25C47AD68()
{
  return MEMORY[0x270FA0FA8]();
}

uint64_t sub_25C47AD78()
{
  return MEMORY[0x270FA1170]();
}

uint64_t sub_25C47AD88()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_25C47AD98()
{
  return MEMORY[0x270FA1190]();
}

uint64_t sub_25C47ADA8()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_25C47ADB8()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_25C47ADC8()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_25C47ADD8()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_25C47ADE8()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_25C47ADF8()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_25C47AE08()
{
  return MEMORY[0x270F9E848]();
}

uint64_t sub_25C47AE18()
{
  return MEMORY[0x270F9E858]();
}

uint64_t sub_25C47AE28()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_25C47AE38()
{
  return MEMORY[0x270F9E878]();
}

uint64_t sub_25C47AE58()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_25C47AE68()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_25C47AE78()
{
  return MEMORY[0x270F9E968]();
}

uint64_t sub_25C47AE88()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_25C47AE98()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_25C47AEA8()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_25C47AEB8()
{
  return MEMORY[0x270F9EA38]();
}

uint64_t sub_25C47AEC8()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_25C47AED8()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_25C47AEF8()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_25C47AF08()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_25C47AF18()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_25C47AF28()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_25C47AF38()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_25C47AF48()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_25C47AF58()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_25C47AF68()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_25C47AF78()
{
  return MEMORY[0x270F9F1A8]();
}

uint64_t sub_25C47AF88()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_25C47AF98()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_25C47AFA8()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_25C47AFB8()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_25C47AFD8()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_25C47AFF8()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_25C47B008()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_25C47B018()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_25C47B028()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_25C47B038()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_25C47B048()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_25C47B068()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_25C47B078()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_25C47B088()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_25C47B098()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_25C47B0A8()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_25C47B0B8()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_25C47B0E8()
{
  return MEMORY[0x270FA0128]();
}

uint64_t BKSDisplayServicesSetArrangement()
{
  return MEMORY[0x270F10468]();
}

uint64_t BKSDisplayServicesSetMainDisplayCloneMirroringModeForDestinationDisplay()
{
  return MEMORY[0x270F10470]();
}

uint64_t BSEqualObjects()
{
  return MEMORY[0x270F107B8]();
}

uint64_t BSEqualStrings()
{
  return MEMORY[0x270F107C8]();
}

uint64_t BSFloatApproximatelyEqualToFloat()
{
  return MEMORY[0x270F107D0]();
}

uint64_t BSSizeEqualToSize()
{
  return MEMORY[0x270F10958]();
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

uint64_t FBSDisplayHDRModeToCADisplayHDRMode()
{
  return MEMORY[0x270F2D208]();
}

uint64_t FBSDisplayOverscanCompensationToCADisplayOverscanAdjustment()
{
  return MEMORY[0x270F2D210]();
}

NSArray *__cdecl NSAllMapTableKeys(NSMapTable *table)
{
  return (NSArray *)MEMORY[0x270EF2A20](table);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

uint64_t NSStringFromBKSDisplayServicesCloneMirroringMode()
{
  return MEMORY[0x270F10588]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _NSFullMethodName()
{
  return MEMORY[0x270EF2CB0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _bs_set_crash_log_message()
{
  return MEMORY[0x270F109A8]();
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_isClassOrObjCExistentialType()
{
  return MEMORY[0x270FA0150]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void bzero(void *a1, size_t a2)
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
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

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
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

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
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

void os_unfair_lock_assert_not_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x270FA01A0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x270FA01D0]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x270FA01D8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastClassUnconditional()
{
  return MEMORY[0x270FA0270]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x270FA0298]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x270FA02F8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x270FA0428]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStaticObject()
{
  return MEMORY[0x270FA0480]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x270FA0528]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x270FA0538]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x270FA2458]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x270FA0588]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x270FA05E8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x270FA05F0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x270FA05F8]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x270FA0648]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x270FA0650]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x270FA0658]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}