@interface CKRecord(FCAdditions)
- (id)fc_safeObjectForKey:()FCAdditions;
- (uint64_t)fc_isDifferentFromRecord:()FCAdditions forKey:;
@end

@implementation CKRecord(FCAdditions)

- (id)fc_safeObjectForKey:()FCAdditions
{
  if (a3)
  {
    v4 = objc_msgSend(a1, "objectForKey:");
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (uint64_t)fc_isDifferentFromRecord:()FCAdditions forKey:
{
  id v6 = a4;
  id v7 = a3;
  v8 = [a1 objectForKeyedSubscript:v6];
  v9 = [v7 objectForKeyedSubscript:v6];

  if (v8 == v9) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = [v8 isEqual:v9] ^ 1;
  }

  return v10;
}

@end