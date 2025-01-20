BOOL sub_100004E0C(id a1, id a2, unint64_t a3, BOOL *a4)
{
  return [a2 isFinished:a3, a4] ^ 1;
}

void sub_100005048(FILE *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10 = a2;
  id v11 = [objc_alloc((Class)NSString) initWithFormat:v10 arguments:&a9];

  id v12 = v11;
  fprintf(a1, "%s\n", (const char *)[v12 UTF8String]);
}

void sub_1000050D4(void *a1, int a2, int a3)
{
  id v5 = a1;
  id v6 = objc_alloc_init((Class)NSMutableDictionary);
  sub_100005208(v6, v5, a3);

  id v7 = v6;
  v8 = v7;
  if (a2)
  {
    id v16 = 0;
    v9 = +[NSJSONSerialization dataWithJSONObject:v7 options:3 error:&v16];
    id v10 = v16;
    id v11 = v10;
    if (v9)
    {
      id v12 = v9;
      id v13 = [v12 bytes];
      id v14 = [v12 length];
      fwrite(v13, (size_t)v14, 1uLL, __stdoutp);
      fputc(10, __stdoutp);
    }
    else
    {
      v15 = [v10 localizedDescription];
      NSLog(@"error: %@", v15);
    }
  }
  else
  {
    sub_1000053A4(v7, 0);
  }
}

void sub_100005208(void *a1, void *a2, int a3)
{
  id v5 = a1;
  id v6 = a2;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    id v8 = v7;
    v9 = 0;
    uint64_t v10 = *(void *)v18;
    do
    {
      id v11 = 0;
      id v12 = v9;
      do
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v6);
        }
        id v13 = *(void **)(*((void *)&v17 + 1) + 8 * (void)v11);
        id v14 = [v6 objectForKeyedSubscript:v13];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v15 = v13;
        }
        else
        {
          id v15 = +[NSString stringWithFormat:@"%@", v13];
        }
        v9 = v15;

        id v16 = sub_100008668(v14, a3);
        [v5 setObject:v16 forKeyedSubscript:v9];

        id v11 = (char *)v11 + 1;
        id v12 = v9;
      }
      while (v8 != v11);
      id v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }
}

void sub_1000053A4(void *a1, int a2)
{
  id v3 = a1;
  v4 = [v3 allKeys];
  id v5 = [v4 sortedArrayUsingSelector:"localizedCaseInsensitiveCompare:"];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v12 = [v3 objectForKeyedSubscript:v11];
        sub_1000083F4(v11, v12, a2);
      }
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

void sub_1000054F8(void *a1, int a2)
{
}

id sub_100005500(uint64_t a1)
{
  uint64_t IsICDP = PCSIdentitySetIsICDP();
  uint64_t IsICDPNetwork = PCSIdentitySetIsICDPNetwork();
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  [v4 setObject:v5 forKeyedSubscript:@"all_status"];
  id v6 = +[NSNumber numberWithBool:IsICDP];
  [v5 setObject:v6 forKeyedSubscript:@"icdp_status"];

  id v7 = +[NSNumber numberWithBool:IsICDPNetwork];
  [v5 setObject:v7 forKeyedSubscript:@"icdp_status_network"];

  if (IsICDP)
  {
    uint64_t v35 = 0;
    id v8 = +[NSNumber numberWithBool:PCSIdentityiCDPWalrus()];
    [v5 setObject:v8 forKeyedSubscript:@"icdp_status_w"];

    uint64_t v9 = +[NSNumber numberWithBool:PCSIdentityiCDPPlesio()];
    [v5 setObject:v9 forKeyedSubscript:@"icdp_status_2"];
  }
  uint64_t v10 = +[NSNumber numberWithUnsignedInt:PCSReportManateeStatus()];
  [v5 setObject:v10 forKeyedSubscript:@"CKKS_Engram"];

  id v11 = +[NSNumber numberWithUnsignedInt:PCSReportManateeStatus()];
  [v5 setObject:v11 forKeyedSubscript:@"CKKS_Manatee"];

  id v12 = objc_alloc_init((Class)NSMutableDictionary);
  [v4 setObject:v12 forKeyedSubscript:@"current_identities"];
  v29 = _NSConcreteStackBlock;
  uint64_t v30 = 3221225472;
  v31 = sub_10000596C;
  v32 = &unk_10001C860;
  uint64_t v34 = a1;
  id v13 = v12;
  id v33 = v13;
  PCSServiceItemsGetEachName();
  id v14 = objc_alloc_init((Class)NSMutableDictionary);
  [v4 setObject:v14 forKeyedSubscript:@"current_identity_pointers"];
  v23 = _NSConcreteStackBlock;
  uint64_t v24 = 3221225472;
  v25 = sub_100005A44;
  v26 = &unk_10001C860;
  uint64_t v28 = a1;
  id v15 = v14;
  id v27 = v15;
  PCSServiceItemsGetEachName();
  id v16 = objc_alloc_init((Class)NSMutableDictionary);
  [v4 setObject:v16 forKeyedSubscript:@"identities"];
  uint64_t v17 = PCSIdentitySetCopyIdentities();
  if (v17)
  {
    CFDictionaryRef v18 = (const __CFDictionary *)v17;
    context[0] = _NSConcreteStackBlock;
    context[1] = 3221225472;
    context[2] = sub_100005B8C;
    context[3] = &unk_10001C888;
    id v21 = v16;
    uint64_t v22 = a1;
    CFDictionaryApplyFunction(v18, (CFDictionaryApplierFunction)sub_1000088C0, context);
    CFRelease(v18);
  }

  return v4;
}

void sub_10000596C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = PCSIdentitySetCopyCurrentIdentityWithError();
  if (v4)
  {
    id v5 = (const void *)v4;
    id v6 = +[NSString stringWithFormat:@"%@", v4];
    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:a2];

    CFRelease(v5);
  }
  else
  {
    [*(id *)(a1 + 32) setObject:@"missing" forKeyedSubscript:a2];
  }
}

void sub_100005A44(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = +[NSMutableDictionary dictionary];
  id v5 = PCSIdentitySetCopyCurrentIdentityPointer();
  id v6 = v5;
  if (v5)
  {
    id v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@", [v5 identity]);
    [v4 setObject:v7 forKeyedSubscript:@"service"];
    id v8 = [v6 currentItemPointerModificationTime];
    uint64_t v9 = [v8 description];
    [v4 setObject:v9 forKeyedSubscript:@"currentItemModificationTime"];
  }
  [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:a2];
}

void sub_100005B8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _PCSIdentityCopyBAT();
  ServiceName = (NSString *)PCSIdentityGetServiceName();
  id v6 = (void *)PCSIdentityCopyCircleFingerPrint();
  CFDataRef KeyID = (const __CFData *)PCSIdentityGetKeyID();
  if (!ServiceName) {
    ServiceName = +[NSString stringWithFormat:@"UNKNOWN-%d", PCSIdentityGetServiceID()];
  }
  id v8 = [*(id *)(a1 + 32) objectForKey:ServiceName];
  if (!v8)
  {
    id v8 = objc_alloc_init((Class)NSMutableArray);
    [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:ServiceName];
  }
  id v9 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v10 = +[NSNumber numberWithInteger:PCSIdentityGetServiceID()];
  [v9 setObject:v10 forKeyedSubscript:@"service_id"];

  [v9 setObject:a2 forKeyedSubscript:@"public_key"];
  CFDataGetBytePtr(KeyID);
  CFDataGetLength(KeyID);
  id v11 = (void *)_PCSCreateHexString();
  [v9 setObject:v11 forKeyedSubscript:@"key_id"];

  id v12 = PCSIdentityWebSafePublicKeyID();
  [v9 setObject:v12 forKeyedSubscript:@"key_id_websafe"];

  id v13 = +[NSNumber numberWithBool:_PCSIdentitySetIsCurrentIdentityPreferCache()];
  [v9 setObject:v13 forKeyedSubscript:@"current"];

  id v14 = +[NSNumber numberWithBool:_PCSIdentityIsManatee()];
  [v9 setObject:v14 forKeyedSubscript:@"manatee"];

  id v15 = +[NSNumber numberWithBool:PCSIdentityIsFullManatee()];
  [v9 setObject:v15 forKeyedSubscript:@"manatee_full"];

  if (v6)
  {
    id v16 = [v6 base64EncodedStringWithOptions:0];
    [v9 setObject:v16 forKeyedSubscript:@"circleFingerPrint"];
  }
  if (v4) {
    [v9 setObject:v4 forKeyedSubscript:@"build_time"];
  }
  CFStringRef Mutable = CFStringCreateMutable(0, 0);
  if (!_PCSIdentityValidate())
  {
    [v9 setObject:&__kCFBooleanFalse forKeyedSubscript:@"key_valid"];
    CFDictionaryRef v18 = v19;
    goto LABEL_13;
  }
  [v9 setObject:&__kCFBooleanTrue forKeyedSubscript:@"key_valid"];
  CFDictionaryRef v18 = v19;
  if (CFStringGetLength(Mutable) > 0) {
LABEL_13:
  }
    [v9 setObject:Mutable forKeyedSubscript:@"key_valid_status"];
  if (Mutable) {
    CFRelease(Mutable);
  }
  [v8 addObject:v9];
}

id sub_100005EF8()
{
  unsigned int IsICDP = PCSIdentitySetIsICDP();
  v0 = (void *)PCSIdentitySetCopyIdentities();
  v1 = &CFArrayApplyFunction_ptr;
  v2 = +[NSMutableDictionary dictionary];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v3 = v0;
  id v4 = [v3 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v23 = *(void *)v25;
    id v22 = v3;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v25 != v23) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        [v3 objectForKeyedSubscript:v7];

        uint64_t ServiceID = PCSIdentityGetServiceID();
        if (ServiceID)
        {
          id v9 = +[NSString stringWithFormat:@"%d", ServiceID];
          uint64_t v10 = [v2 objectForKeyedSubscript:v9];
          if (!v10)
          {
            uint64_t v10 = [v1[201] dictionary];
          }
          id v11 = [v1[201] dictionary];
          if (_PCSIdentityIsManatee())
          {
            [v11 setObject:&__kCFBooleanTrue forKeyedSubscript:@"manatee"];
            if ((PCSIdentityIsFullManatee() & 1) == 0) {
              [v11 setObject:&__kCFBooleanTrue forKeyedSubscript:@"fake-manatee"];
            }
          }
          else
          {
            id v12 = v5;
            id v13 = v1;
            id v14 = v2;
            id v15 = +[NSNumber numberWithBool:_PCSIdentitySetIsCurrentIdentityPreferCache()];
            [v11 setObject:v15 forKeyedSubscript:@"current"];

            v2 = v14;
            v1 = v13;
            id v5 = v12;
            id v3 = v22;
          }
          id v16 = _PCSIdentityCopyBAT();
          if (v16) {
            [v11 setObject:v16 forKeyedSubscript:@"bat"];
          }
          [v10 setObject:v11 forKeyedSubscript:v7];
          [v2 setObject:v10 forKeyedSubscript:v9];
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v24 objects:v30 count:16];
    }
    while (v5);
  }

  v28[0] = @"iCDP";
  +[NSNumber numberWithBool:IsICDP];
  v18 = uint64_t v17 = v2;
  v28[1] = @"services";
  v29[0] = v18;
  v29[1] = v17;
  long long v19 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:2];

  return v19;
}

