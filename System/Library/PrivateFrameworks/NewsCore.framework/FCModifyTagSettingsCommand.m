@interface FCModifyTagSettingsCommand
- (BOOL)mergeLocalRecord:(id)a3 withRemoteRecord:(id)a4;
- (FCModifyTagSettingsCommand)initWithTagSettingsEntries:(id)a3 merge:(BOOL)a4;
@end

@implementation FCModifyTagSettingsCommand

- (FCModifyTagSettingsCommand)initWithTagSettingsEntries:(id)a3 merge:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = objc_msgSend(a3, "fc_arrayByTransformingWithBlock:", &__block_literal_global_32);
  v7 = [(FCModifyRecordsCommand *)self initWithLocalRecords:v6 merge:v4];

  return v7;
}

uint64_t __63__FCModifyTagSettingsCommand_initWithTagSettingsEntries_merge___block_invoke(uint64_t a1, void *a2)
{
  return [a2 asCKRecord];
}

- (BOOL)mergeLocalRecord:(id)a3 withRemoteRecord:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 objectForKeyedSubscript:@"tagID"];
  v8 = [v6 objectForKeyedSubscript:@"tagID"];
  if ([v7 isEqualToString:v8])
  {
    v9 = [v5 objectForKeyedSubscript:@"fontMultiplier"];
    v10 = [v6 objectForKeyedSubscript:@"fontMultiplier"];
    int v11 = [v9 intValue];
    v37 = v10;
    int v12 = [v10 intValue];
    BOOL v13 = v11 != v12;
    if (v11 != v12) {
      [v6 setObject:v9 forKeyedSubscript:@"fontMultiplier"];
    }
    v38 = v9;
    v14 = [v5 objectForKeyedSubscript:@"fontMultiplierMacOS"];
    v15 = [v6 objectForKeyedSubscript:@"fontMultiplierMacOS"];
    int v16 = [v14 intValue];
    v35 = v15;
    if (v16 != [v15 intValue])
    {
      [v6 setObject:v14 forKeyedSubscript:@"fontMultiplierMacOS"];
      BOOL v13 = 1;
    }
    v36 = v14;
    v17 = [v5 objectForKeyedSubscript:@"contentScale"];
    v18 = [v6 objectForKeyedSubscript:@"contentScale"];
    int v19 = [v17 intValue];
    if (v19 != [v18 intValue])
    {
      [v6 setObject:v17 forKeyedSubscript:@"contentScale"];
      BOOL v13 = 1;
    }
    v20 = [v5 objectForKeyedSubscript:@"contentScaleMacOS"];
    v21 = [v6 objectForKeyedSubscript:@"contentScaleMacOS"];
    int v22 = [v20 intValue];
    if (v22 != [v21 intValue])
    {
      [v6 setObject:v20 forKeyedSubscript:@"contentScaleMacOS"];
      BOOL v13 = 1;
    }
  }
  else
  {
    BOOL v13 = 0;
  }
  v23 = [v5 objectForKeyedSubscript:@"accessToken"];
  v24 = [v6 objectForKeyedSubscript:@"accessToken"];
  if ([v7 isEqualToString:v8])
  {
    v25 = v7;
    if (v23) {
      BOOL v26 = 1;
    }
    else {
      BOOL v26 = v24 == 0;
    }
    if (v26)
    {
      if (!v23 || ([v23 isEqualToString:v24] & 1) != 0)
      {
LABEL_22:
        v29 = [v5 objectForKeyedSubscript:@"webAccessOptIn"];
        uint64_t v30 = [v6 objectForKeyedSubscript:@"webAccessOptIn"];
        v31 = (void *)v30;
        if (v29)
        {
          v32 = v6;
          v33 = v29;
        }
        else
        {
          if (!v30)
          {
LABEL_27:

            v7 = v25;
            goto LABEL_28;
          }
          v32 = v6;
          v33 = 0;
        }
        [v32 setObject:v33 forKeyedSubscript:@"webAccessOptIn"];
        BOOL v13 = 1;
        goto LABEL_27;
      }
      v27 = v6;
      v28 = v23;
    }
    else
    {
      v27 = v6;
      v28 = 0;
    }
    [v27 setObject:v28 forKeyedSubscript:@"accessToken"];
    BOOL v13 = 1;
    goto LABEL_22;
  }
LABEL_28:

  return v13;
}

@end