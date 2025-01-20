@interface DisplayLinkTarget
- (BOOL)drawAndReturnError:(id *)a3;
@end

@implementation DisplayLinkTarget

- (BOOL)drawAndReturnError:(id *)a3
{
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v4 = Strong;
    uint64_t v5 = swift_retain();
    v6 = (void *)MEMORY[0x1BA9B6EE0](v5);
    sub_1B63779A4(v4);
    swift_release();
    swift_release();
  }
  return 1;
}

@end