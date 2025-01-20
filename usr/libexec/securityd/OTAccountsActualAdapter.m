@interface OTAccountsActualAdapter
- (ACAccountStore)store;
- (BOOL)isErrorRetryable:(id)a3;
- (id)fetchAccountsRetryingWithError:(id *)a3;
- (id)findAccountForCurrentThread:(id)a3 optionalAltDSID:(id)a4 cloudkitContainerName:(id)a5 octagonContextID:(id)a6 error:(id *)a7;
- (id)inflateAllTPSpecificUsers:(id)a3 octagonContextID:(id)a4;
- (void)setStore:(id)a3;
@end

@implementation OTAccountsActualAdapter

- (void).cxx_destruct
{
}

- (void)setStore:(id)a3
{
}

- (ACAccountStore)store
{
  return self->_store;
}

- (id)inflateAllTPSpecificUsers:(id)a3 octagonContextID:(id)a4
{
  id v23 = a3;
  id v22 = a4;
  v5 = +[ACAccountStore defaultStore];
  v6 = +[NSMutableArray array];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v20 = v5;
  [v5 aa_appleAccounts];
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v25;
    uint64_t v10 = AAAccountClassPrimary;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        v13 = [TPSpecificUser alloc];
        v14 = [v12 identifier];
        v15 = [v12 aa_altDSID];
        id v16 = [v12 aa_isAccountClass:v10];
        v17 = [v12 personaIdentifier];
        v18 = [(TPSpecificUser *)v13 initWithCloudkitContainerName:v23 octagonContextID:v22 appleAccountID:v14 altDSID:v15 isPrimaryPersona:v16 personaUniqueString:v17];

        [v6 addObject:v18];
      }
      id v8 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v8);
  }

  return v6;
}

- (id)findAccountForCurrentThread:(id)a3 optionalAltDSID:(id)a4 cloudkitContainerName:(id)a5 octagonContextID:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  unsigned int v16 = [v12 currentThreadIsForPrimaryiCloudAccount];
  v17 = [v12 currentThreadPersonaUniqueString];
  v18 = sub_10000B070("octagon-account");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)v82 = v17;
    _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "persona identifier: %@", buf, 0xCu);
  }

  v19 = [(OTAccountsActualAdapter *)self store];

  if (!v19)
  {
    v20 = +[ACAccountStore defaultStore];
    [(OTAccountsActualAdapter *)self setStore:v20];
  }
  v21 = [(OTAccountsActualAdapter *)self fetchAccountsRetryingWithError:a7];
  id obj = v21;
  if (!v21)
  {
    long long v24 = sub_10000B070("SecError");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "octagon-account: failed to find accounts", buf, 2u);
    }
    v37 = 0;
    goto LABEL_61;
  }
  unsigned int v72 = v16;
  v69 = a7;
  id v70 = v12;
  id v73 = v15;
  id v71 = v14;
  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  id v22 = [v21 countByEnumeratingWithState:&v77 objects:v83 count:16];
  if (!v22)
  {
    long long v24 = 0;
    v76 = 0;
    v74 = 0;
    goto LABEL_27;
  }
  id v23 = v22;
  long long v24 = 0;
  v76 = 0;
  v74 = 0;
  uint64_t v25 = *(void *)v78;
  uint64_t v26 = AAAccountClassPrimary;
  do
  {
    for (i = 0; i != v23; i = (char *)i + 1)
    {
      if (*(void *)v78 != v25) {
        objc_enumerationMutation(obj);
      }
      v28 = *(void **)(*((void *)&v77 + 1) + 8 * i);
      if (v13)
      {
        v29 = [*(id *)(*((void *)&v77 + 1) + 8 * i) aa_altDSID];
        unsigned int v30 = [v13 isEqualToString:v29];

        if (v30)
        {
          v31 = v28;

          v76 = v31;
        }
      }
      v32 = [v28 personaIdentifier];
      unsigned int v33 = [v17 isEqualToString:v32];

      if (v33)
      {
        v34 = v28;

        long long v24 = v34;
      }
      v35 = [v28 personaIdentifier];
      if (!v35)
      {
        if (!objc_msgSend(v28, "aa_isAccountClass:", v26)) {
          continue;
        }
        v36 = v28;
        v35 = v74;
        v74 = v36;
      }
    }
    id v23 = [obj countByEnumeratingWithState:&v77 objects:v83 count:16];
  }
  while (v23);
