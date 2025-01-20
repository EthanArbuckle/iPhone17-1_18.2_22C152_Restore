@interface NSPredicate(MTAdditions)
+ (uint64_t)falsePredicate;
+ (uint64_t)predicateForDateKey:()MTAdditions isGreaterThanDate:;
+ (uint64_t)predicateForDateKey:()MTAdditions isGreaterThanOrEqualToDate:;
+ (uint64_t)predicateForDateKey:()MTAdditions isGreaterThanOrEqualToDateKey:;
+ (uint64_t)predicateForDateKey:()MTAdditions isLessThanDate:;
+ (uint64_t)predicateForDateKey:()MTAdditions isLessThanOrEqualToDate:;
+ (uint64_t)predicateForNilValueForKey:()MTAdditions;
+ (uint64_t)predicateForNilValueOrEmptyStringForKey:()MTAdditions;
+ (uint64_t)predicateForNonNilValueForKey:()MTAdditions;
+ (uint64_t)predicateForObjectId:()MTAdditions;
+ (uint64_t)predicateForObjectIds:()MTAdditions;
+ (uint64_t)truePredicate;
- (id)AND:()MTAdditions;
- (id)OR:()MTAdditions;
- (uint64_t)NOT;
@end

@implementation NSPredicate(MTAdditions)

+ (uint64_t)falsePredicate
{
  return [MEMORY[0x1E4F28F60] predicateWithFormat:@"FALSEPREDICATE"];
}

+ (uint64_t)predicateForDateKey:()MTAdditions isLessThanDate:
{
  return [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K != NULL AND %K < %@", a3, a3, a4];
}

+ (uint64_t)predicateForNilValueForKey:()MTAdditions
{
  return objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = NULL", a3);
}

+ (uint64_t)predicateForDateKey:()MTAdditions isGreaterThanOrEqualToDateKey:
{
  return objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != NULL AND %K >= %K", a3, a3, a4);
}

- (id)OR:()MTAdditions
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F28BA0];
  v9[0] = a1;
  v9[1] = a3;
  v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  v6 = [v4 arrayWithObjects:v9 count:2];
  v7 = [v3 orPredicateWithSubpredicates:v6];

  return v7;
}

- (id)AND:()MTAdditions
{
  v9[2] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v3 = (void *)MEMORY[0x1E4F28BA0];
    v9[0] = a1;
    v9[1] = a3;
    v4 = (void *)MEMORY[0x1E4F1C978];
    id v5 = a3;
    v6 = [v4 arrayWithObjects:v9 count:2];
    id v7 = [v3 andPredicateWithSubpredicates:v6];
  }
  else
  {
    id v7 = a1;
  }
  return v7;
}

- (uint64_t)NOT
{
  return [MEMORY[0x1E4F28BA0] notPredicateWithSubpredicate:a1];
}

+ (uint64_t)truePredicate
{
  return [MEMORY[0x1E4F28F60] predicateWithFormat:@"TRUEPREDICATE"];
}

+ (uint64_t)predicateForDateKey:()MTAdditions isGreaterThanDate:
{
  return [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K != NULL AND %K > %@", a3, a3, a4];
}

+ (uint64_t)predicateForDateKey:()MTAdditions isGreaterThanOrEqualToDate:
{
  return [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K != NULL AND %K >= %@", a3, a3, a4];
}

+ (uint64_t)predicateForDateKey:()MTAdditions isLessThanOrEqualToDate:
{
  return [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K != NULL AND %K <= %@", a3, a3, a4];
}

+ (uint64_t)predicateForNonNilValueForKey:()MTAdditions
{
  return objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != NULL", a3);
}

+ (uint64_t)predicateForNilValueOrEmptyStringForKey:()MTAdditions
{
  return [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = NULL OR %K == %@", a3, a3, &stru_1F03A51F0];
}

+ (uint64_t)predicateForObjectId:()MTAdditions
{
  return [MEMORY[0x1E4F28F60] predicateWithFormat:@"(self == %@)", a3];
}

+ (uint64_t)predicateForObjectIds:()MTAdditions
{
  return [MEMORY[0x1E4F28F60] predicateWithFormat:@"(self IN %@)", a3];
}

@end