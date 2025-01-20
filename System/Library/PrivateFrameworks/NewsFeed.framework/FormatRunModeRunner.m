@interface FormatRunModeRunner
- (void)debugClearRunModeCache;
@end

@implementation FormatRunModeRunner

- (void)debugClearRunModeCache
{
  swift_beginAccess();
  uint64_t v3 = MEMORY[0x1E4FBC870];
  *(void *)self->seenOnce = MEMORY[0x1E4FBC870];
  swift_retain();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  *(void *)self->seenOnceOnScreen = v3;
  swift_bridgeObjectRelease();
  swift_beginAccess();
  *(void *)self->seenOnceSinceRefresh = v3;
  swift_release();
  swift_bridgeObjectRelease();
}

@end