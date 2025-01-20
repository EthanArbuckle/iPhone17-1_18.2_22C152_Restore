@interface TRIRolloutDeploymentPushNotification
+ (id)descriptor;
@end

@implementation TRIRolloutDeploymentPushNotification

+ (id)descriptor
{
  id v2 = (id)descriptor_descriptor_23;
  if (!descriptor_descriptor_23)
  {
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    LODWORD(v8) = 0;
    id v2 = +[TRIPBDescriptor allocDescriptorForClass:v5 rootClass:v6 file:TRITripushNotificationRoot_FileDescriptor() fields:&descriptor_fields_24 fieldCount:4 storageSize:32 flags:v8];
    if (descriptor_descriptor_23) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"TripushNotification.pbobjc.m", 194, @"Startup recursed!");
    }
    descriptor_descriptor_23 = (uint64_t)v2;
  }
  return v2;
}

@end