_UNKNOWN **sub_100006228(void *a1)
{
  id v103 = a1;
  if (v103)
  {
    id v3 = objc_alloc_init((Class)NSMutableDictionary);
    uint64_t v160 = 0;
    v161 = &v160;
    uint64_t v162 = 0x3032000000;
    v163 = sub_1000073E0;
    v164 = sub_1000073F0;
    v165 = @"ValidateIdentities";
    id v4 = objc_alloc_init((Class)NSMutableDictionary);
    [v3 setObject:v4 forKeyedSubscript:v161[5]];

    uint64_t v154 = 0;
    v155 = &v154;
    uint64_t v156 = 0x3032000000;
    v157 = sub_1000073E0;
    v158 = sub_1000073F0;
    id v159 = 0;
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    id v6 = (void *)v155[5];
    v155[5] = (uint64_t)v5;

    uint64_t v175 = kPCSSetupDSID;
    id v176 = v103;
    uint64_t v7 = +[NSDictionary dictionaryWithObjects:&v176 forKeys:&v175 count:1];
    v147 = _NSConcreteStackBlock;
    uint64_t v148 = 3221225472;
    v149 = sub_1000073F8;
    v150 = &unk_10001C8B0;
    id v121 = v3;
    id v151 = v121;
    v152 = &v160;
    v153 = &v154;
    PCSGuitarfishValidateIdentities();

    dispatch_semaphore_wait((dispatch_semaphore_t)v155[5], 0xFFFFFFFFFFFFFFFFLL);
    v174[0] = kSecureBackupiCloudIdentityPublicDataKey;
    v174[1] = kPCSSecureBackupCFiCloudDataProtectionKey;
    v174[2] = kPCSSecureBackupCFSecureBackupKeyRegistry;
    v174[3] = kPCSSecureBackupCFStableMetadataKey;
    v174[4] = kPCSSecureBackupCFClientMetadataKey;
    v122 = +[NSArray arrayWithObjects:v174 count:5];
    id v8 = (void *)v161[5];
    v161[5] = @"CurrentRecord";

    id v9 = objc_alloc_init((Class)NSMutableDictionary);
    [v121 setObject:v9 forKeyedSubscript:v161[5]];

    id v10 = objc_alloc_init((Class)NSMutableDictionary);
    id v11 = [v121 objectForKeyedSubscript:v161[5]];
    [v11 setObject:v10 forKeyedSubscript:@"PrimaryRecord"];

    v146 = 0;
    v172[0] = kPCSSetupDSID;
    v172[1] = kPCSSetupGuitarfish;
    v173[0] = v103;
    v173[1] = &__kCFBooleanTrue;
    +[NSDictionary dictionaryWithObjects:v173 forKeys:v172 count:2];
    v107 = (void *)__PCSCopyStingrayInfo();
    if (!v107
      || (uint64_t v117 = kSecureBackupStingrayMetadataKey,
          objc_msgSend(v107, "objectForKeyedSubscript:"),
          id v12 = objc_claimAutoreleasedReturnValue(),
          BOOL v13 = v12 == 0,
          v12,
          v13))
    {
      v104 = [v121 objectForKeyedSubscript:v161[5]];
      v49 = [v104 objectForKeyedSubscript:@"PrimaryRecord"];
      [v49 setObject:&__kCFBooleanFalse forKeyedSubscript:@"has_record"];
    }
    else
    {
      id v14 = [v121 objectForKeyedSubscript:v161[5]];
      id v15 = [v14 objectForKeyedSubscript:@"PrimaryRecord"];
      [v15 setObject:&__kCFBooleanTrue forKeyedSubscript:@"has_record"];

      id v16 = [v107 objectForKeyedSubscript:v117];
      v104 = [v16 objectForKeyedSubscript:kPCSSecureBackupCFClientMetadataKey];

      v101 = [v104 objectForKeyedSubscript:kPCSSecureBackupCFiCloudDataProtectionKey];
      v99 = [v101 objectForKeyedSubscript:kPCSSecureBackupMetaSecureBackupWrappedKeys];
      uint64_t v17 = kPCSGuitarfishSecureBackupMetaDBRSeedAESPID;
      CFDictionaryRef v18 = [v101 objectForKeyedSubscript:kPCSGuitarfishSecureBackupMetaDBRSeedAESPID];
      long long v19 = [v18 base64EncodedStringWithOptions:0];
      long long v20 = [v121 objectForKeyedSubscript:v161[5]];
      id v21 = [v20 objectForKeyedSubscript:@"PrimaryRecord"];
      [v21 setObject:v19 forKeyedSubscript:v17];

      if (v104)
      {
        id v22 = objc_alloc_init((Class)NSMutableDictionary);
        uint64_t v23 = [v121 objectForKeyedSubscript:v161[5]];
        long long v24 = [v23 objectForKeyedSubscript:@"PrimaryRecord"];
        [v24 setObject:v22 forKeyedSubscript:@"clientMetadata"];

        long long v144 = 0u;
        long long v145 = 0u;
        long long v142 = 0u;
        long long v143 = 0u;
        id v25 = v104;
        id v26 = [v25 countByEnumeratingWithState:&v142 objects:v171 count:16];
        if (v26)
        {
          uint64_t v114 = *(void *)v143;
          do
          {
            id v119 = v26;
            for (i = 0; i != v119; i = (char *)i + 1)
            {
              if (*(void *)v143 != v114) {
                objc_enumerationMutation(v25);
              }
              uint64_t v28 = *(void *)(*((void *)&v142 + 1) + 8 * i);
              if (([v122 containsObject:v28] & 1) == 0)
              {
                v2 = [v25 objectForKeyedSubscript:v28];
                objc_opt_class();
                char isKindOfClass = objc_opt_isKindOfClass();
                [v25 objectForKeyedSubscript:v28];
                if (isKindOfClass) {
                  v1 = {;
                }
                  uint64_t v30 = [v1 base64EncodedStringWithOptions:0];
                  v110 = (void *)v30;
                }
                else {
                  uint64_t v30 = {;
                }
                  v111 = (void *)v30;
                }
                v31 = [v121 objectForKeyedSubscript:v161[5]];
                v32 = [v31 objectForKeyedSubscript:@"PrimaryRecord"];
                id v21 = [v32 objectForKeyedSubscript:@"clientMetadata"];
                [v21 setObject:v30 forKeyedSubscript:v28];

                id v33 = v111;
                if (isKindOfClass)
                {

                  id v33 = v1;
                }
              }
            }
            id v26 = [v25 countByEnumeratingWithState:&v142 objects:v171 count:16];
          }
          while (v26);
        }

        id v34 = objc_alloc_init((Class)NSMutableDictionary);
        uint64_t v35 = [v121 objectForKeyedSubscript:v161[5]];
        v36 = [v35 objectForKeyedSubscript:@"PrimaryRecord"];
        [v36 setObject:v34 forKeyedSubscript:@"outerMetadata"];

        long long v140 = 0u;
        long long v141 = 0u;
        long long v138 = 0u;
        long long v139 = 0u;
        v37 = [v107 objectForKeyedSubscript:v117];
        id v38 = [v37 countByEnumeratingWithState:&v138 objects:v170 count:16];
        if (v38)
        {
          uint64_t v115 = *(void *)v139;
          id obj = v37;
          do
          {
            id v119 = v38;
            for (j = 0; j != v119; j = (char *)j + 1)
            {
              if (*(void *)v139 != v115) {
                objc_enumerationMutation(obj);
              }
              uint64_t v40 = *(void *)(*((void *)&v138 + 1) + 8 * (void)j);
              if (([v122 containsObject:v40] & 1) == 0)
              {
                v41 = [v107 objectForKeyedSubscript:v117];
                v2 = [v41 objectForKeyedSubscript:v40];
                objc_opt_class();
                char v42 = objc_opt_isKindOfClass();
                [v107 objectForKeyedSubscript:v117];
                if (v42) {
                  v111 = {;
                }
                  v110 = [v111 objectForKeyedSubscript:v40];
                  uint64_t v43 = [v110 base64EncodedStringWithOptions:0];
                  id v105 = (id)v43;
                }
                else {
                  id v21 = {;
                }
                  uint64_t v43 = [v21 objectForKeyedSubscript:v40];
                  v109 = (void *)v43;
                }
                v44 = [v121 objectForKeyedSubscript:v161[5]];
                v45 = [v44 objectForKeyedSubscript:@"PrimaryRecord"];
                v46 = [v45 objectForKeyedSubscript:@"outerMetadata"];
                [v46 setObject:v43 forKeyedSubscript:v40];

                v47 = v109;
                v48 = v21;
                if (v42)
                {

                  v47 = v110;
                  v48 = v111;
                }
              }
            }
            v37 = obj;
            id v38 = [obj countByEnumeratingWithState:&v138 objects:v170 count:16];
          }
          while (v38);
        }
      }
      v131 = _NSConcreteStackBlock;
      uint64_t v132 = 3221225472;
      v133 = sub_10000759C;
      v134 = &unk_10001C8D8;
      v137 = &v160;
      id v135 = v121;
      CFStringRef v136 = @"PrimaryRecord";
      _PCSBackupGuitarfishDecodeOuterRecord();

      v49 = v101;
    }

    id v50 = objc_alloc_init((Class)NSMutableDictionary);
    v51 = [v121 objectForKeyedSubscript:v161[5]];
    [v51 setObject:v50 forKeyedSubscript:@"RecoveryTokenRecord"];

    v146 = 0;
    v168[0] = kPCSSetupDSID;
    v168[1] = kPCSSetupGuitarfishToken;
    v169[0] = v103;
    v169[1] = &__kCFBooleanTrue;
    +[NSDictionary dictionaryWithObjects:v169 forKeys:v168 count:2];
    v118 = (void *)__PCSCopyStingrayInfo();
    v52 = v146;
    if (v146)
    {
      v53 = [v121 objectForKeyedSubscript:v161[5]];
      v54 = [v53 objectForKeyedSubscript:@"RecoveryTokenRecord"];
      [v54 setObject:v52 forKeyedSubscript:@"fetch_error"];
    }
    if (!v118
      || (uint64_t v116 = kSecureBackupGuitarfishRecoveryTokenMetadataKey,
          objc_msgSend(v118, "objectForKeyedSubscript:"),
          v55 = objc_claimAutoreleasedReturnValue(),
          BOOL v56 = v55 == 0,
          v55,
          v56))
    {
      v102 = [v121 objectForKeyedSubscript:v161[5]];
      v96 = [v102 objectForKeyedSubscript:@"RecoveryTokenRecord"];
      [v96 setObject:&__kCFBooleanFalse forKeyedSubscript:@"has_record"];
    }
    else
    {
      v57 = [v121 objectForKeyedSubscript:v161[5]];
      v58 = [v57 objectForKeyedSubscript:@"RecoveryTokenRecord"];
      [v58 setObject:&__kCFBooleanTrue forKeyedSubscript:@"has_record"];

      v59 = [v118 objectForKeyedSubscript:v116];
      v102 = [v59 objectForKeyedSubscript:kPCSSecureBackupCFClientMetadataKey];

      if (v102)
      {
        id v60 = objc_alloc_init((Class)NSMutableDictionary);
        v61 = [v121 objectForKeyedSubscript:v161[5]];
        v62 = [v61 objectForKeyedSubscript:@"RecoveryTokenRecord"];
        [v62 setObject:v60 forKeyedSubscript:@"clientMetadata"];

        long long v129 = 0u;
        long long v130 = 0u;
        long long v127 = 0u;
        long long v128 = 0u;
        id v63 = v102;
        id v64 = [v63 countByEnumeratingWithState:&v127 objects:v167 count:16];
        if (v64)
        {
          v110 = *(void **)v128;
          do
          {
            id v112 = v64;
            for (k = 0; k != v112; k = (char *)k + 1)
            {
              if (*(void **)v128 != v110) {
                objc_enumerationMutation(v63);
              }
              uint64_t v66 = *(void *)(*((void *)&v127 + 1) + 8 * (void)k);
              v67 = [v63 objectForKeyedSubscript:v66];
              objc_opt_class();
              char v68 = objc_opt_isKindOfClass();
              [v63 objectForKeyedSubscript:v66];
              if (v68) {
                v2 = {;
              }
                uint64_t v69 = [v2 base64EncodedStringWithOptions:0];
                v109 = (void *)v69;
              }
              else {
                uint64_t v69 = {;
              }
                id v119 = (id)v69;
              }
              v70 = [v121 objectForKeyedSubscript:v161[5]];
              v71 = [v70 objectForKeyedSubscript:@"RecoveryTokenRecord"];
              v72 = [v71 objectForKeyedSubscript:@"clientMetadata"];
              [v72 setObject:v69 forKeyedSubscript:v66];

              v73 = v119;
              if (v68)
              {

                v73 = v2;
              }
            }
            id v64 = [v63 countByEnumeratingWithState:&v127 objects:v167 count:16];
          }
          while (v64);
        }
      }
      v74 = [v118 objectForKeyedSubscript:v116];
      v75 = [v74 objectForKeyedSubscript:kPCSSecureBackupCFClientMetadataKey];
      v76 = [v75 objectForKeyedSubscript:kPCSSecureBackupCFiCloudDataProtectionKey];
      uint64_t v77 = kPCSGuitarfishSecureBackupMetaDBRSeedAESPID;
      v100 = [v76 objectForKeyedSubscript:kPCSGuitarfishSecureBackupMetaDBRSeedAESPID];

      if (v100)
      {
        v78 = [v100 base64EncodedStringWithOptions:0];
        v79 = [v121 objectForKeyedSubscript:v161[5]];
        v76 = [v79 objectForKeyedSubscript:@"RecoveryTokenRecord"];
        [v76 setObject:v78 forKeyedSubscript:v77];
      }
      id v80 = objc_alloc_init((Class)NSMutableDictionary);
      v81 = [v121 objectForKeyedSubscript:v161[5]];
      v82 = [v81 objectForKeyedSubscript:@"RecoveryTokenRecord"];
      [v82 setObject:v80 forKeyedSubscript:@"outerMetadata"];

      long long v125 = 0u;
      long long v126 = 0u;
      long long v123 = 0u;
      long long v124 = 0u;
      v83 = [v118 objectForKeyedSubscript:v116];
      id v84 = [v83 countByEnumeratingWithState:&v123 objects:v166 count:16];
      if (v84)
      {
        uint64_t v113 = *(void *)v124;
        id v106 = v83;
        do
        {
          id v120 = v84;
          for (m = 0; m != v120; m = (char *)m + 1)
          {
            if (*(void *)v124 != v113) {
              objc_enumerationMutation(v106);
            }
            uint64_t v86 = *(void *)(*((void *)&v123 + 1) + 8 * (void)m);
            if (([v122 containsObject:v86] & 1) == 0)
            {
              v87 = [v118 objectForKeyedSubscript:v116];
              v88 = [v87 objectForKeyedSubscript:v86];
              objc_opt_class();
              char v89 = objc_opt_isKindOfClass();
              [v118 objectForKeyedSubscript:v116];
              if (v89) {
                v110 = {;
              }
                v109 = [v110 objectForKeyedSubscript:v86];
                uint64_t v90 = [v109 base64EncodedStringWithOptions:0];
                v104 = (void *)v90;
              }
              else {
                v76 = {;
              }
                uint64_t v90 = [v76 objectForKeyedSubscript:v86];
                id obj = (id)v90;
              }
              v91 = [v121 objectForKeyedSubscript:v161[5]];
              v92 = [v91 objectForKeyedSubscript:@"RecoveryTokenRecord"];
              v93 = [v92 objectForKeyedSubscript:@"outerMetadata"];
              [v93 setObject:v90 forKeyedSubscript:v86];

              v94 = obj;
              v95 = v76;
              if (v89)
              {

                v94 = v109;
                v95 = v110;
              }
            }
          }
          v83 = v106;
          id v84 = [v106 countByEnumeratingWithState:&v123 objects:v166 count:16];
        }
        while (v84);
      }

      v96 = v100;
    }

    v97 = (_UNKNOWN **)v121;
    _Block_object_dispose(&v154, 8);

    _Block_object_dispose(&v160, 8);
  }
  else
  {
    v97 = &off_10001E420;
  }

  return v97;
}

void sub_100007350(_Unwind_Exception *a1)
{
}

uint64_t sub_1000073E0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000073F0(uint64_t a1)
{
}

intptr_t sub_1000073F8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v9 = a5;
  id v10 = a4;
  id v11 = +[NSNumber numberWithUnsignedInteger:a2];
  id v12 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  [v12 setObject:v11 forKeyedSubscript:@"status"];

  BOOL v13 = +[NSNumber numberWithUnsignedInteger:a3];
  id v14 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  [v14 setObject:v13 forKeyedSubscript:@"flags"];

  id v15 = _PCSGuitarfishPopulateFlagNamesToTelemetryArray();
  id v16 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  [v16 setObject:v15 forKeyedSubscript:@"flags_dict"];

  uint64_t v17 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  [v17 setObject:v10 forKeyedSubscript:@"telemetry"];

  CFDictionaryRef v18 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  [v18 setObject:v9 forKeyedSubscript:@"error"];

  long long v19 = *(NSObject **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);

  return dispatch_semaphore_signal(v19);
}

