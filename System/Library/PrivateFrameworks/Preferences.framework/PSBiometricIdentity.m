@interface PSBiometricIdentity
+ (id)identities;
+ (id)nameForIdentity:(id)a3;
+ (id)nextIdentityName;
+ (int64_t)maximumIdentityCount;
+ (void)removeIdentity:(id)a3;
+ (void)setName:(id)a3 forIdentity:(id)a4;
@end

@implementation PSBiometricIdentity

+ (id)identities
{
  v2 = [MEMORY[0x1E4F50548] manager];
  v3 = [v2 identities:0];

  return v3;
}

+ (int64_t)maximumIdentityCount
{
  v2 = [MEMORY[0x1E4F50548] manager];
  int64_t v3 = [v2 getMaxIdentityCount:1];

  return v3;
}

+ (void)removeIdentity:(id)a3
{
  int64_t v3 = (void *)MEMORY[0x1E4F50548];
  id v4 = a3;
  id v5 = [v3 manager];
  [v5 removeIdentity:v4];
}

+ (id)nameForIdentity:(id)a3
{
  return (id)[a3 name];
}

+ (void)setName:(id)a3 forIdentity:(id)a4
{
  id v5 = a4;
  [v5 setName:a3];
  id v6 = [MEMORY[0x1E4F50548] manager];
  [v6 updateIdentity:v5];
}

+ (id)nextIdentityName
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [MEMORY[0x1E4F1CA80] set];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v33 = 0u;
  long long v32 = 0u;
  id v4 = [a1 identities];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v33 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = [a1 nameForIdentity:*(void *)(*((void *)&v32 + 1) + 8 * i)];
        if (v8) {
          [v3 addObject:v8];
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v5);
  }

  unint64_t v9 = [a1 maximumIdentityCount];
  v22 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v9];
  id v10 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  [v10 setNumberStyle:0];
  if (v9)
  {
    for (unint64_t j = 1; j <= v9; ++j)
    {
      v12 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:j];
      v13 = [v10 stringFromNumber:v12];

      v14 = NSString;
      v15 = PSLocalizableMesaStringForKey(@"IDENTITY_NAME_FORMAT");
      v16 = objc_msgSend(v14, "stringWithFormat:", v15, v13);

      [v22 addObject:v16];
    }
  }
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __39__PSBiometricIdentity_nextIdentityName__block_invoke;
  v30[3] = &unk_1E5C5E1F8;
  id v17 = v3;
  id v31 = v17;
  v18 = [v22 indexesOfObjectsPassingTest:v30];
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  uint64_t v29 = 0x7FFFFFFFFFFFFFFFLL;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __39__PSBiometricIdentity_nextIdentityName__block_invoke_2;
  v23[3] = &unk_1E5C5E220;
  id v19 = v17;
  id v24 = v19;
  v25 = &v26;
  [v18 enumerateRangesWithOptions:2 usingBlock:v23];
  if (v27[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    v20 = 0;
  }
  else
  {
    v20 = objc_msgSend(v22, "objectAtIndex:");
  }

  _Block_object_dispose(&v26, 8);
  return v20;
}

uint64_t __39__PSBiometricIdentity_nextIdentityName__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

unint64_t __39__PSBiometricIdentity_nextIdentityName__block_invoke_2(uint64_t a1, unint64_t a2, unint64_t a3, unsigned char *a4)
{
  unint64_t result = [*(id *)(a1 + 32) count];
  if (result >= a2 && result - a2 < a3)
  {
    unint64_t result = [*(id *)(a1 + 32) count];
    a2 = result;
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  *a4 = 1;
  return result;
}

@end