void sub_1A4AB61FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4AB7174(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id RCSharedLog()
{
  if (RCSharedLog_once != -1) {
    dispatch_once(&RCSharedLog_once, &__block_literal_global_3);
  }
  v0 = (void *)RCSharedLog_result;

  return v0;
}

void sub_1A4AB7A0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4AB7AFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t RCDynamicCast(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  if (objc_opt_isKindOfClass()) {
    return a2;
  }
  return 0;
}

id RCDeviceOSVersion()
{
  v0 = (void *)MGCopyAnswer();

  return v0;
}

id RCDeviceModelString()
{
  v0 = (void *)MGCopyAnswer();

  return v0;
}

id RCAppVersion()
{
  v0 = [MEMORY[0x1E4F28B50] mainBundle];
  v1 = [v0 objectForInfoDictionaryKey:@"CFBundleShortVersionString"];

  return v1;
}

uint64_t __RCSharedLog_block_invoke()
{
  RCSharedLog_result = (uint64_t)os_log_create((const char *)RCLogSubsystemIdentifier, "RemoteConfiguration");

  return MEMORY[0x1F41817F8]();
}

uint64_t RCCompareRelativePriority(uint64_t a1, uint64_t a2)
{
  v3 = [NSNumber numberWithInteger:a1];
  v4 = [NSNumber numberWithInteger:a2];
  uint64_t v5 = [v3 compare:v4];

  return v5;
}

uint64_t RCHigherRelativePriority(uint64_t a1, uint64_t a2)
{
  if (RCCompareRelativePriority(a1, a2) == -1) {
    return a2;
  }
  else {
    return a1;
  }
}

uint64_t RCNextHighestRelativePriority(uint64_t result)
{
  if ((unint64_t)(result + 1) <= 3) {
    return qword_1A4AE19D8[result + 1];
  }
  return result;
}

uint64_t RCInferRelativePriorityFromQualityOfService(uint64_t a1)
{
  if (a1 == 9) {
    return -1;
  }
  return a1 == 33 || a1 == 25;
}

uint64_t RCQueuePriorityFromRelativePriority(uint64_t a1)
{
  if ((unint64_t)(a1 + 1) >= 4) {
    return 0;
  }
  else {
    return 4 * (a1 + 1) - 4;
  }
}

void sub_1A4ABA514(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
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

uint64_t RCUserSegmentationEnvironmentForEnvironmentString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"STAGING"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"QA"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"DEVEL"])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 isEqualToString:@"TEST"])
  {
    uint64_t v2 = 4;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

unint64_t RCSecondsToMilliseconds(double a1)
{
  return (unint64_t)(fmax(a1, 0.0) * 1000.0);
}

double RCMillisecondsToSeconds(unint64_t a1)
{
  return (double)a1 / 1000.0;
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &buf, 0x26u);
}

id RCGenerateOperationID()
{
  uint64_t v0 = 0;
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  do
    v3[v0++] = aAbcdef01234567[arc4random_uniform(0x10u)];
  while (v0 != 16);
  v3[16] = 0;
  id v1 = [NSString stringWithUTF8String:v3];

  return v1;
}

void sub_1A4ABE594(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x26u);
}

void sub_1A4ABFB10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A4AC0D64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4AC1DB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
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

void sub_1A4AC4908(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

void sub_1A4AC5638(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 144));
  _Unwind_Resume(a1);
}

void *RCSpecificCast(uint64_t a1, void *a2)
{
  if (!a2) {
    return 0;
  }
  if ([a2 isMemberOfClass:a1]) {
    return a2;
  }
  return 0;
}

void *RCProtocolCast(uint64_t a1, void *a2)
{
  if (!a2) {
    return 0;
  }
  if ([a2 conformsToProtocol:a1]) {
    return a2;
  }
  return 0;
}

