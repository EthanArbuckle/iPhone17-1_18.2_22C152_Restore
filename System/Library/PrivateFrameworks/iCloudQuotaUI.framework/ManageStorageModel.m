@interface ManageStorageModel
- (_TtC13iCloudQuotaUI18ManageStorageModel)init;
@end

@implementation ManageStorageModel

- (_TtC13iCloudQuotaUI18ManageStorageModel)init
{
  return (_TtC13iCloudQuotaUI18ManageStorageModel *)ManageStorageModel.init()();
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC13iCloudQuotaUI18ManageStorageModel__shouldPresentAlert;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D1C68);
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end