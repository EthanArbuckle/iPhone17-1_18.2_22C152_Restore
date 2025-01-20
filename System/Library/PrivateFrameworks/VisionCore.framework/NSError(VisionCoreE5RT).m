@interface NSError(VisionCoreE5RT)
+ (id)VisionCoreErrorForE5RTErrorCode:()VisionCoreE5RT localizedDescription:;
+ (id)VisionCoreErrorForE5RTLastErrorMessageAndCode:()VisionCoreE5RT;
+ (id)VisionCoreErrorForUnsupportedE5RTIOPortType:()VisionCoreE5RT;
@end

@implementation NSError(VisionCoreE5RT)

+ (id)VisionCoreErrorForUnsupportedE5RTIOPortType:()VisionCoreE5RT
{
  id v4 = [NSString alloc];
  v5 = @"VisionCoreE5RTIOPortTypeUnknown";
  if (a3 == 1) {
    v5 = @"VisionCoreE5RTIOPortTypeTensor";
  }
  if (a3 == 2) {
    v5 = @"VisionCoreE5RTIOPortTypeSurface";
  }
  v6 = v5;
  v7 = (void *)[v4 initWithFormat:@"unsupported I/O port handle type %@", v6];

  v8 = [MEMORY[0x263F087E8] VisionCoreErrorForInternalErrorWithLocalizedDescription:v7];

  return v8;
}

+ (id)VisionCoreErrorForE5RTErrorCode:()VisionCoreE5RT localizedDescription:
{
  id v6 = a4;
  id v7 = objc_alloc(MEMORY[0x263F089D8]);
  uint64_t v8 = MEMORY[0x230F41650](a3);
  v9 = [NSNumber numberWithUnsignedInt:a3];
  v10 = (void *)[v7 initWithFormat:@"%s (%@)", v8, v9];

  if ([v6 length])
  {
    [v10 appendString:@" - "];
    [v10 appendString:v6];
  }
  v11 = [a1 VisionCoreErrorForFailedOperationWithLocalizedDescription:v10];

  return v11;
}

+ (id)VisionCoreErrorForE5RTLastErrorMessageAndCode:()VisionCoreE5RT
{
  last_error_message = (void *)e5rt_get_last_error_message();
  if (last_error_message) {
    last_error_message = (void *)[[NSString alloc] initWithUTF8String:last_error_message];
  }
  id v6 = [a1 VisionCoreErrorForE5RTErrorCode:a3 localizedDescription:last_error_message];

  return v6;
}

@end