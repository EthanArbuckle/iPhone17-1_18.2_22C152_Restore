@interface MRRemoteControl
+ (id)sharedRemoteControl;
@end

@implementation MRRemoteControl

+ (id)sharedRemoteControl
{
  if (sharedRemoteControl_onceToken != -1) {
    dispatch_once(&sharedRemoteControl_onceToken, &__block_literal_global_44);
  }
  v2 = (void *)sharedRemoteControl__sharedRemoteControl;

  return v2;
}

uint64_t __38__MRRemoteControl_sharedRemoteControl__block_invoke()
{
  sharedRemoteControl__sharedRemoteControl = objc_alloc_init(MRRemoteControl);

  return MEMORY[0x1F41817F8]();
}

@end