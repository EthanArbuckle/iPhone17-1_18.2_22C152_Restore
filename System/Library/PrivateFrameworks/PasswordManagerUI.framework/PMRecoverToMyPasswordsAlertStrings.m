@interface PMRecoverToMyPasswordsAlertStrings
+ (id)alertMessageForRecoveringSavedAccountToMyPasswords:(id)a3;
+ (id)alertMessageForRecoveringSavedAccountsToMyPasswords:(id)a3;
+ (id)alertTitleAndMessageForRecoveringSavedAccountToMyPasswords:(id)a3;
+ (id)alertTitleAndMessageForRecoveringSavedAccountsToMyPasswords:(id)a3;
+ (id)alertTitleForRecoveringSavedAccountToMyPasswords:(id)a3;
+ (id)alertTitleForRecoveringSavedAccountsToMyPasswords:(id)a3;
- (PMRecoverToMyPasswordsAlertStrings)init;
@end

@implementation PMRecoverToMyPasswordsAlertStrings

+ (id)alertTitleForRecoveringSavedAccountToMyPasswords:(id)a3
{
  id v3 = a3;
  sub_258CD2600(v3);

  v4 = (void *)sub_258D6F458();
  swift_bridgeObjectRelease();

  return v4;
}

+ (id)alertMessageForRecoveringSavedAccountToMyPasswords:(id)a3
{
  id v3 = a3;
  sub_258CD2758(v3);
  uint64_t v5 = v4;

  if (v5)
  {
    v6 = (void *)sub_258D6F458();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)alertTitleAndMessageForRecoveringSavedAccountToMyPasswords:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = sub_258CD0648((uint64_t)v4);

  return v5;
}

+ (id)alertTitleForRecoveringSavedAccountsToMyPasswords:(id)a3
{
  sub_25893EF94(0, (unint64_t *)&qword_26A0A7D80);
  unint64_t v3 = sub_258D6F6D8();
  swift_getObjCClassMetadata();
  sub_258CD0774(v3);
  swift_bridgeObjectRelease();
  id v4 = (void *)sub_258D6F458();
  swift_bridgeObjectRelease();

  return v4;
}

+ (id)alertMessageForRecoveringSavedAccountsToMyPasswords:(id)a3
{
  sub_25893EF94(0, (unint64_t *)&qword_26A0A7D80);
  unint64_t v3 = sub_258D6F6D8();
  swift_getObjCClassMetadata();
  sub_258CD1948(v3);
  uint64_t v5 = v4;
  swift_bridgeObjectRelease();
  if (v5)
  {
    v6 = (void *)sub_258D6F458();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)alertTitleAndMessageForRecoveringSavedAccountsToMyPasswords:(id)a3
{
  sub_25893EF94(0, (unint64_t *)&qword_26A0A7D80);
  sub_258D6F6D8();
  swift_getObjCClassMetadata();
  sub_258CD2234();
  uint64_t v4 = v3;
  swift_bridgeObjectRelease();

  return v4;
}

- (PMRecoverToMyPasswordsAlertStrings)init
{
  v3.receiver = self;
  v3.super_class = (Class)PMRecoverToMyPasswordsAlertStrings;
  return [(PMRecoverToMyPasswordsAlertStrings *)&v3 init];
}

@end