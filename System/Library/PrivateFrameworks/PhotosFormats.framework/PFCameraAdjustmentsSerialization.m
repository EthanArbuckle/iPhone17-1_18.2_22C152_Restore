@interface PFCameraAdjustmentsSerialization
+ (BOOL)deserializeDictionary:(id)a3 toFilters:(id *)a4 portraitMetadata:(id *)a5 error:(id *)a6;
+ (Class)unarchiver:(id)a3 cannotDecodeObjectOfClassName:(id)a4 originalClasses:(id)a5;
+ (id)_errorWithMessage:(id)a3 code:(int64_t)a4;
+ (id)deserializedAdjustmentsFromData:(id)a3 error:(id *)a4;
+ (id)serializedAdjustments:(id)a3 error:(id *)a4;
+ (id)serializedDictionaryForFilters:(id)a3 portraitMetadata:(id)a4 error:(id *)a5;
@end

@implementation PFCameraAdjustmentsSerialization

+ (Class)unarchiver:(id)a3 cannotDecodeObjectOfClassName:(id)a4 originalClasses:(id)a5
{
  id v6 = a4;
  if ([a5 containsObject:@"CIFilter"])
  {
    v7 = [MEMORY[0x1E4F1E040] filterWithName:v6];
    v8 = objc_opt_class();
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  return v9;
}

+ (id)_errorWithMessage:(id)a3 code:(int64_t)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v5 = [NSString stringWithFormat:@"%@", a3];
  uint64_t v9 = *MEMORY[0x1E4F28568];
  v10[0] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PFCameraAdjustmentsSerializationErrorDomain" code:a4 userInfo:v6];

  return v7;
}

+ (BOOL)deserializeDictionary:(id)a3 toFilters:(id *)a4 portraitMetadata:(id *)a5 error:(id *)a6
{
  v47[2] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  v11 = v10;
  if (!v10)
  {
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    goto LABEL_35;
  }
  v12 = [v10 objectForKeyedSubscript:@"version"];
  v13 = [v11 objectForKeyedSubscript:@"filters"];
  uint64_t v43 = [v11 objectForKeyedSubscript:@"portraitMetadata"];
  if (!v12)
  {
    v14 = @"Missing version";
LABEL_13:
    id v18 = a1;
    uint64_t v19 = -94100;
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v14 = @"Version value is wrong type";
    goto LABEL_13;
  }
  if ([v12 isEqualToString:@"0.0"])
  {
    if (v13)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (!v43) {
          goto LABEL_16;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          goto LABEL_16;
        }
        v14 = @"PortraitMetadata value is wrong type";
      }
      else
      {
        v14 = @"Filters value is wrong type";
      }
    }
    else
    {
      v14 = @"Missing filters";
    }
    goto LABEL_13;
  }
  uint64_t v19 = -94101;
  v14 = @"Unsupported version";
  id v18 = a1;
LABEL_14:
  uint64_t v15 = [v18 _errorWithMessage:v14 code:v19];
  if (v15)
  {
    uint64_t v17 = 0;
    uint64_t v16 = 0;
    goto LABEL_31;
  }
