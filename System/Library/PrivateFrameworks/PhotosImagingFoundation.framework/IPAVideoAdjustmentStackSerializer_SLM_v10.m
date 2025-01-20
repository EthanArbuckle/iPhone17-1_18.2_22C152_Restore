@interface IPAVideoAdjustmentStackSerializer_SLM_v10
- (id)archiveFromData:(id)a3 error:(id *)a4;
- (id)dataFromArchive:(id)a3 error:(id *)a4;
- (id)dataFromVideoAdjustmentStack:(id)a3 error:(id *)a4;
- (id)videoAdjustmentStackFromData:(id)a3 error:(id *)a4;
@end

@implementation IPAVideoAdjustmentStackSerializer_SLM_v10

- (id)archiveFromData:(id)a3 error:(id *)a4
{
  return +[IPAAdjustmentStackSerializer unarchiveData:a3 error:a4];
}

- (id)dataFromArchive:(id)a3 error:(id *)a4
{
  return +[IPAAdjustmentStackSerializer archiveDictionary:a3 error:a4];
}

- (id)dataFromVideoAdjustmentStack:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [v6 adjustments];
  if ([v7 count] == 1)
  {
    v14 = [v7 objectAtIndexedSubscript:0];
    v15 = [v14 identifier];
    if ([v15 isEqualToString:@"SloMo"])
    {
      v22 = [v14 settings];
      id v26 = 0;
      v23 = [(IPAVideoAdjustmentStackSerializer_SLM_v10 *)self dataFromArchive:v22 error:&v26];
      id v24 = v26;
    }
    else
    {
      IPAAdjustmentError(1000, @"SLM serializer only for singleton SLM adjustments: %@", v16, v17, v18, v19, v20, v21, (uint64_t)v6);
      id v24 = (id)objc_claimAutoreleasedReturnValue();
      v23 = 0;
    }

    if (!a4) {
      goto LABEL_10;
    }
  }
  else
  {
    IPAAdjustmentError(1000, @"SLM serializer only for singleton SLM adjustments: %@", v8, v9, v10, v11, v12, v13, (uint64_t)v6);
    id v24 = (id)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    if (!a4) {
      goto LABEL_10;
    }
  }
  if (v24) {
    *a4 = v24;
  }
LABEL_10:

  return v23;
}

- (id)videoAdjustmentStackFromData:(id)a3 error:(id *)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v13 = 0;
  v5 = +[IPAAdjustmentStackSerializer unarchiveData:a3 error:&v13];
  id v6 = v13;
  if (v5)
  {
    v7 = objc_opt_new();
    [v7 setIdentifier:@"SloMo"];
    [v7 setSettings:v5];
    uint64_t v8 = objc_opt_new();
    v14[0] = v7;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    [v8 setAdjustments:v9];

    if (!a4) {
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v8 = 0;
    if (!a4) {
      goto LABEL_7;
    }
  }
  if (v6) {
    *a4 = v6;
  }
LABEL_7:
  long long v11 = *MEMORY[0x1E4F1FA48];
  uint64_t v12 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  [v8 setNaturalDuration:&v11];

  return v8;
}

@end