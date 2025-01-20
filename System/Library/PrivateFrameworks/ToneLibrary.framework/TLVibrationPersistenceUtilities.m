@interface TLVibrationPersistenceUtilities
+ (BOOL)_objectIsValidUserGeneratedVibrationPattern:(id)a3 error:(id *)a4;
+ (BOOL)_validateObjectWithError:(id *)a3 validationBlock:(id)a4;
+ (BOOL)objectIsValidUserGeneratedVibrationPatternsDictionary:(id)a3 error:(id *)a4;
+ (NSURL)userGeneratedVibrationStoreFileURL;
@end

@implementation TLVibrationPersistenceUtilities

+ (BOOL)_validateObjectWithError:(id *)a3 validationBlock:(id)a4
{
  id v15 = 0;
  id v16 = 0;
  id v14 = 0;
  (*((void (**)(id, id *, id *, id *))a4 + 2))(a4, &v16, &v15, &v14);
  id v5 = v16;
  unint64_t v6 = (unint64_t)v15;
  unint64_t v7 = (unint64_t)v14;
  v8 = (void *)v7;
  if (!v5)
  {
    if (!(v6 | v7))
    {
      BOOL v9 = 1;
      goto LABEL_9;
    }
    if (a3)
    {
      v10 = (void *)MEMORY[0x1E4F28C58];
      v11 = (objc_class *)objc_opt_class();
      v12 = NSStringFromClass(v11);
      objc_msgSend(v10, "tl_errorWithDomain:description:", @"TLServiceValidationErrorDomain", @"Unexpected type for %@: %@ (%@)", v8, v12, v6);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_7;
  }
  if (!a3)
  {
LABEL_7:
    BOOL v9 = 0;
    goto LABEL_9;
  }
  BOOL v9 = 0;
  *a3 = v5;
LABEL_9:

  return v9;
}

+ (BOOL)_objectIsValidUserGeneratedVibrationPattern:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __85__TLVibrationPersistenceUtilities__objectIsValidUserGeneratedVibrationPattern_error___block_invoke;
  v9[3] = &unk_1E6C21248;
  id v10 = v6;
  id v7 = v6;
  LOBYTE(a4) = [a1 _validateObjectWithError:a4 validationBlock:v9];

  return (char)a4;
}

void __85__TLVibrationPersistenceUtilities__objectIsValidUserGeneratedVibrationPattern_error___block_invoke(uint64_t a1, void *a2, void *a3, __CFString **a4)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (a2 && a3 && a4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v8 = *(id *)(a1 + 32);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v24;
        while (2)
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v24 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = *(void **)(*((void *)&v23 + 1) + 8 * v12);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              *a3 = v13;
              v22 = @"key of user generated vibration pattern wrapper";
              goto LABEL_29;
            }
            ++v12;
          }
          while (v10 != v12);
          uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
          if (v10) {
            continue;
          }
          break;
        }
      }

      id v8 = [*(id *)(a1 + 32) objectForKey:@"Name"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v14 = [*(id *)(a1 + 32) objectForKey:@"Pattern"];
        if (!+[TLVibrationPattern isValidVibrationPatternPropertyListRepresentation:v14])
        {
          objc_msgSend(MEMORY[0x1E4F28C58], "tl_errorWithDomain:description:", @"TLServiceValidationErrorDomain", @"Invalid vibration pattern: %@", *(void *)(a1 + 32));
          *a2 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        *a3 = v8;
        v22 = @"name of user generated vibration pattern";
LABEL_29:
        *a4 = v22;
      }
    }
    else
    {
      *a3 = *(id *)(a1 + 32);
      *a4 = @"user generated vibration pattern wrapper";
    }
  }
  else
  {
    id v15 = TLLogGeneral();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);

    if (v16)
    {
      v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ToneLibrary/Library/Vibrations/TLVibrationPersistenceUtilities.m"];
      v18 = TLLogGeneral();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = [v17 lastPathComponent];
        v20 = [MEMORY[0x1E4F29060] callStackSymbols];
        *(_DWORD *)buf = 136381443;
        v29 = "+[TLVibrationPersistenceUtilities _objectIsValidUserGeneratedVibrationPattern:error:]_block_invoke";
        __int16 v30 = 2113;
        v31 = v19;
        __int16 v32 = 2049;
        uint64_t v33 = 71;
        __int16 v34 = 2113;
        v35 = v20;
        _os_log_impl(&dword_1DB936000, v18, OS_LOG_TYPE_DEFAULT, "*** Assertion failure in %{private}s, %{private}@:%{private}lu.\n%{private}@", buf, 0x2Au);
      }
    }
    else
    {
      v17 = TLLogGeneral();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        __85__TLVibrationPersistenceUtilities__objectIsValidUserGeneratedVibrationPattern_error___block_invoke_cold_2();
      }
    }

    v21 = TLLogGeneral();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      __85__TLVibrationPersistenceUtilities__objectIsValidUserGeneratedVibrationPattern_error___block_invoke_cold_1();
    }
  }
}

