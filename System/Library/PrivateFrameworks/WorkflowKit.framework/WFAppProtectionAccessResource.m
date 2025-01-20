@interface WFAppProtectionAccessResource
+ (BOOL)isSystemResource;
- (NSString)associatedAppIdentifier;
- (WFAppProtectionAccessResource)init;
- (WFAppProtectionAccessResource)initWithAssociatedAppBundleIdentifier:(id)a3;
- (WFAppProtectionAccessResource)initWithDefinition:(id)a3;
- (WFAppProtectionAccessResource)initWithDefinition:(id)a3 enableDistributedNotifications:(BOOL)a4;
- (id)localizedErrorReasonForStatus:(unint64_t)a3;
- (id)localizedErrorRecoveryOptionsForStatus:(unint64_t)a3;
- (unint64_t)status;
- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4;
- (void)applicationContext:(id)a3 applicationStateDidChange:(int64_t)a4;
- (void)dealloc;
- (void)makeAvailableWithUserInterface:(WFUserInterfaceHost *)a3 completionHandler:(id)a4;
@end

@implementation WFAppProtectionAccessResource

- (WFAppProtectionAccessResource)initWithAssociatedAppBundleIdentifier:(id)a3
{
  uint64_t v3 = sub_1C8532658();
  return (WFAppProtectionAccessResource *)sub_1C8130A34(v3, v4);
}

- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4
{
  sub_1C8532E98();
  unint64_t v5 = sub_1C8532838();
  swift_unknownObjectRetain();
  v6 = self;
  sub_1C8130F44(v5);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)applicationContext:(id)a3 applicationStateDidChange:(int64_t)a4
{
  id v5 = a3;
  v6 = self;
  sub_1C8131170();
}

+ (BOOL)isSystemResource
{
  return 1;
}

- (NSString)associatedAppIdentifier
{
  sub_1C8131598();
  if (v2)
  {
    uint64_t v3 = (void *)sub_1C8532618();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = 0;
  }
  return (NSString *)v3;
}

- (unint64_t)status
{
  uint64_t v2 = self;
  unint64_t v3 = sub_1C8131608();

  return v3;
}

- (id)localizedErrorReasonForStatus:(unint64_t)a3
{
  uint64_t v4 = self;
  sub_1C8131660(a3);
  uint64_t v6 = v5;

  if (v6)
  {
    v7 = (void *)sub_1C8532618();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)localizedErrorRecoveryOptionsForStatus:(unint64_t)a3
{
  uint64_t v4 = self;
  uint64_t v5 = sub_1C8131AA8(a3);

  if (v5)
  {
    uint64_t v6 = (void *)sub_1C8532828();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = 0;
  }
  return v6;
}

- (void)makeAvailableWithUserInterface:(WFUserInterfaceHost *)a3 completionHandler:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  v7 = (void *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  swift_unknownObjectRetain();
  v8 = self;
  sub_1C82A95B4((uint64_t)&unk_1EA5157A0, (uint64_t)v7);
}

- (void)dealloc
{
  uint64_t v2 = self;
  sub_1C8132168();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
}

- (WFAppProtectionAccessResource)initWithDefinition:(id)a3 enableDistributedNotifications:(BOOL)a4
{
  if (a3) {
    sub_1C8532538();
  }
  sub_1C81324F8();
}

- (WFAppProtectionAccessResource)initWithDefinition:(id)a3
{
  if (a3) {
    sub_1C8532538();
  }
  sub_1C8132568();
}

- (WFAppProtectionAccessResource)init
{
}

@end