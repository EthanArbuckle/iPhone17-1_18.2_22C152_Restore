@interface TLAlertTypeValidateConsistencyOfEnumeration
@end

@implementation TLAlertTypeValidateConsistencyOfEnumeration

void ___TLAlertTypeValidateConsistencyOfEnumeration_block_invoke()
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v30 = 0;
  v31[0] = &v30;
  v31[1] = 0x2020000000;
  v31[2] = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v28 = 0;
  v29[0] = &v28;
  v29[1] = 0x2020000000;
  v29[2] = 0;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  uint64_t v27 = 0;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = ___TLAlertTypeValidateConsistencyOfEnumeration_block_invoke_2;
  v23[3] = &unk_1E6C21608;
  v23[4] = &v24;
  v23[5] = &v30;
  v23[6] = &v28;
  v0 = (void (**)(void, void))MEMORY[0x1E0195470](v23);
  v0[2](v0, 0);
  v0[2](v0, 1);
  v0[2](v0, 2);
  v0[2](v0, 3);
  v0[2](v0, 4);
  v0[2](v0, 5);
  v0[2](v0, 6);
  v0[2](v0, 7);
  v0[2](v0, 8);
  v0[2](v0, 9);
  v0[2](v0, 10);
  v0[2](v0, 11);
  v0[2](v0, 12);
  v0[2](v0, 13);
  v0[2](v0, 14);
  v0[2](v0, 15);
  v0[2](v0, 16);
  v0[2](v0, 17);
  v0[2](v0, 18);
  v0[2](v0, 19);
  v0[2](v0, 20);
  v0[2](v0, 21);
  v0[2](v0, 22);
  v0[2](v0, 23);
  v0[2](v0, 24);
  v0[2](v0, 25);
  v0[2](v0, 26);
  v0[2](v0, 27);
  v0[2](v0, 28);
  v0[2](v0, 29);
  if (*(void *)(v31[0] + 24))
  {
    v1 = TLLogGeneral();
    BOOL v2 = os_log_type_enabled(v1, OS_LOG_TYPE_INFO);

    if (v2)
    {
      v3 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ToneLibrary/Library/Playback/TLAlertType.m"];
      v4 = TLLogGeneral();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        id v5 = [v3 lastPathComponent];
        v6 = [MEMORY[0x1E4F29060] callStackSymbols];
        *(_DWORD *)buf = 136381443;
        v33 = "void _TLAlertTypeValidateConsistencyOfEnumeration(void)_block_invoke";
        __int16 v34 = 2113;
        id v35 = v5;
        __int16 v36 = 2049;
        uint64_t v37 = 229;
        __int16 v38 = 2113;
        v39 = v6;
        _os_log_impl(&dword_1DB936000, v4, OS_LOG_TYPE_DEFAULT, "*** Assertion failure in %{private}s, %{private}@:%{private}lu.\n%{private}@", buf, 0x2Au);
      }
    }
    else
    {
      v3 = TLLogGeneral();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        __85__TLVibrationPersistenceUtilities__objectIsValidUserGeneratedVibrationPattern_error___block_invoke_cold_2();
      }
    }

    v7 = TLLogGeneral();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      ___TLAlertTypeValidateConsistencyOfEnumeration_block_invoke_cold_5((uint64_t)v31, v7);
    }
  }
  if (*(void *)(v29[0] + 24) == 29)
  {
    uint64_t v8 = 30;
  }
  else
  {
    v9 = TLLogGeneral();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);

    if (v10)
    {
      v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ToneLibrary/Library/Playback/TLAlertType.m"];
      v12 = TLLogGeneral();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = [v11 lastPathComponent];
        v14 = [MEMORY[0x1E4F29060] callStackSymbols];
        *(_DWORD *)buf = 136381443;
        v33 = "void _TLAlertTypeValidateConsistencyOfEnumeration(void)_block_invoke";
        __int16 v34 = 2113;
        id v35 = v13;
        __int16 v36 = 2049;
        uint64_t v37 = 232;
        __int16 v38 = 2113;
        v39 = v14;
        _os_log_impl(&dword_1DB936000, v12, OS_LOG_TYPE_DEFAULT, "*** Assertion failure in %{private}s, %{private}@:%{private}lu.\n%{private}@", buf, 0x2Au);
      }
    }
    else
    {
      v11 = TLLogGeneral();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __85__TLVibrationPersistenceUtilities__objectIsValidUserGeneratedVibrationPattern_error___block_invoke_cold_2();
      }
    }

    v15 = TLLogGeneral();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      ___TLAlertTypeValidateConsistencyOfEnumeration_block_invoke_cold_3((uint64_t)v29, v15);
    }

    uint64_t v8 = *(void *)(v29[0] + 24) + 1;
  }
  if (v8 != v25[3])
  {
    v16 = TLLogGeneral();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);

    if (v17)
    {
      v18 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ToneLibrary/Library/Playback/TLAlertType.m"];
      v19 = TLLogGeneral();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        id v20 = [v18 lastPathComponent];
        v21 = [MEMORY[0x1E4F29060] callStackSymbols];
        *(_DWORD *)buf = 136381443;
        v33 = "void _TLAlertTypeValidateConsistencyOfEnumeration(void)_block_invoke";
        __int16 v34 = 2113;
        id v35 = v20;
        __int16 v36 = 2049;
        uint64_t v37 = 233;
        __int16 v38 = 2113;
        v39 = v21;
        _os_log_impl(&dword_1DB936000, v19, OS_LOG_TYPE_DEFAULT, "*** Assertion failure in %{private}s, %{private}@:%{private}lu.\n%{private}@", buf, 0x2Au);
      }
    }
    else
    {
      v18 = TLLogGeneral();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        __85__TLVibrationPersistenceUtilities__objectIsValidUserGeneratedVibrationPattern_error___block_invoke_cold_2();
      }
    }

    v22 = TLLogGeneral();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      ___TLAlertTypeValidateConsistencyOfEnumeration_block_invoke_cold_1();
    }
  }
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v30, 8);
}

