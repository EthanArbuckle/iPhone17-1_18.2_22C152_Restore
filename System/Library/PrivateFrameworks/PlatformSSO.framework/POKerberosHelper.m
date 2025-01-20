@interface POKerberosHelper
- (BOOL)checkForValidKerberosTGT:(id)a3;
- (BOOL)destroyCredentialForUUID:(id)a3;
- (gss_cred_id_t_desc_struct)acquireCredentialForUUID:(id)a3;
- (id)importKerberosEntry:(id)a3 error:(id *)a4;
- (void)exchangeKerberosTGTForEntry:(id)a3;
@end

@implementation POKerberosHelper

- (id)importKerberosEntry:(id)a3 error:(id *)a4
{
  uint64_t v177 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = PO_LOG_POKerberosHelper();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [v5 realm];
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = "-[POKerberosHelper importKerberosEntry:error:]";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v7;
    *(_WORD *)&buf[22] = 2112;
    *(void *)&buf[24] = self;
    _os_log_impl(&dword_230E51000, v6, OS_LOG_TYPE_DEFAULT, "%s realm = %{public}@ on %@", buf, 0x20u);
  }
  id v8 = objc_alloc_init(MEMORY[0x263F5E620]);
  v9 = [v5 ticketKeyPath];
  [v8 setTicketKeyPath:v9];

  v10 = [v5 realm];
  [v8 setRealm:v10];

  krb5_context context = 0;
  opt = 0;
  krb5_principal client = 0;
  cache[1] = 0;
  cache[0] = 0;
  int v156 = 0;
  uint64_t v155 = 0;
  long long v175 = 0u;
  long long v176 = 0u;
  long long v173 = 0u;
  long long v174 = 0u;
  long long v171 = 0u;
  long long v172 = 0u;
  long long v170 = 0u;
  memset(buf, 0, sizeof(buf));
  memset(&v154, 0, sizeof(v154));
  krb5_keyblock_zero();
  uint64_t v153 = 0;
  long long v151 = 0u;
  long long v152 = 0u;
  long long v149 = 0u;
  long long v150 = 0u;
  uint64_t v148 = 0;
  uint64_t v147 = 0;
  krb5_data_zero();
  v11 = NSString;
  v12 = [v5 clientName];
  v13 = [v5 realm];
  v14 = [v11 stringWithFormat:@"%@@%@", v12, v13];

  krb5_error_code inited = krb5_init_context(&context);
  if (inited)
  {
    uint64_t v142 = MEMORY[0x263EF8330];
    uint64_t v143 = 3221225472;
    v144 = __46__POKerberosHelper_importKerberosEntry_error___block_invoke;
    v145 = &__block_descriptor_36_e14___NSError_8__0l;
    krb5_error_code v146 = inited;
    id v16 = __46__POKerberosHelper_importKerberosEntry_error___block_invoke();
    goto LABEL_5;
  }
  uint64_t v141 = 0;
  uint64_t v140 = 0;
  krb5_data_zero();
  id v18 = [v5 messageBuffer];
  [v18 bytes];
  v19 = [v5 messageBuffer];
  [v19 length];
  krb5_data_copy();

  v20 = [v14 componentsSeparatedByString:@"@"];
  uint64_t v21 = [v20 count] - 1;

  if (v21 < 2)
  {
    krb5_error_code v24 = krb5_parse_name(context, (const char *)[v14 UTF8String], &client);
    if (v24)
    {
      uint64_t v130 = MEMORY[0x263EF8330];
      uint64_t v131 = 3221225472;
      v132 = __46__POKerberosHelper_importKerberosEntry_error___block_invoke_86;
      v133 = &__block_descriptor_36_e14___NSError_8__0l;
      krb5_error_code v134 = v24;
      id v25 = __46__POKerberosHelper_importKerberosEntry_error___block_invoke_86();
      goto LABEL_5;
    }
  }
  else
  {
    krb5_error_code v22 = krb5_parse_name_flags(0, (const char *)[v14 UTF8String], 4, &client);
    if (v22)
    {
      uint64_t v135 = MEMORY[0x263EF8330];
      uint64_t v136 = 3221225472;
      v137 = __46__POKerberosHelper_importKerberosEntry_error___block_invoke_82;
      v138 = &__block_descriptor_36_e14___NSError_8__0l;
      krb5_error_code v139 = v22;
      id v23 = __46__POKerberosHelper_importKerberosEntry_error___block_invoke_82();
      goto LABEL_5;
    }
  }
  [v5 encryptionKeyType];
  int v26 = krb5_enctype_valid();
  if (v26)
  {
    uint64_t v125 = MEMORY[0x263EF8330];
    uint64_t v126 = 3221225472;
    v127 = __46__POKerberosHelper_importKerberosEntry_error___block_invoke_90;
    v128 = &__block_descriptor_36_e14___NSError_8__0l;
    int v129 = v26;
    id v27 = __46__POKerberosHelper_importKerberosEntry_error___block_invoke_90();
  }
  else
  {
    [v5 encryptionKeyType];
    id v28 = [v5 sessionKey];
    [v28 bytes];
    v29 = [v5 sessionKey];
    [v29 length];
    int v30 = krb5_keyblock_init();

    if (v30)
    {
      uint64_t v120 = MEMORY[0x263EF8330];
      uint64_t v121 = 3221225472;
      v122 = __46__POKerberosHelper_importKerberosEntry_error___block_invoke_94;
      v123 = &__block_descriptor_36_e14___NSError_8__0l;
      int v124 = v30;
      id v31 = __46__POKerberosHelper_importKerberosEntry_error___block_invoke_94();
    }
    else
    {
      krb5_error_code init_creds_opt_alloc = krb5_get_init_creds_opt_alloc(context, &opt);
      if (init_creds_opt_alloc)
      {
        uint64_t v115 = MEMORY[0x263EF8330];
        uint64_t v116 = 3221225472;
        v117 = __46__POKerberosHelper_importKerberosEntry_error___block_invoke_98;
        v118 = &__block_descriptor_36_e14___NSError_8__0l;
        krb5_error_code v119 = init_creds_opt_alloc;
        id v33 = __46__POKerberosHelper_importKerberosEntry_error___block_invoke_98();
      }
      else
      {
        krb5_get_init_creds_opt_set_forwardable(opt, 1);
        krb5_get_init_creds_opt_set_proxiable(opt, 1);
        krb5_get_init_creds_opt_set_renew_life(opt, 2592000);
        krb5_get_init_creds_opt_set_canonicalize((krb5_get_init_creds_opt *)context, (int)opt);
        krb5_get_init_creds_opt_set_win2k();
        int v34 = krb5_init_creds_init();
        if (v34)
        {
          uint64_t v110 = MEMORY[0x263EF8330];
          uint64_t v111 = 3221225472;
          v112 = __46__POKerberosHelper_importKerberosEntry_error___block_invoke_102;
          v113 = &__block_descriptor_36_e14___NSError_8__0l;
          int v114 = v34;
          id v35 = __46__POKerberosHelper_importKerberosEntry_error___block_invoke_102();
        }
        else
        {
          int v36 = krb5_init_creds_set_nonce();
          if (v36)
          {
            uint64_t v105 = MEMORY[0x263EF8330];
            uint64_t v106 = 3221225472;
            v107 = __46__POKerberosHelper_importKerberosEntry_error___block_invoke_106;
            v108 = &__block_descriptor_36_e14___NSError_8__0l;
            int v109 = v36;
            id v37 = __46__POKerberosHelper_importKerberosEntry_error___block_invoke_106();
          }
          else
          {
            int v38 = krb5_init_creds_set_keyblock();
            if (v38)
            {
              uint64_t v100 = MEMORY[0x263EF8330];
              uint64_t v101 = 3221225472;
              v102 = __46__POKerberosHelper_importKerberosEntry_error___block_invoke_110;
              v103 = &__block_descriptor_36_e14___NSError_8__0l;
              int v104 = v38;
              id v39 = __46__POKerberosHelper_importKerberosEntry_error___block_invoke_110();
            }
            else
            {
              int v40 = krb5_init_creds_step();
              if (v40)
              {
                uint64_t v95 = MEMORY[0x263EF8330];
                uint64_t v96 = 3221225472;
                v97 = __46__POKerberosHelper_importKerberosEntry_error___block_invoke_114;
                v98 = &__block_descriptor_36_e14___NSError_8__0l;
                int v99 = v40;
                id v41 = __46__POKerberosHelper_importKerberosEntry_error___block_invoke_114();
              }
              else
              {
                krb5_data_free();
                krb5_data_free();
                if (krb5_cc_cache_match(context, client, cache)
                  && (krb5_error_code v42 = krb5_cc_new_unique(context, "API", 0, cache)) != 0)
                {
                  uint64_t v90 = MEMORY[0x263EF8330];
                  uint64_t v91 = 3221225472;
                  v92 = __46__POKerberosHelper_importKerberosEntry_error___block_invoke_119;
                  v93 = &__block_descriptor_36_e14___NSError_8__0l;
                  krb5_error_code v94 = v42;
                  id v43 = __46__POKerberosHelper_importKerberosEntry_error___block_invoke_119();
                }
                else
                {
                  int v44 = krb5_init_creds_store();
                  if (v44)
                  {
                    uint64_t v85 = MEMORY[0x263EF8330];
                    uint64_t v86 = 3221225472;
                    v87 = __46__POKerberosHelper_importKerberosEntry_error___block_invoke_123;
                    v88 = &__block_descriptor_36_e14___NSError_8__0l;
                    int v89 = v44;
                    id v45 = __46__POKerberosHelper_importKerberosEntry_error___block_invoke_123();
                  }
                  else
                  {
                    int v46 = krb5_init_creds_store_config();
                    if (v46)
                    {
                      uint64_t v80 = MEMORY[0x263EF8330];
                      uint64_t v81 = 3221225472;
                      v82 = __46__POKerberosHelper_importKerberosEntry_error___block_invoke_127;
                      v83 = &__block_descriptor_36_e14___NSError_8__0l;
                      int v84 = v46;
                      id v47 = __46__POKerberosHelper_importKerberosEntry_error___block_invoke_127();
                    }
                    else
                    {
                      uint64_t v168 = 0;
                      uint64_t v167 = 0;
                      int uuid = krb5_cc_get_uuid();
                      if (uuid)
                      {
                        uint64_t v75 = MEMORY[0x263EF8330];
                        uint64_t v76 = 3221225472;
                        v77 = __46__POKerberosHelper_importKerberosEntry_error___block_invoke_131;
                        v78 = &__block_descriptor_36_e14___NSError_8__0l;
                        int v79 = uuid;
                        id v49 = __46__POKerberosHelper_importKerberosEntry_error___block_invoke_131();
                      }
                      else
                      {
                        v50 = (void *)krb5_uuid_to_string();
                        v51 = [NSString stringWithCString:v50 encoding:4];
                        [v8 setCacheName:v51];

                        free(v50);
                        int creds = krb5_init_creds_get_creds();
                        if (creds)
                        {
                          uint64_t v70 = MEMORY[0x263EF8330];
                          uint64_t v71 = 3221225472;
                          v72 = __46__POKerberosHelper_importKerberosEntry_error___block_invoke_135;
                          v73 = &__block_descriptor_36_e14___NSError_8__0l;
                          int v74 = creds;
                          id v53 = __46__POKerberosHelper_importKerberosEntry_error___block_invoke_135();
                        }
                        else
                        {
                          int v54 = decode_Ticket();
                          if (v54)
                          {
                            uint64_t v65 = MEMORY[0x263EF8330];
                            uint64_t v66 = 3221225472;
                            v67 = __46__POKerberosHelper_importKerberosEntry_error___block_invoke_139;
                            v68 = &__block_descriptor_36_e14___NSError_8__0l;
                            int v69 = v54;
                            id v55 = __46__POKerberosHelper_importKerberosEntry_error___block_invoke_139();
                          }
                          else
                          {
                            krb5_free_cred_contents(context, (krb5_creds *)buf);
                            if ((void)v152) {
                              int v56 = *(__int16 *)(v152 + 2);
                            }
                            else {
                              int v56 = 0;
                            }
                            free_Ticket();
                            krb5_free_principal(context, client);
                            krb5_error_code principal = krb5_cc_get_principal(context, cache[0], &client);
                            if (principal)
                            {
                              v63[1] = (char *)MEMORY[0x263EF8330];
                              v63[2] = (char *)3221225472;
                              v63[3] = (char *)__46__POKerberosHelper_importKerberosEntry_error___block_invoke_143;
                              v63[4] = (char *)&__block_descriptor_36_e14___NSError_8__0l;
                              krb5_error_code v64 = principal;
                              id v58 = __46__POKerberosHelper_importKerberosEntry_error___block_invoke_143();
                            }
                            else
                            {
                              v63[0] = 0;
                              if (krb5_unparse_name(context, client, v63))
                              {
                                id v59 = __46__POKerberosHelper_importKerberosEntry_error___block_invoke_147();
                              }
                              else
                              {
                                v60 = [NSString stringWithCString:v63[0] encoding:4];
                                [v8 setUpn:v60];

                                free(v63[0]);
                                v63[0] = 0;
                                v61 = PO_LOG_POKerberosHelper();
                                if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
                                {
                                  v62 = [v5 realm];
                                  *(_DWORD *)v161 = 136315650;
                                  v162 = "-[POKerberosHelper importKerberosEntry:error:]";
                                  __int16 v163 = 2114;
                                  v164 = v62;
                                  __int16 v165 = 2112;
                                  v166 = self;
                                  _os_log_impl(&dword_230E51000, v61, OS_LOG_TYPE_DEFAULT, "%s Successful for realm = %{public}@ on %@", v161, 0x20u);
                                }
                                if (v56 > 0
                                  || [MEMORY[0x263F5E648] forceKerberosTGTExchange])
                                {
                                  [v8 setExchangeRequired:1];
                                }
                                [v8 setImportSuccessful:1];
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_5:
  if (opt) {
    krb5_get_init_creds_opt_free(context, opt);
  }
  if (cache[0]) {
    krb5_cc_close(context, cache[0]);
  }
  krb5_free_keyblock_contents(context, &v154);
  krb5_free_cred_contents(context, (krb5_creds *)buf);
  MEMORY[0x230FCE520](context);
  krb5_data_free();
  krb5_free_principal(context, client);

  return v8;
}

id __46__POKerberosHelper_importKerberosEntry_error___block_invoke()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"krb5_init_context failed when importing kerberos entry."];
  v1 = PO_LOG_POKerberosHelper();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __46__POKerberosHelper_importKerberosEntry_error___block_invoke_cold_1();
  }

  return v0;
}

id __46__POKerberosHelper_importKerberosEntry_error___block_invoke_82()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"krb5_parse_name failed when importing enterprise kerberos entry."];
  v1 = PO_LOG_POKerberosHelper();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __46__POKerberosHelper_importKerberosEntry_error___block_invoke_cold_1();
  }

  return v0;
}

id __46__POKerberosHelper_importKerberosEntry_error___block_invoke_86()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"krb5_parse_name failed when importing kerberos entry."];
  v1 = PO_LOG_POKerberosHelper();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __46__POKerberosHelper_importKerberosEntry_error___block_invoke_cold_1();
  }

  return v0;
}

id __46__POKerberosHelper_importKerberosEntry_error___block_invoke_90()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"krb5_enctype_valid failed when importing kerberos entry."];
  v1 = PO_LOG_POKerberosHelper();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __46__POKerberosHelper_importKerberosEntry_error___block_invoke_cold_1();
  }

  return v0;
}

id __46__POKerberosHelper_importKerberosEntry_error___block_invoke_94()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"krb5_keyblock_init failed when importing kerberos entry."];
  v1 = PO_LOG_POKerberosHelper();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __46__POKerberosHelper_importKerberosEntry_error___block_invoke_cold_1();
  }

  return v0;
}

