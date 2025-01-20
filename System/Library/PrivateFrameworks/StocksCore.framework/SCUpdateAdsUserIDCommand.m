@interface SCUpdateAdsUserIDCommand
+ (BOOL)supportsSecureCoding;
- (SCUpdateAdsUserIDCommand)init;
- (SCUpdateAdsUserIDCommand)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithZone:(id)a3;
@end

@implementation SCUpdateAdsUserIDCommand

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AFE31F40(v4);
}

- (SCUpdateAdsUserIDCommand)initWithCoder:(id)a3
{
  return (SCUpdateAdsUserIDCommand *)sub_1AFE320DC(a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SCUpdateAdsUserIDCommand)init
{
  result = (SCUpdateAdsUserIDCommand *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR___SCUpdateAdsUserIDCommand_userIDCreatedDate;
  uint64_t v4 = sub_1AFFC98F8();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

- (void)executeWithZone:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  v6 = (void *)sub_1AFFCAE68();
  v7 = (void *)sub_1AFFCAE68();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v5;
  v11[4] = sub_1AFE32A6C;
  v11[5] = v8;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 1107296256;
  v11[2] = sub_1AFE196C8;
  v11[3] = &block_descriptor_13;
  v9 = _Block_copy(v11);
  v10 = v5;
  swift_release();
  objc_msgSend(a3, sel_createOrUpdateRecordWithName_recordType_modifyBlock_, v6, v7, v9);
  _Block_release(v9);
  swift_unknownObjectRelease();
}

@end