void *RCClassAndProtocolCast(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9 = a1;
  if (a1)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return 0;
    }
    v13 = &a9;
    if (a3)
    {
      while (1)
      {
        uint64_t v11 = v13++;
        if (([v9 conformsToProtocol:*v11] & 1) == 0) {
          break;
        }
        if (!--a3) {
          return v9;
        }
      }
      return 0;
    }
  }
  return v9;
}

CFTypeRef RCCFTypeCast(uint64_t a1, CFTypeRef cf)
{
  if (!cf) {
    return 0;
  }
  if (CFGetTypeID(cf) == a1) {
    return cf;
  }
  return 0;
}

uint64_t RCCheckedDynamicCast(objc_class *a1, uint64_t a2)
{
  uint64_t v2 = a2;
  if (a2 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      RCCheckedDynamicCast_cold_1(a1);
    }
    return 0;
  }
  return v2;
}

uint64_t RCCheckedStaticCast(uint64_t a1, uint64_t a2)
{
  if (a2 && (objc_opt_isKindOfClass() & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    RCCheckedStaticCast_cold_1();
  }
  return a2;
}

void *RCCheckedProtocolCast(uint64_t a1, void *a2)
{
  uint64_t v2 = a2;
  if (a2 && ([a2 conformsToProtocol:a1] & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      RCCheckedProtocolCast_cold_1();
    }
    return 0;
  }
  return v2;
}

void *RCCheckedStaticProtocolCast(uint64_t a1, void *a2)
{
  if (a2
    && ([a2 conformsToProtocol:a1] & 1) == 0
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    RCCheckedStaticProtocolCast_cold_1();
  }
  return a2;
}

void sub_1A4AC6B74(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1A4AC6C6C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1A4AC7868(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A4AC8FC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  _Block_object_dispose(&a41, 8);
  _Block_object_dispose((const void *)(v41 - 176), 8);
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

id RCBlockConjunction(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __RCBlockConjunction_block_invoke;
  v9[3] = &unk_1E5B765F0;
  id v10 = v3;
  id v11 = v4;
  id v5 = v4;
  id v6 = v3;
  v7 = (void *)MEMORY[0x1A6262080](v9);

  return v7;
}

uint64_t __RCBlockConjunction_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

void RCPerformBlockOnMainThread(void *a1)
{
  id v1 = a1;
  if (!v1 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    RCPerformBlockOnMainThread_cold_1();
  }
  if ([MEMORY[0x1E4F29060] isMainThread]) {
    v1[2](v1);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], v1);
  }
}

void RCPerformIfNonNil(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    RCPerformIfNonNil_cold_1();
    if (!v3) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  if (v3) {
LABEL_4:
  }
    v4[2](v4, v3);
LABEL_5:
}

void RCWaitUntilBlockIsInvoked(void *a1)
{
  id v1 = a1;
  if (!v1 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    RCWaitUntilBlockIsInvoked_cold_1();
  }
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __RCWaitUntilBlockIsInvoked_block_invoke;
  v5[3] = &unk_1E5B76100;
  dispatch_semaphore_t v6 = v2;
  id v3 = (void (*)(void *, void *))v1[2];
  id v4 = v2;
  v3(v1, v5);
  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __RCWaitUntilBlockIsInvoked_block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t RCQoSClassFromQoS(uint64_t a1)
{
  if (a1 == 33) {
    int v1 = 33;
  }
  else {
    int v1 = 0;
  }
  if (a1 == 25) {
    int v2 = 25;
  }
  else {
    int v2 = v1;
  }
  if (a1 == 17) {
    unsigned int v3 = 17;
  }
  else {
    unsigned int v3 = v2;
  }
  if (a1 == 9) {
    int v4 = 9;
  }
  else {
    int v4 = 0;
  }
  if (a1 == -1) {
    unsigned int v5 = 21;
  }
  else {
    unsigned int v5 = v4;
  }
  if (a1 <= 16) {
    return v5;
  }
  else {
    return v3;
  }
}

uint64_t RCQoSFromQoSClass(int a1)
{
  HIDWORD(v1) = a1 - 9;
  LODWORD(v1) = a1 - 9;
  uint64_t v2 = 8 * (v1 >> 3) + 9;
  if ((v1 >> 3) >= 4) {
    return -1;
  }
  else {
    return v2;
  }
}

dispatch_queue_global_t RCDispatchQueueForQualityOfService(uint64_t a1)
{
  if (a1 == 33) {
    uint64_t v1 = 33;
  }
  else {
    uint64_t v1 = 0;
  }
  if (a1 == 25) {
    uint64_t v1 = 25;
  }
  if (a1 == 17) {
    uint64_t v1 = 17;
  }
  uint64_t v2 = 21;
  if (a1 == 9) {
    uint64_t v3 = 9;
  }
  else {
    uint64_t v3 = 0;
  }
  if (a1 != -1) {
    uint64_t v2 = v3;
  }
  if (a1 <= 16) {
    intptr_t v4 = v2;
  }
  else {
    intptr_t v4 = v1;
  }
  return dispatch_get_global_queue(v4, 0);
}

void RCDispatchAsyncWithQualityOfService(void *a1, uint64_t a2, void *a3)
{
  unsigned int v5 = a1;
  RCBlockWithQualityOfService(a2, a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  dispatch_async(v5, v6);
}

id RCBlockWithQualityOfService(uint64_t a1, dispatch_block_t block)
{
  if (a1 == 33) {
    int v3 = 33;
  }
  else {
    int v3 = 0;
  }
  if (a1 == 25) {
    int v4 = 25;
  }
  else {
    int v4 = v3;
  }
  if (a1 == 17) {
    int v5 = 17;
  }
  else {
    int v5 = v4;
  }
  if (a1 == 9) {
    int v6 = 9;
  }
  else {
    int v6 = 0;
  }
  if (a1 == -1) {
    int v7 = 21;
  }
  else {
    int v7 = v6;
  }
  if (a1 <= 16) {
    dispatch_qos_class_t v8 = v7;
  }
  else {
    dispatch_qos_class_t v8 = v5;
  }
  dispatch_block_t v9 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v8, 0, block);
  id v10 = (void *)MEMORY[0x1A6262080]();

  return v10;
}

void RCDispatchAfterWithQualityOfService(dispatch_time_t a1, void *a2, uint64_t a3, void *a4)
{
  int v7 = a2;
  RCBlockWithQualityOfService(a3, a4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  dispatch_after(a1, v7, v8);
}

void RCDispatchGroupNotifyWithQualityOfService(void *a1, void *a2, uint64_t a3, void *a4)
{
  int v7 = a2;
  id v8 = a1;
  RCBlockWithQualityOfService(a3, a4);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  dispatch_group_notify(v8, v7, v9);
}

BOOL RCDispatchGroupIsEmpty(void *a1)
{
  uint64_t v1 = a1;
  if (!v1 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    RCDispatchGroupIsEmpty_cold_1();
  }
  BOOL v2 = dispatch_group_wait(v1, 0) == 0;

  return v2;
}

void RCDispatchGroupNotifyWithTimeout(void *a1, void *a2, dispatch_time_t a3, void *a4)
{
  int v7 = a1;
  id v8 = a2;
  id v9 = a4;
  if (!v7 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    RCDispatchGroupNotifyWithTimeout_cold_3();
    if (v8) {
      goto LABEL_6;
    }
  }
  else if (v8)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    RCDispatchGroupNotifyWithTimeout_cold_2();
  }
LABEL_6:
  if (!v9 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    RCDispatchGroupNotifyWithTimeout_cold_1();
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __RCDispatchGroupNotifyWithTimeout_block_invoke;
  v17[3] = &unk_1E5B76128;
  id v10 = v9;
  id v18 = v10;
  id v11 = RCHandleOperationTimeout(a3, v8, v17);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __RCDispatchGroupNotifyWithTimeout_block_invoke_2;
  block[3] = &unk_1E5B765F0;
  id v15 = v11;
  id v16 = v10;
  id v12 = v10;
  id v13 = v11;
  dispatch_group_notify(v7, v8, block);
}

id RCHandleOperationTimeout(dispatch_time_t a1, void *a2, void *a3)
{
  int v5 = a2;
  id v6 = a3;
  if (!v5 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    RCHandleOperationTimeout_cold_2();
    if (v6) {
      goto LABEL_6;
    }
  }
  else if (v6)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    RCHandleOperationTimeout_cold_1();
  }
LABEL_6:
  if (a1 == -1)
  {
    id v9 = &__block_literal_global_4;
  }
  else
  {
    id v12 = 0;
    int v7 = RCHandleOperationCancellation(&v12, v6);
    id v8 = v12;
    dispatch_after(a1, v5, v8);
    id v9 = (void *)MEMORY[0x1A6262080](v7);
  }
  id v10 = (void *)MEMORY[0x1A6262080](v9);

  return v10;
}

uint64_t __RCDispatchGroupNotifyWithTimeout_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __RCDispatchGroupNotifyWithTimeout_block_invoke_2(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if ((result & 1) == 0)
  {
    int v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v3();
  }
  return result;
}

id RCHandleOperationCancellation(void *a1, void *a2)
{
  id v3 = a2;
  if (!a1 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    RCHandleOperationCancellation_cold_2();
    if (v3) {
      goto LABEL_6;
    }
  }
  else if (v3)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    RCHandleOperationCancellation_cold_1();
  }
LABEL_6:
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  char v23 = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__3;
  v20[4] = __Block_byref_object_dispose__3;
  id v21 = (id)MEMORY[0x1A6262080](v3);
  int v4 = objc_opt_new();
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __RCHandleOperationCancellation_block_invoke;
  v17[3] = &unk_1E5B76B30;
  id v18 = v4;
  v19 = v22;
  id v5 = v4;
  id v6 = (void *)MEMORY[0x1A6262080](v17);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __RCHandleOperationCancellation_block_invoke_3;
  block[3] = &unk_1E5B76B58;
  id v7 = v6;
  id v15 = v7;
  id v16 = v20;
  *a1 = dispatch_block_create((dispatch_block_flags_t)0, block);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __RCHandleOperationCancellation_block_invoke_4;
  v11[3] = &unk_1E5B76B80;
  id v12 = v7;
  id v13 = v20;
  id v8 = v7;
  id v9 = (void *)MEMORY[0x1A6262080](v11);

  _Block_object_dispose(v20, 8);
  _Block_object_dispose(v22, 8);

  return v9;
}

void sub_1A4AC9F38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x1A6262080](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

uint64_t __RCHandleOperationCancellation_block_invoke(uint64_t a1)
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __RCHandleOperationCancellation_block_invoke_2;
  v4[3] = &unk_1E5B76B08;
  uint64_t v1 = *(void **)(a1 + 32);
  v4[4] = *(void *)(a1 + 40);
  v4[5] = &v5;
  [v1 performWithLockSync:v4];
  uint64_t v2 = *((unsigned __int8 *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void sub_1A4ACA03C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __RCHandleOperationCancellation_block_invoke_2(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 32) + 8);
  if (!*(unsigned char *)(v1 + 24))
  {
    *(unsigned char *)(v1 + 24) = 1;
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

uint64_t __RCHandleOperationCancellation_block_invoke_3(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) + 16);
    return v3();
  }
  return result;
}