id __46__POKerberosHelper_importKerberosEntry_error___block_invoke_98()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"krb5_get_init_creds_opt_alloc failed when importing kerberos entry."];
  v1 = PO_LOG_POKerberosHelper();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __46__POKerberosHelper_importKerberosEntry_error___block_invoke_cold_1();
  }

  return v0;
}

id __46__POKerberosHelper_importKerberosEntry_error___block_invoke_102()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"krb5_init_creds_init failed when importing kerberos entry."];
  v1 = PO_LOG_POKerberosHelper();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __46__POKerberosHelper_importKerberosEntry_error___block_invoke_cold_1();
  }

  return v0;
}

id __46__POKerberosHelper_importKerberosEntry_error___block_invoke_106()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"krb5_init_creds_set_nonce failed when importing kerberos entry."];
  v1 = PO_LOG_POKerberosHelper();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __46__POKerberosHelper_importKerberosEntry_error___block_invoke_cold_1();
  }

  return v0;
}

id __46__POKerberosHelper_importKerberosEntry_error___block_invoke_110()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"krb5_init_creds_set_keyblock failed when importing kerberos entry."];
  v1 = PO_LOG_POKerberosHelper();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __46__POKerberosHelper_importKerberosEntry_error___block_invoke_cold_1();
  }

  return v0;
}

