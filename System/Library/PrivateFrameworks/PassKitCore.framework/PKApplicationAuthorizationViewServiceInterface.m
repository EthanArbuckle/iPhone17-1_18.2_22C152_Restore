@interface PKApplicationAuthorizationViewServiceInterface
@end

@implementation PKApplicationAuthorizationViewServiceInterface

void __PKApplicationAuthorizationViewServiceInterface_Service_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE2EAD48];
  v1 = (void *)qword_1EB4033C8;
  qword_1EB4033C8 = v0;

  if (!qword_1EB4033C8) {
    __break(1u);
  }
}

void __PKApplicationAuthorizationViewServiceInterface_Remote_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE2EADA8];
  v1 = (void *)qword_1EB4033D8;
  qword_1EB4033D8 = v0;

  if (!qword_1EB4033D8) {
    __break(1u);
  }
}

@end