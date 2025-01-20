@interface UIAccessibilityAuditUtilities
+ (BOOL)checkBoolValueForOptionsKey:(id)a3 inDictionary:(id)a4;
+ (id)dictionaryWithAXAuditIssue:(int64_t)a3 element:(id)a4 additionalInfo:(id)a5 identifier:(id)a6 foregroundColor:(id)a7 backgroundColor:(id)a8 fontSize:(id)a9 elementRect:(id)a10 text:(id)a11;
+ (id)optionsDictionaryForAuditTest:(id)a3 inDictionary:(id)a4;
@end

@implementation UIAccessibilityAuditUtilities

+ (id)dictionaryWithAXAuditIssue:(int64_t)a3 element:(id)a4 additionalInfo:(id)a5 identifier:(id)a6 foregroundColor:(id)a7 backgroundColor:(id)a8 fontSize:(id)a9 elementRect:(id)a10 text:(id)a11
{
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  id v23 = a11;
  v24 = [MEMORY[0x1E4F1CA60] dictionary];
  v25 = v24;
  if (v16)
  {
    v26 = objc_msgSend(NSString, "stringWithFormat:", @"%li", a3);
    [v25 setObject:v26 forKey:*MEMORY[0x1E4F48840]];

    [v25 setObject:v16 forKey:*MEMORY[0x1E4F48810]];
    if (v17) {
      [v25 setObject:v17 forKey:*MEMORY[0x1E4F48800]];
    }
    if (v18) {
      [v25 setObject:v18 forKey:*MEMORY[0x1E4F48830]];
    }
    if (v19) {
      [v25 setObject:v19 forKey:*MEMORY[0x1E4F48828]];
    }
    if (v20) {
      [v25 setObject:v20 forKey:*MEMORY[0x1E4F48808]];
    }
    if (v21) {
      [v25 setObject:v21 forKey:*MEMORY[0x1E4F48820]];
    }
    if (v22) {
      [v25 setObject:v22 forKey:*MEMORY[0x1E4F48818]];
    }
    if (v23) {
      [v25 setObject:v23 forKey:*MEMORY[0x1E4F48838]];
    }
    id v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v25];
  }
  else
  {
    id v27 = v24;
  }
  v28 = v27;

  return v28;
}

+ (BOOL)checkBoolValueForOptionsKey:(id)a3 inDictionary:(id)a4
{
  if (!a4) {
    return 0;
  }
  id v5 = a4;
  id v6 = a3;
  objc_opt_class();
  v7 = [v5 objectForKey:v6];

  v8 = __UIAccessibilityCastAsClass();

  if (v8) {
    char v9 = [v8 BOOLValue];
  }
  else {
    char v9 = 0;
  }

  return v9;
}

+ (id)optionsDictionaryForAuditTest:(id)a3 inDictionary:(id)a4
{
  if (a4)
  {
    id v5 = a4;
    id v6 = a3;
    objc_opt_class();
    v7 = [v5 objectForKey:v6];

    v8 = __UIAccessibilityCastAsClass();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end