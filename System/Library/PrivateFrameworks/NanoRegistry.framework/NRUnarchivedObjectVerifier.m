@interface NRUnarchivedObjectVerifier
+ (void)unarchivingVerifyObjectClasses:(id)a3 name:(id)a4 classes:(id)a5 owner:(id)a6;
+ (void)unarchivingVerifyObjectIsNotNil:(id)a3 name:(id)a4 owner:(id)a5;
@end

@implementation NRUnarchivedObjectVerifier

+ (void)unarchivingVerifyObjectIsNotNil:(id)a3 name:(id)a4 owner:(id)a5
{
  if (!a3)
  {
    v6 = NSString;
    id v7 = a4;
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    id v10 = [v6 stringWithFormat:@"failure unarchiving %@", v9];

    [MEMORY[0x1E4F1CA00] raise:v10, @"%@ is nil", v7 format];
  }
}

+ (void)unarchivingVerifyObjectClasses:(id)a3 name:(id)a4 classes:(id)a5 owner:(id)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v13 = v11;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v26;
    while (2)
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v26 != v16) {
          objc_enumerationMutation(v13);
        }
        if (objc_opt_isKindOfClass())
        {
          v21 = v13;
          goto LABEL_11;
        }
        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }

  v18 = NSString;
  v19 = (objc_class *)objc_opt_class();
  v20 = NSStringFromClass(v19);
  v21 = [v18 stringWithFormat:@"failure unarchiving %@", v20];

  v22 = (void *)MEMORY[0x1E4F1CA00];
  v23 = (objc_class *)objc_opt_class();
  v24 = NSStringFromClass(v23);
  [v22 raise:v21, @"%@ is class %@ expected one of %@", v10, v24, v13 format];

LABEL_11:
}

@end