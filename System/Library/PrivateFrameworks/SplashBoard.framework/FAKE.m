@interface FAKE
@end

@implementation FAKE

uint64_t __FAKE_NIL_PTR_block_invoke()
{
  FAKE_NIL_PTR___fakeNil = (uint64_t)objc_alloc_init(MEMORY[0x263F8C6D0]);
  return MEMORY[0x270F9A758]();
}

@end