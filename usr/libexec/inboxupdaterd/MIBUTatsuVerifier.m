@interface MIBUTatsuVerifier
+ (BOOL)verifyTatsuEntitlement:(id)a3 error:(id *)a4;
+ (id)_copyDeviceTreeInt:(id)a3 key:(id)a4 defaultValue:(id)a5;
+ (id)_copyDeviceTreeProperty:(id)a3 key:(id)a4;
+ (id)apNonce;
+ (id)sepNonce;
+ (id)sikaFuse;
@end

@implementation MIBUTatsuVerifier

+ (id)apNonce
{
  uint64_t v2 = MGCopyAnswer();
  v3 = (void *)qword_10006C898;
  qword_10006C898 = v2;

  v4 = (void *)qword_10006C898;

  return v4;
}

+ (id)sepNonce
{
  uint64_t v2 = +[NSData generateRandomBytesOfSize:20];
  v3 = (void *)qword_10006C8A0;
  qword_10006C8A0 = v2;

  v4 = (void *)qword_10006C8A0;

  return v4;
}

+ (id)sikaFuse
{
  v3 = [@"IODeviceTree" stringByAppendingString:@":/chosen"];
  id v4 = [a1 _copyDeviceTreeInt:v3 key:@"esdm-fuses" defaultValue:0];

  return v4;
}

+ (BOOL)verifyTatsuEntitlement:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v68 = 0;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  unsigned int v39 = 0;
  long long v37 = off_1000598B8;
  uint64_t v38 = 0;
  if (os_variant_has_internal_content())
  {
    v6 = +[MIBUTestPreferences sharedInstance];
    unsigned __int8 v7 = [v6 useLiveTatsu];

    if ((v7 & 1) == 0)
    {
      if (qword_10006C958 != -1) {
        dispatch_once(&qword_10006C958, &stru_1000598D0);
      }
      v14 = qword_10006C950;
      if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Faking Tatsu entitlement verification, return success", buf, 2u);
      }
      goto LABEL_10;
    }
  }
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_1000598F0);
  }
  v8 = qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Verifying Tatsu entitlement...", buf, 2u);
  }
  id v9 = v5;
  [v9 bytes];
  [v9 length];
  uint64_t inited = Img4DecodeInitManifest();
  if (inited)
  {
    uint64_t v15 = inited;
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_100059910);
    }
    v16 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_10003E9D0(v15, v16, v17, v18, v19, v20, v21, v22);
    }
    sub_1000102B8(a4, 100663297, 0, @"Failed to parse tatsu ticket as Img4 manifest; status: %d",
      v19,
      v20,
      v21,
      v22,
      v15);
    goto LABEL_32;
  }
  uint64_t v11 = Img4DecodePerformManifestTrustEvaluationWithCallbacks();
  if (v11)
  {
    uint64_t v23 = v11;
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_100059930);
    }
    v24 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_10003E964(v23, v24, v25, v26, v27, v28, v29, v30);
    }
    v31 = @"Failed to verify tatsu ticket";
    goto LABEL_31;
  }
  if (v39 != 511)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_100059950);
    }
    v32 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_10003E8F4((uint64_t)&v39, v32, v33, v34, v27, v28, v29, v30);
    }
    uint64_t v35 = v39;
    v31 = @"Tatsu ticket failed verification, verify flags are 0x%x";
LABEL_31:
    sub_1000102B8(a4, 100663297, 0, v31, v27, v28, v29, v30, v35);
LABEL_32:
    BOOL v12 = 0;
    goto LABEL_11;
  }
LABEL_10:
  BOOL v12 = 1;
LABEL_11:

  return v12;
}

+ (id)_copyDeviceTreeProperty:(id)a3 key:(id)a4
{
  id v5 = (__CFString *)a4;
  v6 = v5;
  CFTypeRef CFProperty = 0;
  if (a3 && v5)
  {
    io_registry_entry_t v8 = IORegistryEntryFromPath(kIOMainPortDefault, (const char *)[a3 fileSystemRepresentation]);
    if (v8)
    {
      io_object_t v9 = v8;
      CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v8, v6, 0, 0);
      IOObjectRelease(v9);
    }
    else
    {
      if (qword_10006C958 != -1) {
        dispatch_once(&qword_10006C958, &stru_100059970);
      }
      v10 = qword_10006C950;
      if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)BOOL v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "entry == MACH_PORT_NULL", v12, 2u);
      }
      CFTypeRef CFProperty = 0;
    }
  }

  return (id)CFProperty;
}

+ (id)_copyDeviceTreeInt:(id)a3 key:(id)a4 defaultValue:(id)a5
{
  id v8 = a5;
  io_object_t v9 = v8;
  id v10 = 0;
  unsigned int v13 = 0;
  if (!a3) {
    goto LABEL_6;
  }
  uint64_t v11 = v8;
  if (a4)
  {
    id v10 = [a1 _copyDeviceTreeProperty:a3 key:a4];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v10 length] == (id)4)
    {
      [v10 getBytes:&v13 length:4];
      uint64_t v11 = +[NSNumber numberWithInt:v13];

      goto LABEL_7;
    }
LABEL_6:
    uint64_t v11 = v9;
  }
LABEL_7:

  return v11;
}

@end