void sub_10000759C(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v38 = a2;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (a6)
  {
    id v14 = *(void **)(a1 + 32);
    uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    id v16 = a6;
    uint64_t v17 = [v14 objectForKeyedSubscript:v15];
    CFDictionaryRef v18 = [v17 objectForKeyedSubscript:*(void *)(a1 + 40)];
    [v18 setObject:v16 forKeyedSubscript:@"decode_error"];
  }
  long long v19 = [v38 base64EncodedStringWithOptions:0];
  long long v20 = sub_1000078B4(v19, 0xCuLL);
  id v21 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  id v22 = [v21 objectForKeyedSubscript:*(void *)(a1 + 40)];
  [v22 setObject:v20 forKeyedSubscript:@"wrappingkey_to_primary"];

  uint64_t v23 = [v11 base64EncodedStringWithOptions:0];
  long long v24 = sub_1000078B4(v23, 0xCuLL);
  id v25 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  id v26 = [v25 objectForKeyedSubscript:*(void *)(a1 + 40)];
  [v26 setObject:v24 forKeyedSubscript:@"wrappingkey_to_rtderived"];

  long long v27 = [v12 base64EncodedStringWithOptions:0];
  uint64_t v28 = sub_1000078B4(v27, 0xCuLL);
  v29 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  uint64_t v30 = [v29 objectForKeyedSubscript:*(void *)(a1 + 40)];
  [v30 setObject:v28 forKeyedSubscript:@"wrappingkey_to_escrowidentity"];

  v31 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v13 length]);
  v32 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  id v33 = [v32 objectForKeyedSubscript:*(void *)(a1 + 40)];
  [v33 setObject:v31 forKeyedSubscript:@"encrypted_contents_length"];

  id v34 = [v13 base64EncodedStringWithOptions:0];
  uint64_t v35 = sub_1000078B4(v34, 0x18uLL);
  v36 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  v37 = [v36 objectForKeyedSubscript:*(void *)(a1 + 40)];
  [v37 setObject:v35 forKeyedSubscript:@"encrypted_contents"];
}

__CFString *sub_1000078B4(void *a1, unint64_t a2)
{
  id v3 = a1;
  id v4 = v3;
  if (v3)
  {
    if ((unint64_t)[v3 length] <= a2)
    {
      id v6 = v4;
    }
    else
    {
      dispatch_semaphore_t v5 = [v4 substringToIndex:a2];
      id v6 = +[NSString stringWithFormat:@"%@…", v5];
    }
  }
  else
  {
    id v6 = @"nil";
  }

  return v6;
}

id sub_10000796C()
{
  id v0 = objc_alloc_init((Class)NSMutableDictionary);
  if (OctagonPlatformSupportsSOS())
  {
    uint64_t v18 = 0;
    unsigned int v1 = SOSCCThisDeviceIsInCircle() + 1;
    if (v1 > 4) {
      CFStringRef v2 = @"unknown";
    }
    else {
      CFStringRef v2 = off_10001C9B8[v1];
    }
    [v0 setObject:v2 forKeyedSubscript:@"circle_status"];
    v20[0] = kSOSViewPCSMasterKey;
    v20[1] = kSOSViewPCSiCloudDrive;
    v20[2] = kSOSViewPCSPhotos;
    v20[3] = kSOSViewPCSCloudKit;
    v20[4] = kSOSViewPCSEscrow;
    v20[5] = kSOSViewPCSFDE;
    v20[6] = kSOSViewPCSMailDrop;
    v20[7] = kSOSViewPCSiCloudBackup;
    v20[8] = kSOSViewPCSNotes;
    v20[9] = kSOSViewPCSiMessage;
    v20[10] = kSOSViewPCSFeldspar;
    id v3 = +[NSArray arrayWithObjects:v20 count:11];
    id v4 = objc_alloc_init((Class)NSMutableDictionary);
    [v0 setObject:v4 forKeyedSubscript:@"view_status"];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = v3;
    id v6 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          unsigned int v11 = SOSCCView() - 1;
          CFStringRef v12 = @"unknown";
          if (v11 <= 3) {
            CFStringRef v12 = off_10001C9E0[v11];
          }
          [v4 setObject:v12 forKeyedSubscript:v10];
        }
        id v7 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
      }
      while (v7);
    }
  }

  return v0;
}

id sub_100007BEC()
{
  id v0 = objc_alloc_init((Class)NSMutableDictionary);
  dispatch_semaphore_t v1 = dispatch_semaphore_create(0);
  id v6 = v0;
  dispatch_semaphore_t v7 = v1;
  CFStringRef v2 = v1;
  PCSKeySyncingGetAllClients();
  dispatch_time_t v3 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v2, v3);
  id v4 = v6;

  return v4;
}

void sub_100007CDC(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (v7) {
    [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:@"clients"];
  }
  if (v5)
  {
    id v6 = [v5 description];
    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:@"clients_error"];
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

id sub_100007D88(const void *a1)
{
  id v2 = objc_alloc_init((Class)NSMutableDictionary);
  if (a1)
  {
    CFTypeID v3 = CFGetTypeID(a1);
    if (v3 == CFDictionaryGetTypeID())
    {
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_100007E68;
      v5[3] = &unk_10001C888;
      id v6 = v2;
      id v7 = a1;
      CFDictionaryApplyFunction((CFDictionaryRef)a1, (CFDictionaryApplierFunction)sub_1000088C0, v5);
    }
  }

  return v2;
}

void sub_100007E68(uint64_t a1, uint64_t a2, const __CFDictionary *a3)
{
  id v6 = objc_alloc_init((Class)NSMutableArray);
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:a2];
  id v7 = *(const void **)(a1 + 40);
  if (!v7 || (CFTypeID v8 = CFGetTypeID(v7), v8 != CFDictionaryGetTypeID()))
  {
    +[NSString stringWithFormat:@"ERROR: %@ is not a dictionary", a3];
    CFStringRef v12 = LABEL_8:;
    [v6 addObject:v12];

    goto LABEL_9;
  }
  CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(a3, kPCSSecureBackupCFKeyRegistryPublicIdentities);
  CFArrayRef v10 = Value;
  if (!Value || (CFTypeID v11 = CFGetTypeID(Value), v11 != CFArrayGetTypeID()))
  {
    +[NSString stringWithFormat:@"ERROR: %@ is not an array", v10];
    goto LABEL_8;
  }
  context[0] = _NSConcreteStackBlock;
  context[1] = 3221225472;
  context[2] = sub_100007FE0;
  context[3] = &unk_10001C928;
  id v14 = v6;
  v15.length = CFArrayGetCount(v10);
  v15.location = 0;
  CFArrayApplyFunction(v10, v15, (CFArrayApplierFunction)sub_1000088DC, context);

LABEL_9:
}

void sub_100007FE0(uint64_t a1)
{
  uint64_t v2 = PCSPublicIdentityCreateWithPublicKeyInfo();
  CFTypeID v3 = *(void **)(a1 + 32);
  if (v2)
  {
    id v4 = (const void *)v2;
    id v5 = +[NSString stringWithFormat:@"%d/%@", PCSPublicIdentityGetServiceID(), v2];
    [v3 addObject:v5];

    CFRelease(v4);
  }
  else
  {
    id v6 = +[NSString stringWithFormat:@"ERROR: PCSPublicIdentityCreateWithPublicKeyInfo error: %@", 0];
    [v3 addObject:v6];
  }
}

_UNKNOWN **sub_1000080B0()
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_1000073E0;
  CFArrayRef v10 = sub_1000073F0;
  id v11 = 0;
  id v0 = dispatch_semaphore_create(0);
  PCSRestoreCKBackupWithCompletion();
  dispatch_time_t v1 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v0, v1))
  {
    uint64_t v2 = &off_10001E448;
  }
  else
  {
    CFTypeID v3 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", PCSReportKeyRollPending(), _NSConcreteStackBlock, 3221225472, sub_100008258, &unk_10001C950);
    [(id)v7[5] setObject:v3 forKeyedSubscript:@"rollPending"];

    uint64_t v2 = (_UNKNOWN **)(id)v7[5];
  }
  id v4 = v2;

  _Block_object_dispose(&v6, 8);

  return v4;
}

void sub_100008240(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100008258(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v9 = a5;
  uint64_t v10 = +[NSMutableDictionary dictionary];
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  CFStringRef v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  id v13 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  v19[0] = @"RecoveryIssues";
  id v14 = +[NSNumber numberWithUnsignedInt:a2];
  v20[0] = v14;
  v19[1] = @"RecoveredToIdentitySet";
  CFRange v15 = +[NSNumber numberWithUnsignedInt:a3];
  v20[1] = v15;
  v19[2] = @"AlreadyInRecoverySet";
  long long v16 = +[NSNumber numberWithUnsignedInt:a4];
  v20[2] = v16;
  long long v17 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:3];
  [v13 addEntriesFromDictionary:v17];

  if (v9)
  {
    uint64_t v18 = [v9 description];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v18 forKeyedSubscript:@"error"];
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1000083F4(void *a1, void *a2, int a3)
{
  id v5 = a1;
  id v6 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (a3 == 1)
    {
      sub_100005048(__stdoutp, @"\n%*s%@ -", v7, v8, v9, v10, v11, v12, 4);
      sub_100005048(__stdoutp, @"%*s------------------------", v25, v26, v27, v28, v29, v30, 4);
    }
    else if (a3)
    {
      sub_100005048(__stdoutp, @"%*s%@ -", v7, v8, v9, v10, v11, v12, (4 * a3));
    }
    else
    {
      sub_100005048(__stdoutp, @"\n%*s%@ -", v7, v8, v9, v10, v11, v12, 0);
      sub_100005048(__stdoutp, @"%*s========================", v13, v14, v15, v16, v17, v18, 0);
    }
    sub_1000053A4(v6, (a3 + 1));
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      sub_100005048(__stdoutp, @"%*s%@ -", v19, v20, v21, v22, v23, v24, (4 * a3));
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_1000085EC;
      v31[3] = &unk_10001C970;
      int v32 = a3 + 1;
      [v6 enumerateObjectsUsingBlock:v31];
    }
    else
    {
      sub_100005048(__stdoutp, @"%*s%@: %@", v19, v20, v21, v22, v23, v24, (4 * a3));
    }
  }
}

void sub_1000085EC(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = +[NSNumber numberWithUnsignedInteger:a3];
  sub_1000083F4(v6, v5, *(unsigned int *)(a1 + 32));
}

id sub_100008668(void *a1, int a2)
{
  id v3 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = objc_alloc_init((Class)NSMutableDictionary);
    sub_100005208();

    id v3 = v4;
    goto LABEL_13;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v3;
    +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v5 count]);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100008858;
    v9[3] = &unk_10001C998;
    id v10 = v3;
    char v11 = a2;
    [v5 enumerateObjectsUsingBlock:v9];

    goto LABEL_13;
  }
  if (a2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = [v3 base64EncodedStringWithOptions:0];
LABEL_12:
      uint64_t v7 = (void *)v6;

      id v3 = v7;
      goto LABEL_13;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v6 = +[NSString stringWithFormat:@"%@", v3];
        goto LABEL_12;
      }
    }
  }
LABEL_13:

  return v3;
}

void sub_100008858(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_100008668(a2, *(unsigned __int8 *)(a1 + 40));
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) setObject:v5 atIndexedSubscript:a3];
}

uint64_t sub_1000088C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a3 + 16))(a3, a1, a2);
}

uint64_t sub_1000088DC(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, a1);
}

