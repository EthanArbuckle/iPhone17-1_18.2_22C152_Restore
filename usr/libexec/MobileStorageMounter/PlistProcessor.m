@interface PlistProcessor
+ (id)sharedPlistProcessor;
- (BOOL)jobIsManagedByMSM:(id)a3;
- (BOOL)verifyPlist:(id)a3 forMountPoint:(id)a4 withError:(id *)a5;
- (id)copyAndFixPlist:(id)a3 forMountPoint:(id)a4 withError:(id *)a5;
- (id)copyPlistWithMSMKeys:(id)a3 withError:(id *)a4;
- (void)scanPlistsAtPath:(id)a3 execBlock:(id)a4;
@end

@implementation PlistProcessor

+ (id)sharedPlistProcessor
{
  if (qword_100034880 != -1) {
    dispatch_once(&qword_100034880, &stru_10002CD98);
  }
  v2 = (void *)qword_100034878;

  return v2;
}

- (void)scanPlistsAtPath:(id)a3 execBlock:(id)a4
{
  id v5 = a3;
  v6 = (uint64_t (**)(id, void *, void))a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v7 = +[NSFileManager defaultManager];
  v8 = [v7 enumeratorAtPath:v5];

  id obj = v8;
  id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        v14 = [v5 stringByAppendingPathComponent:v13];
        v15 = +[NSDictionary dictionaryWithContentsOfFile:v14];
        if (v15 && (v6[2](v6, v15, v13) & 1) == 0)
        {

          goto LABEL_12;
        }
      }
      id v10 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_12:
}

- (id)copyAndFixPlist:(id)a3 forMountPoint:(id)a4 withError:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v12 = v8;
  if (!v7 || !v8)
  {
    sub_100013024((uint64_t)"-[PlistProcessor copyAndFixPlist:forMountPoint:withError:]", 107, -3, 0, @"Invalid input(s).", v9, v10, v11, v45);
    id v38 = (id)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    v46 = 0;
    id v37 = 0;
    id v28 = 0;
    long long v18 = 0;
    v36 = 0;
    goto LABEL_15;
  }
  uint64_t v13 = sub_100007CBC(v8);
  v14 = sub_100007CBC(@"/private/var/personalized_factory");
  unsigned __int8 v15 = [v13 hasPrefix:v14];

  v46 = v13;
  if ((v15 & 1) == 0)
  {
    id v39 = v7;
    v34 = 0;
    id v38 = 0;
    v36 = 0;
    goto LABEL_19;
  }
  uint64_t v16 = [v7 objectForKey:@"Label"];
  long long v17 = sub_1000083BC(v7);
  if (!v17)
  {
    v36 = (void *)v16;
    id v37 = [v7 objectForKey:@"XPCServiceName"];

    if (!v37)
    {
      sub_100013024((uint64_t)"-[PlistProcessor copyAndFixPlist:forMountPoint:withError:]", 127, -2, 0, @"Missing program arguments.", v40, v41, v42, v45);
      id v38 = (id)objc_claimAutoreleasedReturnValue();
      v23 = 0;
      id v28 = 0;
      long long v18 = 0;
      goto LABEL_15;
    }
    id v39 = v7;
    v34 = 0;
    id v38 = 0;
LABEL_19:
    long long v18 = 0;
    id v28 = 0;
    id v37 = 0;
    v23 = 0;
    goto LABEL_28;
  }
  long long v18 = v17;
  long long v19 = [v17 objectAtIndex:0];
  v23 = v19;
  if (v19)
  {
    if ([v19 hasPrefix:@"/Developer"])
    {
      v27 = [v23 componentsSeparatedByString:@"/"];
      id v28 = [v27 mutableCopy];

      v29 = [v28 objectAtIndex:0];
      unsigned int v30 = [v29 isEqualToString:&stru_10002F6E8];

      if (v30) {
        [v28 removeObjectAtIndex:0];
      }
      [v28 replaceObjectAtIndex:0 withObject:v13];
      v34 = [v28 componentsJoinedByString:@"/"];
      if (v34)
      {
        id v35 = [v7 mutableCopy];
        [v18 replaceObjectAtIndex:0 withObject:v34];
        [v35 setObject:v18 forKey:@"ProgramArguments"];
        [v35 removeObjectForKey:@"Program"];
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
          sub_10001E014();
        }
        v36 = (void *)v16;
        id v37 = v35;
        id v38 = 0;
        if (!a5) {
          goto LABEL_27;
        }
      }
      else
      {
        v36 = (void *)v16;
        sub_100013024((uint64_t)"-[PlistProcessor copyAndFixPlist:forMountPoint:withError:]", 158, -2, 0, @"Failed to update program path %@.", v31, v32, v33, (uint64_t)v23);
        id v38 = (id)objc_claimAutoreleasedReturnValue();
        id v37 = 0;
        if (!a5) {
          goto LABEL_27;
        }
      }
      goto LABEL_16;
    }
    v36 = (void *)v16;
    sub_100013024((uint64_t)"-[PlistProcessor copyAndFixPlist:forMountPoint:withError:]", 144, -2, 0, @"Invalid program path: %@", v24, v25, v26, (uint64_t)v23);
  }
  else
  {
    v36 = (void *)v16;
    sub_100013024((uint64_t)"-[PlistProcessor copyAndFixPlist:forMountPoint:withError:]", 135, -2, 0, @"Invalid program arguments: %@", v20, v21, v22, (uint64_t)v18);
  }
  id v38 = (id)objc_claimAutoreleasedReturnValue();
  id v37 = 0;
  id v28 = 0;
