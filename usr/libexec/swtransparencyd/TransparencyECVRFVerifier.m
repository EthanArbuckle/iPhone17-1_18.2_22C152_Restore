@interface TransparencyECVRFVerifier
+ (BOOL)verifyMessage:(id)a3 output:(id)a4 proof:(id)a5 key:(id)a6 error:(id *)a7;
+ (BOOL)verifyMessage:(id)a3 salt:(id)a4 output:(id)a5 proof:(id)a6 key:(id)a7 error:(id *)a8;
- (BOOL)verifyMessage:(id)a3 output:(id)a4 proof:(id)a5 error:(id *)a6;
- (BOOL)verifyMessage:(id)a3 salt:(id)a4 output:(id)a5 proof:(id)a6 error:(id *)a7;
- (TransparencyECVRFVerifier)initWithKey:(id)a3;
- (int)vrfType;
@end

@implementation TransparencyECVRFVerifier

- (TransparencyECVRFVerifier)initWithKey:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TransparencyECVRFVerifier;
  v5 = [(TransparencyVRFVerifier *)&v11 initWithKey:v4];
  if (v5
    && (ccvrf_factory_irtfdraft03_default(),
        uint64_t v6 = ccvrf_sizeof_public_key(),
        [v4 vrfKey],
        v7 = objc_claimAutoreleasedReturnValue(),
        id v8 = [v7 length],
        v7,
        (id)v6 != v8))
  {
    v9 = 0;
  }
  else
  {
    v9 = v5;
  }

  return v9;
}

- (int)vrfType
{
  return 3;
}

- (BOOL)verifyMessage:(id)a3 output:(id)a4 proof:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [(TransparencyVRFVerifier *)self key];
  LOBYTE(a6) = +[TransparencyECVRFVerifier verifyMessage:v12 salt:0 output:v11 proof:v10 key:v13 error:a6];

  return (char)a6;
}

+ (BOOL)verifyMessage:(id)a3 output:(id)a4 proof:(id)a5 key:(id)a6 error:(id *)a7
{
  return +[TransparencyECVRFVerifier verifyMessage:a3 salt:0 output:a4 proof:a5 key:a6 error:a7];
}

- (BOOL)verifyMessage:(id)a3 salt:(id)a4 output:(id)a5 proof:(id)a6 error:(id *)a7
{
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = [(TransparencyVRFVerifier *)self key];
  LOBYTE(a7) = +[TransparencyECVRFVerifier verifyMessage:v15 salt:v14 output:v13 proof:v12 key:v16 error:a7];

  return (char)a7;
}

+ (BOOL)verifyMessage:(id)a3 salt:(id)a4 output:(id)a5 proof:(id)a6 key:(id)a7 error:(id *)a8
{
  id v11 = a7;
  id v12 = a6;
  id v13 = +[TransparencyVRFVerifier saltMessage:a3 salt:a4];
  ccvrf_factory_irtfdraft03_default();
  id v14 = [v11 vrfKey];
  [v14 length];
  id v15 = [v11 vrfKey];

  id v16 = v15;
  [v16 bytes];
  [v13 length];
  id v17 = v13;
  [v17 bytes];
  [v12 length];
  id v18 = v12;
  [v18 bytes];

  uint64_t v19 = ccvrf_verify();
  if (v19)
  {
    if (a8)
    {
      *a8 = +[TransparencyError errorWithDomain:@"TransparencyErrorVerify", -2, @"ECVRF verification failed with result %d", v19 code description];
    }
    if (qword_10015B1A0 != -1) {
      dispatch_once(&qword_10015B1A0, &stru_1001360B0);
    }
    v20 = qword_10015B1A8;
    if (os_log_type_enabled((os_log_t)qword_10015B1A8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v24 = v19;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "VRF verification failed with result %d", buf, 8u);
    }
  }

  return v19 == 0;
}

@end