uint64_t start(int a1, char **a2)
{
  uint64_t v76 = 0;
  uint64_t v77 = 0;
  v78 = 0;
  v79 = 0;
  char v4 = 0;
  char v74 = 0;
  uint64_t v75 = 0;
  char v5 = 0;
  char v6 = 0;
  value = 0;
  v88 = 0;
  optind = 0;
  for (int i = 2; ; int i = 1)
  {
    while (1)
    {
      uint64_t v8 = getopt_long(a1, a2, "CDPdfjOsDRrc:hp:s:UuvwZy", (const option *)&off_100021780, 0);
      if ((int)v8 > 98)
      {
        switch((int)v8)
        {
          case 'c':
            uint64_t v9 = +[NSString stringWithUTF8String:optarg];

            v79 = (void *)v9;
            continue;
          case 'd':
            LOBYTE(v77) = 1;
            continue;
          case 'f':
            LOBYTE(v75) = 1;
            continue;
          case 'h':
            int i = 3;
            continue;
          case 'j':
            BYTE4(v75) = 1;
            continue;
          case 'p':
            uint64_t v11 = +[NSString stringWithUTF8String:optarg];

            value = (void *)v11;
            continue;
          case 'r':
            char v74 = 1;
            continue;
          case 's':
            char v4 = 1;
            if (optarg)
            {
              uint64_t v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:");

              v78 = (void *)v10;
            }
            continue;
          case 'u':
            continue;
          case 'v':
            BYTE4(v76) = 1;
            continue;
          case 'w':
            BYTE4(v77) = 1;
            continue;
          case 'y':
            char v6 = 1;
            continue;
          default:
            goto LABEL_83;
        }
      }
      if ((int)v8 > 78)
      {
        switch((int)v8)
        {
          case 'O':
            int i = 2;
            continue;
          case 'P':
            char v5 = 1;
            continue;
          case 'R':
            int i = 5;
            continue;
          case 'U':
            continue;
          case 'Z':
            LOBYTE(v76) = 1;
            continue;
          default:
            goto LABEL_83;
        }
      }
      if (v8 != 67) {
        break;
      }
      int i = 4;
    }
    if (v8 != 68) {
      break;
    }
  }
  if (v8 != -1) {
LABEL_83:
  }
    errx(1, "unknown command: %c", v8);
  uint64_t v84 = 0;
  v85 = &v84;
  uint64_t v86 = 0x2020000000;
  int v87 = 1;
  if (v5)
  {
    uint64_t v12 = +[PCSAccountsModel accountForCurrentPersona];
    uint64_t v13 = v12;
    if (!v12) {
      errx(1, "no accounts");
    }
    uint64_t v14 = [v12 aa_personID];
    uint64_t v15 = (void *)v14;
    if (!v14) {
      errx(1, "no dsid");
    }
    uint64_t v93 = kPCSSetupDSID;
    uint64_t v94 = v14;
    uint64_t v16 = +[NSDictionary dictionaryWithObjects:&v94 forKeys:&v93 count:1];
    uint64_t v17 = (const void *)PCSIdentitySetCreate();
    if (!v17) {
      errx(1, "didn't find any identites in keychain");
    }
    uint64_t v18 = sub_100005EF8();
    if (!v18) {
      errx(1, "no status");
    }
    CFRelease(v17);
    id v83 = 0;
    uint64_t v19 = +[NSPropertyListSerialization dataWithPropertyList:v18 format:100 options:0 error:&v83];
    id v20 = v83;
    if (!v19)
    {
      v72 = +[NSString stringWithFormat:@"failed to make plist: %@", v20];
      errx(1, "%s", v72);
    }
    id v21 = v19;
    id v22 = [v21 bytes];
    id v23 = [v21 length];
    fwrite(v22, (size_t)v23, 1uLL, __stdoutp);
    *((_DWORD *)v85 + 6) = 0;

    goto LABEL_40;
  }
  if (v4)
  {
    v82 = dispatch_semaphore_create(0);
    PCSSyncKeyRegistryWithServiceName();
    dispatch_semaphore_wait(v82, 0xFFFFFFFFFFFFFFFFLL);

LABEL_36:
    uint64_t v13 = 0;
    goto LABEL_40;
  }
  if (v6)
  {
    PCSKeySyncingTriggerDaily();
    uint64_t v13 = 0;
LABEL_39:
    *((_DWORD *)v85 + 6) = 0;
    goto LABEL_40;
  }
  if ((v77 & 0x100000000) != 0)
  {
    v81 = dispatch_semaphore_create(0);
    PCSTriggerWatchSyncing();
    dispatch_semaphore_wait(v81, 0xFFFFFFFFFFFFFFFFLL);
    *((_DWORD *)v85 + 6) = 0;

    goto LABEL_36;
  }
  if (v77)
  {
    uint64_t v26 = +[PCSAccountsModel accountForCurrentPersona];
    uint64_t v13 = v26;
    if (v26)
    {
      uint64_t v27 = [v26 aa_personID];
    }
    else
    {
      warnx("Failed to a configured account, will delete all PCS data");
      uint64_t v27 = 0;
    }
    *((_DWORD *)v85 + 6) = 0;
    if ((__PCSDeleteFromKeychainICDP() & 1) == 0)
    {
      id v46 = +[NSString stringWithFormat:@"Failed to delete from icloud keychain: %@", v88];
      warnx("%s", (const char *)[v46 UTF8String]);

      v47 = v88;
      if (v88)
      {
        v88 = 0;
        CFRelease(v47);
      }
      *((_DWORD *)v85 + 6) = 1;
    }
    if ((__PCSDeleteFromKeychain() & 1) == 0)
    {
      id v48 = +[NSString stringWithFormat:@"Failed to delete from keychain: %@", v88];
      warnx("%s", (const char *)[v48 UTF8String]);

      v49 = v88;
      if (v88)
      {
        v88 = 0;
        CFRelease(v49);
      }
      *((_DWORD *)v85 + 6) = 1;
    }
    if ((__PCSDeleteKeyfile() & 1) == 0)
    {
      id v50 = +[NSString stringWithFormat:@"Failed to delete from keyfile: %@", v88];
      warnx("%s", (const char *)[v50 UTF8String]);

      v51 = v88;
      if (v88)
      {
        v88 = 0;
        CFRelease(v51);
      }
      *((_DWORD *)v85 + 6) = 1;
    }
    v52 = [[PCSUserRegistry alloc] initWithBackup:0];
    [(PCSUserRegistry *)v52 clearCloudKitCache];

    goto LABEL_40;
  }
  if (v79)
  {
    uint64_t v28 = +[PCSAccountsModel accountForCurrentPersona];
    if (!value) {
      errx(1, "password missing");
    }
    uint64_t v13 = v28;
    uint64_t v29 = __stdoutp;
    uint64_t v30 = [v28 aa_personID];
    sub_100005048(v29, @"converting dsid %@\n", v31, v32, v33, v34, v35, v36, (uint64_t)v30);

    v37 = [v13 username];
    id v38 = [v13 aa_personID];
    sub_100013588(i, v37, value, v38, BYTE4(v76) & 1);

    goto LABEL_39;
  }
  if (v76)
  {
    CFStringRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    uint64_t v40 = Mutable;
    if (!Mutable) {
      errx(1, "out of memory");
    }
    if (value) {
      CFDictionarySetValue(Mutable, kPCSSetupPassword, value);
    }
    if (v75) {
      CFDictionarySetValue(v40, kPCSSetupForceUpdate, kCFBooleanTrue);
    }
    uint64_t v13 = +[PCSAccountsModel accountForCurrentPersona];
    v41 = (const void *)kPCSSetupUsername;
    char v42 = [v13 username];
    CFDictionarySetValue(v40, v41, v42);

    uint64_t v43 = (const void *)kPCSSetupDSID;
    v44 = [v13 aa_personID];
    CFDictionarySetValue(v40, v43, v44);

    if ((PCSIdentitySynchronizeKeys() & 1) == 0)
    {
      v73 = +[NSString stringWithFormat:@"PCSIdentitySynchronizeKeys: %@", v88];
      errx(1, "%s", v73);
    }
    CFRelease(v40);
    v45 = v88;
    if (v88)
    {
      v88 = 0;
      CFRelease(v45);
    }
    goto LABEL_39;
  }
  if (v74)
  {
    uint64_t v13 = +[PCSAccountsModel accountForCurrentPersona];
    uint64_t v53 = [v13 aa_personID];
    v54 = (void *)v53;
    if (!v53) {
      errx(1, "no iCloud primary account");
    }
    uint64_t v91 = kPCSSetupDSID;
    uint64_t v92 = v53;
    v55 = +[NSDictionary dictionaryWithObjects:&v92 forKeys:&v91 count:1];
    BOOL v56 = (void *)__PCSCopyStingrayInfo();
    v57 = v56;
    if (!v56) {
      errx(1, "metadata");
    }
    v58 = [v56 objectForKeyedSubscript:kSecureBackupStingrayMetadataKey];
    v59 = [v58 objectForKeyedSubscript:kPCSSecureBackupCFClientMetadataKey];
    id v60 = [v59 objectForKeyedSubscript:kPCSSecureBackupCFSecureBackupKeyRegistry];

    v61 = sub_100007D88(v60);
    sub_1000054F8(v61, BYTE4(v75) & 1);

    *((_DWORD *)v85 + 6) = 0;
    goto LABEL_40;
  }
  v62 = +[PCSAccountsModel accountForCurrentPersona];
  uint64_t v13 = v62;
  if (!v62)
  {
    warnx("no accounts");
    goto LABEL_80;
  }
  [v62 aa_personID];
  id v63 = (id)objc_claimAutoreleasedReturnValue();
  if (!v63)
  {
    warnx("no dsid");
LABEL_80:
    id v63 = kPCSSetupDSIDAny;
  }
  uint64_t v89 = kPCSSetupDSID;
  id v90 = v63;
  id v64 = +[NSDictionary dictionaryWithObjects:&v90 forKeys:&v89 count:1];
  v65 = (const void *)PCSIdentitySetCreate();
  if (!v65) {
    errx(1, "didn't find any identites in keychain");
  }
  id v66 = objc_alloc_init((Class)NSMutableDictionary);
  v67 = sub_100005500((uint64_t)v65);
  [v66 setObject:v67 forKeyedSubscript:@"status"];

  CFRelease(v65);
  char v68 = sub_10000796C();
  [v66 setObject:v68 forKeyedSubscript:@"status_keychain"];

  uint64_t v69 = sub_100007BEC();
  [v66 setObject:v69 forKeyedSubscript:@"status_keysync"];

  v70 = sub_100006228(v63);
  [v66 setObject:v70 forKeyedSubscript:@"status_guitarfish"];

  v71 = sub_1000080B0();
  [v66 setObject:v71 forKeyedSubscript:@"status_messages"];

  sub_1000054F8(v66, BYTE4(v75) & 1);
  *((_DWORD *)v85 + 6) = 0;

LABEL_40:
  uint64_t v24 = *((unsigned int *)v85 + 6);
  _Block_object_dispose(&v84, 8);

  return v24;
}

void sub_100009530(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
}

intptr_t sub_100009634(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2) {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  else {
    sub_100005048(__stderrp, @"error: %@", a3, a4, a5, a6, a7, a8, a3);
  }
  uint64_t v9 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v9);
}

intptr_t sub_1000096A0(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100009A64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100009AD0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained syncUserRegistry];
}

void sub_100009B18(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setupSubscriptions];
}

void sub_100009E50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  objc_sync_exit(v7);
  _Unwind_Resume(a1);
}

uint64_t sub_100009E7C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100009E8C(uint64_t a1)
{
}

void sub_100009E94(uint64_t a1)
{
  [*(id *)(a1 + 32) _onqueueSaveUserRegistryStats];
  [*(id *)(a1 + 32) setStats_dirty:0];
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

void sub_100009F3C(id a1)
{
  id v1 = objc_alloc_init((Class)CKOperationConfiguration);
  uint64_t v2 = (void *)qword_1000219A8;
  qword_1000219A8 = (uint64_t)v1;

  [(id)qword_1000219A8 setTimeoutIntervalForResource:120.0];
  id v3 = (void *)qword_1000219A8;

  [v3 setIsCloudKitSupportOperation:1];
}

void sub_10000A024(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  char v6 = [*(id *)(a1 + 32) oslog];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v13[0] = 67109378;
    v13[1] = a2;
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "accountStatusWithCompletionHandler: %d error: %@", (uint8_t *)v13, 0x12u);
  }

  if (a2 == 3)
  {
    uint64_t v12 = [*(id *)(a1 + 32) oslog];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Stoping syncing", (uint8_t *)v13, 2u);
    }
  }
  else if (a2 == 1)
  {
    uint64_t v7 = [*(id *)(a1 + 32) stats];
    uint64_t v8 = (char *)[v7 lastfetchRecordZoneChangesAtStart] + 86400;
    time_t v9 = time(0);

    if ((uint64_t)v8 <= v9)
    {
      uint64_t v10 = [*(id *)(a1 + 32) oslog];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v13[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Starting to sync", (uint8_t *)v13, 2u);
      }

      id v11 = [*(id *)(a1 + 32) syncUserRegistry];
    }
  }
}

void sub_10000A3D4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_10000A3F0(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) container];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000A4B0;
  v3[3] = &unk_10001CB10;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  [v2 serverPreferredPushEnvironmentWithCompletionHandler:v3];

  objc_destroyWeak(&v4);
}

void sub_10000A49C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10000A4B0(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc((Class)APSConnection);
  uint64_t v5 = APSConnectionOverrideNamedDelegatePort;
  a1 += 4;
  id WeakRetained = objc_loadWeakRetained(a1);
  uint64_t v7 = [WeakRetained queue];
  id v8 = [v4 initWithEnvironmentName:v3 namedDelegatePort:v5 queue:v7];

  time_t v9 = (void *)qword_1000219B8;
  qword_1000219B8 = (uint64_t)v8;

  id v10 = objc_loadWeakRetained(a1);
  [(id)qword_1000219B8 setDelegate:v10];

  id v11 = [@"com.apple.icloud-container." stringByAppendingString:@"com.apple.protectedcloudstorage.protectedcloudkeysyncing"];
  uint64_t v13 = v11;
  uint64_t v12 = +[NSArray arrayWithObjects:&v13 count:1];
  [(id)qword_1000219B8 _setEnabledTopics:v12];
}

void sub_10000A99C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location,uint64_t a23,uint64_t a24,char a25)
{
}

void sub_10000A9F8(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) userdb];
  uint64_t v2 = [v5 getConfigData:@"doneSubscription"];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_10000AA68(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v7 = [WeakRetained oslog];
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v8)
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Couldn't create database subscription; syncing is severely degraded: %@",
        buf,
        0xCu);
    }

    time_t v9 = [WeakRetained queue];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10000ACD0;
    v11[3] = &unk_10001CA30;
    v11[4] = WeakRetained;
    dispatch_sync(v9, v11);

    [WeakRetained checkErrorForRetryPause:v5];
    id v10 = [WeakRetained subscribeAction];
    [v10 trigger];
  }
  else
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "subscription completed", buf, 2u);
    }

    id v10 = [WeakRetained queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000AC50;
    block[3] = &unk_10001CA30;
    block[4] = WeakRetained;
    dispatch_sync(v10, block);
  }
}

void sub_10000AC50(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) userdb];
  id v1 = +[NSData dataWithBytes:"done" length:4];
  [v2 replaceConfigRecord:@"doneSubscription" data:v1];
}

void sub_10000ACD0(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) userdb];
  [v1 deleteRecordID:@"doneSubscription"];
}

void sub_10000AF64(uint64_t a1)
{
  [*(id *)(a1 + 32) _onqueueDeleteServerChangeToken:@"serverChangeToken"];
  [*(id *)(a1 + 32) _onqueueDeleteServerChangeToken:@"MBserverChangeToken"];
  id v2 = [*(id *)(a1 + 32) userdb];
  [v2 deleteRecordID:@"doneSubscription"];
}

void sub_10000AFDC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) oslog];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v7 = 138412290;
    uint64_t v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Creating resyncing operation, finishing with %@", (uint8_t *)&v7, 0xCu);
  }

  id v4 = [*(id *)(a1 + 32) createPendingSyncOperation:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setCurrentSyncOperations:v4];
  id v5 = [*(id *)(a1 + 32) mainOperationQueue];
  char v6 = [v4 actualOperation];
  [v5 addOperation:v6];
}