void *___TLAlertTypeValidateConsistencyOfEnumeration_block_invoke_2(void *result, uint64_t a2)
{
  ++*(void *)(*(void *)(result[4] + 8) + 24);
  uint64_t v2 = *(void *)(result[5] + 8);
  uint64_t v3 = *(void *)(v2 + 24);
  if (v3 >= a2) {
    uint64_t v3 = a2;
  }
  *(void *)(v2 + 24) = v3;
  uint64_t v4 = *(void *)(result[6] + 8);
  uint64_t v5 = *(void *)(v4 + 24);
  if (v5 <= a2) {
    uint64_t v5 = a2;
  }
  *(void *)(v4 + 24) = v5;
  return result;
}

void ___TLAlertTypeValidateConsistencyOfEnumeration_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_1DB936000, v0, v1, "TLAlertType values are expected to be subsequent integer values.", v2, v3, v4, v5, v6);
}

void ___TLAlertTypeValidateConsistencyOfEnumeration_block_invoke_cold_3(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)a1 + 24);
  int v3 = 134218240;
  uint64_t v4 = 29;
  __int16 v5 = 2048;
  uint64_t v6 = v2;
  _os_log_error_impl(&dword_1DB936000, a2, OS_LOG_TYPE_ERROR, "The maximum value of TLAlertType is expected to be %ld; instead, it was %ld. You probably forgot to update the defin"
    "ition of _TLAlertTypeMaximumAllowedValue in TLAlertType_Internal.h.",
    (uint8_t *)&v3,
    0x16u);
}

void ___TLAlertTypeValidateConsistencyOfEnumeration_block_invoke_cold_5(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)a1 + 24);
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1DB936000, a2, OS_LOG_TYPE_ERROR, "The minimum value of TLAlertType is expected to be TLAlertTypeNone, i.e. 0. Instead, it was: %ld", (uint8_t *)&v3, 0xCu);
}

@end