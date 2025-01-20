@interface PASTargetFlowResult
- (ACAccount)personalAccount;
- (FAFamilyMember)familyMember;
- (NSDictionary)authResults;
- (NSError)error;
- (NSString)description;
- (PASTargetFlowResult)init;
- (int64_t)accountType;
@end

@implementation PASTargetFlowResult

- (int64_t)accountType
{
  v2 = self;
  int64_t v3 = PASTargetFlowResultObjc.accountTypeObjc.getter();

  return v3;
}

- (FAFamilyMember)familyMember
{
  v2 = self;
  id v3 = PASTargetFlowResultObjc.familyMember.getter();

  return (FAFamilyMember *)v3;
}

- (ACAccount)personalAccount
{
  v2 = self;
  id v3 = PASTargetFlowResultObjc.personalAccount.getter();

  return (ACAccount *)v3;
}

- (NSDictionary)authResults
{
  v2 = self;
  id v3 = PASTargetFlowResultObjc.authResults.getter();

  return (NSDictionary *)v3;
}

- (NSError)error
{
  return (NSError *)sub_22CC17348((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___PASTargetFlowResult_result, &qword_2684E4AB0);
}

- (NSString)description
{
  return (NSString *)sub_22CC17594(self, (uint64_t)a2, (void (*)(void))PASTargetFlowResultObjc.description.getter);
}

- (PASTargetFlowResult)init
{
  result = (PASTargetFlowResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end