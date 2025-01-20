@interface NSDictionary(WBNSDictionaryExtras)
- (id)wb_URLForKey:()WBNSDictionaryExtras isValid:;
- (id)wb_arrayForKey:()WBNSDictionaryExtras isValid:;
- (id)wb_dateForKey:()WBNSDictionaryExtras isValid:;
- (id)wb_dictionaryForKey:()WBNSDictionaryExtras isValid:;
- (id)wb_numberForKey:()WBNSDictionaryExtras isValid:;
- (id)wb_objectOfType:()WBNSDictionaryExtras forKey:isValid:;
- (id)wb_stringForKey:()WBNSDictionaryExtras isValid:;
- (uint64_t)wb_BOOLForKey:()WBNSDictionaryExtras;
- (uint64_t)wb_numberForKey:()WBNSDictionaryExtras;
@end

@implementation NSDictionary(WBNSDictionaryExtras)

- (id)wb_stringForKey:()WBNSDictionaryExtras isValid:
{
  id v6 = a3;
  v7 = objc_msgSend(a1, "wb_objectOfType:forKey:isValid:", objc_opt_class(), v6, a4);

  return v7;
}

- (id)wb_objectOfType:()WBNSDictionaryExtras forKey:isValid:
{
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __69__NSDictionary_WBNSDictionaryExtras__wb_objectOfType_forKey_isValid___block_invoke;
  v13[3] = &__block_descriptor_40_e8_v12__0B8l;
  v13[4] = a5;
  id v6 = a4;
  v7 = (void *)MEMORY[0x21D4A1230](v13);
  v8 = [a1 objectForKey:v6];

  if (v8)
  {
    char isKindOfClass = objc_opt_isKindOfClass();
    v10 = (void (*)(void *, uint64_t))v7[2];
    if (isKindOfClass)
    {
      v10(v7, 1);
      id v11 = v8;
      goto LABEL_7;
    }
    v10(v7, 0);
  }
  else
  {
    ((void (*)(void *, uint64_t))v7[2])(v7, 1);
  }
  id v11 = 0;
LABEL_7:

  return v11;
}

- (uint64_t)wb_BOOLForKey:()WBNSDictionaryExtras
{
  v3 = objc_msgSend(a1, "wb_numberForKey:isValid:", a3, 0);
  uint64_t v4 = [v3 BOOLValue];

  return v4;
}

- (uint64_t)wb_numberForKey:()WBNSDictionaryExtras
{
  return objc_msgSend(a1, "wb_numberForKey:isValid:", a3, 0);
}

- (id)wb_numberForKey:()WBNSDictionaryExtras isValid:
{
  id v6 = a3;
  v7 = objc_msgSend(a1, "wb_objectOfType:forKey:isValid:", objc_opt_class(), v6, a4);

  return v7;
}

- (id)wb_dictionaryForKey:()WBNSDictionaryExtras isValid:
{
  id v6 = a3;
  v7 = objc_msgSend(a1, "wb_objectOfType:forKey:isValid:", objc_opt_class(), v6, a4);

  return v7;
}

- (id)wb_arrayForKey:()WBNSDictionaryExtras isValid:
{
  id v6 = a3;
  v7 = objc_msgSend(a1, "wb_objectOfType:forKey:isValid:", objc_opt_class(), v6, a4);

  return v7;
}

- (id)wb_dateForKey:()WBNSDictionaryExtras isValid:
{
  id v6 = a3;
  v7 = objc_msgSend(a1, "wb_objectOfType:forKey:isValid:", objc_opt_class(), v6, a4);

  return v7;
}

- (id)wb_URLForKey:()WBNSDictionaryExtras isValid:
{
  id v6 = a3;
  v7 = objc_msgSend(a1, "wb_objectOfType:forKey:isValid:", objc_opt_class(), v6, a4);

  return v7;
}

@end