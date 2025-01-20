@interface NRDUpdateBrainLoader
+ (BOOL)isBrainLoaded;
+ (id)brainAtPath:(id)a3 delegate:(id)a4 error:(id *)a5;
@end

@implementation NRDUpdateBrainLoader

+ (id)brainAtPath:(id)a3 delegate:(id)a4 error:(id *)a5
{
  if (!load_trust_cache_at_path((const char *)objc_msgSend(objc_msgSend(a3, "stringByAppendingPathComponent:", @".TrustCache"), "fileSystemRepresentation"), 0))
  {
    if (a5)
    {
      NSErrorUserInfoKey v22 = NSDebugDescriptionErrorKey;
      CFStringRef v23 = @"trust cache load failed";
      v15 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"NRDUpdateErrorDomain", 100, +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1]);
LABEL_16:
      v10 = 0;
      *a5 = v15;
      return v10;
    }
    return 0;
  }
  id v8 = [a3 stringByAppendingPathComponent:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@.xpc", @"com.apple.NRD.UpdateBrainService"];
  if (![+[NSFileManager defaultManager] fileExistsAtPath:v8])
  {
    if (a5)
    {
      NSErrorUserInfoKey v24 = NSDebugDescriptionErrorKey;
      CFStringRef v25 = @"xpc bundle does not exist";
      v15 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 2, +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1]);
      goto LABEL_16;
    }
    return 0;
  }
  v9 = nrdSharedLogger();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Loading NeRD update brain bundle at %{public}@", (uint8_t *)&buf, 0xCu);
  }
  [v8 fileSystemRepresentation];
  xpc_add_bundle();
  isLoaded = 1;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v27 = 0x3052000000;
  v28 = __Block_byref_object_copy__0;
  v29 = __Block_byref_object_dispose__0;
  uint64_t v30 = 0;
  v10 = [[NRDUpdateBrainClientImpl alloc] initWithDelegate:a4];
  v11 = v10;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = __51__NRDUpdateBrainLoader_brainAtPath_delegate_error___block_invoke;
  v17[3] = &unk_1000189A0;
  v17[4] = &v18;
  v17[5] = &buf;
  [(NRDUpdateBrainClientImpl *)v10 ping:v17];
  if (!*((unsigned char *)v19 + 24)) {
    v10 = 0;
  }
  uint64_t v12 = *((void *)&buf + 1);
  v13 = *(void **)(*((void *)&buf + 1) + 40);
  if (v13)
  {
    if (a5)
    {
      *a5 = v13;
      v13 = *(void **)(v12 + 40);
    }
    id v14 = v13;
  }
  _Block_object_dispose(&buf, 8);
  _Block_object_dispose(&v18, 8);
  return v10;
}

void *__51__NRDUpdateBrainLoader_brainAtPath_delegate_error___block_invoke(void *result, void *a2)
{
  v2 = result;
  if (a2)
  {
    result = [a2 copy];
    *(void *)(*(void *)(v2[5] + 8) + 40) = result;
  }
  else
  {
    *(unsigned char *)(*(void *)(result[4] + 8) + 24) = 1;
  }
  return result;
}

+ (BOOL)isBrainLoaded
{
  return isLoaded;
}

@end