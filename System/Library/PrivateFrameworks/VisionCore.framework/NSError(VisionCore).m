@interface NSError(VisionCore)
+ (id)VisionCoreErrorForCVReturnCode:()VisionCore localizedDescription:;
+ (id)VisionCoreErrorForEspressoErrorInfo:()VisionCore localizedDescription:;
+ (id)VisionCoreErrorForEspressoReturnStatus:()VisionCore localizedDescription:;
+ (id)VisionCoreErrorForFailedEspressoPlan:()VisionCore localizedDescription:;
+ (id)VisionCoreErrorForKernelReturnCode:()VisionCore localizedDescription:;
+ (id)VisionCoreErrorForMemoryAllocationFailureOfElementCount:()VisionCore size:;
+ (id)VisionCoreErrorForMemoryAllocationFailureOfSize:()VisionCore;
+ (id)VisionCoreErrorForMemoryAllocationFailureWithLocalizedDescription:()VisionCore;
+ (id)VisionCoreErrorForUnavailableDescriptorIdentifier:()VisionCore version:;
+ (id)VisionCoreErrorForUnknownProcessingDescriptorIdentifier:()VisionCore;
+ (id)VisionCoreErrorWithCode:()VisionCore localizedDescription:underlyingError:;
+ (id)VisionCoreErrorWithDomain:()VisionCore code:userInfo:;
+ (id)_VisionCoreErrorForMemoryAllocationFailureWithLocalizedDescription:()VisionCore;
+ (uint64_t)VisionCoreErrorForCorruptedResourceWithLocalizedDescription:()VisionCore;
+ (uint64_t)VisionCoreErrorForFailedOperationWithLocalizedDescription:()VisionCore;
+ (uint64_t)VisionCoreErrorForInternalErrorWithLocalizedDescription:()VisionCore;
+ (uint64_t)VisionCoreErrorForInvalidArgumentWithLocalizedDescription:()VisionCore;
+ (uint64_t)VisionCoreErrorForInvalidOperationWithLocalizedDescription:()VisionCore;
+ (uint64_t)VisionCoreErrorForMemoryAllocationFailure;
+ (uint64_t)VisionCoreErrorForUnavailableResourceWithLocalizedDescription:()VisionCore;
+ (uint64_t)VisionCoreErrorWithCode:()VisionCore localizedDescription:;
+ (uint64_t)VisionCoreErrorWithCode:()VisionCore userInfo:;
+ (void)VisionCoreAssert:()VisionCore log:;
+ (void)logInternalError:()VisionCore;
@end

@implementation NSError(VisionCore)

+ (id)VisionCoreErrorWithDomain:()VisionCore code:userInfo:
{
  v2 = objc_msgSend(a1, "errorWithDomain:code:userInfo:");
  [a1 logInternalError:v2];
  return v2;
}

+ (id)VisionCoreErrorForMemoryAllocationFailureOfSize:()VisionCore
{
  v4 = objc_msgSend([NSString alloc], "initWithFormat:", @"Unable to allocate %lu bytes", a3);
  v5 = [a1 _VisionCoreErrorForMemoryAllocationFailureWithLocalizedDescription:v4];

  return v5;
}

+ (void)logInternalError:()VisionCore
{
  if (a3)
  {
    id v3 = a3;
    uint64_t v4 = [v3 code];
    id v13 = [v3 localizedDescription];
    [v13 cStringUsingEncoding:1];
    v5 = [v3 localizedFailureReason];

    id v6 = v5;
    [v6 cStringUsingEncoding:1];
    VisionCoreValidatedLog(4, @"Error code: %llu; description: %s; reason: %s",
      v7,
      v8,
      v9,
      v10,
      v11,
      v12,
      v4);
  }
}

+ (void)VisionCoreAssert:()VisionCore log:
{
  if ((a3 & 1) == 0)
  {
    uint64_t v4 = [a4 UTF8String];
    VisionCoreValidatedLog(4, @"%s", v5, v6, v7, v8, v9, v10, v4);
  }
}

+ (id)VisionCoreErrorForFailedEspressoPlan:()VisionCore localizedDescription:
{
  id v5 = a4;
  uint64_t error_info = espresso_plan_get_error_info();
  uint64_t v8 = objc_msgSend(a1, "VisionCoreErrorForEspressoErrorInfo:localizedDescription:", error_info, v7, v5);

  return v8;
}

+ (id)VisionCoreErrorForEspressoErrorInfo:()VisionCore localizedDescription:
{
  id v8 = a5;
  id v9 = [NSString alloc];
  if (a3 >= 3) {
    uint64_t v10 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"plan phase %u", a3);
  }
  else {
    uint64_t v10 = off_26488B300[(int)a3];
  }
  uint64_t v11 = (void *)[v9 initWithFormat:@"%s (%@)", a4, v10];

  if (v8)
  {
    uint64_t v12 = [[NSString alloc] initWithFormat:@"%@ - %@", v8, v11];

    uint64_t v11 = (void *)v12;
  }
  id v13 = [a1 _VisionCoreEspressoErrorWithLocalizedDescription:v11];

  return v13;
}

+ (id)VisionCoreErrorForEspressoReturnStatus:()VisionCore localizedDescription:
{
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x263F089D8] string];
  objc_msgSend(v7, "appendFormat:", @"%d", a3);
  uint64_t status_string = espresso_get_status_string();
  if (status_string) {
    objc_msgSend(v7, "appendFormat:", @": %s", status_string);
  }
  if ([v6 length]) {
    id v9 = (id)[[NSString alloc] initWithFormat:@"%@ (%@)", v6, v7];
  }
  else {
    id v9 = v7;
  }
  uint64_t v10 = v9;

  uint64_t v11 = [a1 _VisionCoreEspressoErrorWithLocalizedDescription:v10];

  return v11;
}

