@interface UAPresenceManager
- (NSMutableDictionary)authRecords;
- (SKPresence)presence;
- (UAPresenceManager)initWithQueue:(id)a3;
- (void)addQhash:(unsigned int)a3 forInterface:(mDNSInterfaceID_dummystruct *)a4;
- (void)assertPresence;
- (void)removeQhash:(unsigned int)a3 forInterface:(mDNSInterfaceID_dummystruct *)a4;
- (void)setAuthRecords:(id)a3;
- (void)setPresence:(id)a3;
- (void)updatePresenseData;
@end

@implementation UAPresenceManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authRecords, 0);

  objc_storeStrong((id *)&self->_presence, 0);
}

- (void)setAuthRecords:(id)a3
{
}

- (NSMutableDictionary)authRecords
{
  return self->_authRecords;
}

- (void)setPresence:(id)a3
{
}

- (SKPresence)presence
{
  return self->_presence;
}

- (void)updatePresenseData
{
  v2 = [(UAPresenceManager *)self presence];
  v3 = [v2 presentDevices];
  v4 = [v3 filterObjectsUsingBlock:&__block_literal_global_46];

  if ([v4 count])
  {
    uint64_t v5 = pthread_mutex_lock((pthread_mutex_t *)(mDNSStorage[0] + 616));
    *(_DWORD *)(mDNSStorage[0] + 680) = mDNSPlatformRawTime(v5, v6, v7, v8, v9, v10, v11, v12);
    mDNS_Lock_((unsigned int *)mDNSStorage, (uint64_t)"-[UAPresenceManager updatePresenseData]", 713);
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    v45 = v4;
    obuint64_t j = v4;
    id v48 = [obj countByEnumeratingWithState:&v63 objects:v76 count:16];
    if (v48)
    {
      uint64_t v47 = *(void *)v64;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v64 != v47) {
            objc_enumerationMutation(obj);
          }
          uint64_t v50 = v13;
          v14 = [*(id *)(*((void *)&v63 + 1) + 8 * v13) presencePayload];
          v15 = [v14 payloadDictionary];

          v49 = v15;
          v16 = [v15 objectForKey:@"auth_records"];
          v17 = _unicast_assist_cache_log();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            id v18 = [v16 count];
            *(_DWORD *)buf = 134217984;
            *(void *)&buf[4] = v18;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "unicast assist updatePresenseData: next authRecords.count %lu", buf, 0xCu);
          }

          long long v61 = 0u;
          long long v62 = 0u;
          long long v59 = 0u;
          long long v60 = 0u;
          id v51 = v16;
          id v53 = [v51 countByEnumeratingWithState:&v59 objects:v75 count:16];
          if (v53)
          {
            uint64_t v52 = *(void *)v60;
            do
            {
              uint64_t v19 = 0;
              do
              {
                if (*(void *)v60 != v52) {
                  objc_enumerationMutation(v51);
                }
                uint64_t v54 = v19;
                v20 = *(void **)(*((void *)&v59 + 1) + 8 * v19);
                v21 = [v20 objectForKey:@"ifhash"];
                unsigned int v22 = [v21 unsignedIntValue];

                v23 = [v20 objectForKey:@"qhashes"];
                v24 = [v20 objectForKey:@"addr"];
                v25 = _unicast_assist_cache_log();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
                {
                  v26 = [v23 describeQHashes];
                  v27 = [v24 describeAddr];
                  *(_DWORD *)buf = 138412802;
                  *(void *)&buf[4] = v26;
                  *(_WORD *)&buf[12] = 2112;
                  *(void *)&buf[14] = v27;
                  __int16 v73 = 1024;
                  unsigned int v74 = v22;
                  _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "unicast assist updatePresenseData: next qhashes %@ addr %@ ifhash %x", buf, 0x1Cu);
                }
                long long v57 = 0u;
                long long v58 = 0u;
                long long v55 = 0u;
                long long v56 = 0u;
                id v28 = v23;
                id v29 = [v28 countByEnumeratingWithState:&v55 objects:v71 count:16];
                if (v29)
                {
                  id v30 = v29;
                  uint64_t v31 = *(void *)v56;
                  do
                  {
                    for (i = 0; i != v30; i = (char *)i + 1)
                    {
                      if (*(void *)v56 != v31) {
                        objc_enumerationMutation(v28);
                      }
                      v33 = *(void **)(*((void *)&v55 + 1) + 8 * i);
                      memset(buf, 0, 20);
                      if (!_unicast_assist_data_to_addr(v24, (int *)buf))
                      {
                        for (uint64_t j = *(void *)mDNSStorage[0]; j; uint64_t j = *(void *)(j + 3680))
                        {
                          if (strncmp((const char *)(j + 3606), "en", 2uLL)) {
                            continue;
                          }
                          if (!*(unsigned char *)(j + 3696)) {
                            continue;
                          }
                          if (!*(unsigned char *)(j + 3671)) {
                            continue;
                          }
                          *(_DWORD *)v67 = 0;
                          if (_unicast_assist_hash_for_interface(*(void *)(j + 3552), *(int *)buf, v67)
                            || *(_DWORD *)v67 != v22)
                          {
                            continue;
                          }
                          if (*(_DWORD *)buf == 4)
                          {
                            if (*(_DWORD *)(j + 3560) != 4) {
                              continue;
                            }
                            int v35 = *(_DWORD *)&buf[4] ^ *(_DWORD *)(j + 3564);
                            int v36 = *(_DWORD *)(j + 3584);
                          }
                          else
                          {
                            if (*(_DWORD *)buf != 6
                              || *(_DWORD *)(j + 3560) != 6
                              || *(unsigned __int8 *)(j + 3564) != 254
                              || (*(unsigned char *)(j + 3565) & 0xC0) != 0x80
                              || ((*(_DWORD *)&buf[4] ^ *(_DWORD *)(j + 3564)) & *(_DWORD *)(j + 3584)) != 0
                              || ((*(_DWORD *)&buf[8] ^ *(_DWORD *)(j + 3568)) & *(_DWORD *)(j + 3588)) != 0
                              || ((*(_DWORD *)&buf[12] ^ *(_DWORD *)(j + 3572)) & *(_DWORD *)(j + 3592)) != 0)
                            {
                              continue;
                            }
                            int v35 = *(_DWORD *)&buf[16] ^ *(_DWORD *)(j + 3576);
                            int v36 = *(_DWORD *)(j + 3596);
                          }
                          if ((v35 & v36) == 0)
                          {
                            unicast_assist_addr_add("\x05qname", (int)[v33 unsignedIntValue], 12, 8, (int *)buf, *(void *)(j + 3552));
                            goto LABEL_46;
                          }
                        }
                        v37 = _unicast_assist_cache_log();
                        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
                        {
                          *(_DWORD *)v67 = 68289026;
                          int v68 = 20;
                          __int16 v69 = 2098;
                          v70 = buf;
                          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "unicast assist updatePresenseData: no subnet for addr %{public, mdnsresponder:ip_addr}.20P", v67, 0x12u);
                        }
                      }
LABEL_46:
                      ;
                    }
                    id v30 = [v28 countByEnumeratingWithState:&v55 objects:v71 count:16];
                  }
                  while (v30);
                }

                uint64_t v19 = v54 + 1;
              }
              while ((id)(v54 + 1) != v53);
              id v53 = [v51 countByEnumeratingWithState:&v59 objects:v75 count:16];
            }
            while (v53);
          }

          uint64_t v13 = v50 + 1;
        }
        while ((id)(v50 + 1) != v48);
        id v48 = [obj countByEnumeratingWithState:&v63 objects:v76 count:16];
      }
      while (v48);
    }

    mDNS_Unlock_((uint64_t)mDNSStorage, (uint64_t)"-[UAPresenceManager updatePresenseData]", 743);
    KQueueUnlock((uint64_t)"UAPresence updatePresenseData", v38, v39, v40, v41, v42, v43, v44);
    v4 = v45;
  }
}

