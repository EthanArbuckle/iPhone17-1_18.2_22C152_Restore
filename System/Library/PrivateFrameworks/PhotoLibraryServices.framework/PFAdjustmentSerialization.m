@interface PFAdjustmentSerialization
+ (BOOL)validateArchive:(id)a3 containsEntryWithKey:(id)a4 ofType:(Class)a5 errors:(id)a6;
+ (BOOL)validateValue:(id)a3 isOfType:(Class)a4 errors:(id)a5;
+ (id)deserializeAdjustmentsFromData:(id)a3 error:(id *)a4;
+ (id)deserializeDictionaryFromData:(id)a3 error:(id *)a4;
+ (id)serializeAdjustments:(id)a3 error:(id *)a4;
+ (id)serializeDictionary:(id)a3 error:(id *)a4;
@end

@implementation PFAdjustmentSerialization

+ (id)deserializeDictionaryFromData:(id)a3 error:(id *)a4
{
  v12[3] = *(id *)MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    v12[0] = 0;
    v6 = [MEMORY[0x1E4F8DCD8] decompressData:v5 error:v12];
    id v7 = v12[0];
    v8 = v7;
    if (v6)
    {
      id v11 = 0;
      v9 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v6 options:0 error:&v11];
    }
    else
    {
      v9 = 0;
      if (a4) {
        *a4 = v7;
      }
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)serializeDictionary:(id)a3 error:(id *)a4
{
  v12[5] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5
    && (v12[0] = 0,
        [MEMORY[0x1E4F28D90] dataWithJSONObject:v5 options:0 error:v12],
        (v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v11 = 0;
    id v7 = [MEMORY[0x1E4F8DCD8] compressData:v6 error:&v11];
    id v8 = v11;
    v9 = v8;
    if (a4 && !v7) {
      *a4 = v8;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)deserializeAdjustmentsFromData:(id)a3 error:(id *)a4
{
  v15[2] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v5 = objc_msgSend(a1, "deserializeDictionaryFromData:error:");
    if (v5)
    {
      v6 = [[PFAdjustmentStack alloc] initWithEnvelopeDictionary:v5];
      id v7 = v6;
      if (!a4 || v6) {
        goto LABEL_7;
      }
      id v8 = objc_opt_new();
      BOOL v9 = +[PFAdjustmentStack isValidEnvelopeDictionary:v5 errors:v8];
      v10 = (void *)MEMORY[0x1E4F28C58];
      v14[0] = @"isValid";
      id v11 = [NSNumber numberWithBool:v9];
      v14[1] = @"errors";
      v15[0] = v11;
      v15[1] = v8;
      v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
      *a4 = [v10 errorWithDomain:@"PFAdjustmentErrorDomain" code:4001 userInfo:v12];
    }
    id v7 = 0;
LABEL_7:

    goto LABEL_9;
  }
  id v7 = objc_opt_new();
LABEL_9:
  return v7;
}

+ (id)serializeAdjustments:(id)a3 error:(id *)a4
{
  v6 = [a3 envelopeDictionary];
  id v7 = [a1 serializeDictionary:v6 error:a4];

  return v7;
}

+ (BOOL)validateValue:(id)a3 isOfType:(Class)a4 errors:(id)a5
{
  void v15[3] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  char isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) == 0)
  {
    v10 = (void *)MEMORY[0x1E4F28C58];
    v14[0] = @"parameter";
    v14[1] = @"expected";
    v15[0] = @"formatVersion";
    v15[1] = a4;
    void v14[2] = @"actual";
    v15[2] = objc_opt_class();
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];
    v12 = [v10 errorWithDomain:@"PFAdjustmentErrorDomain" code:2 userInfo:v11];
    [v8 addObject:v12];
  }
  return isKindOfClass & 1;
}

+ (BOOL)validateArchive:(id)a3 containsEntryWithKey:(id)a4 ofType:(Class)a5 errors:(id)a6
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a6;
  id v11 = [a3 objectForKeyedSubscript:v9];
  if (!v11)
  {
    v13 = (void *)MEMORY[0x1E4F28C58];
    v22 = @"parameter";
    v23[0] = v9;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
    v15 = v13;
    uint64_t v16 = 3;
LABEL_6:
    v18 = [v15 errorWithDomain:@"PFAdjustmentErrorDomain" code:v16 userInfo:v14];
    [v10 addObject:v18];

    BOOL v12 = 0;
    goto LABEL_7;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v17 = (void *)MEMORY[0x1E4F28C58];
    v20[0] = @"parameter";
    v20[1] = @"expected";
    v21[0] = @"formatVersion";
    v21[1] = a5;
    v20[2] = @"actual";
    v21[2] = objc_opt_class();
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:3];
    v15 = v17;
    uint64_t v16 = 2;
    goto LABEL_6;
  }
  BOOL v12 = 1;
LABEL_7:

  return v12;
}

@end