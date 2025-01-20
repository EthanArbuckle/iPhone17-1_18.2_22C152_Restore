@interface NSError(MOError)
+ (id)errorUsingError:()MOError withUnderyingError:;
@end

@implementation NSError(MOError)

+ (id)errorUsingError:()MOError withUnderyingError:
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (!v5)
  {
    if (!v6)
    {
      v13 = 0;
      goto LABEL_19;
    }
    id v12 = v6;
LABEL_8:
    v13 = v12;
    goto LABEL_19;
  }
  if (!v6)
  {
    id v12 = v5;
    goto LABEL_8;
  }
  v8 = [v5 userInfo];
  v9 = (void *)MEMORY[0x1E4F1CA60];
  if (v8)
  {
    v10 = [v5 userInfo];
    v11 = [v9 dictionaryWithDictionary:v10];
  }
  else
  {
    v11 = objc_opt_new();
  }

  [v11 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
  v14 = [v5 userInfo];
  uint64_t v15 = *MEMORY[0x1E4F28568];
  uint64_t v16 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4F28568]];
  if (v16)
  {
    v17 = (void *)v16;
    v18 = [v7 userInfo];
    v19 = [v18 objectForKeyedSubscript:v15];

    if (v19)
    {
      v20 = NSString;
      v21 = [v5 userInfo];
      v22 = [v21 objectForKeyedSubscript:v15];
      v23 = [v7 userInfo];
      v24 = [v23 objectForKeyedSubscript:v15];
      v25 = [v20 stringWithFormat:@"%@ (due '%@')", v22, v24];
      [v11 setObject:v25 forKeyedSubscript:v15];

LABEL_17:
      goto LABEL_18;
    }
  }
  else
  {
  }
  v26 = [v7 userInfo];
  v27 = [v26 objectForKeyedSubscript:v15];

  if (v27)
  {
    v28 = NSString;
    v21 = [v7 userInfo];
    v22 = [v21 objectForKeyedSubscript:v15];
    v23 = [v28 stringWithFormat:@"due '%@'", v22];
    [v11 setObject:v23 forKeyedSubscript:v15];
    goto LABEL_17;
  }
LABEL_18:
  v29 = (void *)MEMORY[0x1E4F28C58];
  v30 = [v5 domain];
  v13 = objc_msgSend(v29, "errorWithDomain:code:userInfo:", v30, objc_msgSend(v5, "code"), v11);

LABEL_19:
  return v13;
}

@end