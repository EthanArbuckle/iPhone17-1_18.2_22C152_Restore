@interface NSDictionary(SUCoreDictionary)
+ (__CFString)_safeValueName:()SUCoreDictionary ofMaxFieldLength:providingSubstitutionMap:;
+ (__CFString)safeSummaryForDictionary:()SUCoreDictionary;
+ (id)_safeKeyName:()SUCoreDictionary paddedToLength:;
- (id)_safeDescriptionWithName:()SUCoreDictionary atNestedLevel:maxNestedLevel:showingSubLevelName:withMaxValueLength:providingSubstitutionMap:;
- (id)safeDataForKey:()SUCoreDictionary;
- (id)safeDateForKey:()SUCoreDictionary;
- (id)safeDictionaryForKey:()SUCoreDictionary fromBase:withKeyDescription:;
- (id)safeObjectForKey:()SUCoreDictionary ofClass:;
- (id)safeStringForKey:()SUCoreDictionary;
- (id)safeSubDescriptionAtNestedLevel:()SUCoreDictionary instanceAtLevel:withMaxValueLength:providingSubstitutionMap:;
- (id)safeSummary;
- (uint64_t)_logReturningNil:()SUCoreDictionary forKey:valueType:;
- (uint64_t)safeBooleanForKey:()SUCoreDictionary;
- (uint64_t)safeBooleanForKey:()SUCoreDictionary defaultValue:;
- (uint64_t)safeDescriptionWithName:()SUCoreDictionary;
- (uint64_t)safeDescriptionWithName:()SUCoreDictionary maxNestedLevel:withMaxValueLength:providingSubstitutionMap:;
- (uint64_t)safeDictionaryForKey:()SUCoreDictionary;
- (uint64_t)safeIntegerForKey:()SUCoreDictionary;
- (uint64_t)safeIntegerForKey:()SUCoreDictionary defaultValue:;
- (uint64_t)safeLLForKey:()SUCoreDictionary;
- (uint64_t)safeLLForKey:()SUCoreDictionary defaultValue:;
- (uint64_t)safeTriStateForKey:()SUCoreDictionary;
- (uint64_t)safeULLForKey:()SUCoreDictionary;
- (uint64_t)safeULLForKey:()SUCoreDictionary defaultValue:;
- (unint64_t)safeTriStateForKey:()SUCoreDictionary defaultValue:;
- (void)_logReturningDefault:()SUCoreDictionary forKey:valueType:defaultValueName:;
- (void)_logReturningNil:()SUCoreDictionary forKey:valueType:fromBase:withKeyDescription:;
@end

@implementation NSDictionary(SUCoreDictionary)

- (id)safeStringForKey:()SUCoreDictionary
{
  id v4 = a3;
  v5 = [a1 objectForKey:v4];
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v6 = v5;
  }
  else
  {
    [a1 _logReturningNil:v5 forKey:v4 valueType:@"string"];
    id v6 = 0;
  }

  return v6;
}

- (id)safeDictionaryForKey:()SUCoreDictionary fromBase:withKeyDescription:
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [a1 objectForKey:v8];
  if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v12 = v11;
  }
  else
  {
    [a1 _logReturningNil:v11 forKey:v8 valueType:@"dictionary" fromBase:v9 withKeyDescription:v10];
    id v12 = 0;
  }

  return v12;
}

- (id)safeObjectForKey:()SUCoreDictionary ofClass:
{
  id v6 = a3;
  v7 = [a1 objectForKey:v6];
  if (v7 && (objc_opt_isKindOfClass() & 1) != 0)
  {
    id v8 = v7;
  }
  else
  {
    if (a4)
    {
      id v9 = NSStringFromClass(a4);
      if (v9)
      {
        NSStringFromClass(a4);
        id v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v10 = @"nil-object-class";
      }
    }
    else
    {
      id v10 = @"nil-object-class";
    }
    [a1 _logReturningNil:v7 forKey:v6 valueType:v10];

    id v8 = 0;
  }

  return v8;
}

