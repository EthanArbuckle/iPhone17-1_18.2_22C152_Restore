@interface NSDictionary(MTLJSONKeyPath)
- (id)mtl_valueForJSONKeyPath:()MTLJSONKeyPath success:error:;
@end

@implementation NSDictionary(MTLJSONKeyPath)

- (id)mtl_valueForJSONKeyPath:()MTLJSONKeyPath success:error:
{
  v52[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 length];
  if (v7)
  {
    unint64_t v8 = v7;
    char v9 = 0;
    unint64_t v10 = 0;
    unint64_t v11 = 0;
    v12 = 0;
    do
    {
      int v13 = [v6 characterAtIndex:v11];
      if (v13 == 46)
      {
        v16 = objc_msgSend(v6, "substringWithRange:", v10, v11 - v10);
        v17 = v16;
        if (v9)
        {
          uint64_t v18 = [v16 stringByReplacingOccurrencesOfString:@"\\." withString:@"."];

          v17 = (void *)v18;
        }
        if (v12) {
          [v12 addObject:v17];
        }
        else {
          v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v17, 0);
        }
        unint64_t v14 = v11 + 1;

        char v9 = 0;
        unint64_t v10 = v11 + 1;
      }
      else if (v13 == 92)
      {
        unint64_t v14 = v11 + 1;
        if (v11 + 1 < v8)
        {
          int v15 = [v6 characterAtIndex:v11 + 1];
          if (v15 == 46) {
            unint64_t v14 = v11 + 2;
          }
          else {
            unint64_t v14 = v11;
          }
          v9 |= v15 == 46;
        }
      }
      else
      {
        unint64_t v14 = v11 + 1;
      }
      unint64_t v11 = v14;
    }
    while (v14 < v8);
    if (v10)
    {
      objc_msgSend(v6, "substringWithRange:", v10, v8 - v10);
      id v19 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v19 = v6;
    }
    id v20 = v19;
    if (v9)
    {
      uint64_t v21 = [v19 stringByReplacingOccurrencesOfString:@"\\." withString:@"."];

      id v20 = (id)v21;
    }
    if (v12)
    {
      [v12 addObject:v20];
      id v22 = v12;
      v23 = v22;
      goto LABEL_27;
    }
  }
  else
  {
    id v20 = v6;
  }
  v52[0] = v20;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:1];
  id v22 = 0;
LABEL_27:

  id v24 = a1;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v25 = v23;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v45 objects:v51 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v46;
    id v42 = v24;
    while (2)
    {
      uint64_t v29 = 0;
      id v30 = v24;
      do
      {
        if (*(void *)v46 != v28) {
          objc_enumerationMutation(v25);
        }
        if (!v30)
        {
          id v24 = 0;
          goto LABEL_40;
        }
        uint64_t v31 = *(void *)(*((void *)&v45 + 1) + 8 * v29);
        id v32 = [MEMORY[0x1E4F1CA98] null];

        if (v30 == v32)
        {
          id v24 = v30;
          goto LABEL_40;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (a5)
          {
            v49[0] = *MEMORY[0x1E4F28568];
            v35 = [MEMORY[0x1E4F28B50] mainBundle];
            v36 = [v35 localizedStringForKey:@"Invalid JSON dictionary" value:&stru_1F229A4D8 table:0];
            v49[1] = *MEMORY[0x1E4F28588];
            v50[0] = v36;
            v37 = NSString;
            v38 = [MEMORY[0x1E4F28B50] mainBundle];
            v39 = [v38 localizedStringForKey:@"JSON key path %1$@ could not resolved because an incompatible JSON dictionary was supplied: \"%2$@\"" value:&stru_1F229A4D8 table:0];
            v40 = objc_msgSend(v37, "stringWithFormat:", v39, v6, v42);
            v50[1] = v40;
            v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:v49 count:2];

            *a5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MTLJSONAdapterErrorDomain" code:3 userInfo:v41];
          }
          if (a4) {
            *a4 = 0;
          }

          v33 = 0;
          goto LABEL_43;
        }
        id v24 = [v30 objectForKeyedSubscript:v31];

        ++v29;
        id v30 = v24;
      }
      while (v27 != v29);
      uint64_t v27 = [v25 countByEnumeratingWithState:&v45 objects:v51 count:16];
      if (v27) {
        continue;
      }
      break;
    }
  }
LABEL_40:

  if (a4) {
    *a4 = 1;
  }
  id v30 = v24;
  v33 = v30;
LABEL_43:

  return v33;
}

@end