BOOL __39__UAPresenceManager_updatePresenseData__block_invoke(id a1, SKPresentDevice *a2)
{
  return [(SKPresentDevice *)a2 isSelfDevice] ^ 1;
}

- (void)assertPresence
{
  id v51 = +[NSMutableArray array];
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  v46 = self;
  v3 = [(UAPresenceManager *)self authRecords];
  v4 = [v3 allKeys];

  obuint64_t j = v4;
  id v5 = [v4 countByEnumeratingWithState:&v57 objects:v70 count:16];
  p_base_prots = (__objc2_prot_list **)(&OS_mdns_trust__metaData + 40);
  id v47 = v5;
  if (v5)
  {
    uint64_t v45 = *(void *)v58;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v58 != v45) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v57 + 1) + 8 * (void)v7);
        uint64_t v9 = [(UAPresenceManager *)v46 authRecords];
        uint64_t v10 = [v9 objectForKey:v8];

        if ([v10 count])
        {
          id v11 = [v8 unsignedIntegerValue];
          uint64_t v12 = +[NSMutableArray array];
          for (uint64_t i = *(void *)mDNSStorage[0]; i; uint64_t i = *(void *)(i + 3680))
          {
            if (strncmp((const char *)(i + 3606), "en", 2uLL) || !*(unsigned char *)(i + 3696) || !*(unsigned char *)(i + 3671)) {
              continue;
            }
            if (!v11 || *(id *)(i + 3552) == v11)
            {
              unsigned int v61 = 0;
              int v14 = *(_DWORD *)(i + 3560);
              if (v14 == 6)
              {
                if (*(unsigned __int8 *)(i + 3564) != 254 || (*(unsigned char *)(i + 3565) & 0xC0) != 0x80)
                {
LABEL_27:
                  v17 = 0;
LABEL_28:

                  continue;
                }
                uint64_t v15 = i + 3564;
                uint64_t v16 = 16;
              }
              else
              {
                if (v14 != 4) {
                  goto LABEL_27;
                }
                uint64_t v15 = i + 3564;
                uint64_t v16 = 4;
              }
              v17 = +[NSData dataWithBytes:v15 length:v16];
              if (!v17
                || _unicast_assist_hash_for_interface(*(void *)(i + 3552), *(_DWORD *)(i + 3560), &v61))
              {
                goto LABEL_28;
              }
              v71[0] = @"ifhash";
              id v18 = +[NSNumber numberWithUnsignedInt:v61];
              v71[1] = @"addr";
              *(void *)buf = v18;
              *(void *)&buf[8] = v17;
              uint64_t v19 = +[NSDictionary dictionaryWithObjects:buf forKeys:v71 count:2];
              [v12 addObject:v19];

              if (!v11) {
                continue;
              }
            }
            if ((unint64_t)[v12 count] > 1) {
              break;
            }
          }
          id v48 = v7;
          if ([v12 count]) {
            id v20 = v12;
          }
          else {
            id v20 = 0;
          }
          p_base_prots = &OS_mdns_trust__metaData.base_prots;

          if ([v20 count])
          {
            char v21 = 0;
            id v49 = v20;
            uint64_t v22 = 16;
            do
            {
              char v50 = v21;
              v56[0] = _NSConcreteStackBlock;
              v56[1] = 3221225472;
              v56[2] = __35__UAPresenceManager_assertPresence__block_invoke;
              v56[3] = &__block_descriptor_40_e22_B16__0__NSDictionary_8l;
              v56[4] = v22;
              v23 = [v20 filterObjectsUsingBlock:v56];
              v24 = v23;
              if (v23)
              {
                long long v54 = 0u;
                long long v55 = 0u;
                long long v52 = 0u;
                long long v53 = 0u;
                id v25 = [v23 countByEnumeratingWithState:&v52 objects:v69 count:16];
                if (v25)
                {
                  id v26 = v25;
                  uint64_t v27 = *(void *)v53;
                  do
                  {
                    for (uint64_t j = 0; j != v26; uint64_t j = (char *)j + 1)
                    {
                      if (*(void *)v53 != v27) {
                        objc_enumerationMutation(v24);
                      }
                      id v29 = *(void **)(*((void *)&v52 + 1) + 8 * (void)j);
                      id v30 = [v29 objectForKeyedSubscript:@"ifhash"];
                      uint64_t v31 = [v29 objectForKeyedSubscript:@"addr"];
                      v67[0] = @"qhashes";
                      v67[1] = @"ifhash";
                      v68[0] = v10;
                      v68[1] = v30;
                      v67[2] = @"addr";
                      v68[2] = v31;
                      v32 = [(__objc2_prot_list *)p_base_prots[218] dictionaryWithObjects:v68 forKeys:v67 count:3];
                      [v51 addObject:v32];

                      v33 = _unicast_assist_cache_log();
                      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
                      {
                        v34 = [v10 describeQHashes];
                        int v35 = [v31 describeAddr];
                        unsigned int v36 = [v30 unsignedIntValue];
                        *(_DWORD *)buf = 138412802;
                        *(void *)&buf[4] = v34;
                        *(_WORD *)&buf[12] = 2112;
                        *(void *)&buf[14] = v35;
                        __int16 v65 = 1024;
                        unsigned int v66 = v36;
                        _os_log_debug_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "unicast assist assertPresence qhashes %@ addr %@ ifhash %x", buf, 0x1Cu);

                        p_base_prots = (__objc2_prot_list **)(&OS_mdns_trust__metaData + 40);
                      }
                    }
                    id v26 = [v24 countByEnumeratingWithState:&v52 objects:v69 count:16];
                  }
                  while (v26);
                }
              }

              char v21 = 1;
              uint64_t v22 = 4;
              id v20 = v49;
            }
            while ((v50 & 1) == 0);
          }

          uint64_t v7 = v48;
        }

        uint64_t v7 = (char *)v7 + 1;
      }
      while (v7 != v47);
      id v37 = [obj countByEnumeratingWithState:&v57 objects:v70 count:16];
      id v47 = v37;
    }
    while (v37);
  }

  id v38 = objc_alloc((Class)SKPresencePayload);
  CFStringRef v62 = @"auth_records";
  long long v63 = v51;
  uint64_t v39 = [(__objc2_prot_list *)p_base_prots[218] dictionaryWithObjects:&v63 forKeys:&v62 count:1];
  id v40 = [v38 initWithDictionary:v39];

  uint64_t v41 = [(UAPresenceManager *)v46 presence];
  [v41 assertPresenceWithPresencePayload:v40 completion:&__block_literal_global_4510];

  uint64_t v42 = [(UAPresenceManager *)v46 presence];
  [v42 retainTransientSubscriptionAssertionWithCompletion:&__block_literal_global_43_4511];
}