LABEL_15:
  v34 = 0;
  if (!a5)
  {
LABEL_27:
    id v39 = v37;
    goto LABEL_28;
  }
LABEL_16:
  if (v37) {
    goto LABEL_27;
  }
  id v38 = v38;
  id v39 = 0;
  *a5 = v38;
LABEL_28:
  id v43 = v39;

  return v43;
}

- (id)copyPlistWithMSMKeys:(id)a3 withError:(id *)a4
{
  id v5 = a3;
  uint64_t v9 = v5;
  if (v5)
  {
    id v10 = [v5 mutableCopy];
    uint64_t v11 = [v9 objectForKey:@"_AdditionalProperties"];
    v12 = sub_100012728(v11);

    if (v12) {
      id v13 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:v11];
    }
    else {
      id v13 = objc_alloc_init((Class)NSMutableDictionary);
    }
    long long v19 = v13;
    if (v13)
    {
      CFStringRef v24 = @"ManagedByMobileStorageMounter";
      uint64_t v25 = &__kCFBooleanTrue;
      uint64_t v20 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
      [v19 setObject:v20 forKeyedSubscript:@"MobileStorageMounter"];

      [v10 setObject:v19 forKeyedSubscript:@"_AdditionalProperties"];
      id v18 = v10;
      long long v17 = 0;
      id v10 = v18;
      if (!a4) {
        goto LABEL_13;
      }
    }
    else
    {
      long long v17 = sub_100013024((uint64_t)"-[PlistProcessor copyPlistWithMSMKeys:withError:]", 208, -2, 0, @"Failed to allocate dictionary.", v14, v15, v16, v23);
      id v18 = 0;
      if (!a4) {
        goto LABEL_13;
      }
    }
  }
  else
  {
    long long v17 = sub_100013024((uint64_t)"-[PlistProcessor copyPlistWithMSMKeys:withError:]", 192, -2, 0, @"Invalid input.", v6, v7, v8, v23);
    id v18 = 0;
    id v10 = 0;
    uint64_t v11 = 0;
    long long v19 = 0;
    if (!a4) {
      goto LABEL_13;
    }
  }
  if (!v18) {
    *a4 = v17;
  }
LABEL_13:
  id v21 = v18;

  return v21;
}

