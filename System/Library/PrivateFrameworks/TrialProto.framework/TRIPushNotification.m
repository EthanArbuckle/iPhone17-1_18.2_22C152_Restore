@interface TRIPushNotification
+ (id)descriptor;
@end

@implementation TRIPushNotification

+ (id)descriptor
{
  id v2 = (id)descriptor_descriptor_8;
  if (!descriptor_descriptor_8)
  {
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    LODWORD(v8) = 0;
    id v2 = +[TRIPBDescriptor allocDescriptorForClass:v5 rootClass:v6 file:TRITripushNotificationRoot_FileDescriptor() fields:off_1EB3EE110 fieldCount:3 storageSize:32 flags:v8];
    [v2 setupOneofs:_MergedGlobals_1 count:1 firstHasIndex:0xFFFFFFFFLL];
    if (descriptor_descriptor_8) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"TripushNotification.pbobjc.m", 113, @"Startup recursed!");
    }
    descriptor_descriptor_8 = (uint64_t)v2;
  }
  return v2;
}

@end