BOOL __35__UAPresenceManager_assertPresence__block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 objectForKeyedSubscript:@"addr"];
  BOOL v4 = [v3 length] == *(id *)(a1 + 32);

  return v4;
}

void __35__UAPresenceManager_assertPresence__block_invoke_41(id a1, NSError *a2)
{
  v2 = a2;
  if (v2)
  {
    v3 = _unicast_assist_cache_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      BOOL v4 = [(NSError *)v2 description];
      int v5 = 138543362;
      uint64_t v6 = v4;
      _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "unicast assist StatusKit retainTransientSubscriptionAssertionWithCompletion: %{public}@", (uint8_t *)&v5, 0xCu);
    }
  }
}

void __35__UAPresenceManager_assertPresence__block_invoke_39(id a1, NSError *a2)
{
  v2 = a2;
  if (v2)
  {
    v3 = _unicast_assist_cache_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      BOOL v4 = [(NSError *)v2 description];
      int v5 = 138543362;
      uint64_t v6 = v4;
      _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "unicast assist StatusKit assertPresenceWithCompletion: %{public}@", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)removeQhash:(unsigned int)a3 forInterface:(mDNSInterfaceID_dummystruct *)a4
{
  unsigned int v4 = a4;
  id v10 = +[NSNumber numberWithUnsignedInteger:a3];
  uint64_t v6 = +[NSNumber numberWithUnsignedInteger:v4];
  uint64_t v7 = [(UAPresenceManager *)self authRecords];
  uint64_t v8 = [v7 objectForKey:v6];

  if (v8 && [v8 containsObject:v10])
  {
    [v8 removeObject:v10];
    if (![v8 count])
    {
      uint64_t v9 = [(UAPresenceManager *)self authRecords];
      [v9 removeObjectForKey:v6];
    }
    [(UAPresenceManager *)self assertPresence];
  }
}

- (void)addQhash:(unsigned int)a3 forInterface:(mDNSInterfaceID_dummystruct *)a4
{
  unsigned int v4 = a4;
  id v10 = +[NSNumber numberWithUnsignedInteger:a3];
  uint64_t v6 = +[NSNumber numberWithUnsignedInteger:v4];
  uint64_t v7 = [(UAPresenceManager *)self authRecords];
  uint64_t v8 = [v7 objectForKey:v6];

  if (!v8)
  {
    uint64_t v8 = +[NSMutableArray array];
    uint64_t v9 = [(UAPresenceManager *)self authRecords];
    [v9 setObject:v8 forKey:v6];
  }
  if (([v8 containsObject:v10] & 1) == 0)
  {
    [v8 addObject:v10];
    [(UAPresenceManager *)self assertPresence];
  }
}

- (UAPresenceManager)initWithQueue:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)UAPresenceManager;
  int v5 = [(UAPresenceManager *)&v14 init];
  if (v5)
  {
    uint64_t v6 = +[NSMutableDictionary dictionary];
    authRecords = v5->_authRecords;
    v5->_authRecords = (NSMutableDictionary *)v6;

    uint64_t v8 = (SKPresence *)[objc_alloc((Class)SKPresence) initWithPresenceIdentifier:@"com.apple.mDNSResponder" isPersonal:1];
    presence = v5->_presence;
    v5->_presence = v8;

    [(SKPresence *)v5->_presence addDelegate:v5 queue:v4];
    id v10 = _unicast_assist_cache_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v13 = v5->_presence;
      *(_DWORD *)buf = 138543362;
      uint64_t v16 = v13;
      _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "unicast assist StatusKit init: _presence %{public}@", buf, 0xCu);
    }

    id v11 = v5;
  }

  return v5;
}

@end