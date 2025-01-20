@interface DisplayLink
- (void)_displayLinkFired;
@end

@implementation DisplayLink

- (void)_displayLinkFired
{
  delegate = self->delegate;
  swift_beginAccess();
  if (MEMORY[0x263E3B0E0](delegate))
  {
    uint64_t v4 = *(void *)&self->delegate[8];
    uint64_t ObjectType = swift_getObjectType();
    v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 8);
    uint64_t v7 = swift_retain();
    v6(v7, ObjectType, v4);
    swift_release();
    swift_unknownObjectRelease();
  }
}

@end