@interface TISupplementalPersonItem(TextInputCore)
- (id)core_nameReadingPairsWithGenerationMode:()TextInputCore mecabraEnvironment:;
- (id)core_nonPhoneticRangesInString:()TextInputCore options:locale:;
- (uint64_t)core_isEqualToMecabraCandidate:()TextInputCore;
- (void)core_appendEntitiesToArray:()TextInputCore;
@end

@implementation TISupplementalPersonItem(TextInputCore)

- (id)core_nameReadingPairsWithGenerationMode:()TextInputCore mecabraEnvironment:
{
  id v5 = a4;
  id v6 = objc_alloc(MEMORY[0x1E4F6F4B8]);
  v7 = [a1 givenName];
  v8 = [a1 phoneticGivenName];
  v9 = [a1 middleName];
  v10 = [a1 phoneticMiddleName];
  v11 = [a1 familyName];
  v12 = [a1 phoneticFamilyName];
  v13 = [a1 organizationName];
  v14 = [a1 nickname];
  v15 = (void *)[v6 initWithFirstName:v7 phoneticFirstName:v8 middleName:v9 phoneticMiddleName:v10 lastName:v11 phoneticLastName:v12 organizationName:0.0 jobTitle:v13 nickname:0 relations:v14 streets:0 cities:0 score:0];

  v16 = v5;
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  TICreateNameReadingPairFromContactAndAppendToArray(v15, a3, v5, v17);
  v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", (unint64_t)objc_msgSend(v17, "count") >> 1);
  if ([v17 count])
  {
    unint64_t v19 = 0;
    do
    {
      v20 = [v17 objectAtIndexedSubscript:v19];
      if ([v17 count] <= v19 + 1)
      {
        v21 = 0;
      }
      else
      {
        v21 = [v17 objectAtIndexedSubscript:v19 + 1];
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v22 = v21;
      }
      else {
        v22 = 0;
      }
      v23 = +[TINameReadingPair nameReadingPairWithName:v20 reading:v22];
      [v18 addObject:v23];

      v19 += 2;
    }
    while ([v17 count] > v19);
  }

  return v18;
}

- (id)core_nonPhoneticRangesInString:()TextInputCore options:locale:
{
  id v8 = a3;
  id v9 = a5;
  v10 = objc_opt_new();
  v11 = [a1 givenName];
  uint64_t v12 = [v11 length];

  if (v12)
  {
    v13 = [a1 givenName];
    v14 = rangesOfStringInString(v13, v8, a4, v9);
    [v10 addObjectsFromArray:v14];
  }
  v15 = [a1 middleName];
  uint64_t v16 = [v15 length];

  if (v16)
  {
    id v17 = [a1 middleName];
    v18 = rangesOfStringInString(v17, v8, a4, v9);
    [v10 addObjectsFromArray:v18];
  }
  unint64_t v19 = [a1 familyName];
  uint64_t v20 = [v19 length];

  if (v20)
  {
    v21 = [a1 familyName];
    v22 = rangesOfStringInString(v21, v8, a4, v9);
    [v10 addObjectsFromArray:v22];
  }
  v23 = [a1 nickname];
  uint64_t v24 = [v23 length];

  if (v24)
  {
    v25 = [a1 nickname];
    v26 = rangesOfStringInString(v25, v8, a4, v9);
    [v10 addObjectsFromArray:v26];
  }
  v27 = [a1 previousFamilyName];
  uint64_t v28 = [v27 length];

  if (v28)
  {
    v29 = [a1 previousFamilyName];
    v30 = rangesOfStringInString(v29, v8, a4, v9);
    [v10 addObjectsFromArray:v30];
  }

  return v10;
}

