@interface SCUpdateUpsellAppLaunchCountCommand
+ (BOOL)supportsSecureCoding;
- (SCUpdateUpsellAppLaunchCountCommand)init;
- (SCUpdateUpsellAppLaunchCountCommand)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithZone:(id)a3;
@end

@implementation SCUpdateUpsellAppLaunchCountCommand

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___SCUpdateUpsellAppLaunchCountCommand_upsellAppLaunchCount);
  id v5 = a3;
  v6 = self;
  id v7 = (id)sub_1AFFCAE68();
  objc_msgSend(v5, sel_encodeInt64_forKey_, v4, v7);
}

- (SCUpdateUpsellAppLaunchCountCommand)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  id v6 = a3;
  id v7 = self;
  v8 = (void *)sub_1AFFCAE68();
  v9 = (objc_class *)objc_msgSend(v6, sel_decodeInt64ForKey_, v8);

  *(Class *)((char *)&v7->super.isa + OBJC_IVAR___SCUpdateUpsellAppLaunchCountCommand_upsellAppLaunchCount) = v9;
  v12.receiver = v7;
  v12.super_class = ObjectType;
  v10 = [(SCUpdateUpsellAppLaunchCountCommand *)&v12 init];

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SCUpdateUpsellAppLaunchCountCommand)init
{
  result = (SCUpdateUpsellAppLaunchCountCommand *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)executeWithZone:(id)a3
{
  swift_unknownObjectRetain();
  id v5 = self;
  id v6 = (void *)sub_1AFFCAE68();
  id v7 = (void *)sub_1AFFCAE68();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v5;
  v11[4] = sub_1AFD771CC;
  v11[5] = v8;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 1107296256;
  v11[2] = sub_1AFE196C8;
  v11[3] = &block_descriptor_0;
  v9 = _Block_copy(v11);
  v10 = v5;
  swift_release();
  objc_msgSend(a3, sel_createOrUpdateRecordWithName_recordType_modifyBlock_, v6, v7, v9);
  _Block_release(v9);
  swift_unknownObjectRelease();
}

@end