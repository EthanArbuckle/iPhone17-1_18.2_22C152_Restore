@interface WLKSanitizer
+ (id)_sanitizeDictionary:(id)a3;
+ (id)sanitizeError:(id)a3;
@end

@implementation WLKSanitizer

+ (id)sanitizeError:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = [v3 domain];
    if (v5 && [v4 code])
    {
      v6 = [v4 userInfo];

      if (v6)
      {
        v7 = [v4 userInfo];
        v8 = +[WLKSanitizer _sanitizeDictionary:v7];

        v9 = (void *)MEMORY[0x1E4F28C58];
        v10 = [v4 domain];
        objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, objc_msgSend(v4, "code"), v8);
        id v11 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_8;
      }
    }
    else
    {
    }
  }
  id v11 = v4;
LABEL_8:

  return v11;
}

+ (id)_sanitizeDictionary:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  v5 = [v3 dictionary];
  uint64_t v6 = *MEMORY[0x1E4F28568];
  v7 = objc_msgSend(v4, "wlk_stringForKey:", *MEMORY[0x1E4F28568]);
  objc_msgSend(v5, "wlk_setObjectUnlessNil:forKey:", v7, v6);

  uint64_t v8 = *MEMORY[0x1E4F285A0];
  v9 = objc_msgSend(v4, "wlk_stringForKey:", *MEMORY[0x1E4F285A0]);
  objc_msgSend(v5, "wlk_setObjectUnlessNil:forKey:", v9, v8);

  uint64_t v10 = *MEMORY[0x1E4F289C0];
  id v11 = objc_msgSend(v4, "wlk_stringForKey:", *MEMORY[0x1E4F289C0]);
  objc_msgSend(v5, "wlk_setObjectUnlessNil:forKey:", v11, v10);

  uint64_t v12 = *MEMORY[0x1E4F28458];
  v13 = objc_msgSend(v4, "wlk_stringForKey:", *MEMORY[0x1E4F28458]);
  objc_msgSend(v5, "wlk_setObjectUnlessNil:forKey:", v13, v12);

  uint64_t v14 = *MEMORY[0x1E4F28228];
  v15 = objc_msgSend(v4, "wlk_stringForKey:", *MEMORY[0x1E4F28228]);
  objc_msgSend(v5, "wlk_setObjectUnlessNil:forKey:", v15, v14);

  uint64_t v16 = *MEMORY[0x1E4F289D0];
  v17 = objc_msgSend(v4, "wlk_urlForKey:", *MEMORY[0x1E4F289D0]);
  v18 = [v17 absoluteString];
  objc_msgSend(v5, "wlk_setObjectUnlessNil:forKey:", v18, v16);

  uint64_t v19 = *MEMORY[0x1E4F28328];
  v20 = objc_msgSend(v4, "wlk_stringForKey:", *MEMORY[0x1E4F28328]);

  objc_msgSend(v5, "wlk_setObjectUnlessNil:forKey:", v20, v19);
  v21 = (void *)[v5 copy];

  return v21;
}

@end