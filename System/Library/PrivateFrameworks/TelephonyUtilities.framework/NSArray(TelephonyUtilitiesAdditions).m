@interface NSArray(TelephonyUtilitiesAdditions)
- (BOOL)tu_containsObjectPassingTest:()TelephonyUtilitiesAdditions;
- (id)tu_firstObjectPassingTest:()TelephonyUtilitiesAdditions;
- (id)tu_mapAndFilterObjectsUsingBlock:()TelephonyUtilitiesAdditions;
@end

@implementation NSArray(TelephonyUtilitiesAdditions)

- (id)tu_firstObjectPassingTest:()TelephonyUtilitiesAdditions
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66__NSArray_TelephonyUtilitiesAdditions__tu_firstObjectPassingTest___block_invoke;
  v9[3] = &unk_1E58E7B88;
  id v5 = v4;
  id v10 = v5;
  uint64_t v6 = [a1 indexOfObjectPassingTest:v9];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = 0;
  }
  else
  {
    v7 = [a1 objectAtIndexedSubscript:v6];
  }

  return v7;
}

- (id)tu_mapAndFilterObjectsUsingBlock:()TelephonyUtilitiesAdditions
{
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73__NSArray_TelephonyUtilitiesAdditions__tu_mapAndFilterObjectsUsingBlock___block_invoke;
  v11[3] = &unk_1E58E7B60;
  id v13 = v4;
  id v6 = v5;
  id v12 = v6;
  id v7 = v4;
  [a1 enumerateObjectsWithOptions:0 usingBlock:v11];
  v8 = v12;
  id v9 = v6;

  return v9;
}

- (BOOL)tu_containsObjectPassingTest:()TelephonyUtilitiesAdditions
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69__NSArray_TelephonyUtilitiesAdditions__tu_containsObjectPassingTest___block_invoke;
  v8[3] = &unk_1E58E7B88;
  id v9 = v4;
  id v5 = v4;
  BOOL v6 = [a1 indexOfObjectPassingTest:v8] != 0x7FFFFFFFFFFFFFFFLL;

  return v6;
}

@end