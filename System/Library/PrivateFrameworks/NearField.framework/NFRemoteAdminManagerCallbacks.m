@interface NFRemoteAdminManagerCallbacks
+ (id)interface;
@end

@implementation NFRemoteAdminManagerCallbacks

+ (id)interface
{
  if (qword_1EB4D1FD0 != -1) {
    dispatch_once(&qword_1EB4D1FD0, &__block_literal_global_85);
  }
  v2 = (void *)qword_1EB4D1FC8;
  return v2;
}

uint64_t __42__NFRemoteAdminManagerCallbacks_interface__block_invoke()
{
  qword_1EB4D1FC8 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEF400F8];
  return MEMORY[0x1F41817F8]();
}

@end