uint64_t __RCHandleOperationCancellation_block_invoke_4(uint64_t a1)
{
  int v2 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  int v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;

  return v2 ^ 1u;
}

uint64_t __RCHandleOperationTimeout_block_invoke()
{
  return 0;
}

void RCDispatchGroupWrap(void *a1, void *a2)
{
  uint64_t v3 = a1;
  int v4 = a2;
  if (!v3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    RCDispatchGroupWrap_cold_2();
    if (v4) {
      goto LABEL_6;
    }
  }
  else if (v4)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    RCDispatchGroupWrap_cold_1();
  }
LABEL_6:
  dispatch_group_enter(v3);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __RCDispatchGroupWrap_block_invoke;
  v7[3] = &unk_1E5B76100;
  char v8 = v3;
  uint64_t v5 = (void (*)(void *, void *))v4[2];
  id v6 = v3;
  v5(v4, v7);
}

void __RCDispatchGroupWrap_block_invoke(uint64_t a1)
{
}

void RCRepeat(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  if (v3)
  {
    for (; a1; --a1)
      v3[2](v3);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    RCRepeat_cold_1();
  }
}

id RCTestBlockForClass(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __RCTestBlockForClass_block_invoke;
  v3[3] = &__block_descriptor_40_e8_B16__0_8lu32l8;
  v3[4] = a1;
  uint64_t v1 = (void *)MEMORY[0x1A6262080](v3);

  return v1;
}

