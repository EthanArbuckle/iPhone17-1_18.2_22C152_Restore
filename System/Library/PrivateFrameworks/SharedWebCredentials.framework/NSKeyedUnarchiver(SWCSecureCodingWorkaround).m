@interface NSKeyedUnarchiver(SWCSecureCodingWorkaround)
+ (id)swc_unarchivedObjectOfClass:()SWCSecureCodingWorkaround fromData:error:;
+ (id)swc_unarchivedObjectOfClasses:()SWCSecureCodingWorkaround fromData:error:;
@end

@implementation NSKeyedUnarchiver(SWCSecureCodingWorkaround)

+ (id)swc_unarchivedObjectOfClass:()SWCSecureCodingWorkaround fromData:error:
{
  id v8 = a4;
  v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", a3, 0);
  v10 = objc_msgSend(a1, "swc_unarchivedObjectOfClasses:fromData:error:", v9, v8, a5);

  return v10;
}

+ (id)swc_unarchivedObjectOfClasses:()SWCSecureCodingWorkaround fromData:error:
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = (void *)MEMORY[0x1AD1157F0]();
  id v25 = 0;
  v11 = [a1 unarchivedObjectOfClasses:v8 fromData:v9 error:&v25];
  id v12 = v25;
  if (v11)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v13 = v8;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v28 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v22;
LABEL_4:
      uint64_t v16 = 0;
      while (1)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v13);
        }
        if (objc_opt_isKindOfClass()) {
          break;
        }
        if (v14 == ++v16)
        {
          uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v28 count:16];
          if (v14) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:

      id v17 = objc_alloc(MEMORY[0x1E4F28C58]);
      v26[0] = @"Line";
      v26[1] = @"Function";
      v27[0] = &unk_1F0345950;
      objc_msgSend(NSString, "stringWithUTF8String:", "+[NSKeyedUnarchiver(SWCSecureCodingWorkaround) swc_unarchivedObjectOfClasses:fromData:error:]", v21);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      v27[1] = v13;
      v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:2];
      uint64_t v19 = [v17 initWithDomain:*MEMORY[0x1E4F281F8] code:4864 userInfo:v18];

      v11 = 0;
      id v12 = (id)v19;
    }
  }
  if (a5 && !v11) {
    *a5 = v12;
  }

  return v11;
}

@end