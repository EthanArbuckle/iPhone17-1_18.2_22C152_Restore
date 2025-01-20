@interface NSURL(TUSanitizedCopying)
+ (id)tu_defaultAllowedSchemes;
- (id)sanitizedCopy;
- (id)sanitizedCopyWithZone:()TUSanitizedCopying;
- (id)sanitizedCopyWithZone:()TUSanitizedCopying allowedSchemes:;
@end

@implementation NSURL(TUSanitizedCopying)

+ (id)tu_defaultAllowedSchemes
{
  if (tu_defaultAllowedSchemes_onceToken != -1) {
    dispatch_once(&tu_defaultAllowedSchemes_onceToken, &__block_literal_global_40);
  }
  v0 = (void *)tu_defaultAllowedSchemes_defaultAllowedSchemes;

  return v0;
}

- (id)sanitizedCopy
{
  v2 = objc_msgSend(MEMORY[0x1E4F1CB10], "tu_defaultAllowedSchemes");
  v3 = [a1 sanitizedCopyWithZone:0 allowedSchemes:v2];

  return v3;
}

- (id)sanitizedCopyWithZone:()TUSanitizedCopying
{
  v5 = objc_msgSend(MEMORY[0x1E4F1CB10], "tu_defaultAllowedSchemes");
  v6 = [a1 sanitizedCopyWithZone:a3 allowedSchemes:v5];

  return v6;
}

- (id)sanitizedCopyWithZone:()TUSanitizedCopying allowedSchemes:
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = [a1 scheme];
  v8 = [v7 lowercaseString];

  if ([v8 length])
  {
    if ([v6 containsObject:v8])
    {
      v9 = (void *)[a1 copyWithZone:a3];
      goto LABEL_10;
    }
    v10 = TUDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412546;
      v16 = a1;
      __int16 v17 = 2112;
      id v18 = v6;
      v11 = "[WARN] URL scheme is not in list of allowed schemes: %@ allowedSchemes: %@";
      v12 = v10;
      uint32_t v13 = 22;
      goto LABEL_8;
    }
  }
  else
  {
    v10 = TUDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      v16 = a1;
      v11 = "[WARN] URL does not contain a valid scheme: %@";
      v12 = v10;
      uint32_t v13 = 12;
LABEL_8:
      _os_log_impl(&dword_19C496000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v15, v13);
    }
  }

  v9 = 0;
LABEL_10:

  return v9;
}

@end