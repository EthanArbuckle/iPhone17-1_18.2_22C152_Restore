@interface CNContactStore(TelephonyUtilities)
+ (BOOL)tu_isAuthorized;
+ (id)tu_contactStore;
+ (uint64_t)tu_authorizationStatus;
- (id)tu_contactsByContactHandleForContactHandles:()TelephonyUtilities keyDescriptors:error:;
@end

@implementation CNContactStore(TelephonyUtilities)

+ (id)tu_contactStore
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1B990]);
  v3 = [MEMORY[0x1E4F28B50] mainBundle];
  v4 = objc_msgSend(v3, "tu_assumedIdentity");
  [v2 setAssumedIdentity:v4];

  [v2 setIncludeLocalContacts:1];
  v5 = (void *)[[a1 alloc] initWithConfiguration:v2];

  return v5;
}

+ (uint64_t)tu_authorizationStatus
{
  return [MEMORY[0x1E4F1B980] authorizationStatusForEntityType:0];
}

+ (BOOL)tu_isAuthorized
{
  return objc_msgSend(a1, "tu_authorizationStatus") == 3;
}

- (id)tu_contactsByContactHandleForContactHandles:()TelephonyUtilities keyDescriptors:error:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([v8 count])
  {
    v10 = (void *)[objc_alloc(MEMORY[0x1E4F1B908]) initWithKeysToFetch:v9];
    v11 = [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingHandleStrings:v8];
    [v10 setPredicate:v11];

    v12 = TUDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412546;
      uint64_t v19 = (uint64_t)v10;
      __int16 v20 = 2112;
      v21 = a1;
      _os_log_impl(&dword_19C496000, v12, OS_LOG_TYPE_DEFAULT, "Executing contact fetch request %@ using contact store %@", (uint8_t *)&v18, 0x16u);
    }

    v13 = [a1 executeFetchRequest:v10 error:a5];
    v14 = [v13 value];
    v15 = TUDefaultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = [v14 count];
      int v18 = 134217984;
      uint64_t v19 = v16;
      _os_log_impl(&dword_19C496000, v15, OS_LOG_TYPE_DEFAULT, "Contact fetch request returned %lu results", (uint8_t *)&v18, 0xCu);
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

@end