- (void)_logReturningNil:()SUCoreDictionary forKey:valueType:fromBase:withKeyDescription:
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (v11)
  {
    v16 = +[SUCoreLog sharedLogger];
    v17 = [v16 oslog];

    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (v14)
    {
      if (v15)
      {
        if (v18)
        {
          v19 = (objc_class *)objc_opt_class();
          v20 = NSStringFromClass(v19);
          int v27 = 138544386;
          id v28 = v14;
          __int16 v29 = 2114;
          id v30 = v12;
          __int16 v31 = 2114;
          id v32 = v15;
          __int16 v33 = 2114;
          id v34 = v20;
          __int16 v35 = 2114;
          id v36 = v13;
          v21 = "[SUCoreDictionary] [%{public}@] key '%{public}@' (%{public}@) references value of the incorrect class (%"
                "{public}@), returning %{public}@ value: nil";
          v22 = v17;
          uint32_t v23 = 52;
LABEL_14:
          _os_log_error_impl(&dword_1B4EC2000, v22, OS_LOG_TYPE_ERROR, v21, (uint8_t *)&v27, v23);
        }
LABEL_15:

        goto LABEL_16;
      }
      if (!v18) {
        goto LABEL_15;
      }
      v25 = (objc_class *)objc_opt_class();
      v20 = NSStringFromClass(v25);
      int v27 = 138544130;
      id v28 = v14;
      __int16 v29 = 2114;
      id v30 = v12;
      __int16 v31 = 2114;
      id v32 = v20;
      __int16 v33 = 2114;
      id v34 = v13;
      v21 = "[SUCoreDictionary] [%{public}@] key '%{public}@' references value of the incorrect class (%{public}@), retur"
            "ning %{public}@ value: nil";
    }
    else
    {
      if (!v15)
      {
        if (v18)
        {
          v26 = (objc_class *)objc_opt_class();
          v20 = NSStringFromClass(v26);
          int v27 = 138543874;
          id v28 = v12;
          __int16 v29 = 2114;
          id v30 = v20;
          __int16 v31 = 2114;
          id v32 = v13;
          v21 = "[SUCoreDictionary] key '%{public}@' references value of the incorrect class (%{public}@), returning %{pu"
                "blic}@ value: nil";
          v22 = v17;
          uint32_t v23 = 32;
          goto LABEL_14;
        }
        goto LABEL_15;
      }
      if (!v18) {
        goto LABEL_15;
      }
      v24 = (objc_class *)objc_opt_class();
      v20 = NSStringFromClass(v24);
      int v27 = 138544130;
      id v28 = v12;
      __int16 v29 = 2114;
      id v30 = v15;
      __int16 v31 = 2114;
      id v32 = v20;
      __int16 v33 = 2114;
      id v34 = v13;
      v21 = "[SUCoreDictionary] key '%{public}@' (%{public}@) references value of the incorrect class (%{public}@), retur"
            "ning %{public}@ value: nil";
    }
    v22 = v17;
    uint32_t v23 = 42;
    goto LABEL_14;
  }
LABEL_16:
}

- (uint64_t)_logReturningNil:()SUCoreDictionary forKey:valueType:
{
  return [a1 _logReturningNil:a3 forKey:a4 valueType:a5 fromBase:0 withKeyDescription:0];
}

- (id)safeDataForKey:()SUCoreDictionary
{
  id v4 = a3;
  v5 = [a1 objectForKey:v4];
  if (!v5) {
    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (id v6 = (id)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v5 options:1]) == 0)
  {
LABEL_6:
    [a1 _logReturningNil:v5 forKey:v4 valueType:@"data"];
    id v6 = 0;
  }
LABEL_7:

  return v6;
}

- (id)safeSummary
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__3;
  id v12 = __Block_byref_object_dispose__3;
  id v13 = @"{";
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x2020000000;
  char v7 = 1;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__NSDictionary_SUCoreDictionary__safeSummary__block_invoke;
  v5[3] = &unk_1E60B6B70;
  v5[4] = v6;
  v5[5] = &v8;
  [a1 enumerateKeysAndObjectsUsingBlock:v5];
  uint64_t v1 = [(id)v9[5] stringByAppendingString:@"}"];
  v2 = (void *)v9[5];
  v9[5] = v1;

  id v3 = (id)v9[5];
  _Block_object_dispose(v6, 8);
  _Block_object_dispose(&v8, 8);

  return v3;
}

- (uint64_t)safeIntegerForKey:()SUCoreDictionary
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(a1, "safeIntegerForKey:defaultValue:", v4, objc_msgSend(&unk_1F0D9E148, "integerValue"));

  return v5;
}

- (uint64_t)safeIntegerForKey:()SUCoreDictionary defaultValue:
{
  id v6 = a3;
  char v7 = [a1 objectForKey:v6];
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    a4 = [v7 integerValue];
  }
  else
  {
    uint64_t v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"%llu", a4);
    [a1 _logReturningDefault:v7 forKey:v6 valueType:@"integer" defaultValueName:v8];
  }
  return a4;
}

- (uint64_t)safeBooleanForKey:()SUCoreDictionary
{
  return [a1 safeBooleanForKey:a3 defaultValue:0];
}

