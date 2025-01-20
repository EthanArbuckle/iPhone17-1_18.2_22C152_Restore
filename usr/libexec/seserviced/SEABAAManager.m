@interface SEABAAManager
+ (id)sharedManager;
- (id)PerformSEABAAWithAttestation:(id)a3 casdCertificate:(id)a4 nonce:(id)a5 OIDs:(id)a6 validityInterval:(id)a7 error:(id *)a8;
@end

@implementation SEABAAManager

+ (id)sharedManager
{
  if (qword_10045CC80 != -1) {
    dispatch_once(&qword_10045CC80, &stru_10040C1D0);
  }
  v2 = (void *)qword_10045CC78;

  return v2;
}

- (id)PerformSEABAAWithAttestation:(id)a3 casdCertificate:(id)a4 nonce:(id)a5 OIDs:(id)a6 validityInterval:(id)a7 error:(id *)a8
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a3;
  v18 = SESDefaultLogObject();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "", buf, 2u);
  }

  id v62 = v17;
  sub_100030FF8((uint64_t)SESSignatureFixer, &v62);
  id v19 = v62;

  *(void *)buf = 0;
  v57 = buf;
  uint64_t v58 = 0x3032000000;
  v59 = sub_1000140B0;
  v60 = sub_1000140C0;
  id v61 = 0;
  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x3032000000;
  v53 = sub_1000140B0;
  v54 = sub_1000140C0;
  id v55 = 0;
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x2020000000;
  char v49 = 0;
  uint64_t v41 = 0;
  v42 = (os_unfair_lock_s *)&v41;
  uint64_t v43 = 0x2810000000;
  v44 = &unk_1003D5B51;
  int v45 = 0;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_1000140C8;
  v35[3] = &unk_10040C1F8;
  v37 = &v41;
  v38 = &v46;
  v39 = &v50;
  v40 = buf;
  v20 = dispatch_semaphore_create(0);
  v36 = v20;
  sub_100014270((uint64_t)self, v19, v13, v14, v15, v16, v35);
  dispatch_time_t v21 = dispatch_time(0, 279000000000);
  if (dispatch_semaphore_wait(v20, v21))
  {
    os_unfair_lock_lock(v42 + 8);
    if (!*((unsigned char *)v47 + 24))
    {
      v22 = SESDefaultLogObject();
      uint64_t v23 = SESCreateAndLogError();
      v24 = (void *)v51[5];
      v51[5] = v23;

      *((unsigned char *)v47 + 24) = 1;
    }
    os_unfair_lock_unlock(v42 + 8);
  }
  if (v51[5] && SESInternalVariant())
  {
    id v25 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.seserviced"];
    if ([v25 BOOLForKey:@"debug.allow.cert.failure"])
    {
      v26 = [@"DEAD" hexStringAsData];
      v27 = [@"DEAD" hexStringAsData];
      uint64_t v28 = sub_1000141D8((uint64_t)SEABAAResponse, v26, v27);
      v29 = (void *)*((void *)v57 + 5);
      *((void *)v57 + 5) = v28;

      v30 = (void *)v51[5];
      v51[5] = 0;
    }
  }
  v31 = (void *)*((void *)v57 + 5);
  if (a8 && !v31)
  {
    SESEnsureError();
    *a8 = (id)objc_claimAutoreleasedReturnValue();
    v31 = (void *)*((void *)v57 + 5);
  }
  id v32 = v31;

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v50, 8);

  _Block_object_dispose(buf, 8);

  return v32;
}

@end