@interface PASSourceFlowResult
- (ACAccount)personalAccount;
- (FAFamilyMember)familyMember;
- (NSDictionary)authResults;
- (NSError)error;
- (NSString)description;
- (PASSourceFlowResult)init;
- (int64_t)accountType;
@end

@implementation PASSourceFlowResult

- (int64_t)accountType
{
  v2 = self;
  int64_t v3 = PASSourceFlowResultObjc.accountTypeObjc.getter();

  return v3;
}

- (FAFamilyMember)familyMember
{
  v2 = self;
  id v3 = PASSourceFlowResultObjc.familyMember.getter();

  return (FAFamilyMember *)v3;
}

- (ACAccount)personalAccount
{
  v2 = self;
  id v3 = PASSourceFlowResultObjc.personalAccount.getter();

  return (ACAccount *)v3;
}

- (NSDictionary)authResults
{
  v2 = self;
  id v3 = PASSourceFlowResultObjc.authResults.getter();

  return (NSDictionary *)v3;
}

- (NSError)error
{
  return (NSError *)sub_22CC17348((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___PASSourceFlowResult_result, (uint64_t *)&unk_2684E35D0);
}

- (NSString)description
{
  return (NSString *)sub_22CC17594(self, (uint64_t)a2, (void (*)(void))PASSourceFlowResultObjc.description.getter);
}

- (PASSourceFlowResult)init
{
  result = (PASSourceFlowResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end