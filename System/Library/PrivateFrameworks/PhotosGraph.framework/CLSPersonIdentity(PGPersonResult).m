@interface CLSPersonIdentity(PGPersonResult)
+ (uint64_t)type;
- (BOOL)isInferredChild;
- (id)keywordDescription;
- (uint64_t)compareToPerson:()PGPersonResult;
- (uint64_t)isVerified;
- (uint64_t)suggestedContactIdentifier;
@end

@implementation CLSPersonIdentity(PGPersonResult)

- (BOOL)isInferredChild
{
  v1 = [a1 birthdayDate];
  if (v1)
  {
    v2 = [MEMORY[0x1E4F1C9C8] date];
    [v2 timeIntervalSinceDate:v1];
    double v4 = v3;

    BOOL v5 = v4 < 410248800.0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (uint64_t)isVerified
{
  return 1;
}

- (uint64_t)compareToPerson:()PGPersonResult
{
  uint64_t v0 = [(id)objc_opt_class() type];
  uint64_t v1 = [(id)objc_opt_class() type];
  uint64_t v2 = 1;
  if (v0) {
    uint64_t v2 = -1;
  }
  if (v0 == v1) {
    return 0;
  }
  else {
    return v2;
  }
}

- (uint64_t)suggestedContactIdentifier
{
  return 0;
}

- (id)keywordDescription
{
  uint64_t v2 = [a1 fullName];
  if ([v2 length])
  {
    id v3 = v2;
  }
  else
  {
    id v3 = [a1 contactIdentifier];
  }
  double v4 = v3;
  if (v3) {
    [NSString stringWithFormat:@"[%@] %@", @"CLSPersonIdentity", v3];
  }
  else {
  BOOL v5 = [NSString stringWithFormat:@"[%@]", @"CLSPersonIdentity", v7];
  }

  return v5;
}

+ (uint64_t)type
{
  return 2;
}

@end