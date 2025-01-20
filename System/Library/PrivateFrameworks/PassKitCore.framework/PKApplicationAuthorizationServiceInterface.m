@interface PKApplicationAuthorizationServiceInterface
@end

@implementation PKApplicationAuthorizationServiceInterface

void __PKApplicationAuthorizationServiceInterface_Client_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE2BF760];
  v1 = (void *)_MergedGlobals_269;
  _MergedGlobals_269 = v0;

  if (!_MergedGlobals_269) {
    __break(1u);
  }
}

void __PKApplicationAuthorizationServiceInterface_Server_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE2EACE8];
  v1 = (void *)qword_1EB4033B8;
  qword_1EB4033B8 = v0;

  if (!qword_1EB4033B8) {
    __break(1u);
  }
}

@end