+ (id)VisionCoreErrorForKernelReturnCode:()VisionCore localizedDescription:
{
  id v6 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", a4, *MEMORY[0x263F08320], 0);
  uint64_t v7 = [a1 VisionCoreErrorWithDomain:*MEMORY[0x263F08350] code:a3 userInfo:v6];

  return v7;
}

+ (id)VisionCoreErrorForCVReturnCode:()VisionCore localizedDescription:
{
  id v6 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", a4, *MEMORY[0x263F08320], 0);
  uint64_t v7 = [a1 VisionCoreErrorWithDomain:*MEMORY[0x263F08410] code:a3 userInfo:v6];

  return v7;
}

+ (id)VisionCoreErrorForMemoryAllocationFailureOfElementCount:()VisionCore size:
{
  id v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"Unable to allocate %lu bytes for %lu elements of size %lu", a4 * a3, a3, a4);
  id v6 = [a1 _VisionCoreErrorForMemoryAllocationFailureWithLocalizedDescription:v5];

  return v6;
}

+ (id)VisionCoreErrorForMemoryAllocationFailureWithLocalizedDescription:()VisionCore
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = [@"Unable to allocate memory" stringByAppendingFormat:@" - %@", v4];
  }
  else
  {
    id v5 = @"Unable to allocate memory";
  }
  id v6 = [a1 _VisionCoreErrorForMemoryAllocationFailureWithLocalizedDescription:v5];

  return v6;
}

+ (uint64_t)VisionCoreErrorForMemoryAllocationFailure
{
  return [a1 VisionCoreErrorForMemoryAllocationFailureWithLocalizedDescription:0];
}

+ (id)_VisionCoreErrorForMemoryAllocationFailureWithLocalizedDescription:()VisionCore
{
  id v4 = (objc_class *)NSDictionary;
  id v5 = a3;
  id v6 = [v4 alloc];
  uint64_t v7 = objc_msgSend(v6, "initWithObjectsAndKeys:", v5, *MEMORY[0x263F08320], 0);

  id v8 = [a1 VisionCoreErrorWithDomain:*MEMORY[0x263F07F70] code:-108 userInfo:v7];

  return v8;
}

+ (uint64_t)VisionCoreErrorForFailedOperationWithLocalizedDescription:()VisionCore
{
  return [a1 VisionCoreErrorWithCode:6 localizedDescription:a3];
}

+ (uint64_t)VisionCoreErrorForInvalidOperationWithLocalizedDescription:()VisionCore
{
  return [a1 VisionCoreErrorWithCode:5 localizedDescription:a3];
}

+ (uint64_t)VisionCoreErrorForCorruptedResourceWithLocalizedDescription:()VisionCore
{
  return [a1 VisionCoreErrorWithCode:4 localizedDescription:a3];
}

+ (id)VisionCoreErrorForUnknownProcessingDescriptorIdentifier:()VisionCore
{
  id v4 = (objc_class *)NSString;
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithFormat:@"unknown processing descriptor \"%@\"", v5];

  uint64_t v7 = [a1 VisionCoreErrorForUnavailableResourceWithLocalizedDescription:v6];

  return v7;
}

+ (id)VisionCoreErrorForUnavailableDescriptorIdentifier:()VisionCore version:
{
  id v6 = (objc_class *)NSString;
  id v7 = a4;
  id v8 = a3;
  id v9 = (void *)[[v6 alloc] initWithFormat:@"%@ %@ is not available - ensure correct version specified.", v8, v7];

  uint64_t v10 = [a1 VisionCoreErrorForUnavailableResourceWithLocalizedDescription:v9];

  return v10;
}

+ (uint64_t)VisionCoreErrorForUnavailableResourceWithLocalizedDescription:()VisionCore
{
  return [a1 VisionCoreErrorWithCode:3 localizedDescription:a3];
}

+ (uint64_t)VisionCoreErrorForInternalErrorWithLocalizedDescription:()VisionCore
{
  return [a1 VisionCoreErrorWithCode:1 localizedDescription:a3];
}

+ (uint64_t)VisionCoreErrorForInvalidArgumentWithLocalizedDescription:()VisionCore
{
  return [a1 VisionCoreErrorWithCode:2 localizedDescription:a3];
}

+ (uint64_t)VisionCoreErrorWithCode:()VisionCore localizedDescription:
{
  return [a1 VisionCoreErrorWithCode:a3 localizedDescription:a4 underlyingError:0];
}

+ (id)VisionCoreErrorWithCode:()VisionCore localizedDescription:underlyingError:
{
  id v8 = (objc_class *)NSDictionary;
  id v9 = a5;
  id v10 = a4;
  id v11 = [v8 alloc];
  uint64_t v12 = objc_msgSend(v11, "initWithObjectsAndKeys:", v10, *MEMORY[0x263F08320], v9, *MEMORY[0x263F08608], 0);

  id v13 = [a1 VisionCoreErrorWithCode:a3 userInfo:v12];

  return v13;
}

+ (uint64_t)VisionCoreErrorWithCode:()VisionCore userInfo:
{
  return [a1 VisionCoreErrorWithDomain:@"com.apple.VisionCore" code:a3 userInfo:a4];
}

@end