id __46__POKerberosHelper_importKerberosEntry_error___block_invoke_114()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"krb5_init_creds_step failed when importing kerberos entry."];
  v1 = PO_LOG_POKerberosHelper();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __46__POKerberosHelper_importKerberosEntry_error___block_invoke_cold_1();
  }

  return v0;
}

id __46__POKerberosHelper_importKerberosEntry_error___block_invoke_119()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"krb5_cc_new_unique failed when importing kerberos entry."];
  v1 = PO_LOG_POKerberosHelper();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __46__POKerberosHelper_importKerberosEntry_error___block_invoke_cold_1();
  }

  return v0;
}

id __46__POKerberosHelper_importKerberosEntry_error___block_invoke_123()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"krb5_init_creds_store failed when importing kerberos entry."];
  v1 = PO_LOG_POKerberosHelper();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __46__POKerberosHelper_importKerberosEntry_error___block_invoke_cold_1();
  }

  return v0;
}

id __46__POKerberosHelper_importKerberosEntry_error___block_invoke_127()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"krb5_init_creds_store_config failed when importing kerberos entry."];
  v1 = PO_LOG_POKerberosHelper();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __46__POKerberosHelper_importKerberosEntry_error___block_invoke_cold_1();
  }

  return v0;
}

id __46__POKerberosHelper_importKerberosEntry_error___block_invoke_131()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"krb5_cc_get_uuid failed when importing kerberos entry."];
  v1 = PO_LOG_POKerberosHelper();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __46__POKerberosHelper_importKerberosEntry_error___block_invoke_cold_1();
  }

  return v0;
}