uint64_t __RCTestBlockForClass_block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

id RCTestBlockForProtocol(void *a1)
{
  id v1 = a1;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __RCTestBlockForProtocol_block_invoke;
  v5[3] = &unk_1E5B76BE8;
  id v6 = v1;
  id v2 = v1;
  uint64_t v3 = (void *)MEMORY[0x1A6262080](v5);

  return v3;
}

uint64_t __RCTestBlockForProtocol_block_invoke(uint64_t a1, void *a2)
{
  return [a2 conformsToProtocol:*(void *)(a1 + 32)];
}

__CFString *RCStringFromQualityOfService(uint64_t a1)
{
  id v1 = @"UserInteractive";
  id v2 = @"Utility";
  uint64_t v3 = @"UserInitiated";
  if (a1 != 25) {
    uint64_t v3 = @"UserInteractive";
  }
  if (a1 != 17) {
    id v2 = v3;
  }
  if (a1 == 9) {
    id v1 = @"Background";
  }
  if (a1 == -1) {
    id v1 = @"Default";
  }
  if (a1 <= 16) {
    return v1;
  }
  else {
    return v2;
  }
}

__CFString *RCStringFromQueuePriority(uint64_t a1)
{
  *((void *)&v1 + 1) = a1;
  *(void *)&long long v1 = a1 + 8;
  unint64_t v2 = (v1 >> 2) - 1;
  if (v2 > 3) {
    return @"VeryLow";
  }
  else {
    return off_1E5B76C08[v2];
  }
}

