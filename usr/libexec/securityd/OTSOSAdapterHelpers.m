@interface OTSOSAdapterHelpers
+ (id)peerPublicSigningKeySPKIs:(id)a3;
+ (id)peerPublicSigningKeySPKIsForCircle:(id)a3 error:(id *)a4;
@end

@implementation OTSOSAdapterHelpers

+ (id)peerPublicSigningKeySPKIsForCircle:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v19 = 0;
  unsigned int v7 = [v6 circleStatus:&v19];
  id v8 = v19;
  v9 = v8;
  if (v7 || v8)
  {
    v14 = sub_10000B070("SecError");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      if (v7 + 1 > 4) {
        CFStringRef v15 = @"kSOSCCError";
      }
      else {
        CFStringRef v15 = off_1003079C8[v7 + 1];
      }
      *(_DWORD *)buf = 138412546;
      CFStringRef v21 = v15;
      __int16 v22 = 2112;
      v23 = v9;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "octagon-sos: Not in circle; not preapproving keys: %@ (%@)",
        buf,
        0x16u);
    }

    v13 = 0;
    if (a4) {
      *a4 = v9;
    }
  }
  else
  {
    id v18 = 0;
    v10 = [v6 fetchTrustedPeers:&v18];
    v11 = (__CFString *)v18;
    v12 = v11;
    if (!v10 || v11)
    {
      v16 = sub_10000B070("SecError");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        CFStringRef v21 = v12;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "octagon-sos: Can't fetch trusted peer SPKIs: %@", buf, 0xCu);
      }

      v13 = 0;
      if (a4) {
        *a4 = v12;
      }
    }
    else
    {
      v13 = [a1 peerPublicSigningKeySPKIs:v10];
    }
  }

  return v13;
}

+ (id)peerPublicSigningKeySPKIs:(id)a3
{
  id v3 = a3;
  v4 = +[NSMutableArray array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v19;
    *(void *)&long long v7 = 138412290;
    long long v17 = v7;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v12 = [v11 publicSigningKey:v17];
        v13 = [v12 encodeSubjectPublicKeyInfo];

        v14 = sub_10000B070("SecError");
        BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
        if (v13)
        {
          if (v15)
          {
            *(_DWORD *)buf = v17;
            v23 = v11;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "octagon-sos: Created SPKI for peer: %@", buf, 0xCu);
          }

          [v4 addObject:v13];
        }
        else
        {
          if (v15)
          {
            *(_DWORD *)buf = v17;
            v23 = v11;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "octagon-sos: Can't create SPKI for peer: %@", buf, 0xCu);
          }
        }
      }
      id v8 = [v5 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v8);
  }

  return v4;
}

@end