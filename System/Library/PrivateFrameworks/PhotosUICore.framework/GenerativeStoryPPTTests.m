@interface GenerativeStoryPPTTests
- (void)testNavigatingToMemoryCreationView;
@end

@implementation GenerativeStoryPPTTests

- (void)testNavigatingToMemoryCreationView
{
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = self;
  v4 = *(void (**)(void *, uint64_t))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.super.isa) + 0x58);
  v5 = self;
  v4(&unk_1E98229D8, v3);

  swift_release();
}

@end