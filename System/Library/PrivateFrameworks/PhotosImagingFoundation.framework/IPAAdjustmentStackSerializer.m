@interface IPAAdjustmentStackSerializer
+ (id)B64StringForData:(id)a3;
+ (id)JSONFromData:(id)a3;
+ (id)JSONFromData:(id)a3 error:(id *)a4;
+ (id)archiveDictionary:(id)a3;
+ (id)archiveDictionary:(id)a3 error:(id *)a4;
+ (id)compressData:(id)a3;
+ (id)compressData:(id)a3 error:(id *)a4;
+ (id)dataFromB64String:(id)a3;
+ (id)dataFromJSON:(id)a3;
+ (id)dataFromJSON:(id)a3 error:(id *)a4;
+ (id)dataFromPropertyList:(id)a3;
+ (id)dataFromPropertyList:(id)a3 error:(id *)a4;
+ (id)decompressData:(id)a3;
+ (id)decompressData:(id)a3 error:(id *)a4;
+ (id)propertyListFromData:(id)a3;
+ (id)propertyListFromData:(id)a3 error:(id *)a4;
+ (id)unarchiveData:(id)a3;
+ (id)unarchiveData:(id)a3 error:(id *)a4;
- (id)_adjustmentStackFromData:(id)a3 error:(id *)a4;
- (id)_dataFromAdjustmentStack:(id)a3 error:(id *)a4;
- (id)adjustmentStackFromData:(id)a3 error:(id *)a4;
- (id)archiveFromData:(id)a3 error:(id *)a4;
- (id)dataFromAdjustmentStack:(id)a3 error:(id *)a4;
- (id)dataFromArchive:(id)a3 error:(id *)a4;
@end

@implementation IPAAdjustmentStackSerializer

- (id)archiveFromData:(id)a3 error:(id *)a4
{
  id v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  objc_claimAutoreleasedReturnValue();
  v6 = (IPAAdjustmentStackSerializer *)_PFAssertFailHandler();
  return [(IPAAdjustmentStackSerializer *)v6 _adjustmentStackFromData:v8 error:v9];
}

- (id)_adjustmentStackFromData:(id)a3 error:(id *)a4
{
  id v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  objc_claimAutoreleasedReturnValue();
  v6 = (IPAAdjustmentStackSerializer *)_PFAssertFailHandler();
  return [(IPAAdjustmentStackSerializer *)v6 _dataFromAdjustmentStack:v8 error:v9];
}

- (id)_dataFromAdjustmentStack:(id)a3 error:(id *)a4
{
  id v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  objc_claimAutoreleasedReturnValue();
  v6 = (IPAAdjustmentStackSerializer *)_PFAssertFailHandler();
  return [(IPAAdjustmentStackSerializer *)v6 dataFromArchive:v8 error:v9];
}

- (id)dataFromArchive:(id)a3 error:(id *)a4
{
  id v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  objc_claimAutoreleasedReturnValue();
  v6 = (IPAAdjustmentStackSerializer *)_PFAssertFailHandler();
  return [(IPAAdjustmentStackSerializer *)v6 adjustmentStackFromData:v8 error:v9];
}

- (id)adjustmentStackFromData:(id)a3 error:(id *)a4
{
  if (a3)
  {
    v9 = [(IPAAdjustmentStackSerializer *)self _adjustmentStackFromData:a3 error:a4];
    id v10 = 0;
  }
  else
  {
    IPAAdjustmentError(1001, @"attempting to deserialize nil data", 0, (uint64_t)a4, v4, v5, v6, v7, v12);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    if (a4 && v10)
    {
      id v10 = v10;
      v9 = 0;
      *a4 = v10;
    }
  }

  return v9;
}

- (id)dataFromAdjustmentStack:(id)a3 error:(id *)a4
{
  id v12 = a3;
  if (v12)
  {
    id v17 = 0;
    v13 = [(IPAAdjustmentStackSerializer *)self _dataFromAdjustmentStack:v12 error:&v17];
    id v14 = v17;
    if (!a4) {
      goto LABEL_7;
    }
  }
  else
  {
    IPAAdjustmentError(1000, @"attempting to serialize nil adjustment stack", v6, v7, v8, v9, v10, v11, v16);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    if (!a4) {
      goto LABEL_7;
    }
  }
  if (v14) {
    *a4 = v14;
  }
LABEL_7:

  return v13;
}

+ (id)propertyListFromData:(id)a3 error:(id *)a4
{
  v15[3] = *(id *)MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    v15[0] = 0;
    uint64_t v6 = [MEMORY[0x1E4F28F98] propertyListWithData:v5 options:0 format:0 error:v15];
    uint64_t v13 = (uint64_t)v15[0];
    if (!(v6 | v13))
    {
      uint64_t v13 = IPAAdjustmentError(1008, @"propertyListWithData returned nil with no error", v7, v8, v9, v10, v11, v12, (uint64_t)v15[0]);
    }
    if (a4 && v13)
    {
      uint64_t v13 = (uint64_t) (id) v13;
      *a4 = (id)v13;
    }
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v13 = 0;
  }

  return (id)v6;
}

