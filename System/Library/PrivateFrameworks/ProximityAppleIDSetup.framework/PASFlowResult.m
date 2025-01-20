@interface PASFlowResult
- (ACAccount)personalAccount;
- (FAFamilyMember)familyMember;
- (NSDictionary)authResults;
- (NSError)error;
- (PASFlowResult)init;
- (int64_t)accountType;
@end

@implementation PASFlowResult

- (int64_t)accountType
{
  return 2;
}

- (FAFamilyMember)familyMember
{
  return (FAFamilyMember *)0;
}

- (ACAccount)personalAccount
{
  return (ACAccount *)0;
}

- (NSDictionary)authResults
{
  return (NSDictionary *)0;
}

- (NSError)error
{
  return (NSError *)0;
}

- (PASFlowResult)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PASFlowResultObjc();
  return [(PASFlowResult *)&v3 init];
}

@end