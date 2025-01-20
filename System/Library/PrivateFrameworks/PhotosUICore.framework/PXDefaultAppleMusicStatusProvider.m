@interface PXDefaultAppleMusicStatusProvider
- (NSError)error;
- (PXDefaultAppleMusicStatusProvider)init;
- (PXObservable)observable;
- (int64_t)statusForCapability:(int64_t)a3;
- (void)requestStatusForCapability:(int64_t)a3 handler:(id)a4;
- (void)startGatheringCapabilityStatuses;
@end

@implementation PXDefaultAppleMusicStatusProvider

- (PXDefaultAppleMusicStatusProvider)init
{
  return (PXDefaultAppleMusicStatusProvider *)DefaultAppleMusicStatusProvider.init()();
}

- (int64_t)statusForCapability:(int64_t)a3
{
  swift_getObjectType();
  v4 = *(os_unfair_lock_s **)((char *)&self->super.isa + OBJC_IVAR___PXDefaultAppleMusicStatusProvider_lockedState);
  uint64_t v5 = (uint64_t)&v4[4];
  v6 = v4 + 8;
  v7 = self;
  os_unfair_lock_lock(v6);
  sub_1A9D76F60(v5, &v10);
  os_unfair_lock_unlock(v6);
  int64_t v8 = v10;

  return v8;
}

- (void)requestStatusForCapability:(int64_t)a3 handler:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  int64_t v8 = self;
  sub_1A9D740B8(a3, (uint64_t)sub_1A9D76904, v7);
  swift_release();
}

- (void)startGatheringCapabilityStatuses
{
  sub_1A9BF71C0(0, (unint64_t *)&qword_1E9821250, MEMORY[0x1E4FBCFE8], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v3 - 8, v4);
  v6 = (char *)&v11 - v5;
  uint64_t v7 = sub_1AB23AD7C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  uint64_t v8 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v9 = (void *)swift_allocObject();
  v9[2] = 0;
  v9[3] = 0;
  v9[5] = 0;
  v9[6] = 0;
  v9[4] = v8;
  uint64_t v10 = self;
  sub_1A9BF49C0((uint64_t)v6, (uint64_t)&unk_1E9821E58, (uint64_t)v9);
  swift_release();
}

- (NSError)error
{
  v2 = *(os_unfair_lock_s **)((char *)&self->super.isa + OBJC_IVAR___PXDefaultAppleMusicStatusProvider_lockedState);
  uint64_t v3 = (uint64_t)&v2[4];
  uint64_t v4 = v2 + 8;
  uint64_t v5 = self;
  os_unfair_lock_lock(v4);
  sub_1A9D7475C(v3, &v9);
  os_unfair_lock_unlock(v4);
  v6 = v9;

  if (v6)
  {
    uint64_t v7 = (void *)sub_1AB23030C();
  }
  else
  {
    uint64_t v7 = 0;
  }
  return (NSError *)v7;
}

- (PXObservable)observable
{
  return (PXObservable *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                 + OBJC_IVAR___PXDefaultAppleMusicStatusProvider_observable));
}

- (void).cxx_destruct
{
  swift_release();
  sub_1A9D75C44((uint64_t)self + OBJC_IVAR___PXDefaultAppleMusicStatusProvider_injectedTCCStatusProvider);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___PXDefaultAppleMusicStatusProvider____lazy_storage___cloudStatusMonitor));

  swift_release();
}

@end