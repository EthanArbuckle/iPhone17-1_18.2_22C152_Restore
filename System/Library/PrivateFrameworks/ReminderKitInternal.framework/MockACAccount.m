@interface MockACAccount
- (BOOL)isEnabledForDataclass:(id)a3;
- (NSArray)childAccounts;
- (NSMutableSet)enabledDataclasses;
- (NSString)aa_altDSID;
- (NSString)aa_primaryEmail;
- (_TtC19ReminderKitInternal13MockACAccount)initWithAccountType:(id)a3;
- (_TtC19ReminderKitInternal13MockACAccount)initWithCoder:(id)a3;
- (_TtC19ReminderKitInternal13MockACAccount)initWithManagedAccount:(id)a3;
- (id)childAccountsWithAccountTypeIdentifier:(id)a3;
- (void)setEnabled:(BOOL)a3 forDataclass:(id)a4;
- (void)setEnabledDataclasses:(id)a3;
@end

@implementation MockACAccount

- (NSString)aa_primaryEmail
{
  return (NSString *)sub_1A73C8658();
}

- (NSString)aa_altDSID
{
  return (NSString *)sub_1A73C8658();
}

- (NSArray)childAccounts
{
  sub_1A731874C();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1A7572A00();
  swift_bridgeObjectRelease();

  return (NSArray *)v2;
}

- (id)childAccountsWithAccountTypeIdentifier:(id)a3
{
  if (a3)
  {
    uint64_t v3 = _sSo15REMSortingStylea19ReminderKitInternalE11descriptionSSvg_0();
    uint64_t v5 = v4;
  }
  else
  {
    uint64_t v3 = 0;
    uint64_t v5 = 0;
  }
  unint64_t v6 = swift_bridgeObjectRetain();
  sub_1A73C98DC(v6, v3, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1A731874C();
  v7 = (void *)sub_1A7572A00();
  swift_bridgeObjectRelease();

  return v7;
}

- (BOOL)isEnabledForDataclass:(id)a3
{
  uint64_t v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC19ReminderKitInternal13MockACAccount_rem_enabledDataClasses);
  BOOL result = swift_beginAccess();
  if (a3)
  {
    uint64_t v7 = *v5;
    v8 = self;
    id v9 = a3;
    swift_bridgeObjectRetain();
    char v10 = sub_1A72DB52C((uint64_t)v9, v7);

    swift_bridgeObjectRelease();
    return v10 & 1;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)setEnabled:(BOOL)a3 forDataclass:(id)a4
{
  id v7 = a4;
  v8 = self;
  sub_1A73C88A0(a3, a4);
}

- (NSMutableSet)enabledDataclasses
{
  swift_beginAccess();
  uint64_t v3 = self;
  uint64_t v4 = swift_bridgeObjectRetain();
  sub_1A737F20C(v4);
  swift_bridgeObjectRelease();
  id v5 = objc_allocWithZone(MEMORY[0x1E4F1CA80]);
  unint64_t v6 = (void *)sub_1A7572C60();
  swift_bridgeObjectRelease();
  id v7 = objc_msgSend(v5, sel_initWithSet_, v6);

  return (NSMutableSet *)v7;
}

- (void)setEnabledDataclasses:(id)a3
{
  id v6 = a3;
  id v5 = self;
  sub_1A73C9AD8(a3);
}

- (_TtC19ReminderKitInternal13MockACAccount)initWithAccountType:(id)a3
{
  return (_TtC19ReminderKitInternal13MockACAccount *)sub_1A73C8C64((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithAccountType_);
}

- (_TtC19ReminderKitInternal13MockACAccount)initWithCoder:(id)a3
{
  return (_TtC19ReminderKitInternal13MockACAccount *)sub_1A73C8C64((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithCoder_);
}

- (_TtC19ReminderKitInternal13MockACAccount)initWithManagedAccount:(id)a3
{
  return (_TtC19ReminderKitInternal13MockACAccount *)sub_1A73C8C64((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithManagedAccount_);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end