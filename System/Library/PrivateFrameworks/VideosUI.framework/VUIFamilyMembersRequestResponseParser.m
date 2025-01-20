@interface VUIFamilyMembersRequestResponseParser
- (VUIFamilyMembersRequestResponseParser)init;
- (id)_filterCurrentFamilyMember:(id)a3 fromResults:(id)a4;
- (id)_parseFamilyMemberIdentifierFromDictionary:(id)a3 withKey:(id)a4;
- (id)_processRawFamilyMemberResults:(id)a3;
- (id)parseAMSURLResult:(id)a3;
@end

@implementation VUIFamilyMembersRequestResponseParser

- (VUIFamilyMembersRequestResponseParser)init
{
  v6.receiver = self;
  v6.super_class = (Class)VUIFamilyMembersRequestResponseParser;
  v2 = [(VUIFamilyMembersRequestResponseParser *)&v6 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.tv.mediaAPI", "VUIFamilyMembersRequestResponseParser");
    v4 = (void *)sLogObject_8;
    sLogObject_8 = (uint64_t)v3;
  }
  return v2;
}

- (id)parseAMSURLResult:(id)a3
{
  id v4 = a3;
  v5 = [v4 object];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v7 = [v4 object];
    v8 = objc_msgSend(v7, "vui_dictionaryForKey:", @"results");

    if (v8)
    {
      v9 = [(VUIFamilyMembersRequestResponseParser *)self _parseFamilyMemberIdentifierFromDictionary:v8 withKey:@"me"];
      v10 = objc_msgSend(v8, "vui_arrayForKey:", @"members");
      if (v10)
      {
        v11 = [(VUIFamilyMembersRequestResponseParser *)self _processRawFamilyMemberResults:v10];
        if (v9)
        {
          uint64_t v12 = [(VUIFamilyMembersRequestResponseParser *)self _filterCurrentFamilyMember:v9 fromResults:v11];

          v11 = (void *)v12;
        }
      }
      else
      {
        v15 = sLogObject_8;
        if (os_log_type_enabled((os_log_t)sLogObject_8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v17 = 0;
          _os_log_impl(&dword_1E2BD7000, v15, OS_LOG_TYPE_DEFAULT, "Parsing AMS Family Member Fetch with no family members bag", v17, 2u);
        }
        v11 = (void *)MEMORY[0x1E4F1CBF0];
      }
    }
    else
    {
      v14 = sLogObject_8;
      if (os_log_type_enabled((os_log_t)sLogObject_8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl(&dword_1E2BD7000, v14, OS_LOG_TYPE_DEFAULT, "Parsing AMS Family Member Fetch with no results bag", v18, 2u);
      }
      v11 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    v13 = sLogObject_8;
    if (os_log_type_enabled((os_log_t)sLogObject_8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v13, OS_LOG_TYPE_DEFAULT, "Parsing AMS Family Member Fetch with no object dictionary", buf, 2u);
    }
    v11 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v11;
}

- (id)_processRawFamilyMemberResults:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v18 = objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v9 = objc_alloc_init(VUIFamilyMember);
          v10 = objc_msgSend(v8, "vui_stringForKey:", @"firstName");
          [(VUIFamilyMember *)v9 setFirstName:v10];
          v11 = objc_msgSend(v8, "vui_stringForKey:", @"lastName");
          [(VUIFamilyMember *)v9 setLastName:v11];
          uint64_t v12 = [(VUIFamilyMembersRequestResponseParser *)self _parseFamilyMemberIdentifierFromDictionary:v8 withKey:@"id"];
          [(VUIFamilyMember *)v9 setMemberIdentifier:v12];
          v13 = objc_msgSend(v8, "vui_stringForKey:", @"accountName");
          [(VUIFamilyMember *)v9 setAccountName:v13];
          -[VUIFamilyMember setSharingPurchases:](v9, "setSharingPurchases:", objc_msgSend(v8, "vui_BOOLForKey:defaultValue:", @"sharingPurchases", 0));
          [v18 addObject:v9];
        }
        else
        {
          v14 = sLogObject_8;
          if (os_log_type_enabled((os_log_t)sLogObject_8, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1E2BD7000, v14, OS_LOG_TYPE_DEFAULT, "Parsing AMS Family Member Fetch invalid member dictionary", buf, 2u);
          }
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v5);
  }

  v15 = (void *)[v18 copy];
  return v15;
}

- (id)_parseFamilyMemberIdentifierFromDictionary:(id)a3 withKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_msgSend(v5, "vui_stringForKey:", v6);
  if (v7)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
    v9 = [v8 numberFromString:v7];
  }
  else
  {
    v9 = objc_msgSend(v5, "vui_numberForKey:", v6);
  }

  return v9;
}

- (id)_filterCurrentFamilyMember:(id)a3 fromResults:(id)a4
{
  id v5 = a3;
  id v6 = (void *)MEMORY[0x1E4F28F60];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __80__VUIFamilyMembersRequestResponseParser__filterCurrentFamilyMember_fromResults___block_invoke;
  v13[3] = &unk_1E6DF81E8;
  id v14 = v5;
  id v7 = v5;
  id v8 = a4;
  v9 = [v6 predicateWithBlock:v13];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v8];

  v11 = [v10 filteredArrayUsingPredicate:v9];

  return v11;
}

uint64_t __80__VUIFamilyMembersRequestResponseParser__filterCurrentFamilyMember_fromResults___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 memberIdentifier];
  LODWORD(a1) = [v3 isEqualToNumber:*(void *)(a1 + 32)];

  return a1 ^ 1;
}

@end