void sub_10000B5AC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak(v2);
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak((id *)(v5 - 144));
  _Unwind_Resume(a1);
}

void sub_10000B604(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v11 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v12 = [WeakRetained oslog];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = [v7 recordName];
      id v14 = [v7 zoneID];
      int v20 = 138412546;
      id v21 = v13;
      __int16 v22 = 2112;
      id v23 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "received new record(%@) for: %@", (uint8_t *)&v20, 0x16u);
    }
    if (v9)
    {
      id v15 = [v11 oslog];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 138412290;
        id v21 = v9;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Got CloudKit error: %@", (uint8_t *)&v20, 0xCu);
      }
LABEL_11:

      goto LABEL_12;
    }
    uint64_t v16 = [v7 zoneID];
    uint64_t v17 = [v11 mobileBackupRecordZoneID];
    unsigned int v18 = [v16 isEqual:v17];

    if (!v18)
    {
      id v15 = [v11 oslog];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = [v7 zoneID];
        int v20 = 138412290;
        id v21 = v19;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "got update for unknown zone: %@", (uint8_t *)&v20, 0xCu);
      }
      goto LABEL_11;
    }
    [v11 saveEscrowChange:v8];
  }
LABEL_12:
}

void sub_10000B840(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    char v6 = [WeakRetained oslog];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [v3 recordName];
      int v13 = 138412290;
      id v14 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Record deleted: %@", (uint8_t *)&v13, 0xCu);
    }
    id v8 = [v3 zoneID];
    id v9 = [v5 mobileBackupRecordZoneID];
    unsigned int v10 = [v8 isEqual:v9];

    if (v10)
    {
      [v5 deleteEscrowID:v3];
    }
    else
    {
      id v11 = [v5 oslog];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = [v3 zoneID];
        int v13 = 138412290;
        id v14 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "got delete for unknown zone: %@", (uint8_t *)&v13, 0xCu);
      }
    }
  }
}

void sub_10000B9DC(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v13 = WeakRetained;
  if (WeakRetained)
  {
    if (v11)
    {
      id v14 = [v11 domain];
      unsigned int v15 = [v14 isEqualToString:CKErrorDomain];

      uint64_t v16 = [v13 oslog];
      BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
      if (v15)
      {
        if (v17)
        {
          int v22 = 138412546;
          id v23 = v11;
          __int16 v24 = 2112;
          id v25 = v9;
          unsigned int v18 = "Got CloudKit error while fetching: %@ for zone:%@";
LABEL_13:
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v22, 0x16u);
        }
      }
      else if (v17)
      {
        int v22 = 138412546;
        id v23 = v11;
        __int16 v24 = 2112;
        id v25 = v9;
        unsigned int v18 = "Got other error: %@for zone:%@";
        goto LABEL_13;
      }

      goto LABEL_15;
    }
    uint64_t v19 = [WeakRetained oslog];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 138412546;
      id v23 = v9;
      __int16 v24 = 2112;
      id v25 = v10;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Finished fetching changes for %@ with change token %@", (uint8_t *)&v22, 0x16u);
    }

    if (v10)
    {
      int v20 = [v13 mobileBackupRecordZoneID];
      unsigned int v21 = [v9 isEqual:v20];

      if (v21) {
        [v13 saveServerChangeToken:v10 forKey:@"MBserverChangeToken"];
      }
    }
  }
LABEL_15:
}

void sub_10000BBE8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = WeakRetained;
  if (v3 && WeakRetained)
  {
    char v6 = [WeakRetained oslog];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "fetchRecordzoneChangesCompletionBlock error: %@", buf, 0xCu);
    }
  }
  id v7 = [v5 stats];
  [v7 setFetchRecordZoneChanges:[v7 fetchRecordZoneChanges] + 1];

  [v5 flushStats];
  id v8 = [v5 oslog];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Finished fetching changes with error: %@", buf, 0xCu);
  }

  [*(id *)(a1 + 32) setError:v3];
  id v9 = [v5 mainOperationQueue];
  [v9 addOperation:*(void *)(a1 + 32)];

  if (!v3)
  {
    id v10 = [v5 queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000BDCC;
    block[3] = &unk_10001CA30;
    block[4] = v5;
    dispatch_sync(v10, block);
  }
}

id sub_10000BDCC(uint64_t a1)
{
  time_t v2 = time(0);
  id v3 = [*(id *)(a1 + 32) stats];
  [v3 setLastfetchRecordZoneChangesAtStart:v2];

  id v4 = *(void **)(a1 + 32);

  return [v4 _onqueueSaveUserRegistryStats];
}

void sub_10000C070(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000C094(uint64_t a1)
{
  time_t v2 = [*(id *)(a1 + 32) pendingSyncOperations];

  id v3 = [*(id *)(a1 + 32) oslog];
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      uint64_t v5 = [*(id *)(a1 + 32) pendingSyncOperations];
      char v6 = [v5 finishOperation];
      int v24 = 138412290;
      id v25 = v6;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Returning pending syncing operation: %@", (uint8_t *)&v24, 0xCu);
    }
    id v7 = [*(id *)(a1 + 32) pendingSyncOperations];
    uint64_t v8 = [v7 finishOperation];
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
  else
  {
    if (v4)
    {
      id v11 = [*(id *)(a1 + 32) currentSyncOperations];
      int v24 = 138412290;
      id v25 = v11;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Creating new syncing operation, after %@", (uint8_t *)&v24, 0xCu);
    }
    uint64_t v12 = [*(id *)(a1 + 32) createPendingSyncOperation:0];
    [*(id *)(a1 + 32) setPendingSyncOperations:v12];

    id v13 = [*(id *)(a1 + 32) currentSyncOperations];
    id v14 = [v13 finishOperation];

    if (v14)
    {
      unsigned int v15 = [*(id *)(a1 + 32) pendingSyncOperations];
      uint64_t v16 = [v15 actualOperation];
      BOOL v17 = [*(id *)(a1 + 32) currentSyncOperations];
      unsigned int v18 = [v17 finishOperation];
      [v16 addDependency:v18];
    }
    uint64_t v19 = [*(id *)(a1 + 32) pendingSyncOperations];
    uint64_t v20 = [v19 finishOperation];
    uint64_t v21 = *(void *)(*(void *)(a1 + 40) + 8);
    int v22 = *(void **)(v21 + 40);
    *(void *)(v21 + 40) = v20;

    id v7 = [*(id *)(a1 + 32) mainOperationQueue];
    id v10 = [*(id *)(a1 + 32) pendingSyncOperations];
    id v23 = [v10 actualOperation];
    [v7 addOperation:v23];
  }
}

void sub_10000C610(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location, char a20)
{
  _Block_object_dispose(&a20, 8);
  objc_destroyWeak((id *)(v20 - 104));
  _Unwind_Resume(a1);
}

void sub_10000C688(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v2 = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = [v2 oslog];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = WeakRetained;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Beginning syncing operation %@", (uint8_t *)&buf, 0xCu);
  }

  if (*(unsigned char *)(a1 + 64))
  {
    BOOL v4 = [v2 queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000D068;
    block[3] = &unk_10001CA30;
    block[4] = v2;
    dispatch_sync(v4, block);

    uint64_t v5 = *(void **)(a1 + 32);
    v59[0] = _NSConcreteStackBlock;
    v59[1] = 3221225472;
    v59[2] = sub_10000D158;
    v59[3] = &unk_10001CC78;
    objc_copyWeak(&v60, (id *)(a1 + 56));
    objc_copyWeak(&v61, &location);
    objc_copyWeak(&v62, (id *)(a1 + 48));
    v59[4] = *(void *)(a1 + 40);
    [v5 addExecutionBlock:v59];
    objc_destroyWeak(&v62);
    objc_destroyWeak(&v61);
    objc_destroyWeak(&v60);
  }
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v74 = 0x3032000000;
  uint64_t v75 = sub_100009E7C;
  uint64_t v76 = sub_100009E8C;
  id v77 = 0;
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x3032000000;
  BOOL v56 = sub_100009E7C;
  v57 = sub_100009E8C;
  id v58 = 0;
  id v7 = [v2 container];
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_10000D274;
  v49[3] = &unk_10001CCA0;
  p_long long buf = &buf;
  v52 = &v53;
  uint64_t v8 = v6;
  id v50 = v8;
  [v7 accountInfoWithCompletionHandler:v49];

  dispatch_time_t v9 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v8, v9))
  {
    id v10 = +[NSError errorWithDomain:kPCSErrorDomain code:75 userInfo:0];
    [*(id *)(a1 + 32) setError:v10];

    id v11 = [v2 mainOperationQueue];
    [v11 addOperation:*(void *)(a1 + 32)];
    goto LABEL_34;
  }
  if ([*(id *)(*((void *)&buf + 1) + 40) accountStatus] == (id)1)
  {
    if ([*(id *)(*((void *)&buf + 1) + 40) hasValidCredentials])
    {
      uint64_t v12 = [v2 userdb];
      id v11 = [v12 dsid];

      if (!v11
        || ([v2 accounts],
            id v13 = objc_claimAutoreleasedReturnValue(),
            [v13 dsid],
            id v14 = objc_claimAutoreleasedReturnValue(),
            unsigned __int8 v15 = [v11 isEqualToString:v14],
            v14,
            v13,
            (v15 & 1) == 0))
      {
        uint64_t v16 = [v2 accounts];
        BOOL v17 = [v16 dsid];

        if (!v17)
        {
          id v38 = [v2 oslog];
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v71 = 0;
            _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "No DSID available. Quitting sync.", v71, 2u);
          }

          uint64_t v39 = kPCSErrorDomain;
          NSErrorUserInfoKey v65 = NSLocalizedDescriptionKey;
          CFStringRef v66 = @"No iCloud account";
          uint64_t v40 = +[NSDictionary dictionaryWithObjects:&v66 forKeys:&v65 count:1];
          v41 = +[NSError errorWithDomain:v39 code:66 userInfo:v40];
          [*(id *)(a1 + 32) setError:v41];

          id v36 = [v2 mainOperationQueue];
          [v36 addOperation:*(void *)(a1 + 32)];
          goto LABEL_33;
        }
        unsigned int v18 = [v2 queue];
        v47[0] = _NSConcreteStackBlock;
        v47[1] = 3221225472;
        v47[2] = sub_10000D310;
        v47[3] = &unk_10001CBB0;
        v47[4] = v2;
        id v48 = v17;
        id v19 = v17;
        dispatch_sync(v18, v47);
      }
      uint64_t v20 = [v2 getServerChangeToken:@"MBserverChangeToken"];
      BOOL v21 = v20 == 0;

      if (v21)
      {
        uint64_t v32 = [v2 oslog];
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v71 = 0;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Creating zone before syncing", v71, 2u);
        }

        uint64_t v33 = [v2 defaultCKConfiguration];
        int v22 = [v2 createZone:v33 withName:@"PCSUserRegistryMobileBackup"];
      }
      else
      {
        int v22 = 0;
      }
      uint64_t v34 = objc_alloc_init(PCSRegistryOperation);
      uint64_t v35 = v34;
      if (v22) {
        [(PCSRegistryOperation *)v34 addDependency:v22];
      }
      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472;
      v43[2] = sub_10000D3AC;
      v43[3] = &unk_10001CCC8;
      objc_copyWeak(&v46, (id *)(a1 + 56));
      id v36 = v22;
      id v44 = v36;
      id v45 = *(id *)(a1 + 32);
      [(PCSRegistryOperation *)v35 addExecutionBlock:v43];
      v37 = [v2 mainOperationQueue];
      [v37 addOperation:v35];

      objc_destroyWeak(&v46);
LABEL_33:

      goto LABEL_34;
    }
    uint64_t v29 = [v2 oslog];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v30 = v54[5];
      *(_DWORD *)v71 = 138412290;
      uint64_t v72 = v30;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "iCloud account in grey mode (%@)", v71, 0xCu);
    }

    uint64_t v31 = +[NSError errorWithDomain:CKErrorDomain code:9 userInfo:0];
    [*(id *)(a1 + 32) setError:v31];

    id v11 = [v2 mainOperationQueue];
    [v11 addOperation:*(void *)(a1 + 32)];
  }
  else
  {
    id v23 = [v2 oslog];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = v54[5];
      *(_DWORD *)v71 = 138412290;
      uint64_t v72 = v24;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Not logged into iCloud (%@)", v71, 0xCu);
    }

    uint64_t v25 = v54[5];
    uint64_t v26 = kPCSErrorDomain;
    if (v25)
    {
      v69[0] = NSLocalizedDescriptionKey;
      v69[1] = NSUnderlyingErrorKey;
      v70[0] = @"No iCloud account";
      v70[1] = v25;
      +[NSDictionary dictionaryWithObjects:v70 forKeys:v69 count:2];
    }
    else
    {
      NSErrorUserInfoKey v67 = NSLocalizedDescriptionKey;
      CFStringRef v68 = @"No iCloud account";
      +[NSDictionary dictionaryWithObjects:&v68 forKeys:&v67 count:1];
    uint64_t v27 = };
    uint64_t v28 = +[NSError errorWithDomain:v26 code:66 userInfo:v27];
    [*(id *)(a1 + 32) setError:v28];

    id v11 = [v2 mainOperationQueue];
    [v11 addOperation:*(void *)(a1 + 32)];
  }
LABEL_34:

  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&buf, 8);

  objc_destroyWeak(&location);
}

void sub_10000CFC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,id location)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v50 - 176), 8);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_10000D068(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) oslog];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) pendingSyncOperations];
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "syncing operation (%@) no longer pending", (uint8_t *)&v6, 0xCu);
  }
  BOOL v4 = [*(id *)(a1 + 32) pendingSyncOperations];
  [*(id *)(a1 + 32) setCurrentSyncOperations:v4];

  return [*(id *)(a1 + 32) setPendingSyncOperations:0];
}

void sub_10000D158(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v5 = [WeakRetained oslog];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = [v3 error];
    int v9 = 138412546;
    id v10 = v4;
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Finished syncing operation %@: (%@)", (uint8_t *)&v9, 0x16u);
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;
}