- (uint64_t)safeBooleanForKey:()SUCoreDictionary defaultValue:
{
  id v6 = a3;
  char v7 = [a1 objectForKey:v6];
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    a4 = [v7 BOOLValue];
  }
  else
  {
    if (a4) {
      uint64_t v8 = @"YES";
    }
    else {
      uint64_t v8 = @"NO";
    }
    [a1 _logReturningDefault:v7 forKey:v6 valueType:@"BOOLean" defaultValueName:v8];
  }

  return a4;
}

- (uint64_t)safeLLForKey:()SUCoreDictionary
{
  return [a1 safeLLForKey:a3 defaultValue:0];
}

- (uint64_t)safeLLForKey:()SUCoreDictionary defaultValue:
{
  id v6 = a3;
  char v7 = [a1 objectForKey:v6];
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    a4 = [v7 longLongValue];
  }
  else
  {
    uint64_t v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", a4);
    [a1 _logReturningDefault:v7 forKey:v6 valueType:@"ll" defaultValueName:v8];
  }
  return a4;
}

- (uint64_t)safeULLForKey:()SUCoreDictionary
{
  return [a1 safeULLForKey:a3 defaultValue:0];
}

- (uint64_t)safeULLForKey:()SUCoreDictionary defaultValue:
{
  id v6 = a3;
  char v7 = [a1 objectForKey:v6];
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    a4 = [v7 unsignedLongLongValue];
  }
  else
  {
    uint64_t v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"%llu", a4);
    [a1 _logReturningDefault:v7 forKey:v6 valueType:@"ull" defaultValueName:v8];
  }
  return a4;
}

- (uint64_t)safeTriStateForKey:()SUCoreDictionary
{
  return [a1 safeTriStateForKey:a3 defaultValue:2];
}

- (unint64_t)safeTriStateForKey:()SUCoreDictionary defaultValue:
{
  id v6 = a3;
  char v7 = [a1 objectForKey:v6];
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v8 = [v7 integerValue];
      if (v8 < 2) {
        goto LABEL_12;
      }
      id v9 = +[SUCoreLog sharedLogger];
      uint64_t v10 = [v9 oslog];

      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[NSDictionary(SUCoreDictionary) safeTriStateForKey:defaultValue:]((uint64_t)v6, (uint64_t)v7, v10);
      }
    }
  }
  if (a4 >= 3)
  {
    id v11 = +[SUCoreLog sharedLogger];
    id v12 = [v11 oslog];

    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[NSDictionary(SUCoreDictionary) safeTriStateForKey:defaultValue:]((uint64_t)v6, a4, v12);
    }

    a4 = 2;
  }
  id v13 = objc_msgSend([NSString alloc], "initWithFormat:", @"%llu", a4);
  [a1 _logReturningDefault:v7 forKey:v6 valueType:@"integer" defaultValueName:v13];

  unint64_t v8 = a4;
LABEL_12:

  return v8;
}

- (uint64_t)safeDictionaryForKey:()SUCoreDictionary
{
  return [a1 safeDictionaryForKey:a3 fromBase:0 withKeyDescription:0];
}

- (id)safeDateForKey:()SUCoreDictionary
{
  id v4 = a3;
  uint64_t v5 = [a1 objectForKey:v4];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v5;
      goto LABEL_10;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F28C10]);
      [v7 setDateFormat:@"yyyy-MM-dd"];
      id v6 = [v7 dateFromString:v5];
      if (v6)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {

          goto LABEL_10;
        }
      }
    }
  }
  [a1 _logReturningNil:v5 forKey:v4 valueType:@"date"];
  id v6 = 0;
LABEL_10:

  return v6;
}

- (uint64_t)safeDescriptionWithName:()SUCoreDictionary
{
  return [a1 _safeDescriptionWithName:a3 atNestedLevel:0 maxNestedLevel:3 showingSubLevelName:0 withMaxValueLength:0 providingSubstitutionMap:0];
}

- (uint64_t)safeDescriptionWithName:()SUCoreDictionary maxNestedLevel:withMaxValueLength:providingSubstitutionMap:
{
  return [a1 _safeDescriptionWithName:a3 atNestedLevel:0 maxNestedLevel:a4 showingSubLevelName:0 withMaxValueLength:a5 providingSubstitutionMap:a6];
}