LABEL_27:
  v38 = sub_10000B070("octagon-account");
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)v82 = v17;
    *(_WORD *)&v82[8] = 2112;
    *(void *)&v82[10] = v13;
    _os_log_debug_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEBUG, "Search Criteria  - persona: %@ altDSID: %@", buf, 0x16u);
  }

  v39 = sub_10000B070("octagon-account");
  id v15 = v73;
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
  {
    v64 = [v74 aa_altDSID];
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v82 = v72;
    *(_WORD *)&v82[4] = 2112;
    *(void *)&v82[6] = v64;
    _os_log_debug_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEBUG, "Primary account - persona primary: %{BOOL}d altDSID: %@", buf, 0x12u);
  }
  v40 = sub_10000B070("octagon-account");
  id v14 = v71;
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
  {
    v65 = [v24 personaIdentifier];
    v66 = [v24 aa_altDSID];
    *(_DWORD *)buf = 138412546;
    *(void *)v82 = v65;
    *(_WORD *)&v82[8] = 2112;
    *(void *)&v82[10] = v66;
    _os_log_debug_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEBUG, "Match by persona - persona: %@ altDSID: %@", buf, 0x16u);
  }
  v41 = sub_10000B070("octagon-account");
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
  {
    v67 = [v76 personaIdentifier];
    v68 = [v76 aa_altDSID];
    *(_DWORD *)buf = 138412546;
    *(void *)v82 = v67;
    *(_WORD *)&v82[8] = 2112;
    *(void *)&v82[10] = v68;
    _os_log_debug_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEBUG, "Match by altDSID - persona: %@ altDSID: %@", buf, 0x16u);
  }
  if (!v72)
  {
    if (v13)
    {
      if (!v24) {
        goto LABEL_43;
      }
      if (!v76) {
        goto LABEL_43;
      }
      v43 = [v76 personaIdentifier];
      v44 = [v24 personaIdentifier];
      unsigned __int8 v45 = [v43 isEqualToString:v44];

      v42 = v24;
      if ((v45 & 1) == 0)
      {
LABEL_43:
        v46 = sub_10000B070("octagon-account");
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)v82 = v17;
          *(_WORD *)&v82[8] = 2112;
          *(void *)&v82[10] = v13;
          _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Search Criteria  - persona: %@ altDSID: %@", buf, 0x16u);
        }

        v47 = sub_10000B070("octagon-account");
        id v12 = v70;
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          v48 = [v74 aa_altDSID];
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v82 = 0;
          *(_WORD *)&v82[4] = 2112;
          *(void *)&v82[6] = v48;
          _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "Primary account - persona primary: %{BOOL}d altDSID: %@", buf, 0x12u);
        }
        v49 = sub_10000B070("octagon-account");
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          v50 = [v24 personaIdentifier];
          v51 = [v24 aa_altDSID];
          *(_DWORD *)buf = 138412546;
          *(void *)v82 = v50;
          *(_WORD *)&v82[8] = 2112;
          *(void *)&v82[10] = v51;
          _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "Match by persona - persona: %@ altDSID: %@", buf, 0x16u);
        }
        v52 = sub_10000B070("octagon-account");
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        {
          v53 = [v76 personaIdentifier];
          v54 = [v76 aa_altDSID];
          *(_DWORD *)buf = 138412546;
          *(void *)v82 = v53;
          *(_WORD *)&v82[8] = 2112;
          *(void *)&v82[10] = v54;
          _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "Match by altDSID - persona: %@ altDSID: %@", buf, 0x16u);
        }
        if (v69)
        {
          v55 = +[NSString stringWithFormat:@"AppleAccount mismatch for persona '%@' and altDSID '%@'", v17, v13];
          id *v69 = +[NSError errorWithDomain:@"com.apple.security.octagon" code:63 description:v55];
        }
        v56 = sub_10000B070("octagon-account");
        id v15 = v73;
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "Persona/altDSID mis-match specified for query", buf, 2u);
        }
        v37 = 0;
        goto LABEL_59;
      }
      goto LABEL_58;
    }
    goto LABEL_57;
  }
  if (!v13)
  {
    v42 = v74;
    if (v74) {
      goto LABEL_58;
    }
LABEL_57:
    v42 = v24;
    if (!v24) {
      goto LABEL_64;
    }
    goto LABEL_58;
  }
  v42 = v76;
  if (v76)
  {
LABEL_58:
    v56 = v42;
    v57 = [v56 aa_altDSID];
    v58 = [v56 identifier];
    v59 = [v56 personaIdentifier];
    v60 = [TPSpecificUser alloc];
    v37 = [(TPSpecificUser *)v60 initWithCloudkitContainerName:v71 octagonContextID:v73 appleAccountID:v58 altDSID:v57 isPrimaryPersona:[v56 aa_isAccountClass:AAAccountClassPrimary] personaUniqueString:v59];

    id v12 = v70;
LABEL_59:

    goto LABEL_60;
  }