id __46__POKerberosHelper_importKerberosEntry_error___block_invoke_135()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"krb5_init_creds_get_creds failed when importing kerberos entry."];
  v1 = PO_LOG_POKerberosHelper();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __46__POKerberosHelper_importKerberosEntry_error___block_invoke_cold_1();
  }

  return v0;
}

id __46__POKerberosHelper_importKerberosEntry_error___block_invoke_139()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"decode_Ticket failed when importing kerberos entry."];
  v1 = PO_LOG_POKerberosHelper();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __46__POKerberosHelper_importKerberosEntry_error___block_invoke_cold_1();
  }

  return v0;
}

id __46__POKerberosHelper_importKerberosEntry_error___block_invoke_143()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"krb5_cc_get_principal failed when importing kerberos entry."];
  v1 = PO_LOG_POKerberosHelper();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __46__POKerberosHelper_importKerberosEntry_error___block_invoke_cold_1();
  }

  return v0;
}

id __46__POKerberosHelper_importKerberosEntry_error___block_invoke_147()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"krb5_unparse_name failed when importing kerberos entry."];
  v1 = PO_LOG_POKerberosHelper();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __46__POKerberosHelper_importKerberosEntry_error___block_invoke_cold_1();
  }

  return v0;
}

- (void)exchangeKerberosTGTForEntry:(id)a3
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = PO_LOG_POKerberosHelper();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [v4 realm];
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = "-[POKerberosHelper exchangeKerberosTGTForEntry:]";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 2112;
    *(void *)&buf[24] = self;
    _os_log_impl(&dword_230E51000, v5, OS_LOG_TYPE_DEFAULT, "%s uint64_t realm = %{public}@ on %@", buf, 0x20u);
  }
  krb5_ccache cache = 0;
  krb5_context context = 0;
  uint64_t v54 = 0;
  uint64_t v55 = 0;
  id v37 = 0;
  int creds = 0;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v47 = 0u;
  memset(buf, 0, sizeof(buf));
  long long v35 = 0u;
  memset(v34, 0, sizeof(v34));
  krb5_error_code inited = krb5_init_context(&context);
  if (inited)
  {
    int v8 = inited;
    id v9 = __48__POKerberosHelper_exchangeKerberosTGTForEntry___block_invoke();
    goto LABEL_11;
  }
  id v10 = [v4 cacheName];
  [v10 UTF8String];
  int v8 = krb5_string_to_uuid();

  if (v8)
  {
    id v11 = __48__POKerberosHelper_exchangeKerberosTGTForEntry___block_invoke_152();
    goto LABEL_11;
  }
  int v12 = krb5_cc_resolve_by_uuid();
  if (v12)
  {
    int v8 = v12;
    id v13 = __48__POKerberosHelper_exchangeKerberosTGTForEntry___block_invoke_156();
    goto LABEL_11;
  }
  krb5_error_code principal = krb5_cc_get_principal(context, cache, (krb5_principal *)buf);
  if (principal)
  {
    int v8 = principal;
    id v15 = __48__POKerberosHelper_exchangeKerberosTGTForEntry___block_invoke_160();
    goto LABEL_11;
  }
  uint64_t realm = krb5_principal_get_realm();
  if (realm)
  {
    uint64_t v33 = realm;
    int v18 = krb5_make_principal();
    if (v18)
    {
      int v8 = v18;
      id v19 = __48__POKerberosHelper_exchangeKerberosTGTForEntry___block_invoke_162();
    }
    else
    {
      krb5_error_code credentials = krb5_get_credentials(context, 1, cache, (krb5_creds *)buf, &v37);
      if (credentials)
      {
        int v8 = credentials;
        id v21 = __48__POKerberosHelper_exchangeKerberosTGTForEntry___block_invoke_166();
      }
      else
      {
        *(void *)&v34[64] = time(0) + 604800;
        krb5_error_code v22 = krb5_copy_principal(context, *(krb5_const_principal *)&v37->magic, (krb5_principal *)v34);
        if (v22)
        {
          int v8 = v22;
          id v23 = __48__POKerberosHelper_exchangeKerberosTGTForEntry___block_invoke_170();
        }
        else
        {
          krb5_error_code v24 = krb5_copy_principal(context, v37->client, (krb5_principal *)&v34[8]);
          if (v24)
          {
            int v8 = v24;
            id v25 = __48__POKerberosHelper_exchangeKerberosTGTForEntry___block_invoke_174();
          }
          else
          {
            int kdc_cred = krb5_get_kdc_cred();
            if (kdc_cred)
            {
              int v8 = kdc_cred;
              id v27 = __48__POKerberosHelper_exchangeKerberosTGTForEntry___block_invoke_175();
            }
            else
            {
              krb5_error_code v28 = krb5_cc_initialize(context, cache, *(krb5_principal *)&creds->magic);
              if (v28)
              {
                int v8 = v28;
                id v29 = __48__POKerberosHelper_exchangeKerberosTGTForEntry___block_invoke_179();
              }
              else
              {
                krb5_error_code v30 = krb5_cc_store_cred(context, cache, creds);
                if (!v30)
                {
                  objc_msgSend(v4, "setExchangeRequired:", 0, "krbtgt", v33, 0);
                  [v4 setFailedToConnect:0];
                  id v16 = PO_LOG_POKerberosHelper();
                  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
                  {
                    v32 = [v4 realm];
                    *(_DWORD *)int v40 = 136315650;
                    id v41 = "-[POKerberosHelper exchangeKerberosTGTForEntry:]";
                    __int16 v42 = 2114;
                    id v43 = v32;
                    __int16 v44 = 2112;
                    id v45 = self;
                    _os_log_impl(&dword_230E51000, v16, OS_LOG_TYPE_DEFAULT, "%s Success for uint64_t realm = %{public}@ on %@", v40, 0x20u);
                  }
LABEL_17:

                  goto LABEL_18;
                }
                int v8 = v30;
                id v31 = __48__POKerberosHelper_exchangeKerberosTGTForEntry___block_invoke_183();
              }
            }
          }
        }
      }
    }
LABEL_11:
    if (v8 == -1765328347)
    {
      [v4 setExchangeRequired:0];
      id v16 = PO_LOG_POKerberosHelper();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[POKerberosHelper exchangeKerberosTGTForEntry:](v4);
      }
    }
    else
    {
      if (v8 != -1765328228) {
        goto LABEL_18;
      }
      [v4 setFailedToConnect:1];
      id v16 = PO_LOG_POKerberosHelper();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[POKerberosHelper exchangeKerberosTGTForEntry:](v4);
      }
    }
    goto LABEL_17;
  }