void sub_1A4ACE318(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

uint64_t RCIsInternalBuild()
{
  if (RCIsInternalBuild_onceToken != -1) {
    dispatch_once(&RCIsInternalBuild_onceToken, &__block_literal_global_7);
  }
  return RCIsInternalBuild_internalBuild;
}

uint64_t __RCIsInternalBuild_block_invoke()
{
  uint64_t result = os_variant_has_internal_content();
  RCIsInternalBuild_internalBuild = result;
  return result;
}

id RCAppBundleID()
{
  uint64_t v0 = [MEMORY[0x1E4F28B50] mainBundle];
  long long v1 = [v0 bundleIdentifier];

  return v1;
}

uint64_t RCJSONIntegerValue(void *a1, void *a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    id v6 = [a1 objectForKeyedSubscript:v5];
    if (!v6
      || ([MEMORY[0x1E4F1CA98] null],
          uint64_t v7 = objc_claimAutoreleasedReturnValue(),
          v7,
          v6 == v7))
    {
      char v8 = RCSharedLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int v10 = 138543618;
        id v11 = v5;
        __int16 v12 = 2048;
        uint64_t v13 = a3;
        _os_log_impl(&dword_1A4AB3000, v8, OS_LOG_TYPE_ERROR, "missing integer value for key: %{public}@ defaultValue: %lld", (uint8_t *)&v10, 0x16u);
      }
    }
    else
    {
      a3 = [v6 integerValue];
    }
  }
  return a3;
}