- (BOOL)jobIsManagedByMSM:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (!v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_10001E090();
    }
    goto LABEL_22;
  }
  uint64_t v5 = [v3 objectForKeyedSubscript:@"Label"];
  if (!v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_10001E0D8();
    }
    goto LABEL_22;
  }
  uint64_t v6 = (void *)v5;
  uint64_t v7 = [v4 objectForKeyedSubscript:@"_AdditionalProperties"];
  uint64_t v8 = sub_100012728(v7);

  if (!v8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_10001E120();
    }

    goto LABEL_21;
  }
  uint64_t v9 = [v7 objectForKeyedSubscript:@"MobileStorageMounter"];
  id v10 = sub_100012728(v9);

  if (!v10)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_10001E1A8((uint64_t)v6, v14, v15, v16, v17, v18, v19, v20);
    }

    goto LABEL_20;
  }
  uint64_t v11 = [v9 objectForKeyedSubscript:@"ManagedByMobileStorageMounter"];
  v12 = sub_1000126BC(v11);

  if (!v12)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_10001E240((uint64_t)v6, v21, v22, v23, v24, v25, v26, v27);
    }

LABEL_20:
LABEL_21:

LABEL_22:
    unsigned __int8 v13 = 0;
    goto LABEL_23;
  }
  unsigned __int8 v13 = [v11 BOOLValue];

LABEL_23:
  return v13;
}

- (BOOL)verifyPlist:(id)a3 forMountPoint:(id)a4 withError:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v12 = v8;
  if (!v7 || !v8)
  {
    sub_100013024((uint64_t)"-[PlistProcessor verifyPlist:forMountPoint:withError:]", 282, -3, 0, @"Invalid input(s).", v9, v10, v11, v42);
    id v35 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v21 = 0;
    uint64_t v23 = 0;
    uint64_t v27 = 0;
    uint64_t v16 = 0;
    if (!a5) {
      goto LABEL_20;
    }
    goto LABEL_16;
  }
  uint64_t v16 = [v7 objectForKey:@"Label"];
  if (!v16)
  {
    sub_100013024((uint64_t)"-[PlistProcessor verifyPlist:forMountPoint:withError:]", 288, -2, 0, @"Failed to retrieve job label.", v13, v14, v15, v42);
    id v35 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v21 = 0;
    goto LABEL_15;
  }
  uint64_t v17 = sub_1000083BC(v7);
  uint64_t v21 = v17;
  if (!v17)
  {
    sub_100013024((uint64_t)"-[PlistProcessor verifyPlist:forMountPoint:withError:]", 294, -2, 0, @"Failed to retrieve program arguments.", v18, v19, v20, v42);
    id v35 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  uint64_t v22 = [v17 objectAtIndex:0];
  uint64_t v23 = sub_100007CBC(v22);

  if (!v23)
  {
    id v37 = [v21 objectAtIndex:0];
    sub_100013024((uint64_t)"-[PlistProcessor verifyPlist:forMountPoint:withError:]", 300, -2, 0, @"Failed to normalize %@.", v38, v39, v40, (uint64_t)v37);
    id v35 = (id)objc_claimAutoreleasedReturnValue();

LABEL_15:
    uint64_t v23 = 0;
    uint64_t v27 = 0;
    if (!a5)
    {
LABEL_20:
      BOOL v36 = 0;
      goto LABEL_21;
    }
LABEL_16:
    id v35 = v35;
    BOOL v36 = 0;
    *a5 = v35;
    goto LABEL_21;
  }
  uint64_t v27 = sub_100007CBC(v12);
  if (!v27)
  {
    sub_100013024((uint64_t)"-[PlistProcessor verifyPlist:forMountPoint:withError:]", 306, -2, 0, @"Failed to normalize %@.", v24, v25, v26, (uint64_t)v12);
    goto LABEL_19;
  }
  id v28 = sub_100007CBC(@"/Developer");
  unsigned int v29 = [v27 hasPrefix:v28];

  if (v29)
  {
    unsigned int v30 = sub_100007CBC(@"/Developer");
    unsigned __int8 v31 = [v23 hasPrefix:v30];

    if ((v31 & 1) == 0)
    {
      sub_100013024((uint64_t)"-[PlistProcessor verifyPlist:forMountPoint:withError:]", 315, -2, 0, @"Invalid program path: %@", v32, v33, v34, (uint64_t)v23);
LABEL_19:
      id v35 = (id)objc_claimAutoreleasedReturnValue();
      if (!a5) {
        goto LABEL_20;
      }
      goto LABEL_16;
    }
  }
  id v35 = 0;
  BOOL v36 = 1;
LABEL_21:

  return v36;
}

@end