- (id)_safeDescriptionWithName:()SUCoreDictionary atNestedLevel:maxNestedLevel:showingSubLevelName:withMaxValueLength:providingSubstitutionMap:
{
  id v14 = a3;
  id v15 = a8;
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__3;
  v47 = __Block_byref_object_dispose__3;
  id v48 = 0;
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x2020000000;
  uint64_t v42 = 0;
  if (a4)
  {
    v16 = [NSString string];
    v17 = [v16 stringByPaddingToLength:4 * a4 withString:@" " startingAtIndex:0];

    if (a6) {
      [NSString stringWithFormat:@"%@%@ <sub-dictionary>:\n%@{>>>\n", v17, v14, v17];
    }
    else {
    uint64_t v18 = [NSString stringWithFormat:@"%@{>>>\n", v17];
    }
    v20 = (void *)v44[5];
    v44[5] = v18;
  }
  else
  {
    uint64_t v19 = [NSString stringWithFormat:@"%@ <dictionary>:\n{>>>\n", v14];
    v20 = (void *)v44[5];
    v44[5] = v19;
    v17 = &stru_1F0D92C90;
  }

  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __152__NSDictionary_SUCoreDictionary___safeDescriptionWithName_atNestedLevel_maxNestedLevel_showingSubLevelName_withMaxValueLength_providingSubstitutionMap___block_invoke;
  v38[3] = &unk_1E60B6AF8;
  v38[4] = &v39;
  [a1 enumerateKeysAndObjectsUsingBlock:v38];
  if (v40[3])
  {
    v21 = objc_msgSend([NSString alloc], "initWithFormat:", @"[%llu]", a4);
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __152__NSDictionary_SUCoreDictionary___safeDescriptionWithName_atNestedLevel_maxNestedLevel_showingSubLevelName_withMaxValueLength_providingSubstitutionMap___block_invoke_2;
    v29[3] = &unk_1E60B6B20;
    __int16 v33 = &v39;
    uint64_t v35 = a4;
    uint64_t v36 = a5;
    uint64_t v37 = a7;
    id v30 = v15;
    id v34 = &v43;
    id v22 = v21;
    id v31 = v22;
    id v32 = v17;
    [a1 enumerateKeysAndObjectsUsingBlock:v29];
  }
  uint32_t v23 = (void *)v44[5];
  v24 = (void *)[[NSString alloc] initWithFormat:@"%@<<<}", v17];
  uint64_t v25 = [v23 stringByAppendingString:v24];
  v26 = (void *)v44[5];
  v44[5] = v25;

  id v27 = (id)v44[5];
  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v43, 8);

  return v27;
}

