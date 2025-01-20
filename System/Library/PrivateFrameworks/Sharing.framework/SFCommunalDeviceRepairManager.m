@interface SFCommunalDeviceRepairManager
- (_TtC7Sharing29SFCommunalDeviceRepairManager)init;
- (id)updateIDSCacheHandler;
- (void)handleBLEDeviceFound:(id)a3;
- (void)resetTrigger;
- (void)setUpdateIDSCacheHandler:(id)a3;
@end

@implementation SFCommunalDeviceRepairManager

- (id)updateIDSCacheHandler
{
  if (*(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC7Sharing29SFCommunalDeviceRepairManager_updateIDSCacheHandler))
  {
    uint64_t v2 = *(void *)&self->isAttemptingRepair[OBJC_IVAR____TtC7Sharing29SFCommunalDeviceRepairManager_updateIDSCacheHandler];
    v5[4] = *(Class *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7Sharing29SFCommunalDeviceRepairManager_updateIDSCacheHandler);
    v5[5] = v2;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 1107296256;
    v5[2] = sub_1A56A2368;
    v5[3] = &block_descriptor_7;
    v3 = _Block_copy(v5);
    swift_retain();
    swift_release();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)setUpdateIDSCacheHandler:(id)a3
{
  uint64_t v4 = (uint64_t)_Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v5;
    v6 = sub_1A56A37C4;
  }
  else
  {
    v6 = 0;
  }
  v7 = (void (**)(uint64_t))((char *)self
                                     + OBJC_IVAR____TtC7Sharing29SFCommunalDeviceRepairManager_updateIDSCacheHandler);
  uint64_t v8 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC7Sharing29SFCommunalDeviceRepairManager_updateIDSCacheHandler);
  *v7 = v6;
  v7[1] = (void (*)(uint64_t))v4;

  sub_1A54F5EA8(v8);
}

- (void)handleBLEDeviceFound:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1A56A2480(v4);
}

- (void)resetTrigger
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC7Sharing29SFCommunalDeviceRepairManager_isAttemptingRepair) = 0;
}

- (_TtC7Sharing29SFCommunalDeviceRepairManager)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC7Sharing29SFCommunalDeviceRepairManager_isAttemptingRepair) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7Sharing29SFCommunalDeviceRepairManager_repairSession) = 0;
  id v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7Sharing29SFCommunalDeviceRepairManager_updateIDSCacheHandler);
  *id v4 = 0;
  v4[1] = 0;
  v6.receiver = self;
  v6.super_class = ObjectType;
  return [(SFCommunalDeviceRepairManager *)&v6 init];
}

- (void).cxx_destruct
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC7Sharing29SFCommunalDeviceRepairManager_updateIDSCacheHandler);

  sub_1A54F5EA8(v3);
}

@end