void sub_10000D274(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10000D310(uint64_t a1)
{
  [*(id *)(a1 + 32) _onqueueDeleteServerChangeToken:@"MBserverChangeToken"];
  id v2 = [*(id *)(a1 + 32) oslog];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Caching DSID from Accounts", v5, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) userdb];
  [v4 setDsid:v3];
}

void sub_10000D3AC(id *a1)
{
  id v2 = a1 + 6;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v4 = a1[4];
  if (v4 && ([v4 error], id v5 = objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    id v6 = [WeakRetained oslog];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [a1[4] error];
      *(_DWORD *)long long buf = 138412290;
      unsigned int v18 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Zone creation failed for some reason: (%@), stopping MobileBackup sync", buf, 0xCu);
    }
    uint64_t v8 = [a1[4] error];
    [a1[5] setError:v8];

    id v9 = [WeakRetained mainOperationQueue];
    [v9 addOperation:a1[5]];
  }
  else
  {
    id v10 = [WeakRetained fetchAllChanges:0];
    id v11 = objc_alloc_init(PCSRegistryOperation);
    [(PCSRegistryOperation *)v11 addDependency:v10];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    _DWORD v13[2] = sub_10000D5E4;
    v13[3] = &unk_10001CCC8;
    objc_copyWeak(&v16, v2);
    id v9 = v10;
    id v14 = v9;
    id v15 = a1[5];
    [(PCSRegistryOperation *)v11 addExecutionBlock:v13];
    id v12 = [WeakRetained mainOperationQueue];
    [v12 addOperation:v11];

    objc_destroyWeak(&v16);
  }
}

void sub_10000D5C4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10000D5E4(id *a1)
{
  id v2 = a1 + 6;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v4 = [a1[4] error];

  if (v4)
  {
    id v5 = [a1[4] error];
    [WeakRetained checkErrorForRetryPause:v5];

    id v6 = [a1[4] error];
    unsigned int v7 = [WeakRetained errorShouldCauseReset:v6];

    uint64_t v8 = [WeakRetained oslog];
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v9)
      {
        id v10 = [a1[4] error];
        *(_DWORD *)long long buf = 138412290;
        uint64_t v30 = v10;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Fetch failed for some terrible reason: (%@), restarting entire sync process", buf, 0xCu);
      }
      [WeakRetained resyncDatabase:a1[5]];
    }
    else
    {
      if (v9)
      {
        BOOL v17 = [a1[4] error];
        *(_DWORD *)long long buf = 138412290;
        uint64_t v30 = v17;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Fetching failed for some reason: (%@), scheduling sync restart", buf, 0xCu);
      }
      unsigned int v18 = [WeakRetained resyncRegistryAction];
      [v18 trigger];

      id v19 = [a1[4] error];
      [a1[5] setError:v19];

      uint64_t v20 = [WeakRetained mainOperationQueue];
      [v20 addOperation:a1[5]];
    }
  }
  else
  {
    id v11 = [WeakRetained mobileBackup];
    unsigned __int8 v12 = [v11 isBackupEnabled];

    if (v12)
    {
      id v13 = [WeakRetained startBackupOfNewMobileBackupIdentities];
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_10000D9BC;
      v25[3] = &unk_10001CCC8;
      objc_copyWeak(&v28, v2);
      id v14 = v13;
      id v26 = v14;
      id v27 = a1[5];
      id v15 = +[NSBlockOperation blockOperationWithBlock:v25];
      id v16 = v15;
      if (v14)
      {
        [v15 addDependency:v14];
      }
      else
      {
        id v23 = [WeakRetained oslog];
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "No new items to push; finishing",
            buf,
            2u);
        }
      }
      uint64_t v24 = [WeakRetained mainOperationQueue];
      [v24 addOperation:v16];

      objc_destroyWeak(&v28);
    }
    else
    {
      BOOL v21 = [WeakRetained oslog];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "MobileBackup is off; not pushing data to CloudKit",
          buf,
          2u);
      }

      int v22 = [WeakRetained mainOperationQueue];
      [v22 addOperation:a1[5]];
    }
  }
}

void sub_10000D998(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10000D9BC(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  uint64_t v3 = [WeakRetained oslog];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [a1[4] error];
    int v12 = 138412290;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "startBackupOfNewMobileBackupIdentities as part of syncing done: (%@)", (uint8_t *)&v12, 0xCu);
  }
  id v5 = [a1[4] error];

  if (v5)
  {
    id v6 = [WeakRetained oslog];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v7 = [a1[4] error];
      int v12 = 138412290;
      id v13 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Pushing new changes failed for some reason: (%@), scheduling retry", (uint8_t *)&v12, 0xCu);
    }
    uint64_t v8 = [a1[4] error];
    [WeakRetained checkErrorForRetryPause:v8];

    BOOL v9 = [WeakRetained resyncRegistryAction];
    [v9 trigger];
  }
  id v10 = [a1[4] error];
  [a1[5] setError:v10];

  id v11 = [WeakRetained mainOperationQueue];
  [v11 addOperation:a1[5]];
}

void sub_10000DD84(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) userdb];
  id v2 = [*(id *)(a1 + 40) recordID];
  uint64_t v3 = [v2 recordName];
  id v4 = [*(id *)(a1 + 48) encodedData];
  [v5 replaceRecordID:v3 data:v4 publicKey:*(void *)(a1 + 56)];
}

void sub_10000DFD0(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) userdb];
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = [*(id *)(a1 + 48) encodedData];
  [v4 replaceConfigRecord:v2 data:v3];
}

void sub_10000E2F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000E318(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) userdb];
  uint64_t v2 = [v5 getConfigData:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_10000E4EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000E508(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) userdb];
  uint64_t v2 = [v5 getConfigData:@"UserRegistryStats"];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_10000E77C(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) userdb];
  [v1 deleteRecordAll];
}

void sub_10000EFFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000F030(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained oslog];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "CloudKit timeout complete", v3, 2u);
  }
}

void sub_10000F0A8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) mainOperationQueue];
  [v2 addOperation:*(void *)(a1 + 40)];
}

void sub_10000F320(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000F364(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  BOOL v9 = [WeakRetained oslog];
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v10)
    {
      id v11 = *(void **)(a1 + 32);
      int v14 = 138412546;
      id v15 = v11;
      __int16 v16 = 2112;
      id v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Error creating zone (%@): %@", (uint8_t *)&v14, 0x16u);
    }

    [*(id *)(a1 + 40) setError:v7];
    [WeakRetained checkErrorForRetryPause:v7];
  }
  else
  {
    if (v10)
    {
      int v14 = 138412290;
      id v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Created zones: %@", (uint8_t *)&v14, 0xCu);
    }

    int v12 = [WeakRetained subscribeAction];
    [v12 trigger];
  }
  id v13 = [WeakRetained mainOperationQueue];
  [v13 addOperation:*(void *)(a1 + 40)];
}

void sub_10000F69C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000F6DC(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v9 = [WeakRetained oslog];
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v10)
    {
      id v11 = [WeakRetained mobileBackupRecordZoneID];
      int v13 = 138412546;
      id v14 = v11;
      __int16 v15 = 2112;
      id v16 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Error deleting zone (%@): %@", (uint8_t *)&v13, 0x16u);
    }
  }
  else if (v10)
  {
    int v13 = 138412290;
    id v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Deleted zones: %@", (uint8_t *)&v13, 0xCu);
  }

  [*(id *)(a1 + 32) setError:v7];
  int v12 = [WeakRetained mainOperationQueue];
  [v12 addOperation:*(void *)(a1 + 32)];
}

void sub_10000F964(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000F97C(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) userdb];
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(id *)(a1 + 48);
  id v4 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
  [v4 encodeObject:v3 forKey:@"record"];

  id v5 = [v4 encodedData];
  id v6 = [v5 copy];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v7 setEscrowKey:v2 escrowBlob:v6];
}

void sub_10000FB08(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) recordName];
  uint64_t v2 = [*(id *)(a1 + 40) userdb];
  [v2 deleteEscrowKey:v3];
}

void sub_10000FCB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000FCD4(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) userdb];
  uint64_t v2 = [v5 queryEscrowKey:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

id sub_10000FD40(void *a1)
{
  id v1 = a1;
  id v2 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v1 error:0];

  uint64_t v3 = [v2 decodeObjectOfClass:objc_opt_class() forKey:@"record"];

  return v3;
}

void sub_100010220(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, id a18)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a18);
  _Unwind_Resume(a1);
}

void sub_1000102A4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v37 = a2;
  id v36 = a3;
  id v38 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v34 = a1;
  id v8 = objc_loadWeakRetained((id *)(a1 + 48));
  BOOL v9 = v8;
  if (WeakRetained)
  {
    from = (id *)(a1 + 48);
    uint64_t v35 = v8;
    BOOL v10 = [WeakRetained oslog];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v53 = v38;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Finished uploading registry records (%@)", buf, 0xCu);
    }

    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v11 = v37;
    id v12 = [v11 countByEnumeratingWithState:&v46 objects:v51 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v47;
      do
      {
        for (int i = 0; i != v12; int i = (char *)i + 1)
        {
          if (*(void *)v47 != v13) {
            objc_enumerationMutation(v11);
          }
          __int16 v15 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          id v16 = [WeakRetained oslog];
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            id v17 = [v15 recordID];
            unsigned int v18 = [v17 recordName];
            *(_DWORD *)long long buf = 138412290;
            id v53 = v18;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Stored record, saving in cache: %@", buf, 0xCu);
          }
          [WeakRetained saveEscrowChange:v15];
        }
        id v12 = [v11 countByEnumeratingWithState:&v46 objects:v51 count:16];
      }
      while (v12);
    }

    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v19 = v36;
    id v20 = [v19 countByEnumeratingWithState:&v42 objects:v50 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v43;
      do
      {
        for (j = 0; j != v20; j = (char *)j + 1)
        {
          if (*(void *)v43 != v21) {
            objc_enumerationMutation(v19);
          }
          [WeakRetained deleteEscrowID:*(void *)(*((void *)&v42 + 1) + 8 * (void)j)];
        }
        id v20 = [v19 countByEnumeratingWithState:&v42 objects:v50 count:16];
      }
      while (v20);
    }

    if (v38)
    {
      id v23 = [WeakRetained oslog];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        id v53 = v38;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Retriggering syncing due to error (%@)", buf, 0xCu);
      }

      uint64_t v24 = [WeakRetained resyncRegistryAction];
      [v24 trigger];

      [v35 setError:v38];
      uint64_t v25 = [WeakRetained mainOperationQueue];
      [v25 addOperation:v35];
    }
    else
    {
      uint64_t v26 = *(void *)(v34 + 32);
      if (v26)
      {
        id v27 = [WeakRetained pushMobileBackupRecordsToCloudKit:v26 removeObjects:&__NSArray0__struct];
        id v28 = objc_alloc_init(PCSRegistryOperation);
        [(PCSRegistryOperation *)v28 addDependency:v27];
        v39[0] = _NSConcreteStackBlock;
        v39[1] = 3221225472;
        v39[2] = sub_100010788;
        v39[3] = &unk_10001CE08;
        objc_copyWeak(&v41, from);
        id v29 = v27;
        id v40 = v29;
        [(PCSRegistryOperation *)v28 addExecutionBlock:v39];
        [v35 addDependency:v28];
        uint64_t v30 = [WeakRetained mainOperationQueue];
        [v30 addOperation:v35];

        uint64_t v31 = [WeakRetained mainOperationQueue];
        [v31 addOperation:v28];

        objc_destroyWeak(&v41);
      }
      else
      {
        uint64_t v32 = [WeakRetained mainOperationQueue];
        [v32 addOperation:v35];
      }
    }
    BOOL v9 = v35;
  }
  else
  {
    [v8 cancel];
  }
}

void sub_100010768(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100010788(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [*(id *)(a1 + 32) error];
  [WeakRetained setError:v2];
}

id sub_100010990(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = PCSIdentityGetPublicKey();
  id v7 = +[NSString stringWithFormat:@"%@-%@%@", v5, v6, v4];

  id v8 = v7;
  BOOL v9 = (const char *)[v8 UTF8String];
  ccsha256_di();
  strlen(v9);
  ccdigest();
  BOOL v10 = (void *)_PCSCreateHexString();

  return v10;
}

void sub_100010D90(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void sub_10001111C(uint64_t a1, uint64_t a2)
{
  if (PCSServiceItemEscrowManateeIdentityByName())
  {
    uint64_t v4 = PCSIdentitySetCopyOrderedIdentities();
    if (v4)
    {
      CFArrayRef v5 = (const __CFArray *)v4;
      context[0] = _NSConcreteStackBlock;
      context[1] = 3221225472;
      context[2] = sub_1000112CC;
      context[3] = &unk_10001CE80;
      uint64_t v6 = *(void *)(a1 + 56);
      id v7 = *(void **)(a1 + 40);
      void context[4] = *(void *)(a1 + 32);
      uint64_t v12 = v6;
      id v11 = v7;
      v15.length = CFArrayGetCount(v5);
      v15.id location = 0;
      CFArrayApplyFunction(v5, v15, (CFArrayApplierFunction)sub_100012D6C, context);
      CFRelease(v5);

      return;
    }
    id v8 = [*(id *)(a1 + 32) oslog];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v14 = a2;
      BOOL v9 = "No identities for %@";
      goto LABEL_8;
    }
  }
  else
  {
    id v8 = [*(id *)(a1 + 32) oslog];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v14 = a2;
      BOOL v9 = "Not doing MobileBackup for %@";
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v9, buf, 0xCu);
    }
  }
}

