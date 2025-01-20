@interface iCloudHomeDataModelCache
- (_TtC14iCloudSettings24iCloudHomeDataModelCache)init;
@end

@implementation iCloudHomeDataModelCache

- (_TtC14iCloudSettings24iCloudHomeDataModelCache)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14iCloudSettings24iCloudHomeDataModelCache_dataModelCache) = (Class)MEMORY[0x263F8EE80];
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC14iCloudSettings24iCloudHomeDataModelCache_preLaunchActionHasExecuted) = 0;
  v2 = self;
  v3 = (objc_class *)swift_slowAlloc();
  *(Class *)((char *)&v2->super.isa + OBJC_IVAR____TtC14iCloudSettings24iCloudHomeDataModelCache_unfairLock) = v3;
  *(_DWORD *)v3 = 0;

  v5.receiver = v2;
  v5.super_class = (Class)type metadata accessor for iCloudHomeDataModelCache();
  return [(iCloudHomeDataModelCache *)&v5 init];
}

- (void).cxx_destruct
{
}

@end