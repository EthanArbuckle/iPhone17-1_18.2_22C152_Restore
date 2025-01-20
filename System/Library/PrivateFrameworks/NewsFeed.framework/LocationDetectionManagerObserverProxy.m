@interface LocationDetectionManagerObserverProxy
- (void)locationDetectionManager:(id)a3 didChangeAuthorizationStatus:(int)a4;
@end

@implementation LocationDetectionManagerObserverProxy

- (void)locationDetectionManager:(id)a3 didChangeAuthorizationStatus:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v6 = MEMORY[0x1C18C9C60](self->delegate, a2);
  if (v6)
  {
    v7 = (void *)v6;
    swift_unknownObjectRetain();
    swift_retain();
    objc_msgSend(v7, sel_locationDetectionManager_didChangeAuthorizationStatus_, a3, v4);
    swift_unknownObjectRelease();
    swift_release();
    swift_unknownObjectRelease();
  }
}

@end