LABEL_64:
  v62 = sub_10000B070("octagon-account");
  v63 = v62;
  if (v17)
  {
    id v12 = v70;
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)v82 = v17;
      _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "Unable to find Apple account matching persona %@", buf, 0xCu);
    }
  }
  else
  {
    id v12 = v70;
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEBUG, "Unable to find Apple account matching primary persona (nil)", buf, 2u);
    }
  }

  if (v69 && !*v69)
  {
    v56 = +[NSString stringWithFormat:@"No AppleAccount exists matching persona '%@' and altDSID '%@'", v17, v13];
    +[NSError errorWithDomain:@"com.apple.security.octagon" code:59 description:v56];
    v37 = 0;
    id *v69 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_59;
  }
  v37 = 0;
LABEL_60:

LABEL_61:

  return v37;
}

- (id)fetchAccountsRetryingWithError:(id *)a3
{
  v5 = [(OTAccountsActualAdapter *)self store];
  id v14 = 0;
  v6 = [v5 aa_appleAccountsWithError:&v14];
  id v7 = v14;

  if (v6)
  {
LABEL_2:
    id v8 = v6;
  }
  else
  {
    int v10 = 0;
    while (v10 != 5 && [(OTAccountsActualAdapter *)self isErrorRetryable:v7])
    {
      v11 = sub_10000B070("octagon-account");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109378;
        LODWORD(v16[0]) = v10;
        WORD2(v16[0]) = 2112;
        *(void *)((char *)v16 + 6) = v7;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "retrying accountsd XPC, (%d, %@)", buf, 0x12u);
      }

      ++v10;
      id v12 = [(OTAccountsActualAdapter *)self store];
      id v14 = 0;
      v6 = [v12 aa_appleAccountsWithError:&v14];
      id v7 = v14;

      if (v6) {
        goto LABEL_2;
      }
    }
    id v13 = sub_10000B070("SecError");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16[0] = v7;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "octagon-account: Can't talk with accountsd: %@", buf, 0xCu);
    }

    if (a3)
    {
      id v7 = v7;
      id v8 = 0;
      *a3 = v7;
    }
    else
    {
      id v8 = 0;
    }
  }

  return v8;
}

- (BOOL)isErrorRetryable:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = [v3 domain];
    if ([v5 isEqualToString:NSCocoaErrorDomain]) {
      BOOL v6 = [v4 code] == (id)4097 || [v4 code] == (id)4099;
    }
    else {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

@end