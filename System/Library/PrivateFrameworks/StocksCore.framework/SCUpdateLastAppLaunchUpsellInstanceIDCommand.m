@interface SCUpdateLastAppLaunchUpsellInstanceIDCommand
+ (BOOL)supportsSecureCoding;
- (SCUpdateLastAppLaunchUpsellInstanceIDCommand)init;
- (SCUpdateLastAppLaunchUpsellInstanceIDCommand)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithZone:(id)a3;
@end

@implementation SCUpdateLastAppLaunchUpsellInstanceIDCommand

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = (void *)sub_1AFFCAE68();
  id v7 = (id)sub_1AFFCAE68();
  objc_msgSend(v4, sel_encodeObject_forKey_, v6, v7);
}

- (SCUpdateLastAppLaunchUpsellInstanceIDCommand)initWithCoder:(id)a3
{
  return (SCUpdateLastAppLaunchUpsellInstanceIDCommand *)sub_1AFE8F990(a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SCUpdateLastAppLaunchUpsellInstanceIDCommand)init
{
  result = (SCUpdateLastAppLaunchUpsellInstanceIDCommand *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

- (void)executeWithZone:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  v6 = (void *)sub_1AFFCAE68();
  id v7 = (void *)sub_1AFFCAE68();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v5;
  v11[4] = sub_1AFE8FDA0;
  v11[5] = v8;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 1107296256;
  v11[2] = sub_1AFE196C8;
  v11[3] = &block_descriptor_21;
  v9 = _Block_copy(v11);
  v10 = v5;
  swift_release();
  objc_msgSend(a3, sel_createOrUpdateRecordWithName_recordType_modifyBlock_, v6, v7, v9);
  _Block_release(v9);
  swift_unknownObjectRelease();
}

@end