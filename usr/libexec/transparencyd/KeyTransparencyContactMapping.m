@interface KeyTransparencyContactMapping
+ (id)countryCodeMap;
+ (id)mapContactsToIDS:(id)a3;
@end

@implementation KeyTransparencyContactMapping

+ (id)countryCodeMap
{
  if (qword_10032F190 != -1) {
    dispatch_once(&qword_10032F190, &stru_1002C7A98);
  }
  v2 = (void *)qword_10032F188;

  return v2;
}

+ (id)mapContactsToIDS:(id)a3
{
  id v3 = a3;
  +[NSMutableSet set];
  v46 = v3;
  id v47 = (id)objc_claimAutoreleasedReturnValue();
  [v3 phoneNumbers];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [obj countByEnumeratingWithState:&v53 objects:v66 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v54;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v54 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v53 + 1) + 8 * (void)v7);
        v9 = [v8 value];
        v10 = v9;
        if (v9)
        {
          v11 = [v9 digits];
          if (v11)
          {
            v12 = [v10 countryCode];
            v13 = (void *)IDSCopyIDForPhoneNumberWithOptions();

            if (qword_10032F198 != -1) {
              dispatch_once(&qword_10032F198, &stru_1002C7AF8);
            }
            v14 = (void *)qword_10032F1A0;
            if (os_log_type_enabled((os_log_t)qword_10032F1A0, OS_LOG_TYPE_DEFAULT))
            {
              v15 = v14;
              v16 = [v10 digits];
              v17 = [v10 countryCode];
              *(_DWORD *)buf = 138413058;
              uint64_t v59 = (uint64_t)v16;
              __int16 v60 = 2112;
              v61 = v17;
              __int16 v62 = 2160;
              uint64_t v63 = 1752392040;
              __int16 v64 = 2112;
              uint64_t v65 = (uint64_t)v13;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "mapContactsToIDS adding phonenumber %@[%@] as %{mask.hash}@", buf, 0x2Au);
            }
            uint64_t v18 = [v10 countryCode];
            if (v18)
            {
              v19 = (void *)v18;
              goto LABEL_35;
            }
            if (([v13 isEqualToString:@"tel:(null)"] & 1) == 0 && v13) {
              goto LABEL_36;
            }
            if (qword_10032F198 != -1) {
              dispatch_once(&qword_10032F198, &stru_1002C7B18);
            }
            v22 = qword_10032F1A0;
            if (os_log_type_enabled((os_log_t)qword_10032F1A0, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Unable to find IDS contact for given phone number, attempting to guess country code based on NSLocale", buf, 2u);
            }
            v19 = CPPhoneNumberCopyHomeCountryCode();
            v23 = [a1 countryCodeMap];
            v24 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%d", [v19 intValue]);
            v25 = [v23 objectForKey:v24];

            if (v25)
            {
              v26 = [v10 digits];
              uint64_t v27 = IDSCopyIDForPhoneNumberWithOptions();

              if (qword_10032F198 != -1) {
                dispatch_once(&qword_10032F198, &stru_1002C7B38);
              }
              v28 = (void *)qword_10032F1A0;
              if (os_log_type_enabled((os_log_t)qword_10032F1A0, OS_LOG_TYPE_DEFAULT))
              {
                v29 = v28;
                v30 = [v10 digits];
                *(_DWORD *)buf = 138413058;
                uint64_t v59 = (uint64_t)v30;
                __int16 v60 = 2112;
                v61 = v25;
                __int16 v62 = 2160;
                uint64_t v63 = 1752392040;
                __int16 v64 = 2112;
                uint64_t v65 = v27;
                _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "mapContactsToIDS Found valid country code from NSLocale, adding phonenumber %@[%@] as %{mask.hash}@", buf, 0x2Au);
              }
            }
            else
            {
              uint64_t v27 = (uint64_t)v13;
            }

            v13 = (void *)v27;
LABEL_35:

            if (v13)
            {
LABEL_36:
              if (([v13 isEqualToString:@"tel:(null)"] & 1) == 0) {
                [v47 addObject:v13];
              }
            }
          }
          else
          {
            if (qword_10032F198 != -1) {
              dispatch_once(&qword_10032F198, &stru_1002C7AD8);
            }
            v21 = qword_10032F1A0;
            if (os_log_type_enabled((os_log_t)qword_10032F1A0, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 141558530;
              uint64_t v59 = 1752392040;
              __int16 v60 = 2112;
              v61 = v8;
              __int16 v62 = 2112;
              uint64_t v63 = (uint64_t)v46;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "mapContactsToIDS phonenumber string missing %{mask.hash}@ on %@", buf, 0x20u);
            }
          }

          goto LABEL_40;
        }
        if (qword_10032F198 != -1) {
          dispatch_once(&qword_10032F198, &stru_1002C7AB8);
        }
        v20 = qword_10032F1A0;
        if (os_log_type_enabled((os_log_t)qword_10032F1A0, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 141558530;
          uint64_t v59 = 1752392040;
          __int16 v60 = 2112;
          v61 = v8;
          __int16 v62 = 2112;
          uint64_t v63 = (uint64_t)v46;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "mapContactsToIDS phonenumber missing %{mask.hash}@ on %@", buf, 0x20u);
        }
LABEL_40:

        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [obj countByEnumeratingWithState:&v53 objects:v66 count:16];
    }
    while (v5);
  }
  v31 = [v46 emailAddresses];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v32 = [v31 countByEnumeratingWithState:&v49 objects:v57 count:16];
  if (v32)
  {
    id v33 = v32;
    uint64_t v34 = *(void *)v50;
    do
    {
      v35 = 0;
      do
      {
        if (*(void *)v50 != v34) {
          objc_enumerationMutation(v31);
        }
        v36 = *(void **)(*((void *)&v49 + 1) + 8 * (void)v35);
        v37 = [v36 value];

        if (v37)
        {
          v38 = [v36 value];
          v39 = (void *)IDSCopyIDForEmailAddress();

          if (qword_10032F198 != -1) {
            dispatch_once(&qword_10032F198, &stru_1002C7B78);
          }
          v40 = (void *)qword_10032F1A0;
          if (os_log_type_enabled((os_log_t)qword_10032F1A0, OS_LOG_TYPE_DEFAULT))
          {
            v41 = v40;
            v42 = [v36 value];
            *(_DWORD *)buf = 141558786;
            uint64_t v59 = 1752392040;
            __int16 v60 = 2112;
            v61 = v42;
            __int16 v62 = 2160;
            uint64_t v63 = 1752392040;
            __int16 v64 = 2112;
            uint64_t v65 = (uint64_t)v39;
            _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "mapContactsToIDS adding email %{mask.hash}@ as %{mask.hash}@", buf, 0x2Au);
          }
          if (v39) {
            [v47 addObject:v39];
          }
        }
        else
        {
          if (qword_10032F198 != -1) {
            dispatch_once(&qword_10032F198, &stru_1002C7B58);
          }
          v43 = qword_10032F1A0;
          if (os_log_type_enabled((os_log_t)qword_10032F1A0, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 141558530;
            uint64_t v59 = 1752392040;
            __int16 v60 = 2112;
            v61 = v36;
            __int16 v62 = 2112;
            uint64_t v63 = (uint64_t)v46;
            _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "mapContactsToIDS phonenumber missing %{mask.hash}@ on %@", buf, 0x20u);
          }
        }
        v35 = (char *)v35 + 1;
      }
      while (v33 != v35);
      id v33 = [v31 countByEnumeratingWithState:&v49 objects:v57 count:16];
    }
    while (v33);
  }

  return v47;
}

@end