- (uint64_t)core_isEqualToMecabraCandidate:()TextInputCore
{
  id v4 = a3;
  id v5 = [v4 input];
  uint64_t v6 = [v5 length];

  if (v6)
  {
    v7 = [a1 phoneticGivenName];
    id v8 = [v4 input];
    char v9 = [v7 isEqualToString:v8];

    if (v9) {
      goto LABEL_13;
    }
    v10 = [a1 phoneticMiddleName];
    v11 = [v4 input];
    char v12 = [v10 isEqualToString:v11];

    if (v12) {
      goto LABEL_13;
    }
    v13 = [a1 phoneticFamilyName];
    v14 = [v4 input];
    char v15 = [v13 isEqualToString:v14];

    if (v15) {
      goto LABEL_13;
    }
    uint64_t v16 = [a1 nickname];
    id v17 = [v4 input];
    char v18 = [v16 isEqualToString:v17];

    if (v18) {
      goto LABEL_13;
    }
    unint64_t v19 = [a1 previousFamilyName];
    uint64_t v20 = [v4 input];
    char v21 = [v19 isEqualToString:v20];

    if (v21) {
      goto LABEL_13;
    }
  }
  v22 = [v4 candidate];
  uint64_t v23 = [v22 length];

  if (!v23) {
    goto LABEL_15;
  }
  uint64_t v24 = [a1 givenName];
  v25 = [v4 candidate];
  char v26 = [v24 isEqualToString:v25];

  if (v26) {
    goto LABEL_13;
  }
  v27 = [a1 middleName];
  uint64_t v28 = [v4 candidate];
  char v29 = [v27 isEqualToString:v28];

  if (v29) {
    goto LABEL_13;
  }
  v30 = [a1 familyName];
  v31 = [v4 candidate];
  char v32 = [v30 isEqualToString:v31];

  if (v32) {
    goto LABEL_13;
  }
  v33 = [a1 nickname];
  v34 = [v4 candidate];
  char v35 = [v33 isEqualToString:v34];

  if ((v35 & 1) != 0
    || ([a1 previousFamilyName],
        v36 = objc_claimAutoreleasedReturnValue(),
        [v4 candidate],
        v37 = objc_claimAutoreleasedReturnValue(),
        char v38 = [v36 isEqualToString:v37],
        v37,
        v36,
        (v38 & 1) != 0))
  {
LABEL_13:
    uint64_t v39 = 1;
  }
  else
  {
LABEL_15:
    uint64_t v39 = 0;
  }

  return v39;
}

- (void)core_appendEntitiesToArray:()TextInputCore
{
  id v47 = a3;
  id v4 = [a1 givenName];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F6F4C8]);
    v7 = [a1 givenName];
    id v8 = objc_msgSend(v6, "initWithName:data:", v7, objc_msgSend(a1, "identifier"));
    [v47 addObject:v8];
  }
  char v9 = [a1 phoneticGivenName];
  uint64_t v10 = [v9 length];

  if (v10)
  {
    id v11 = objc_alloc(MEMORY[0x1E4F6F4C8]);
    char v12 = [a1 phoneticGivenName];
    v13 = objc_msgSend(v11, "initWithName:data:", v12, objc_msgSend(a1, "identifier"));
    [v47 addObject:v13];
  }
  v14 = [a1 middleName];
  uint64_t v15 = [v14 length];

  if (v15)
  {
    id v16 = objc_alloc(MEMORY[0x1E4F6F4C8]);
    id v17 = [a1 middleName];
    char v18 = objc_msgSend(v16, "initWithName:data:", v17, objc_msgSend(a1, "identifier"));
    [v47 addObject:v18];
  }
  unint64_t v19 = [a1 phoneticMiddleName];
  uint64_t v20 = [v19 length];

  if (v20)
  {
    id v21 = objc_alloc(MEMORY[0x1E4F6F4C8]);
    v22 = [a1 phoneticMiddleName];
    uint64_t v23 = objc_msgSend(v21, "initWithName:data:", v22, objc_msgSend(a1, "identifier"));
    [v47 addObject:v23];
  }
  uint64_t v24 = [a1 familyName];
  uint64_t v25 = [v24 length];

  if (v25)
  {
    id v26 = objc_alloc(MEMORY[0x1E4F6F4C8]);
    v27 = [a1 familyName];
    uint64_t v28 = objc_msgSend(v26, "initWithName:data:", v27, objc_msgSend(a1, "identifier"));
    [v47 addObject:v28];
  }
  char v29 = [a1 phoneticFamilyName];
  uint64_t v30 = [v29 length];

  if (v30)
  {
    id v31 = objc_alloc(MEMORY[0x1E4F6F4C8]);
    char v32 = [a1 phoneticFamilyName];
    v33 = objc_msgSend(v31, "initWithName:data:", v32, objc_msgSend(a1, "identifier"));
    [v47 addObject:v33];
  }
  v34 = [a1 previousFamilyName];
  uint64_t v35 = [v34 length];

  if (v35)
  {
    id v36 = objc_alloc(MEMORY[0x1E4F6F4C8]);
    v37 = [a1 previousFamilyName];
    char v38 = objc_msgSend(v36, "initWithName:data:", v37, objc_msgSend(a1, "identifier"));
    [v47 addObject:v38];
  }
  uint64_t v39 = [a1 nickname];
  uint64_t v40 = [v39 length];

  if (v40)
  {
    id v41 = objc_alloc(MEMORY[0x1E4F6F4C8]);
    v42 = [a1 nickname];
    v43 = objc_msgSend(v41, "initWithName:data:", v42, objc_msgSend(a1, "identifier"));
    [v47 addObject:v43];
  }
  v44 = [a1 personNameComponents];
  if (v44)
  {
    v45 = [MEMORY[0x1E4F28F38] localizedStringFromPersonNameComponents:v44 style:2 options:0];
    v46 = objc_msgSend(objc_alloc(MEMORY[0x1E4F6F4C8]), "initWithName:data:", v45, objc_msgSend(a1, "identifier"));
    [v47 addObject:v46];
  }
}

@end