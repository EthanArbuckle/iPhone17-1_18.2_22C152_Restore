@interface CLPlacemark(PPSpecificityComparison)
- (uint64_t)pp_specificityCompare:()PPSpecificityComparison;
@end

@implementation CLPlacemark(PPSpecificityComparison)

- (uint64_t)pp_specificityCompare:()PPSpecificityComparison
{
  v78[6] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = [a1 name];
    if (v5)
    {
      v6 = [a1 name];
    }
    else
    {
      v6 = &stru_1F253DF18;
    }
    v62 = v6;
    v78[0] = v6;
    v8 = [a1 subThoroughfare];
    if (v8)
    {
      v9 = [a1 subThoroughfare];
    }
    else
    {
      v9 = &stru_1F253DF18;
    }
    v60 = v9;
    v78[1] = v9;
    v10 = [a1 thoroughfare];
    if (v10)
    {
      v11 = [a1 thoroughfare];
    }
    else
    {
      v11 = &stru_1F253DF18;
    }
    v58 = v11;
    v78[2] = v11;
    v12 = [a1 subLocality];
    if (v12)
    {
      v13 = [a1 subLocality];
    }
    else
    {
      v13 = &stru_1F253DF18;
    }
    v78[3] = v13;
    v14 = [a1 locality];
    if (v14)
    {
      v15 = [a1 locality];
    }
    else
    {
      v15 = &stru_1F253DF18;
    }
    v78[4] = v15;
    v16 = [a1 administrativeArea];
    if (v16)
    {
      v17 = [a1 administrativeArea];
    }
    else
    {
      v17 = &stru_1F253DF18;
    }
    v78[5] = v17;
    v64 = [MEMORY[0x1E4F1C978] arrayWithObjects:v78 count:6];
    if (v16) {

    }
    if (v14) {
    if (v12)
    }

    if (v10) {
    if (v8)
    }

    if (v5) {
    uint64_t v18 = [v4 name];
    }
    if (v18)
    {
      v19 = [v4 name];
    }
    else
    {
      v19 = &stru_1F253DF18;
    }
    v61 = v19;
    v77[0] = v19;
    v20 = [v4 subThoroughfare];
    if (v20)
    {
      v21 = [v4 subThoroughfare];
    }
    else
    {
      v21 = &stru_1F253DF18;
    }
    v59 = v21;
    v77[1] = v21;
    v22 = [v4 thoroughfare];
    if (v22)
    {
      v23 = [v4 thoroughfare];
    }
    else
    {
      v23 = &stru_1F253DF18;
    }
    v63 = (void *)v18;
    v57 = v23;
    v77[2] = v23;
    v24 = [v4 subLocality];
    if (v24)
    {
      v25 = [v4 subLocality];
    }
    else
    {
      v25 = &stru_1F253DF18;
    }
    v77[3] = v25;
    v26 = [v4 locality];
    if (v26)
    {
      v27 = [v4 locality];
    }
    else
    {
      v27 = &stru_1F253DF18;
    }
    v77[4] = v27;
    v28 = [v4 administrativeArea];
    if (v28)
    {
      v29 = [v4 administrativeArea];
    }
    else
    {
      v29 = &stru_1F253DF18;
    }
    v77[5] = v29;
    v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v77 count:6];
    if (v28) {

    }
    if (v26) {
    if (v24)
    }

    if (v22) {
    v31 = v30;
    }
    if (v20) {

    }
    if (v63) {
    uint64_t v32 = [v64 count];
    }
    if (v32 != [v30 count])
    {
      v33 = pp_default_log_handle();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1CA9A8000, v33, OS_LOG_TYPE_FAULT, "Number of fields used for specificity comparison should always be the same.", buf, 2u);
      }
    }
    unint64_t v34 = [v64 count];
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    id v35 = v64;
    uint64_t v36 = [v35 countByEnumeratingWithState:&v70 objects:v76 count:16];
    unint64_t v37 = v34;
    if (v36)
    {
      uint64_t v38 = v36;
      uint64_t v39 = *(void *)v71;
      unint64_t v40 = v34;
      while (2)
      {
        uint64_t v41 = 0;
        unint64_t v37 = v40 - v38;
        do
        {
          if (*(void *)v71 != v39) {
            objc_enumerationMutation(v35);
          }
          if (![*(id *)(*((void *)&v70 + 1) + 8 * v41) isEqualToString:&stru_1F253DF18])
          {
            unint64_t v37 = v40 - v41;
            goto LABEL_77;
          }
          ++v41;
        }
        while (v38 != v41);
        uint64_t v38 = [v35 countByEnumeratingWithState:&v70 objects:v76 count:16];
        unint64_t v40 = v37;
        if (v38) {
          continue;
        }
        break;
      }
    }
LABEL_77:
    id v65 = v4;

    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id v42 = v31;
    uint64_t v43 = [v42 countByEnumeratingWithState:&v66 objects:v75 count:16];
    unint64_t v44 = v34;
    if (v43)
    {
      uint64_t v45 = v43;
      uint64_t v46 = *(void *)v67;
      unint64_t v47 = v34;
      while (2)
      {
        uint64_t v48 = 0;
        unint64_t v44 = v47 - v45;
        do
        {
          if (*(void *)v67 != v46) {
            objc_enumerationMutation(v42);
          }
          if (![*(id *)(*((void *)&v66 + 1) + 8 * v48) isEqualToString:&stru_1F253DF18])
          {
            unint64_t v44 = v47 - v48;
            goto LABEL_87;
          }
          ++v48;
        }
        while (v45 != v48);
        uint64_t v45 = [v42 countByEnumeratingWithState:&v66 objects:v75 count:16];
        unint64_t v47 = v44;
        if (v45) {
          continue;
        }
        break;
      }
    }
LABEL_87:

    if (v37 >= v44) {
      unint64_t v49 = v44;
    }
    else {
      unint64_t v49 = v37;
    }
    unint64_t v50 = v34 - v49 + 1;
    while (v34 >= v50)
    {
      v51 = [v35 objectAtIndexedSubscript:--v34];
      v52 = [v42 objectAtIndexedSubscript:v34];
      char v53 = [v51 isEqualToString:v52];

      if ((v53 & 1) == 0)
      {
        uint64_t v7 = 0;
        goto LABEL_95;
      }
    }
    v54 = [NSNumber numberWithUnsignedInteger:v37];
    v55 = [NSNumber numberWithUnsignedInteger:v44];
    uint64_t v7 = [v54 compare:v55];

LABEL_95:
    id v4 = v65;
  }
  else
  {
    uint64_t v7 = 1;
  }

  return v7;
}

@end