LABEL_18:
  if (cache) {
    krb5_cc_close(context, cache);
  }
  if (creds) {
    krb5_free_creds(context, creds);
  }
  if (v37) {
    krb5_free_creds(context, v37);
  }
  krb5_free_cred_contents(context, (krb5_creds *)buf);
  krb5_free_cred_contents(context, (krb5_creds *)v34);
  MEMORY[0x230FCE520](context);
}

id __48__POKerberosHelper_exchangeKerberosTGTForEntry___block_invoke()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"krb5_init_context failed when importing kerberos entry."];
  v1 = PO_LOG_POKerberosHelper();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __46__POKerberosHelper_importKerberosEntry_error___block_invoke_cold_1();
  }

  return v0;
}

id __48__POKerberosHelper_exchangeKerberosTGTForEntry___block_invoke_152()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"krb5_string_to_uuid failed when importing kerberos entry."];
  v1 = PO_LOG_POKerberosHelper();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __46__POKerberosHelper_importKerberosEntry_error___block_invoke_cold_1();
  }

  return v0;
}

id __48__POKerberosHelper_exchangeKerberosTGTForEntry___block_invoke_156()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"krb5_cc_resolve_by_uuid failed when importing kerberos entry."];
  v1 = PO_LOG_POKerberosHelper();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __46__POKerberosHelper_importKerberosEntry_error___block_invoke_cold_1();
  }

  return v0;
}

