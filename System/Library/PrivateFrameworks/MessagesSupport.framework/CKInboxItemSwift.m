@interface CKInboxItemSwift
- (CKInboxItemSwift)init;
- (CKInboxItemSwift)initWithIdentifier:(id)a3 title:(id)a4 subtitle:(id)a5 systemImage:(id)a6 accessoryText:(id)a7;
- (NSString)description;
- (void)updateWithAccessoryText:(id)a3;
@end

@implementation CKInboxItemSwift

- (CKInboxItemSwift)initWithIdentifier:(id)a3 title:(id)a4 subtitle:(id)a5 systemImage:(id)a6 accessoryText:(id)a7
{
  uint64_t v9 = sub_1E4ACF8C8();
  MEMORY[0x1F4188790](v9 - 8);
  v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E4ACF8B8();
  uint64_t v12 = sub_1E4ACFC88();
  uint64_t v14 = v13;
  if (a5)
  {
    a5 = (id)sub_1E4ACFC88();
    uint64_t v16 = v15;
  }
  else
  {
    uint64_t v16 = 0;
  }
  uint64_t v17 = sub_1E4ACFC88();
  uint64_t v19 = v18;
  if (a7)
  {
    uint64_t v21 = sub_1E4ACFC88();
  }
  else
  {
    uint64_t v21 = 0;
    unint64_t v20 = 0;
  }
  return (CKInboxItemSwift *)InboxItem.init(identifier:title:subtitle:systemImage:accessoryText:)((uint64_t)v11, v12, v14, (uint64_t)a5, v16, v17, v19, v21, v20);
}

- (void)updateWithAccessoryText:(id)a3
{
  sub_1E4ACFC88();
  swift_getKeyPath();
  swift_getKeyPath();
  v4 = self;
  sub_1E4ACF9E8();
}

- (NSString)description
{
  v2 = self;
  InboxItem.description.getter();

  v3 = (void *)sub_1E4ACFC78();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (CKInboxItemSwift)init
{
  result = (CKInboxItemSwift *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR___CKInboxItemSwift_identifier;
  uint64_t v4 = sub_1E4ACF8C8();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v5 = (char *)self + OBJC_IVAR___CKInboxItemSwift__accessoryText;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE88D10);
  v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);
  v7(v5, v6);
}

@end