- (id)safeSubDescriptionAtNestedLevel:()SUCoreDictionary instanceAtLevel:withMaxValueLength:providingSubstitutionMap:
{
  id v10 = a6;
  if (a3 == 1)
  {
    uint64_t v22 = 0;
    uint32_t v23 = &v22;
    uint64_t v24 = 0x3032000000;
    uint64_t v25 = __Block_byref_object_copy__3;
    v26 = __Block_byref_object_dispose__3;
    id v27 = 0;
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x3032000000;
    uint64_t v19 = __Block_byref_object_copy__3;
    v20 = __Block_byref_object_dispose__3;
    id v21 = 0;
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x2020000000;
    v15[3] = 0;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __126__NSDictionary_SUCoreDictionary__safeSubDescriptionAtNestedLevel_instanceAtLevel_withMaxValueLength_providingSubstitutionMap___block_invoke;
    v14[3] = &unk_1E60B6B48;
    v14[4] = v15;
    v14[5] = &v22;
    v14[6] = &v16;
    v14[7] = a4;
    [a1 enumerateKeysAndObjectsUsingBlock:v14];
    id v11 = (void *)v17[5];
    if (v11)
    {
      id v12 = [v11 _safeDescriptionWithName:v23[5] atNestedLevel:1 maxNestedLevel:3 showingSubLevelName:1 withMaxValueLength:a5 providingSubstitutionMap:v10];
    }
    else
    {
      id v12 = 0;
    }
    _Block_object_dispose(v15, 8);
    _Block_object_dispose(&v16, 8);

    _Block_object_dispose(&v22, 8);
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

+ (id)_safeKeyName:()SUCoreDictionary paddedToLength:
{
  id v5 = a3;
  unint64_t v6 = [v5 length];
  id v7 = v5;
  unint64_t v8 = v7;
  BOOL v9 = a4 >= v6;
  unint64_t v10 = a4 - v6;
  if (v10 != 0 && v9)
  {
    id v11 = [NSString string];
    id v12 = [v11 stringByPaddingToLength:v10 withString:@" " startingAtIndex:0];

    id v13 = (void *)[[NSString alloc] initWithFormat:@"%@%@", v12, v8];
  }
  else
  {
    id v13 = v7;
    if (v9) {
      goto LABEL_7;
    }
    id v13 = objc_msgSend(v7, "substringWithRange:", 0, a4);
    id v12 = v8;
  }

LABEL_7:
  return v13;
}

+ (__CFString)_safeValueName:()SUCoreDictionary ofMaxFieldLength:providingSubstitutionMap:
{
  id v7 = a3;
  id v8 = a5;
  if (!v7)
  {
    BOOL v9 = @"<nil>";
    goto LABEL_37;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v9 = @"<NSNull>";
    goto LABEL_37;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v12 = [v7 unsignedLongLongValue];
      if (!v12)
      {
        BOOL v9 = @"0[NO]";
        goto LABEL_37;
      }
      if (v12 == 1)
      {
        BOOL v9 = @"1[YES]";
        goto LABEL_37;
      }
      id v15 = [MEMORY[0x1E4F1CA20] currentLocale];
      id v11 = [v7 descriptionWithLocale:v15];

      if (!v11)
      {
        BOOL v9 = @"<NSNumber>";
        goto LABEL_36;
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v11 = objc_opt_new();
        [v11 setDateFormat:@"dd-MM-yyyy-hh-mm-ss"];
        id v13 = [v11 stringFromDate:v7];
        id v14 = v13;
        if (v13) {
          BOOL v9 = v13;
        }
        else {
          BOOL v9 = @"<NSDate>";
        }

        goto LABEL_36;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        BOOL v9 = @"<NSDictionary>";
        goto LABEL_37;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        BOOL v9 = @"<NSData>";
        goto LABEL_37;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        BOOL v9 = @"<NSArray>";
        goto LABEL_37;
      }
      v20 = (objc_class *)objc_opt_class();
      id v11 = NSStringFromClass(v20);
      if (!v11)
      {
        BOOL v9 = @"(not shown)";
        goto LABEL_36;
      }
    }
    goto LABEL_24;
  }
  if (!a4 || [v7 length] <= a4)
  {
    BOOL v9 = (__CFString *)v7;
    goto LABEL_37;
  }
  if (!v8)
  {
    if (a4 < 8)
    {
      BOOL v9 = @"<NSString>";
      goto LABEL_37;
    }
    unint64_t v17 = a4 - 2;
    uint64_t v18 = NSString;
    id v11 = objc_msgSend(v7, "substringWithRange:", 0, v17);
    uint64_t v16 = [v18 stringWithFormat:@"%@..", v11];
    goto LABEL_35;
  }
  unint64_t v10 = +[SUCore limitString:v7 toMaxLength:a4 providingSubstitutionMap:v8];
  id v11 = v10;
  if (v10 && [v10 length] <= a4)
  {
LABEL_24:
    uint64_t v16 = v11;
LABEL_35:
    BOOL v9 = v16;
    goto LABEL_36;
  }
  BOOL v9 = @"<NSString>";
LABEL_36:

LABEL_37:
  return v9;
}

+ (__CFString)safeSummaryForDictionary:()SUCoreDictionary
{
  id v3 = a3;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = [v3 safeSummary];
    }
    else
    {
      id v4 = @"NOT-DICTIONARY";
    }
  }
  else
  {
    id v4 = @"NONE";
  }

  return v4;
}

- (void)_logReturningDefault:()SUCoreDictionary forKey:valueType:defaultValueName:
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  if (a3)
  {
    uint64_t v12 = +[SUCoreLog sharedLogger];
    id v13 = [v12 oslog];

    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138543874;
      id v15 = v9;
      __int16 v16 = 2114;
      id v17 = v10;
      __int16 v18 = 2114;
      id v19 = v11;
      _os_log_error_impl(&dword_1B4EC2000, v13, OS_LOG_TYPE_ERROR, "[SUCoreDictionary] key '%{public}@' is the incorrect class, returning %{public}@ default value: %{public}@", (uint8_t *)&v14, 0x20u);
    }
  }
}

- (void)safeTriStateForKey:()SUCoreDictionary defaultValue:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = [MEMORY[0x1E4F28ED0] numberWithInteger:a2];
  int v6 = 138543618;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  id v9 = v5;
  _os_log_error_impl(&dword_1B4EC2000, a3, OS_LOG_TYPE_ERROR, "[SUCoreDictionary] key '%{public}@' is invalid value: %{public}@, returning SUCoreTriStateNotSet", (uint8_t *)&v6, 0x16u);
}

- (void)safeTriStateForKey:()SUCoreDictionary defaultValue:.cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1B4EC2000, log, OS_LOG_TYPE_ERROR, "[SUCoreDictionary] key '%{public}@' is invalid value: %{public}@, returning default value", (uint8_t *)&v3, 0x16u);
}

@end