id __48__POKerberosHelper_exchangeKerberosTGTForEntry___block_invoke_160()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"krb5_cc_get_principal failed when importing kerberos entry."];
  v1 = PO_LOG_POKerberosHelper();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __46__POKerberosHelper_importKerberosEntry_error___block_invoke_cold_1();
  }

  return v0;
}

id __48__POKerberosHelper_exchangeKerberosTGTForEntry___block_invoke_162()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"krb5_make_principal failed when importing kerberos entry."];
  v1 = PO_LOG_POKerberosHelper();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __46__POKerberosHelper_importKerberosEntry_error___block_invoke_cold_1();
  }

  return v0;
}

id __48__POKerberosHelper_exchangeKerberosTGTForEntry___block_invoke_166()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"krb5_get_credentials failed when importing kerberos entry."];
  v1 = PO_LOG_POKerberosHelper();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __46__POKerberosHelper_importKerberosEntry_error___block_invoke_cold_1();
  }

  return v0;
}

id __48__POKerberosHelper_exchangeKerberosTGTForEntry___block_invoke_170()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"krb5_copy_principal failed when importing kerberos entry."];
  v1 = PO_LOG_POKerberosHelper();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __46__POKerberosHelper_importKerberosEntry_error___block_invoke_cold_1();
  }

  return v0;
}

