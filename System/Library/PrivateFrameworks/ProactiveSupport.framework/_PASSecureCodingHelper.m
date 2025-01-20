@interface _PASSecureCodingHelper
+ (id)robustDecodeObjectOfClass:(Class)a3 forKey:(id)a4 withCoder:(id)a5 expectNonNull:(BOOL)a6 errorDomain:(id)a7 errorCode:(int64_t)a8 logHandle:(id)a9;
+ (id)robustDecodeObjectOfClasses:(id)a3 forKey:(id)a4 withCoder:(id)a5 expectNonNull:(BOOL)a6 errorDomain:(id)a7 errorCode:(int64_t)a8 logHandle:(id)a9;
@end

@implementation _PASSecureCodingHelper

+ (id)robustDecodeObjectOfClass:(Class)a3 forKey:(id)a4 withCoder:(id)a5 expectNonNull:(BOOL)a6 errorDomain:(id)a7 errorCode:(int64_t)a8 logHandle:(id)a9
{
  BOOL v11 = a6;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a9;
  v19 = (void *)MEMORY[0x1A62450A0]();
  v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", a3, 0);
  v21 = [a1 robustDecodeObjectOfClasses:v20 forKey:v15 withCoder:v16 expectNonNull:v11 errorDomain:v17 errorCode:a8 logHandle:v18];

  return v21;
}

+ (id)robustDecodeObjectOfClasses:(id)a3 forKey:(id)a4 withCoder:(id)a5 expectNonNull:(BOOL)a6 errorDomain:(id)a7 errorCode:(int64_t)a8 logHandle:(id)a9
{
  BOOL v11 = a6;
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a9;
  v19 = (void *)MEMORY[0x1A62450A0]();
  if (!v18)
  {
    id v18 = MEMORY[0x1E4F14500];
    id v20 = MEMORY[0x1E4F14500];
  }
  v21 = [v16 decodeObjectOfClasses:v14 forKey:v15];
  if (v21)
  {
    int64_t v47 = a8;
    v48 = v19;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v22 = v14;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v50 objects:v56 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v51;
      while (2)
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v51 != v25) {
            objc_enumerationMutation(v22);
          }
          if (objc_opt_isKindOfClass())
          {
            id v31 = v21;

            goto LABEL_16;
          }
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v50 objects:v56 count:16];
        if (v24) {
          continue;
        }
        break;
      }
    }

    id v27 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v54 = *MEMORY[0x1E4F28568];
    v28 = [NSString stringWithFormat:@"key \"%@\" maps to unexpected class", v15];
    v55 = v28;
    v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v55 forKeys:&v54 count:1];
    v30 = (void *)[v27 initWithDomain:v17 code:v47 userInfo:v29];
    [v16 failWithError:v30];

    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v43 = v18;
      v44 = [v16 error];
      *(_DWORD *)buf = 138412546;
      id v62 = v15;
      __int16 v63 = 2112;
      v64 = v44;
      _os_log_error_impl(&dword_1A32C4000, v43, OS_LOG_TYPE_ERROR, "error decoding for key %@ - %@", buf, 0x16u);
    }
    id v31 = 0;
LABEL_16:
    v19 = v48;
  }
  else
  {
    v32 = [v16 error];

    if (v32)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v33 = v18;
        v34 = [v16 error];
        *(_DWORD *)buf = 138412546;
        id v62 = v15;
        __int16 v63 = 2112;
        v64 = v34;
        _os_log_error_impl(&dword_1A32C4000, v33, OS_LOG_TYPE_ERROR, "error decoding for key %@ - %@", buf, 0x16u);
      }
    }
    else if (v11)
    {
      int v35 = [v16 containsValueForKey:v15];
      id v49 = objc_alloc(MEMORY[0x1E4F28C58]);
      if (v35)
      {
        uint64_t v59 = *MEMORY[0x1E4F28568];
        v36 = [NSString stringWithFormat:@"archive contains illegal nil value for key \"%@\"", v15];
        v60 = v36;
        v37 = (void *)MEMORY[0x1E4F1C9E8];
        v38 = &v60;
        v39 = &v59;
      }
      else
      {
        uint64_t v57 = *MEMORY[0x1E4F28568];
        v36 = [NSString stringWithFormat:@"key \"%@\" not present", v15];
        v58 = v36;
        v37 = (void *)MEMORY[0x1E4F1C9E8];
        v38 = &v58;
        v39 = &v57;
      }
      v40 = [v37 dictionaryWithObjects:v38 forKeys:v39 count:1];
      v41 = (void *)[v49 initWithDomain:v17 code:a8 userInfo:v40];

      [v16 failWithError:v41];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v45 = v18;
        v46 = [v16 error];
        *(_DWORD *)buf = 138412546;
        id v62 = v15;
        __int16 v63 = 2112;
        v64 = v46;
        _os_log_error_impl(&dword_1A32C4000, v45, OS_LOG_TYPE_ERROR, "error decoding for key %@ - %@", buf, 0x16u);
      }
    }
    id v31 = 0;
  }

  return v31;
}

@end