double RCJSONDoubleValue(void *a1, void *a2, double a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    id v6 = [a1 objectForKeyedSubscript:v5];
    if (!v6
      || ([MEMORY[0x1E4F1CA98] null],
          uint64_t v7 = objc_claimAutoreleasedReturnValue(),
          v7,
          v6 == v7))
    {
      id v9 = RCSharedLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v11 = 138543618;
        id v12 = v5;
        __int16 v13 = 2048;
        double v14 = a3;
        _os_log_impl(&dword_1A4AB3000, v9, OS_LOG_TYPE_ERROR, "missing double value for key: %{public}@ defaultValue: %f", (uint8_t *)&v11, 0x16u);
      }
    }
    else
    {
      [v6 doubleValue];
      a3 = v8;
    }
  }
  return a3;
}

uint64_t RCJSONBoolValue(void *a1, void *a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    id v6 = [a1 objectForKeyedSubscript:v5];
    if (!v6
      || ([MEMORY[0x1E4F1CA98] null],
          uint64_t v7 = objc_claimAutoreleasedReturnValue(),
          v7,
          v6 == v7))
    {
      double v8 = RCSharedLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int v10 = 138543618;
        id v11 = v5;
        __int16 v12 = 1024;
        int v13 = a3;
        _os_log_impl(&dword_1A4AB3000, v8, OS_LOG_TYPE_ERROR, "missing BOOL value for key: %{public}@ defaultValue: %d", (uint8_t *)&v10, 0x12u);
      }
    }
    else
    {
      a3 = [v6 BOOLValue];
    }
  }
  return a3;
}

id RCJSONStringValue(void *a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (a1)
  {
    double v8 = [a1 objectForKeyedSubscript:v5];
    if (!v8
      || ([MEMORY[0x1E4F1CA98] null],
          id v9 = objc_claimAutoreleasedReturnValue(),
          v9,
          int v10 = v8,
          v8 == v9))
    {
      id v11 = RCSharedLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v14 = 138543618;
        id v15 = v5;
        __int16 v16 = 2114;
        v17 = v7;
        _os_log_impl(&dword_1A4AB3000, v11, OS_LOG_TYPE_ERROR, "missing string value for key: %{public}@ defaultValue: %{public}@", (uint8_t *)&v14, 0x16u);
      }

      int v10 = v7;
    }
    id v12 = v10;
  }
  else
  {
    id v12 = v6;
  }

  return v12;
}