id __48__POKerberosHelper_exchangeKerberosTGTForEntry___block_invoke_174()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"krb5_copy_principal failed when importing kerberos entry."];
  v1 = PO_LOG_POKerberosHelper();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __46__POKerberosHelper_importKerberosEntry_error___block_invoke_cold_1();
  }

  return v0;
}

id __48__POKerberosHelper_exchangeKerberosTGTForEntry___block_invoke_175()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"krb5_get_kdc_cred failed when importing kerberos entry."];
  v1 = PO_LOG_POKerberosHelper();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __46__POKerberosHelper_importKerberosEntry_error___block_invoke_cold_1();
  }

  return v0;
}

id __48__POKerberosHelper_exchangeKerberosTGTForEntry___block_invoke_179()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"krb5_cc_initialize failed when importing kerberos entry."];
  v1 = PO_LOG_POKerberosHelper();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __46__POKerberosHelper_importKerberosEntry_error___block_invoke_cold_1();
  }

  return v0;
}

id __48__POKerberosHelper_exchangeKerberosTGTForEntry___block_invoke_183()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"krb5_cc_store_cred failed when importing kerberos entry."];
  v1 = PO_LOG_POKerberosHelper();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __46__POKerberosHelper_importKerberosEntry_error___block_invoke_cold_1();
  }

  return v0;
}

