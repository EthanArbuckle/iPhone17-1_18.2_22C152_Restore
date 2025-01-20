@interface TSLocalDraftsDeviceManager
- (TSLocalDraftsDelegate)delegate;
- (TSLocalDraftsDeviceManager)init;
- (void)setDelegate:(id)a3;
@end

@implementation TSLocalDraftsDeviceManager

- (TSLocalDraftsDelegate)delegate
{
  v2 = (char *)self + OBJC_IVAR___TSLocalDraftsDeviceManager_delegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x1E01EFB70](v2);
  return (TSLocalDraftsDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
}

- (TSLocalDraftsDeviceManager)init
{
  return (TSLocalDraftsDeviceManager *)LocalDraftsDeviceManager.init()();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  v3 = (char *)self + OBJC_IVAR___TSLocalDraftsDeviceManager_delegate;
  sub_1DEB1DDEC((uint64_t)v3);
}

@end