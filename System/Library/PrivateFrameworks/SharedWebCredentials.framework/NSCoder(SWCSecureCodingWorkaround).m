@interface NSCoder(SWCSecureCodingWorkaround)
- (id)swc_decodeObjectOfClass:()SWCSecureCodingWorkaround forKey:;
- (id)swc_decodeObjectOfClasses:()SWCSecureCodingWorkaround forKey:;
@end

@implementation NSCoder(SWCSecureCodingWorkaround)

- (id)swc_decodeObjectOfClass:()SWCSecureCodingWorkaround forKey:
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = (void *)MEMORY[0x1AD1157F0]();
  v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", a3, 0);
  v9 = [a1 decodeObjectOfClasses:v8 forKey:v6];

  if (v9 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    id v10 = objc_alloc(MEMORY[0x1E4F28C58]);
    v15[0] = @"Line";
    v15[1] = @"Function";
    v16[0] = &unk_1F0345968;
    v11 = [NSString stringWithUTF8String:"-[NSCoder(SWCSecureCodingWorkaround) swc_decodeObjectOfClass:forKey:]"];
    v16[1] = v11;
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
    v13 = (void *)[v10 initWithDomain:*MEMORY[0x1E4F281F8] code:4864 userInfo:v12];
    [a1 failWithError:v13];

    v9 = 0;
  }

  return v9;
}

- (id)swc_decodeObjectOfClasses:()SWCSecureCodingWorkaround forKey:
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x1AD1157F0]();
  v9 = [a1 decodeObjectOfClasses:v6 forKey:v7];
  if (v9)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v19;
LABEL_4:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v10);
        }
        if (objc_opt_isKindOfClass()) {
          break;
        }
        if (v11 == ++v13)
        {
          uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v24 count:16];
          if (v11) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:

      id v14 = objc_alloc(MEMORY[0x1E4F28C58]);
      v22[0] = @"Line";
      v22[1] = @"Function";
      v23[0] = &unk_1F0345980;
      objc_msgSend(NSString, "stringWithUTF8String:", "-[NSCoder(SWCSecureCodingWorkaround) swc_decodeObjectOfClasses:forKey:]", v18);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      v23[1] = v10;
      v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
      v16 = (void *)[v14 initWithDomain:*MEMORY[0x1E4F281F8] code:4864 userInfo:v15];
      [a1 failWithError:v16];

      v9 = 0;
    }
  }
  return v9;
}

@end