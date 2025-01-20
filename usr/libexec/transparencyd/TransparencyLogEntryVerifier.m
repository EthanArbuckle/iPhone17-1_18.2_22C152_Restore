@interface TransparencyLogEntryVerifier
- (BOOL)verifyInclusionOfLogLeaf:(id)a3 position:(unint64_t)a4 treeSize:(unint64_t)a5 treeHead:(id)a6 hashPath:(id)a7 error:(id *)a8;
- (TransparencyLogEntryVerifier)initWithTrustedKeyStore:(id)a3;
- (TransparencyTrustedKeyStore)trustedKeyStore;
- (unint64_t)verifyLogEntryWithLogLeaf:(id)a3 position:(unint64_t)a4 hashesToRoot:(id)a5 signedLogHead:(id)a6 error:(id *)a7;
- (void)setTrustedKeyStore:(id)a3;
@end

@implementation TransparencyLogEntryVerifier

- (TransparencyLogEntryVerifier)initWithTrustedKeyStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TransparencyLogEntryVerifier;
  v6 = [(TransparencyLogEntryVerifier *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_trustedKeyStore, a3);
  }

  return v7;
}

- (BOOL)verifyInclusionOfLogLeaf:(id)a3 position:(unint64_t)a4 treeSize:(unint64_t)a5 treeHead:(id)a6 hashPath:(id)a7 error:(id *)a8
{
  id v13 = a3;
  id v14 = a6;
  id v15 = a7;
  if (a4 >= a5)
  {
    if (a8)
    {
      *a8 = +[TransparencyError errorWithDomain:@"TransparencyErrorVerify" code:-49 description:@"leaf index is too big for tree size"];
    }
    if (qword_10032F268 != -1) {
      dispatch_once(&qword_10032F268, &stru_1002C8CB8);
    }
    v30 = qword_10032F270;
    if (os_log_type_enabled((os_log_t)qword_10032F270, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "leaf index is too big for tree size", buf, 2u);
    }
    goto LABEL_34;
  }
  v43 = a8;
  buf[0] = 0;
  char v50 = 1;
  v16 = +[NSMutableData dataWithBytes:buf length:1];
  id v45 = v13;
  [v16 appendData:v13];
  v41 = v16;
  unint64_t v17 = a5 - 1;
  v40 = (void *)SecSHA256DigestCreateFromData();
  id v18 = [v40 copy];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v44 = v15;
  id v19 = v15;
  id v20 = [v19 countByEnumeratingWithState:&v46 objects:v55 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v47;
    while (2)
    {
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        v24 = v18;
        if (*(void *)v47 != v22) {
          objc_enumerationMutation(v19);
        }
        if (!v17)
        {

          goto LABEL_26;
        }
        uint64_t v25 = *(void *)(*((void *)&v46 + 1) + 8 * i);
        v26 = +[NSMutableData dataWithBytes:&v50 length:1];
        v27 = v26;
        if ((a4 & 1) != 0 || a4 == v17)
        {
          [v26 appendData:v25];
          [v27 appendData:v24];
          id v18 = (id)SecSHA256DigestCreateFromData();
          if (a4 && (a4 & 1) == 0)
          {
            do
            {
              unint64_t v28 = a4;
              a4 >>= 1;
              v17 >>= 1;
            }
            while (v28 >= 2 && (v28 & 2) == 0);
          }
        }
        else
        {
          [v26 appendData:v24];
          [v27 appendData:v25];
          id v18 = (id)SecSHA256DigestCreateFromData();
        }
        a4 >>= 1;
        v17 >>= 1;
      }
      id v21 = [v19 countByEnumeratingWithState:&v46 objects:v55 count:16];
      if (v21) {
        continue;
      }
      break;
    }
  }

  if (v17)
  {

    id v13 = v45;
    v29 = v43;
LABEL_28:
    if (v29)
    {
      v33 = [v13 kt_hexString];
      v34 = [v14 kt_hexString];
      id *v29 = +[TransparencyError errorWithDomain:@"TransparencyErrorVerify", -45, @"failed to verify inclusion proof for leaf (%@) in head (%@)", v33, v34 code description];
    }
    if (qword_10032F268 != -1) {
      dispatch_once(&qword_10032F268, &stru_1002C8CD8);
    }
    id v15 = v44;
    v35 = (void *)qword_10032F270;
    if (os_log_type_enabled((os_log_t)qword_10032F270, OS_LOG_TYPE_ERROR))
    {
      v36 = v35;
      v37 = [v13 kt_hexString];
      v38 = [v14 kt_hexString];
      *(_DWORD *)buf = 138412546;
      v52 = v37;
      __int16 v53 = 2112;
      v54 = v38;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "failed to verify inclusion proof for leaf (%@) in head (%@)", buf, 0x16u);
    }
LABEL_34:
    BOOL v32 = 0;
    goto LABEL_35;
  }
  v24 = v18;
LABEL_26:
  id v13 = v45;
  v29 = v43;
  unsigned __int8 v31 = [v24 isEqualToData:v14];

  if ((v31 & 1) == 0) {
    goto LABEL_28;
  }
  BOOL v32 = 1;
  id v15 = v44;
LABEL_35:

  return v32;
}

- (unint64_t)verifyLogEntryWithLogLeaf:(id)a3 position:(unint64_t)a4 hashesToRoot:(id)a5 signedLogHead:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  unint64_t v15 = (unint64_t)[v14 verifyWithError:a7];
  if (v15 == 1)
  {
    v16 = [v14 parsedLogHead];
    id v17 = [v16 logSize];
    id v18 = [v14 parsedLogHead];
    id v19 = [v18 logHeadHash];
    unsigned __int8 v20 = [(TransparencyLogEntryVerifier *)self verifyInclusionOfLogLeaf:v12 position:a4 treeSize:v17 treeHead:v19 hashPath:v13 error:a7];

    if (v20)
    {
      unint64_t v15 = 1;
    }
    else
    {
      if (a7)
      {
        *a7 = +[TransparencyError errorWithDomain:@"TransparencyErrorVerify" code:-44 underlyingError:*a7 description:@"failed to verify inclusion proof for log leaf in log head"];
      }
      if (qword_10032F268 != -1) {
        dispatch_once(&qword_10032F268, &stru_1002C8CF8);
      }
      id v21 = qword_10032F270;
      if (os_log_type_enabled((os_log_t)qword_10032F270, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v23 = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "failed to verify inclusion proof for log leaf in log head", v23, 2u);
      }
      unint64_t v15 = 0;
    }
  }

  return v15;
}

- (TransparencyTrustedKeyStore)trustedKeyStore
{
  return (TransparencyTrustedKeyStore *)objc_getProperty(self, a2, 8, 1);
}

- (void)setTrustedKeyStore:(id)a3
{
}

- (void).cxx_destruct
{
}

@end