+ (id)propertyListFromData:(id)a3
{
  return (id)[a1 propertyListFromData:a3 error:0];
}

+ (id)dataFromPropertyList:(id)a3 error:(id *)a4
{
  v15[3] = *(id *)MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    v15[0] = 0;
    uint64_t v6 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v5 format:200 options:0 error:v15];
    uint64_t v13 = (uint64_t)v15[0];
    if (!(v6 | v13))
    {
      uint64_t v13 = IPAAdjustmentError(1008, @"dataWithPropertyList returned nil with no error", v7, v8, v9, v10, v11, v12, (uint64_t)v15[0]);
    }
    if (a4 && v13)
    {
      uint64_t v13 = (uint64_t) (id) v13;
      *a4 = (id)v13;
    }
  }
  else
  {
    uint64_t v13 = 0;
    uint64_t v6 = 0;
  }

  return (id)v6;
}

+ (id)dataFromPropertyList:(id)a3
{
  return (id)[a1 dataFromPropertyList:a3 error:0];
}

+ (id)archiveDictionary:(id)a3 error:(id *)a4
{
  v10[3] = *(id *)MEMORY[0x1E4F143B8];
  id v5 = a3;
  v10[0] = 0;
  uint64_t v6 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v5 requiringSecureCoding:1 error:v10];
  id v7 = v10[0];
  uint64_t v8 = v7;
  if (a4 && v7) {
    *a4 = v7;
  }

  return v6;
}

+ (id)archiveDictionary:(id)a3
{
  return (id)[a1 archiveDictionary:a3 error:0];
}

+ (id)unarchiveData:(id)a3 error:(id *)a4
{
  v14[5] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = (void *)MEMORY[0x1E4F28DC0];
  id v7 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v14[0] = objc_opt_class();
  v14[1] = objc_opt_class();
  v14[2] = objc_opt_class();
  v14[3] = objc_opt_class();
  v14[4] = objc_opt_class();
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:5];
  uint64_t v9 = (void *)[v7 initWithArray:v8];
  v13[0] = 0;
  uint64_t v10 = [v6 unarchivedObjectOfClasses:v9 fromData:v5 error:v13];
  id v11 = v13[0];

  if (a4 && v11) {
    *a4 = v11;
  }

  return v10;
}

+ (id)unarchiveData:(id)a3
{
  return (id)[a1 unarchiveData:a3 error:0];
}

+ (id)JSONFromData:(id)a3 error:(id *)a4
{
  v15[3] = *(id *)MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    v15[0] = 0;
    uint64_t v6 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v5 options:0 error:v15];
    uint64_t v13 = (uint64_t)v15[0];
    if (!(v6 | v13))
    {
      uint64_t v13 = IPAAdjustmentError(1002, @"JSONObjectWithData returned nil with no error", v7, v8, v9, v10, v11, v12, (uint64_t)v15[0]);
    }
    if (a4 && v13)
    {
      uint64_t v13 = (uint64_t) (id) v13;
      *a4 = (id)v13;
    }
  }
  else
  {
    uint64_t v13 = 0;
    uint64_t v6 = 0;
  }

  return (id)v6;
}

+ (id)JSONFromData:(id)a3
{
  return (id)[a1 JSONFromData:a3 error:0];
}

+ (id)dataFromJSON:(id)a3 error:(id *)a4
{
  v15[3] = *(id *)MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    v15[0] = 0;
    uint64_t v6 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v5 options:0 error:v15];
    uint64_t v13 = (uint64_t)v15[0];
    if (!(v6 | v13))
    {
      uint64_t v13 = IPAAdjustmentError(1002, @"dataWithJSONObject returned nil with no error", v7, v8, v9, v10, v11, v12, (uint64_t)v15[0]);
    }
    if (a4 && v13)
    {
      uint64_t v13 = (uint64_t) (id) v13;
      *a4 = (id)v13;
    }
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v13 = 0;
  }

  return (id)v6;
}

+ (id)dataFromJSON:(id)a3
{
  return (id)[a1 dataFromJSON:a3 error:0];
}

+ (id)decompressData:(id)a3 error:(id *)a4
{
  id v9 = 0;
  id v5 = [MEMORY[0x1E4F8CE58] decompressData:a3 options:0 error:&v9];
  id v6 = v9;
  uint64_t v7 = v6;
  if (a4 && v6) {
    *a4 = v6;
  }

  return v5;
}

+ (id)decompressData:(id)a3
{
  return (id)[a1 decompressData:a3 error:0];
}

+ (id)compressData:(id)a3 error:(id *)a4
{
  id v9 = 0;
  id v5 = [MEMORY[0x1E4F8CE58] compressData:a3 options:0 error:&v9];
  id v6 = v9;
  uint64_t v7 = v6;
  if (a4 && v6) {
    *a4 = v6;
  }

  return v5;
}

+ (id)compressData:(id)a3
{
  return (id)[a1 compressData:a3 error:0];
}

+ (id)dataFromB64String:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F1C9B8];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithBase64EncodedString:v4 options:0];

  return v5;
}

+ (id)B64StringForData:(id)a3
{
  return (id)[a3 base64EncodedStringWithOptions:0];
}

@end