- (BOOL)checkForValidKerberosTGT:(id)a3
{
  id v4 = a3;
  id v5 = PO_LOG_POKerberosHelper();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[POKerberosHelper checkForValidKerberosTGT:]();
  }

  v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v4];
  if (v6)
  {
    gss_cred_id_t cred_handle = [(POKerberosHelper *)self acquireCredentialForUUID:v6];
    BOOL v7 = cred_handle != 0;
    if (cred_handle)
    {
      OM_uint32 minor_status = 0;
      gss_release_cred(&minor_status, &cred_handle);
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (gss_cred_id_t_desc_struct)acquireCredentialForUUID:(id)a3
{
  id v3 = a3;
  id v4 = PO_LOG_POKerberosHelper();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[POKerberosHelper acquireCredentialForUUID:]();
  }

  if (!v3)
  {
    int v8 = 0;
    goto LABEL_19;
  }
  id v5 = [v3 UUIDString];
  if (([(__CFString *)v5 isEqualToString:&stru_26E5C8990] & 1) != 0
    || (CFUUIDRef v6 = CFUUIDCreateFromString(0, v5)) == 0)
  {
    *(void *)lifetime = 0;
    goto LABEL_14;
  }
  CFUUIDRef v7 = v6;
  int v8 = GSSCreateCredentialFromUUID(v6);
  CFRelease(v7);
  *(void *)lifetime = 0;
  if (!v8)
  {
LABEL_14:
    id v11 = NSString;
    int v12 = [v3 UUIDString];
    id v13 = [v11 stringWithFormat:@"failed to find credential: %@", v12];

    v14 = PO_LOG_POKerberosHelper();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[POKerberosHelper acquireCredentialForUUID:]((uint64_t)v13, v14, v15, v16, v17, v18, v19, v20);
    }

    int v8 = 0;
    goto LABEL_17;
  }
  OM_uint32 v9 = gss_inquire_cred(&lifetime[1], v8, 0, lifetime, 0, 0);
  if (lifetime[0]) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 0;
  }
  if (!v10) {
    int v8 = 0;
  }
LABEL_17:

LABEL_19:
  return v8;
}

- (BOOL)destroyCredentialForUUID:(id)a3
{
  id v3 = (__CFString *)a3;
  id v4 = PO_LOG_POKerberosHelper();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[POKerberosHelper destroyCredentialForUUID:]();
  }

  if (v3)
  {
    if (([(__CFString *)v3 isEqualToString:&stru_26E5C8990] & 1) == 0
      && (CFUUIDRef v5 = CFUUIDCreateFromString(0, v3)) != 0
      && (v6 = v5, gss_cred_id_t cred_handle = GSSCreateCredentialFromUUID(v5), CFRelease(v6), cred_handle))
    {
      OM_uint32 min_stat = 0;
      BOOL v7 = gss_destroy_cred(&min_stat, &cred_handle) == 0;
    }
    else
    {
      BOOL v7 = 1;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

void __46__POKerberosHelper_importKerberosEntry_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_1();
  v1 = [NSNumber numberWithInt:*(unsigned int *)(v0 + 32)];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_230E51000, v2, v3, "%{public}@, %{public}@", v4, v5, v6, v7, v8);
}

- (void)exchangeKerberosTGTForEntry:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 realm];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_230E51000, v2, v3, "TGT exchange connection failure for uint64_t realm = %{public}@, %d", v4, v5, v6, v7, v8);
}

- (void)exchangeKerberosTGTForEntry:(void *)a1 .cold.2(void *a1)
{
  v1 = [a1 realm];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_230E51000, v2, v3, "Not retrying TGT exchange for uint64_t realm = %{public}@, %d", v4, v5, v6, v7, v8);
}

- (void)checkForValidKerberosTGT:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)acquireCredentialForUUID:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)acquireCredentialForUUID:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

- (void)destroyCredentialForUUID:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

@end