void sub_1000112CC(uint64_t a1, uint64_t a2)
{
  CFArrayRef v5 = [*(id *)(a1 + 32) mobileBackupKeyRecordIdentity:a2 version:@"-v2"];
  uint64_t v6 = [*(id *)(a1 + 32) queryEscrowName:v5];
  id v7 = v6;
  if (!v6 || ([v6 etag], id v8 = objc_claimAutoreleasedReturnValue(), v8, !v8))
  {
    BOOL v10 = *(void **)(a1 + 32);
    id v11 = [v10 mobileBackupRecordZoneID];
    BOOL v9 = [v10 keyRecord:a2 withName:v5 zone:v11];

    if ([*(id *)(a1 + 32) updateEscrowData:v9 escrowIdentity:*(void *)(a1 + 48) identity:a2])
    {
      [*(id *)(a1 + 40) addObject:v9];
      uint64_t v12 = [*(id *)(a1 + 32) oslog];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138412546;
        uint64_t v15 = a2;
        __int16 v16 = 2112;
        id v17 = v5;
        uint64_t v13 = "Will store %@ as (%@)";
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v14, 0x16u);
      }
    }
    else
    {
      uint64_t v12 = [*(id *)(a1 + 32) oslog];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138412546;
        uint64_t v15 = a2;
        __int16 v16 = 2112;
        id v17 = v5;
        uint64_t v13 = "Couldn't escrow identity %@ (%@); skipping";
        goto LABEL_10;
      }
    }

    goto LABEL_12;
  }
  BOOL v9 = [*(id *)(a1 + 32) oslog];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412546;
    uint64_t v15 = a2;
    __int16 v16 = 2112;
    id v17 = v5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Already stored %@ as (%@); skipping",
      (uint8_t *)&v14,
      0x16u);
  }
LABEL_12:
}

void sub_100011D44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100011D80(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) userdb];
  uint64_t v2 = [v5 queryEscrowKeys];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_1000124E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10001251C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = [*(id *)(a1 + 32) oslog];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "queryMobileBackupKeysFromCloudKit: error: %@", (uint8_t *)&v13, 0xCu);
    }

    id v8 = [v6 copy];
    uint64_t v9 = *(void *)(a1 + 48);
LABEL_9:
    uint64_t v11 = *(void *)(v9 + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v8;

    goto LABEL_10;
  }
  if (v5)
  {
    uint64_t v10 = [*(id *)(a1 + 32) oslog];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 134217984;
      id v14 = [v5 count];
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "queryMobileBackupKeysFromCloudKit got keys (count %lu)", (uint8_t *)&v13, 0xCu);
    }

    id v8 = [v5 copy];
    uint64_t v9 = *(void *)(a1 + 56);
    goto LABEL_9;
  }
LABEL_10:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_100012AAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100012AD0(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) userdb];
  uint64_t v2 = [v5 queryEscrowKeys];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t sub_100012D6C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, a1);
}

id sub_100012ED4()
{
  if (qword_1000219D0 != -1) {
    dispatch_once(&qword_1000219D0, &stru_10001CF40);
  }
  id v0 = (void *)qword_1000219C8;

  return v0;
}

void sub_100012F28(uint64_t a1)
{
  id WeakRetained = (dispatch_object_t *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    dispatch_suspend(WeakRetained[7]);
    dispatch_object_t v3 = v2[3];
    if (v3)
    {
      uint64_t v4 = objc_retainBlock(v3);
      v15[0] = 0;
      v15[1] = v15;
      v15[2] = 0x3032000000;
      v15[3] = sub_100013100;
      v15[4] = sub_100013110;
      uint64_t v16 = v2[8];
      dispatch_object_t v5 = v2[8];
      v2[8] = 0;

      dispatch_object_t v6 = v2[6];
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100013118;
      v12[3] = &unk_10001CEF8;
      id v7 = v4;
      int v13 = v7;
      id v14 = v15;
      [v6 addOperationWithBlock:v12];

      _Block_object_dispose(v15, 8);
    }
    dispatch_time_t v8 = dispatch_time(0, 1000000000 * (void)v2[4]);
    uint64_t v9 = sub_100012ED4();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100013188;
    block[3] = &unk_10001CA30;
    uint64_t v11 = v2;
    dispatch_after(v8, v9, block);
  }
}

void sub_1000130E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100013100(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100013110(uint64_t a1)
{
}

void sub_100013118(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  if (v4)
  {
    *(void *)(v3 + 40) = 0;
  }
}

void sub_100013188(uint64_t a1)
{
}

uint64_t sub_100013290(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 72) = *(unsigned char *)(result + 40) == 0;
  return result;
}

void sub_100013368(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  dispatch_object_t v6 = WeakRetained;
  if (!*((void *)WeakRetained + 9) && !*((void *)WeakRetained + 8))
  {
    id v3 = [*(id *)(a1 + 32) label];
    [v3 UTF8String];
    uint64_t v4 = os_transaction_create();
    dispatch_object_t v5 = (void *)v6[8];
    v6[8] = v4;

    id WeakRetained = v6;
  }
  dispatch_source_merge_data(*((dispatch_source_t *)WeakRetained + 7), 1uLL);
}

void sub_100013524(id a1)
{
  id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("PCSDelayedActionQueue", v3);
  uint64_t v2 = (void *)qword_1000219C8;
  qword_1000219C8 = (uint64_t)v1;
}

uint64_t sub_100013588(int a1, void *a2, void *a3, void *a4, int a5)
{
  id v9 = a4;
  id v10 = a3;
  id v11 = a2;
  id v12 = objc_alloc_init((Class)NSMutableDictionary);
  sub_1000139FC(v12, v9, v11, v10);

  int v13 = +[PCSAccountsModel guitarfishStateForDSID:v9];

  if (v13)
  {
    id v20 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v13 BOOLValue]);
    [v12 setObject:v20 forKeyedSubscript:kPCSSetupGuitarfish];

    switch(a1)
    {
      case 1:
        if (a5)
        {
          sub_100005048(__stdoutp, @"Calling PCSIdentityMigrateDropStingray", v14, v15, v16, v17, v18, v19, v32);
          if (PCSIdentityMigrateDropStingray())
          {
            uint64_t v21 = __stdoutp;
            int v22 = @"PCSIdentityMigrateDropStingray succeeded";
            goto LABEL_20;
          }
        }
        else if (PCSIdentityMigrateDropStingray())
        {
          goto LABEL_39;
        }
        sub_100005048(__stderrp, @"PCSIdentityMigrateDropStingray: %@", v14, v15, v16, v17, v18, v19, 0);
        break;
      case 2:
        if (a5)
        {
          sub_100005048(__stdoutp, @"Calling PCSIdentityMigrateToiCDP", v14, v15, v16, v17, v18, v19, v32);
          if (PCSIdentityMigrateToiCDP())
          {
            uint64_t v21 = __stdoutp;
            int v22 = @"PCSIdentityMigrateToiCDP succeeded";
            goto LABEL_20;
          }
        }
        else if (PCSIdentityMigrateToiCDP())
        {
          goto LABEL_39;
        }
        sub_100005048(__stderrp, @"PCSIdentityMigrateToiCDP: %@", v14, v15, v16, v17, v18, v19, 0);
        break;
      case 3:
        id v23 = __stderrp;
        uint64_t v24 = @"Convert HSM no longer supported";
        goto LABEL_7;
      case 4:
        if (a5)
        {
          sub_100005048(__stdoutp, @"Calling PCSIdentityMigrateCloseDoor", v14, v15, v16, v17, v18, v19, v32);
          if (PCSIdentityMigrateCloseDoor())
          {
            uint64_t v21 = __stdoutp;
            int v22 = @"PCSIdentityMigrateCloseDoor succeeded";
            goto LABEL_20;
          }
        }
        else if (PCSIdentityMigrateCloseDoor())
        {
          goto LABEL_39;
        }
        sub_100005048(__stderrp, @"PCSIdentityMigrateCloseDoor: %@", v14, v15, v16, v17, v18, v19, 0);
        break;
      case 5:
        if (a5)
        {
          sub_100005048(__stdoutp, @"Calling PCSIdentityMigrateRestoreHSM", v14, v15, v16, v17, v18, v19, v32);
          if (PCSIdentityMigrateRestoreHSM())
          {
            uint64_t v21 = __stdoutp;
            int v22 = @"PCSIdentityMigrateRestoreHSM succeeded";
LABEL_20:
            sub_100005048(v21, v22, v14, v15, v16, v17, v18, v19, v33);
            goto LABEL_39;
          }
        }
        else if (PCSIdentityMigrateRestoreHSM())
        {
LABEL_39:
          id v25 = 0;
          goto LABEL_40;
        }
        sub_100005048(__stderrp, @"PCSIdentityMigrateRestoreHSM: %@", v14, v15, v16, v17, v18, v19, 0);
        break;
      case 6:
        if (a5) {
          sub_100005048(__stdoutp, @"Calling PCSAccountEnableWalrus", v14, v15, v16, v17, v18, v19, v32);
        }
        char v27 = PCSAccountEnableWalrus();
        id v25 = 0;
        if ((v27 & 1) == 0)
        {
          sub_100005048(__stderrp, @"PCSAccountEnableWalrus: %@", v14, v15, v16, v17, v18, v19, (uint64_t)v25);
          goto LABEL_9;
        }
        if (!a5) {
          goto LABEL_40;
        }
        id v28 = __stdoutp;
        id v29 = @"PCSAccountEnableWalrus succeeded";
        goto LABEL_31;
      case 7:
        if (a5) {
          sub_100005048(__stdoutp, @"Calling PCSAccountDisableWalrus", v14, v15, v16, v17, v18, v19, v32);
        }
        char v30 = PCSAccountDisableWalrus();
        id v25 = 0;
        if ((v30 & 1) == 0)
        {
          sub_100005048(__stderrp, @"PCSAccountDisableWalrus: %@", v14, v15, v16, v17, v18, v19, (uint64_t)v25);
          goto LABEL_9;
        }
        if (a5)
        {
          id v28 = __stdoutp;
          id v29 = @"PCSAccountDisableWalrus succeeded";
LABEL_31:
          sub_100005048(v28, v29, v14, v15, v16, v17, v18, v19, v32);
        }
LABEL_40:
        uint64_t v26 = 0;
        goto LABEL_41;
      default:
        break;
    }
  }
  else
  {
    id v23 = __stderrp;
    uint64_t v24 = @"Failed to get Guitarfish state.";
LABEL_7:
    sub_100005048(v23, v24, v14, v15, v16, v17, v18, v19, v32);
  }
  id v25 = 0;
LABEL_9:
  uint64_t v26 = 1;
LABEL_41:
  if (a5) {
    sub_100005048(__stderrp, @"convert returning: %d", v14, v15, v16, v17, v18, v19, v26);
  }

  return v26;
}

void sub_1000139FC(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  if (!v9)
  {
    NSLog(@"Must provide either an AppleID to fetch a PET");
    exit(1);
  }
  id v11 = v10;
  id v12 = objc_alloc_init((Class)AKAppleIDAuthenticationContext);
  [v12 setUsername:v9];
  if (v11) {
    [v12 _setPassword:v11];
  }
  [v12 setAuthenticationType:1];
  [v12 setIsUsernameEditable:0];
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x3032000000;
  uint64_t v33 = sub_100013CD8;
  uint64_t v34 = sub_100013CE8;
  id v35 = 0;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  char v27 = sub_100013CD8;
  id v28 = sub_100013CE8;
  id v29 = 0;
  dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
  id v14 = objc_alloc_init((Class)AKAppleIDAuthenticationController);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100013CF0;
  v18[3] = &unk_10001CF68;
  id v15 = v8;
  id v19 = v15;
  id v16 = v9;
  id v20 = v16;
  int v22 = &v30;
  id v23 = &v24;
  uint64_t v17 = v13;
  uint64_t v21 = v17;
  [v14 authenticateWithContext:v12 completion:v18];
  dispatch_semaphore_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
  [v7 setObject:v16 forKeyedSubscript:kPCSSetupUsername];
  [v7 setObject:v31[5] forKeyedSubscript:kPCSSetupPassword];
  [v7 setObject:v15 forKeyedSubscript:kPCSSetupDSID];
  [v7 setObject:v11 forKeyedSubscript:kPCSSetupRawPassword];
  [v7 setObject:v25[5] forKeyedSubscript:kPCSSetupPasswordGeneration];

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);
}

void sub_100013CB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100013CD8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100013CE8(uint64_t a1)
{
}