id RCJSONArrayValue(void *a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    int v4 = [a1 objectForKeyedSubscript:v3];
    if (!v4
      || ([MEMORY[0x1E4F1CA98] null],
          id v5 = objc_claimAutoreleasedReturnValue(),
          v5,
          v4 == v5))
    {
      uint64_t v7 = RCSharedLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int v9 = 138543362;
        id v10 = v3;
        _os_log_impl(&dword_1A4AB3000, v7, OS_LOG_TYPE_ERROR, "missing array value for key: %{public}@", (uint8_t *)&v9, 0xCu);
      }

      id v6 = 0;
    }
    else
    {
      id v6 = v4;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

id RCJSONDictionaryValue(void *a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    int v4 = [a1 objectForKeyedSubscript:v3];
    if (!v4
      || ([MEMORY[0x1E4F1CA98] null],
          id v5 = objc_claimAutoreleasedReturnValue(),
          v5,
          v4 == v5))
    {
      uint64_t v7 = RCSharedLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int v9 = 138543362;
        id v10 = v3;
        _os_log_impl(&dword_1A4AB3000, v7, OS_LOG_TYPE_ERROR, "missing dictionary value for key: %{public}@", (uint8_t *)&v9, 0xCu);
      }

      id v6 = 0;
    }
    else
    {
      id v6 = v4;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void sub_1A4AD3794(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
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

double RCRound(double a1)
{
  return round(a1);
}

double RCFractionalPart(double a1)
{
  BOOL v1 = a1 <= 0.0;
  double v2 = -(-a1 - floor(-a1));
  double result = a1 - floor(a1);
  if (v1) {
    return v2;
  }
  return result;
}

double RCClamp(double a1, double a2, double a3)
{
  double v4 = a2;
  if (a3 < a2 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    RCClamp_cold_1();
  }
  if (a1 >= v4)
  {
    double v4 = a1;
    if (a1 > a3) {
      return a3;
    }
  }
  return v4;
}

unint64_t RCClampUInt64s(unint64_t a1, unint64_t a2, unint64_t a3)
{
  if (a1 >= a3) {
    unint64_t v3 = a3;
  }
  else {
    unint64_t v3 = a1;
  }
  if (a1 >= a2) {
    return v3;
  }
  else {
    return a2;
  }
}

double RCMix(double a1, double a2, double a3)
{
  return a1 + (a2 - a1) * a3;
}

double RCRandom()
{
  return (double)random() / 2147483650.0;
}

double RCRandomBetween(double a1, double a2)
{
  return a1 + (a2 - a1) * ((double)random() / 2147483650.0);
}

double RCReverseSquare(double a1)
{
  return 1.0 - (1.0 - a1) * (1.0 - a1);
}

long double RCSineMap(double a1)
{
  return (sin(a1 * 3.14159265 + -1.57079633) + 1.0) * 0.5;
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

void sub_1A4AD78B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4AD7AA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4AD7CC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4AD7E5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4AD7F54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void RCCheckedDynamicCast_cold_1(objc_class *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  unint64_t v3 = NSStringFromClass(a1);
  double v4 = (objc_class *)objc_opt_class();
  *(_DWORD *)buf = 136315906;
  id v6 = "id RCCheckedDynamicCast(Class, id<NSObject>)";
  __int16 v7 = 2080;
  double v8 = "/Library/Caches/com.apple.xbs/Sources/RemoteConfiguration/RemoteConfiguration/Utilities/RCCast.m";
  __int16 v9 = 1024;
  int v10 = 99;
  __int16 v11 = 2114;
  uint64_t v12 = [v2 initWithFormat:@"Unexpected object type in checked dynamic cast - Expected %@, Got %@", v3, NSStringFromClass(v4)];
  _os_log_error_impl(&dword_1A4AB3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure: %s %s:%d %{public}@", buf, 0x26u);
}

void RCCheckedStaticCast_cold_1()
{
  [[NSString alloc] initWithFormat:@"Unexpected object type in checked static cast.  This is a serious problem and could lead to a crash, or worse."];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0(&dword_1A4AB3000, MEMORY[0x1E4F14500], v0, "*** Assertion failure: %s %s:%d %{public}@", v1, v2, v3, v4, 2u);
}

void RCCheckedProtocolCast_cold_1()
{
  [[NSString alloc] initWithFormat:@"Unexpected object type in checked protocol cast"];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0(&dword_1A4AB3000, MEMORY[0x1E4F14500], v0, "*** Assertion failure: %s %s:%d %{public}@", v1, v2, v3, v4, 2u);
}

void RCCheckedStaticProtocolCast_cold_1()
{
  [[NSString alloc] initWithFormat:@"Unexpected object type in checked protocol cast. This is a serious problem and could lead to a crash, or worse."];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0(&dword_1A4AB3000, MEMORY[0x1E4F14500], v0, "*** Assertion failure: %s %s:%d %{public}@", v1, v2, v3, v4, 2u);
}

void RCPerformBlockOnMainThread_cold_1()
{
  uint64_t v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"block", v6, 2u);
}

void RCPerformIfNonNil_cold_1()
{
  uint64_t v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"block", v6, 2u);
}

void RCWaitUntilBlockIsInvoked_cold_1()
{
  uint64_t v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"block", v6, 2u);
}

void RCDispatchGroupIsEmpty_cold_1()
{
  uint64_t v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"group", v6, 2u);
}

void RCDispatchGroupNotifyWithTimeout_cold_1()
{
  uint64_t v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"block", v6, 2u);
}

