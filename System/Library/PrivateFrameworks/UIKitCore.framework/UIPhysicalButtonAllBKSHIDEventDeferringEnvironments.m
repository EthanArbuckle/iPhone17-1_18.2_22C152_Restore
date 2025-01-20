@interface UIPhysicalButtonAllBKSHIDEventDeferringEnvironments
@end

@implementation UIPhysicalButtonAllBKSHIDEventDeferringEnvironments

void ___UIPhysicalButtonAllBKSHIDEventDeferringEnvironments_block_invoke()
{
  objc_msgSend(MEMORY[0x1E4F4F280], "ui_cameraCaptureButtonEnvironment");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [MEMORY[0x1E4F1CAD0] setWithObject:v2];
  v1 = (void *)qword_1EB262F98;
  qword_1EB262F98 = v0;
}

@end