void sub_100013CF0(uint64_t a1, void *a2, void *a3)
{
  id v32 = a2;
  id v5 = a3;
  if (v5)
  {
    sub_100005048(__stderrp, @"authentication error: %@", v6, v7, v8, v9, v10, v11, (uint64_t)v5);
    goto LABEL_11;
  }
  uint64_t v12 = *(void **)(a1 + 32);
  dispatch_semaphore_t v13 = [v32 objectForKeyedSubscript:AKAuthenticationDSIDKey];
  uint64_t v14 = [v13 stringValue];
  LOBYTE(v12) = [v12 isEqualToString:v14];

  if ((v12 & 1) == 0)
  {
    id v29 = __stderrp;
    uint64_t v30 = @"authentication error: dsid mismatch";
LABEL_10:
    sub_100005048(v29, v30, v15, v16, v17, v18, v19, v20, v31);
LABEL_11:
    exit(1);
  }
  uint64_t v21 = *(void **)(a1 + 40);
  int v22 = [v32 objectForKeyedSubscript:AKAuthenticationUsernameKey];
  LOBYTE(v21) = [v21 isEqualToString:v22];

  if ((v21 & 1) == 0)
  {
    id v29 = __stderrp;
    uint64_t v30 = @"authentication error: username mismatch";
    goto LABEL_10;
  }
  uint64_t v23 = [v32 objectForKeyedSubscript:AKAuthenticationPasswordKey];
  uint64_t v24 = *(void *)(*(void *)(a1 + 56) + 8);
  id v25 = *(void **)(v24 + 40);
  *(void *)(v24 + 40) = v23;

  uint64_t v26 = [v32 objectForKeyedSubscript:AKPasswordVersionKey];
  uint64_t v27 = *(void *)(*(void *)(a1 + 64) + 8);
  id v28 = *(void **)(v27 + 40);
  *(void *)(v27 + 40) = v26;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return _CFArrayGetTypeID();
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return _CFDictionaryGetTypeID();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

void CFRelease(CFTypeRef cf)
{
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return _CFStringCreateMutable(alloc, maxLength);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return _CFStringGetLength(theString);
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t OctagonPlatformSupportsSOS()
{
  return _OctagonPlatformSupportsSOS();
}

uint64_t PCSAccountDisableWalrus()
{
  return _PCSAccountDisableWalrus();
}

uint64_t PCSAccountEnableWalrus()
{
  return _PCSAccountEnableWalrus();
}

uint64_t PCSBackupCreateEscrowedKeyWithIdentity()
{
  return _PCSBackupCreateEscrowedKeyWithIdentity();
}

uint64_t PCSGuitarfishValidateIdentities()
{
  return _PCSGuitarfishValidateIdentities();
}

uint64_t PCSIdentityCopyCircleFingerPrint()
{
  return _PCSIdentityCopyCircleFingerPrint();
}

uint64_t PCSIdentityCopyPublicKeyInfo()
{
  return _PCSIdentityCopyPublicKeyInfo();
}

uint64_t PCSIdentityGetKeyID()
{
  return _PCSIdentityGetKeyID();
}

uint64_t PCSIdentityGetPublicKey()
{
  return _PCSIdentityGetPublicKey();
}

uint64_t PCSIdentityGetServiceID()
{
  return _PCSIdentityGetServiceID();
}

uint64_t PCSIdentityGetServiceName()
{
  return _PCSIdentityGetServiceName();
}

uint64_t PCSIdentityIsFullManatee()
{
  return _PCSIdentityIsFullManatee();
}

uint64_t PCSIdentityMigrateCloseDoor()
{
  return _PCSIdentityMigrateCloseDoor();
}

uint64_t PCSIdentityMigrateDropStingray()
{
  return _PCSIdentityMigrateDropStingray();
}

uint64_t PCSIdentityMigrateRestoreHSM()
{
  return _PCSIdentityMigrateRestoreHSM();
}

uint64_t PCSIdentityMigrateToiCDP()
{
  return _PCSIdentityMigrateToiCDP();
}

uint64_t PCSIdentitySetCopyCurrentIdentityPointer()
{
  return _PCSIdentitySetCopyCurrentIdentityPointer();
}

uint64_t PCSIdentitySetCopyCurrentIdentityWithError()
{
  return _PCSIdentitySetCopyCurrentIdentityWithError();
}

uint64_t PCSIdentitySetCopyIdentities()
{
  return _PCSIdentitySetCopyIdentities();
}

uint64_t PCSIdentitySetCopyOrderedIdentities()
{
  return _PCSIdentitySetCopyOrderedIdentities();
}

uint64_t PCSIdentitySetCreate()
{
  return _PCSIdentitySetCreate();
}

uint64_t PCSIdentitySetIsICDP()
{
  return _PCSIdentitySetIsICDP();
}

uint64_t PCSIdentitySetIsICDPNetwork()
{
  return _PCSIdentitySetIsICDPNetwork();
}

uint64_t PCSIdentitySetIsWalrusWithForceFetch()
{
  return _PCSIdentitySetIsWalrusWithForceFetch();
}

uint64_t PCSIdentitySynchronizeKeys()
{
  return _PCSIdentitySynchronizeKeys();
}

uint64_t PCSIdentityWebSafePublicKeyID()
{
  return _PCSIdentityWebSafePublicKeyID();
}

uint64_t PCSIdentityiCDPPlesio()
{
  return _PCSIdentityiCDPPlesio();
}

uint64_t PCSIdentityiCDPWalrus()
{
  return _PCSIdentityiCDPWalrus();
}

uint64_t PCSKeySyncingGetAllClients()
{
  return _PCSKeySyncingGetAllClients();
}

uint64_t PCSKeySyncingTriggerDaily()
{
  return _PCSKeySyncingTriggerDaily();
}

uint64_t PCSPublicIdentityCreateWithPublicKeyInfo()
{
  return _PCSPublicIdentityCreateWithPublicKeyInfo();
}

uint64_t PCSPublicIdentityGetServiceID()
{
  return _PCSPublicIdentityGetServiceID();
}

uint64_t PCSReportKeyRollPending()
{
  return _PCSReportKeyRollPending();
}

uint64_t PCSReportManateeStatus()
{
  return _PCSReportManateeStatus();
}

uint64_t PCSRestoreCKBackupWithCompletion()
{
  return _PCSRestoreCKBackupWithCompletion();
}

uint64_t PCSServiceItemEscrowManateeIdentityByName()
{
  return _PCSServiceItemEscrowManateeIdentityByName();
}

uint64_t PCSServiceItemsGetEachName()
{
  return _PCSServiceItemsGetEachName();
}

uint64_t PCSSyncKeyRegistryWithServiceName()
{
  return _PCSSyncKeyRegistryWithServiceName();
}

uint64_t PCSTriggerWatchSyncing()
{
  return _PCSTriggerWatchSyncing();
}

uint64_t SOSCCThisDeviceIsInCircle()
{
  return _SOSCCThisDeviceIsInCircle();
}

uint64_t SOSCCView()
{
  return _SOSCCView();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _PCSBackupGuitarfishDecodeOuterRecord()
{
  return __PCSBackupGuitarfishDecodeOuterRecord();
}

uint64_t _PCSCreateHexString()
{
  return __PCSCreateHexString();
}

uint64_t _PCSGuitarfishPopulateFlagNamesToTelemetryArray()
{
  return __PCSGuitarfishPopulateFlagNamesToTelemetryArray();
}

uint64_t _PCSIdentityCopyBAT()
{
  return __PCSIdentityCopyBAT();
}

uint64_t _PCSIdentityIsManatee()
{
  return __PCSIdentityIsManatee();
}

uint64_t _PCSIdentitySetCopyCurrentIdentityInternal()
{
  return __PCSIdentitySetCopyCurrentIdentityInternal();
}

uint64_t _PCSIdentitySetIsCurrentIdentityPreferCache()
{
  return __PCSIdentitySetIsCurrentIdentityPreferCache();
}

uint64_t _PCSIdentityValidate()
{
  return __PCSIdentityValidate();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __PCSCopyStingrayInfo()
{
  return ___PCSCopyStingrayInfo();
}

uint64_t __PCSDeleteFromKeychain()
{
  return ___PCSDeleteFromKeychain();
}

uint64_t __PCSDeleteFromKeychainICDP()
{
  return ___PCSDeleteFromKeychainICDP();
}

uint64_t __PCSDeleteKeyfile()
{
  return ___PCSDeleteKeyfile();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t ccdigest()
{
  return _ccdigest();
}

uint64_t ccsha256_di()
{
  return _ccsha256_di();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_merge_data(dispatch_source_t source, uintptr_t value)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void errx(int a1, const char *a2, ...)
{
}

void exit(int a1)
{
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return _fputc(a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

int getopt_long(int a1, char *const *a2, const char *a3, const option *a4, int *a5)
{
  return _getopt_long(a1, a2, a3, a4, a5);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

time_t time(time_t *a1)
{
  return _time(a1);
}

void warnx(const char *a1, ...)
{
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__onqueueSaveUserRegistryStats(void *a1, const char *a2, ...)
{
  return [a1 _onqueueSaveUserRegistryStats];
}

id objc_msgSend_accountForCurrentPersona(void *a1, const char *a2, ...)
{
  return [a1 accountForCurrentPersona];
}

id objc_msgSend_accountStatus(void *a1, const char *a2, ...)
{
  return [a1 accountStatus];
}

id objc_msgSend_accounts(void *a1, const char *a2, ...)
{
  return [a1 accounts];
}

id objc_msgSend_actualOperation(void *a1, const char *a2, ...)
{
  return [a1 actualOperation];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_clearCloudKitCache(void *a1, const char *a2, ...)
{
  return [a1 clearCloudKitCache];
}

id objc_msgSend_cloudKitRateLimitedOp(void *a1, const char *a2, ...)
{
  return [a1 cloudKitRateLimitedOp];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_container(void *a1, const char *a2, ...)
{
  return [a1 container];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentItemPointerModificationTime(void *a1, const char *a2, ...)
{
  return [a1 currentItemPointerModificationTime];
}

id objc_msgSend_currentSyncOperations(void *a1, const char *a2, ...)
{
  return [a1 currentSyncOperations];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultAccountsModel(void *a1, const char *a2, ...)
{
  return [a1 defaultAccountsModel];
}

id objc_msgSend_defaultCKConfiguration(void *a1, const char *a2, ...)
{
  return [a1 defaultCKConfiguration];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_deleteRecordAll(void *a1, const char *a2, ...)
{
  return [a1 deleteRecordAll];
}

id objc_msgSend_dependencies(void *a1, const char *a2, ...)
{
  return [a1 dependencies];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_dsid(void *a1, const char *a2, ...)
{
  return [a1 dsid];
}

id objc_msgSend_encodedData(void *a1, const char *a2, ...)
{
  return [a1 encodedData];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_etag(void *a1, const char *a2, ...)
{
  return [a1 etag];
}

id objc_msgSend_fetchRecordZoneChanges(void *a1, const char *a2, ...)
{
  return [a1 fetchRecordZoneChanges];
}

id objc_msgSend_finishOperation(void *a1, const char *a2, ...)
{
  return [a1 finishOperation];
}

id objc_msgSend_flushStats(void *a1, const char *a2, ...)
{
  return [a1 flushStats];
}

id objc_msgSend_hasValidCredentials(void *a1, const char *a2, ...)
{
  return [a1 hasValidCredentials];
}

id objc_msgSend_identity(void *a1, const char *a2, ...)
{
  return [a1 identity];
}

id objc_msgSend_identityCopySet(void *a1, const char *a2, ...)
{
  return [a1 identityCopySet];
}

id objc_msgSend_isBackupEnabled(void *a1, const char *a2, ...)
{
  return [a1 isBackupEnabled];
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return [a1 isCancelled];
}

id objc_msgSend_isExecuting(void *a1, const char *a2, ...)
{
  return [a1 isExecuting];
}

id objc_msgSend_isFinished(void *a1, const char *a2, ...)
{
  return [a1 isFinished];
}

id objc_msgSend_isReady(void *a1, const char *a2, ...)
{
  return [a1 isReady];
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return [a1 label];
}

id objc_msgSend_lastError(void *a1, const char *a2, ...)
{
  return [a1 lastError];
}

id objc_msgSend_lastfetchRecordZoneChangesAtStart(void *a1, const char *a2, ...)
{
  return [a1 lastfetchRecordZoneChangesAtStart];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_loadMobileBackupKeysFromDB(void *a1, const char *a2, ...)
{
  return [a1 loadMobileBackupKeysFromDB];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_longValue(void *a1, const char *a2, ...)
{
  return [a1 longValue];
}

id objc_msgSend_mainOperationQueue(void *a1, const char *a2, ...)
{
  return [a1 mainOperationQueue];
}

id objc_msgSend_mobileBackup(void *a1, const char *a2, ...)
{
  return [a1 mobileBackup];
}

id objc_msgSend_mobileBackupRecordZoneID(void *a1, const char *a2, ...)
{
  return [a1 mobileBackupRecordZoneID];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_operationStateString(void *a1, const char *a2, ...)
{
  return [a1 operationStateString];
}

id objc_msgSend_operationUUID(void *a1, const char *a2, ...)
{
  return [a1 operationUUID];
}

id objc_msgSend_oslog(void *a1, const char *a2, ...)
{
  return [a1 oslog];
}

id objc_msgSend_pendingSyncOperations(void *a1, const char *a2, ...)
{
  return [a1 pendingSyncOperations];
}

id objc_msgSend_previousServerChangeToken(void *a1, const char *a2, ...)
{
  return [a1 previousServerChangeToken];
}

id objc_msgSend_privateCloudDatabase(void *a1, const char *a2, ...)
{
  return [a1 privateCloudDatabase];
}

id objc_msgSend_privateDatabase(void *a1, const char *a2, ...)
{
  return [a1 privateDatabase];
}

id objc_msgSend_pushNotifications(void *a1, const char *a2, ...)
{
  return [a1 pushNotifications];
}

id objc_msgSend_queryEscrowKeys(void *a1, const char *a2, ...)
{
  return [a1 queryEscrowKeys];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return [a1 queue];
}

id objc_msgSend_recordFetch(void *a1, const char *a2, ...)
{
  return [a1 recordFetch];
}

id objc_msgSend_recordID(void *a1, const char *a2, ...)
{
  return [a1 recordID];
}

id objc_msgSend_recordModify(void *a1, const char *a2, ...)
{
  return [a1 recordModify];
}

id objc_msgSend_recordName(void *a1, const char *a2, ...)
{
  return [a1 recordName];
}

id objc_msgSend_recordType(void *a1, const char *a2, ...)
{
  return [a1 recordType];
}

id objc_msgSend_resyncRegistryAction(void *a1, const char *a2, ...)
{
  return [a1 resyncRegistryAction];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_scanPCSIdentitiesForNewMobileBackupRecords(void *a1, const char *a2, ...)
{
  return [a1 scanPCSIdentitiesForNewMobileBackupRecords];
}

id objc_msgSend_selfname(void *a1, const char *a2, ...)
{
  return [a1 selfname];
}

id objc_msgSend_setupSubscriptions(void *a1, const char *a2, ...)
{
  return [a1 setupSubscriptions];
}

id objc_msgSend_startBackupOfNewMobileBackupIdentities(void *a1, const char *a2, ...)
{
  return [a1 startBackupOfNewMobileBackupIdentities];
}

id objc_msgSend_statModify(void *a1, const char *a2, ...)
{
  return [a1 statModify];
}

id objc_msgSend_stats(void *a1, const char *a2, ...)
{
  return [a1 stats];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_subscribeAction(void *a1, const char *a2, ...)
{
  return [a1 subscribeAction];
}

id objc_msgSend_syncUserRegistry(void *a1, const char *a2, ...)
{
  return [a1 syncUserRegistry];
}

id objc_msgSend_trigger(void *a1, const char *a2, ...)
{
  return [a1 trigger];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_userdb(void *a1, const char *a2, ...)
{
  return [a1 userdb];
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return [a1 username];
}

id objc_msgSend_zoneID(void *a1, const char *a2, ...)
{
  return [a1 zoneID];
}

id objc_msgSend_zoneReset(void *a1, const char *a2, ...)
{
  return [a1 zoneReset];
}