void RCDispatchGroupNotifyWithTimeout_cold_2()
{
  uint64_t v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"queue", v6, 2u);
}

void RCDispatchGroupNotifyWithTimeout_cold_3()
{
  uint64_t v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"group", v6, 2u);
}

void RCHandleOperationTimeout_cold_1()
{
  uint64_t v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"timeoutHandler", v6, 2u);
}

void RCHandleOperationTimeout_cold_2()
{
  uint64_t v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"timeoutQueue", v6, 2u);
}

void RCHandleOperationCancellation_cold_1()
{
  uint64_t v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"cancellationHandler", v6, 2u);
}

void RCHandleOperationCancellation_cold_2()
{
  uint64_t v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"cancellationTrigger", v6, 2u);
}

void RCDispatchGroupWrap_cold_1()
{
  uint64_t v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"block", v6, 2u);
}

void RCDispatchGroupWrap_cold_2()
{
  uint64_t v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"group", v6, 2u);
}

void RCRepeat_cold_1()
{
  uint64_t v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"block", v6, 2u);
}

void RCClamp_cold_1()
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "max >= min");
  *(_DWORD *)buf = 136315906;
  int v2 = "CGFloat RCClamp(CGFloat, CGFloat, CGFloat)";
  __int16 v3 = 2080;
  int v4 = "/Library/Caches/com.apple.xbs/Sources/RemoteConfiguration/RemoteConfiguration/Utilities/RCMath.m";
  __int16 v5 = 1024;
  int v6 = 44;
  __int16 v7 = 2114;
  double v8 = v0;
  _os_log_error_impl(&dword_1A4AB3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure: %s %s:%d %{public}@", buf, 0x26u);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1F40CA3C0](*(void *)&__upper_bound);
}

int deflate(z_streamp strm, int flush)
{
  return MEMORY[0x1F4182BD0](strm, *(void *)&flush);
}

int deflateEnd(z_streamp strm)
{
  return MEMORY[0x1F4182BE0](strm);
}

int deflateInit2_(z_streamp strm, int level, int method, int windowBits, int memLevel, int strategy, const char *version, int stream_size)
{
  return MEMORY[0x1F4182BE8](strm, *(void *)&level, *(void *)&method, *(void *)&windowBits, *(void *)&memLevel, *(void *)&strategy, version, *(void *)&stream_size);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C0](flags, block);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C8](flags, *(void *)&qos_class, *(void *)&relative_priority, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
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

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
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

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_merge_data(dispatch_source_t source, uintptr_t value)
{
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

int inflate(z_streamp strm, int flush)
{
  return MEMORY[0x1F4182CB0](strm, *(void *)&flush);
}

int inflateEnd(z_streamp strm)
{
  return MEMORY[0x1F4182CB8](strm);
}

int inflateInit2_(z_streamp strm, int windowBits, const char *version, int stream_size)
{
  return MEMORY[0x1F4182CC8](strm, *(void *)&windowBits, version, *(void *)&stream_size);
}

uint64_t nw_activity_create()
{
  return MEMORY[0x1F40F2898]();
}

uint64_t nw_activity_create_from_token()
{
  return MEMORY[0x1F40F28A0]();
}

uint64_t nw_activity_set_parent_activity()
{
  return MEMORY[0x1F40F28E8]();
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

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1F40CD648]();
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA78](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1F40CDA80](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA88](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA98](a1);
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  return MEMORY[0x1F40CDAA8](a1);
}

int pthread_mutexattr_settype(pthread_mutexattr_t *a1, int a2)
{
  return MEMORY[0x1F40CDAC0](a1, *(void *)&a2);
}

uint64_t random(void)
{
  return MEMORY[0x1F40CDC18]();
}

long double sin(long double __x)
{
  MEMORY[0x1F40CE058](__x);
  return result;
}