+ (BOOL)objectIsValidUserGeneratedVibrationPatternsDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __95__TLVibrationPersistenceUtilities_objectIsValidUserGeneratedVibrationPatternsDictionary_error___block_invoke;
  v9[3] = &unk_1E6C21270;
  id v10 = v6;
  id v11 = a1;
  id v7 = v6;
  LOBYTE(a4) = [a1 _validateObjectWithError:a4 validationBlock:v9];

  return (char)a4;
}

void __95__TLVibrationPersistenceUtilities_objectIsValidUserGeneratedVibrationPatternsDictionary_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (!a2 || !a3 || !a4)
  {
    v17 = TLLogGeneral();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_INFO);

    if (v18)
    {
      v19 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ToneLibrary/Library/Vibrations/TLVibrationPersistenceUtilities.m"];
      v20 = TLLogGeneral();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = [v19 lastPathComponent];
        v22 = [MEMORY[0x1E4F29060] callStackSymbols];
        *(_DWORD *)buf = 136381443;
        __int16 v32 = "+[TLVibrationPersistenceUtilities objectIsValidUserGeneratedVibrationPatternsDictionary:error:]_block_invoke";
        __int16 v33 = 2113;
        __int16 v34 = v21;
        __int16 v35 = 2049;
        uint64_t v36 = 109;
        __int16 v37 = 2113;
        v38 = v22;
        _os_log_impl(&dword_1DB936000, v20, OS_LOG_TYPE_DEFAULT, "*** Assertion failure in %{private}s, %{private}@:%{private}lu.\n%{private}@", buf, 0x2Au);
      }
    }
    else
    {
      v19 = TLLogGeneral();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        __85__TLVibrationPersistenceUtilities__objectIsValidUserGeneratedVibrationPattern_error___block_invoke_cold_2();
      }
    }

    long long v23 = TLLogGeneral();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      __85__TLVibrationPersistenceUtilities__objectIsValidUserGeneratedVibrationPattern_error___block_invoke_cold_1();
    }

    return;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    *a3 = *(id *)(a1 + 32);
    *a4 = @"root object";
    return;
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (!v9) {
    goto LABEL_31;
  }
  uint64_t v10 = v9;
  long long v24 = a2;
  uint64_t v11 = *(void *)v27;
  while (2)
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v27 != v11) {
        objc_enumerationMutation(v8);
      }
      v13 = *(void **)(*((void *)&v26 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        *a3 = v13;
        *a4 = @"key object";
        goto LABEL_31;
      }
      if (![v13 hasPrefix:@"usergeneratedvibration:"])
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "tl_errorWithDomain:description:", @"TLServiceValidationErrorDomain", @"Invalid key object: %@. All key objects need to start with \"%@\", v13, @"usergeneratedvibration:"");
        id v16 = (id)objc_claimAutoreleasedReturnValue();

        if (!v16) {
          return;
        }
        goto LABEL_30;
      }
      id v14 = *(void **)(a1 + 40);
      id v15 = [*(id *)(a1 + 32) objectForKey:v13];
      id v25 = 0;
      [v14 _objectIsValidUserGeneratedVibrationPattern:v15 error:&v25];
      id v16 = v25;

      if (v16)
      {

LABEL_30:
        id v8 = v16;
        *long long v24 = v8;
        goto LABEL_31;
      }
    }
    uint64_t v10 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v10) {
      continue;
    }
    break;
  }
LABEL_31:
}

+ (NSURL)userGeneratedVibrationStoreFileURL
{
  v2 = CPSharedResourcesDirectory();
  v3 = [v2 stringByAppendingPathComponent:@"Media/Vibrations/UserGeneratedVibrationPatterns.plist"];
  if (v3)
  {
    v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v3 isDirectory:0];
  }
  else
  {
    v4 = 0;
  }

  return (NSURL *)v4;
}

void __85__TLVibrationPersistenceUtilities__objectIsValidUserGeneratedVibrationPattern_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_1DB936000, v0, v1, "Pointers of validation block can't be NULL.", v2, v3, v4, v5, v6);
}

void __85__TLVibrationPersistenceUtilities__objectIsValidUserGeneratedVibrationPattern_error___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_1DB936000, v0, v1, "*** Assertion failure.", v2, v3, v4, v5, v6);
}

@end