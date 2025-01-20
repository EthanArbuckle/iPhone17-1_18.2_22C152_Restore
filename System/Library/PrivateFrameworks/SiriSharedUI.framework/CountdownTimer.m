@interface CountdownTimer
- (void)notifyDelegate;
@end

@implementation CountdownTimer

- (void)notifyDelegate
{
  if (MEMORY[0x210553300](self->delegate, a2))
  {
    uint64_t v3 = *(void *)&self->delegate[8];
    uint64_t ObjectType = swift_getObjectType();
    v5 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
    swift_retain();
    v5(ObjectType, v3);
    swift_release();
    swift_unknownObjectRelease();
  }
}

@end