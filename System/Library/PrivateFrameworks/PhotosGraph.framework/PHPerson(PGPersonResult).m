@interface PHPerson(PGPersonResult)
+ (uint64_t)type;
- (id)keywordDescription;
- (uint64_t)birthdayDate;
- (uint64_t)compareToPerson:()PGPersonResult;
- (uint64_t)isInferredChild;
- (uint64_t)suggestedContactIdentifier;
@end

@implementation PHPerson(PGPersonResult)

- (uint64_t)isInferredChild
{
  return 0;
}

- (uint64_t)birthdayDate
{
  return 0;
}

- (uint64_t)compareToPerson:()PGPersonResult
{
  id v4 = a3;
  uint64_t v5 = [(id)objc_opt_class() type];
  if (v5 == [(id)objc_opt_class() type])
  {
    id v6 = v4;
    uint64_t v7 = [a1 faceCount];
    uint64_t v8 = [v6 faceCount];
    if (v7 <= v8)
    {
      if (v7 < v8)
      {
        uint64_t v9 = 1;
      }
      else
      {
        v10 = [a1 uuid];
        v11 = [v6 uuid];
        uint64_t v9 = [v10 compare:v11];
      }
    }
    else
    {
      uint64_t v9 = -1;
    }
  }
  else
  {
    uint64_t v9 = 1;
  }

  return v9;
}

- (uint64_t)suggestedContactIdentifier
{
  return 0;
}

- (id)keywordDescription
{
  v2 = [a1 name];
  if ([v2 length])
  {
    id v3 = v2;
  }
  else
  {
    id v3 = [a1 localIdentifier];
  }
  id v4 = v3;
  if (v3) {
    [NSString stringWithFormat:@"[%@] %@", @"PHPerson", v3];
  }
  else {
  uint64_t v5 = [NSString stringWithFormat:@"[%@]", @"PHPerson", v7];
  }

  return v5;
}

+ (uint64_t)type
{
  return 1;
}

@end