LABEL_16:
  context = (void *)MEMORY[0x1A6259880]();
  v47[0] = objc_opt_class();
  v47[1] = objc_opt_class();
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:2];
  [MEMORY[0x1E4F1CAD0] setWithArray:v20];
  v22 = v21 = v13;
  id v45 = 0;
  v40 = v21;
  v23 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v21 error:&v45];
  uint64_t v15 = (uint64_t)v45;
  [v23 setDelegate:a1];
  id v39 = a1;
  if (v23)
  {
    uint64_t v17 = [v23 decodeObjectOfClasses:v22 forKey:*MEMORY[0x1E4F284E8]];
  }
  else
  {
    [NSString stringWithFormat:@"Error unarchiving filters, error: %@", v15];
    v24 = v35 = v12;
    [a1 _errorWithMessage:v24 code:-94100];
    v37 = a4;
    v25 = a5;
    uint64_t v27 = v26 = a6;

    uint64_t v17 = 0;
    uint64_t v15 = v27;
    a6 = v26;
    a5 = v25;
    v12 = v35;
    a4 = v37;
  }
  if (!(v17 | v15))
  {
    uint64_t v15 = [v39 _errorWithMessage:@"No filters could be extracted" code:-94100];
  }

  uint64_t v16 = 0;
  v28 = (void *)v43;
  if (!v43 || v15)
  {
    v13 = v40;
    goto LABEL_32;
  }
  contexta = (void *)MEMORY[0x1A6259880]();
  uint64_t v46 = objc_opt_class();
  v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v46 count:1];
  v29 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:");
  id v44 = 0;
  v30 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v43 error:&v44];
  uint64_t v15 = (uint64_t)v44;
  if (v30)
  {
    uint64_t v16 = [v30 decodeObjectOfClasses:v29 forKey:*MEMORY[0x1E4F284E8]];
  }
  else
  {
    [NSString stringWithFormat:@"Error unarchiving portrait metadata, error: %@", v15];
    v32 = v31 = a6;
    uint64_t v36 = [v39 _errorWithMessage:v32 code:-94100];

    a6 = v31;
    uint64_t v16 = 0;
    uint64_t v15 = v36;
  }
  if (!(v16 | v15))
  {
    uint64_t v15 = [v39 _errorWithMessage:@"No portrait metadata could be extracted" code:-94100];
  }

  v13 = v40;
LABEL_31:
  v28 = (void *)v43;
LABEL_32:

  if (!v15)
  {
LABEL_35:
    BOOL v33 = 1;
    if (!a4) {
      goto LABEL_37;
    }
    goto LABEL_36;
  }

  BOOL v33 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  if (a4) {
LABEL_36:
  }
    *a4 = (id) v17;
LABEL_37:
  if (a5) {
    *a5 = (id) v16;
  }
  if (a6) {
    *a6 = (id) v15;
  }

  return v33;
}

+ (id)serializedDictionaryForFilters:(id)a3 portraitMetadata:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    id v20 = 0;
    id v10 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v8 requiringSecureCoding:1 error:&v20];
    id v11 = v20;
    v12 = 0;
    if (!v10)
    {
      v13 = [NSString stringWithFormat:@"Failed to serialize filters, error: %@", v11];
      v12 = [a1 _errorWithMessage:v13 code:-94102];
    }
    if (!v9)
    {
LABEL_9:
      uint64_t v14 = 0;
      uint64_t v15 = 0;
      uint64_t v16 = 0;
      if (v12) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else
  {
    v12 = [a1 _errorWithMessage:@"Missing filters parameter" code:-94103];
    id v10 = 0;
    if (!v9) {
      goto LABEL_9;
    }
  }
  if (v12) {
    goto LABEL_9;
  }
  uint64_t v19 = 0;
  uint64_t v14 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v9 requiringSecureCoding:1 error:&v19];
LABEL_10:
  uint64_t v17 = [MEMORY[0x1E4F1CA60] dictionary];
  [v17 setObject:@"0.0" forKeyedSubscript:@"version"];
  [v17 setObject:v10 forKeyedSubscript:@"filters"];
  [v17 setObject:v14 forKeyedSubscript:@"portraitMetadata"];
  uint64_t v16 = (void *)[v17 copy];

  v12 = 0;
  uint64_t v15 = (void *)v14;
LABEL_11:
  if (a5) {
    *a5 = v12;
  }

  return v16;
}

+ (id)serializedAdjustments:(id)a3 error:(id *)a4
{
  return (id)[MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:a4];
}

+ (id)deserializedAdjustmentsFromData:(id)a3 error:(id *)a4
{
  v5 = (void *)MEMORY[0x1E4F28DC0];
  id v6 = a3;
  v7 = [v5 unarchivedObjectOfClass:objc_opt_class() fromData:v6 error:a4];

  return v7;
}

@end