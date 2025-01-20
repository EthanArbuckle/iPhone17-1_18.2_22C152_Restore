@interface VVCarrierParameters
- (NSDictionary)parameterValues;
- (VVCarrierParameters)initWithService:(id)a3;
- (id)parameterValueForKey:(id)a3;
- (void)setParameterValues:(id)a3;
@end

@implementation VVCarrierParameters

- (VVCarrierParameters)initWithService:(id)a3
{
  id v4 = a3;
  v72.receiver = self;
  v72.super_class = (Class)VVCarrierParameters;
  v57 = [(VVCarrierParameters *)&v72 init];
  if (v57)
  {
    v5 = v57;
    v71 = v5;
    v58 = v4;
    v54 = v5;
    v60 = [v4 contextInfo];
    v59 = [v4 telephonyClient];
    v6 = +[NSMutableDictionary dictionary];
    v5->mambaID = (const char *)[v4 getServiceObjLogPrefix];
    p_mambaID = &v5->mambaID;
    v7 = [v60 context];
    CFStringRef v82 = @"com.apple.voicemail.imap";
    v8 = +[NSArray arrayWithObjects:&v82 count:1];
    id v70 = 0;
    v9 = [v59 context:v7 getCarrierBundleValue:v8 error:&v70];
    id v10 = v70;

    if (v10)
    {
      v11 = sub_100007194();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_10007FBE8();
      }
    }
    else if (v9)
    {
      [v6 addEntriesFromDictionary:v9];
    }

    v81[0] = @"com.apple.voicemail.imap";
    v81[1] = @"AllowedIMAPServers";
    v12 = +[NSArray arrayWithObjects:v81 count:2];
    v13 = [v60 context];
    id v69 = v10;
    v14 = [v59 context:v13 getCarrierBundleValue:v12 error:&v69];
    id v15 = v69;

    if (v15)
    {
      v16 = sub_100007194();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_10007FBE8();
      }
    }
    else if (v14)
    {
      [v6 addEntriesFromDictionary:v14];
    }

    v17 = [v60 context];
    CFStringRef v80 = @"VVMIgnoresIntlDataRoaming";
    v18 = +[NSArray arrayWithObjects:&v80 count:1];
    id v68 = v15;
    v19 = [v59 context:v17 getCarrierBundleValue:v18 error:&v68];
    id v20 = v68;

    if (v20)
    {
      v21 = sub_100007194();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_10007FBE8();
      }
    }
    else if (v19)
    {
      [v6 setObject:v19 forKey:@"VVMIgnoresIntlDataRoaming"];
    }

    v22 = [v60 context];
    CFStringRef v79 = @"VVMRetryIntervals";
    v23 = +[NSArray arrayWithObjects:&v79 count:1];
    id v67 = v20;
    v24 = [v59 context:v22 getCarrierBundleValue:v23 error:&v67];
    id v25 = v67;

    if (v25)
    {
      v26 = sub_100007194();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        sub_10007FBE8();
      }
    }
    else if (v24)
    {
      [v6 setObject:v24 forKey:@"VVMRetryIntervals"];
    }

    v27 = [v60 context];
    CFStringRef v78 = @"VVMDetachedStorageDisabled";
    v28 = +[NSArray arrayWithObjects:&v78 count:1];
    id v66 = v25;
    v29 = [v59 context:v27 getCarrierBundleValue:v28 error:&v66];
    id v30 = v66;

    if (v30)
    {
      v31 = sub_100007194();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        sub_10007FBE8();
      }
    }
    else if (v29)
    {
      [v6 setObject:v29 forKey:@"VVMDetachedStorageDisabled"];
    }

    v32 = [v60 context];
    CFStringRef v77 = @"VVMNotificationFallbackTimeout";
    v33 = +[NSArray arrayWithObjects:&v77 count:1];
    id v65 = v30;
    v34 = [v59 context:v32 getCarrierBundleValue:v33 error:&v65];
    id v55 = v65;

    if (v55)
    {
      v35 = sub_100007194();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        sub_10007FBE8();
      }
    }
    else if (v34)
    {
      [v6 setObject:v34 forKey:@"VVMNotificationFallbackTimeout"];
    }

    v36 = +[NSBundle bundleForClass:objc_opt_class()];
    v37 = [v36 pathForResource:@"CarrierParameters-Default" ofType:@"plist"];
    if (v37)
    {
      v38 = [objc_alloc((Class)NSDictionary) initWithContentsOfFile:v37];
      long long v63 = 0u;
      long long v64 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      v39 = [v38 allKeys];
      id v40 = [v39 countByEnumeratingWithState:&v61 objects:v76 count:16];
      if (v40)
      {
        uint64_t v41 = *(void *)v62;
        do
        {
          for (i = 0; i != v40; i = (char *)i + 1)
          {
            if (*(void *)v62 != v41) {
              objc_enumerationMutation(v39);
            }
            uint64_t v43 = *(void *)(*((void *)&v61 + 1) + 8 * i);
            v44 = [v6 objectForKeyedSubscript:v43];
            BOOL v45 = v44 == 0;

            if (v45)
            {
              v46 = [v38 objectForKeyedSubscript:v43];
              [v6 setObject:v46 forKeyedSubscript:v43];
            }
          }
          id v40 = [v39 countByEnumeratingWithState:&v61 objects:v76 count:16];
        }
        while (v40);
      }
    }
    else
    {
      v38 = sub_100007194();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        v47 = *p_mambaID;
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = v47;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = " ";
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "#I %s%sdefaultPath not found", buf, 0x16u);
      }
    }

    v48 = sub_100007194();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      v49 = *p_mambaID;
      v50 = [v58 contextInfo];
      *(_DWORD *)buf = 136315650;
      *(void *)&buf[4] = v49;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = " ";
      __int16 v74 = 2112;
      v75 = v50;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "#I %s%sInitialized CarrierParameters for context %@:", buf, 0x20u);
    }
    *(void *)buf = off_1000C1508;
    *(void *)&buf[8] = &v71;
    v75 = buf;
    logger::CFTypeRefLogger();
    sub_10000748C(buf);
    v51 = (NSDictionary *)[v6 copy];
    parameterValues = v54->_parameterValues;
    v54->_parameterValues = v51;

    id v4 = v58;
  }

  return v57;
}

- (id)parameterValueForKey:(id)a3
{
  v3 = [(NSDictionary *)self->_parameterValues objectForKeyedSubscript:a3];
  return v3;
}

- (NSDictionary)parameterValues
{
  return self->_parameterValues;
}

- (void)setParameterValues:(id)a3
{
}

- (void).cxx_destruct
{
}

@end