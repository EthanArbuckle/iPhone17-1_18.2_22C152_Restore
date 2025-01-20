@interface KTVerifyPendingSignaturesOperation
- (BOOL)verifyHeadsWithPendingSignatures:(id)a3 error:(id *)a4;
- (BOOL)verifySMTsWithPendingSignatures:(id)a3 error:(id *)a4;
- (KTOperationDependencies)deps;
- (KTVerifyPendingSignaturesOperation)initWithDependencies:(id)a3 opId:(id)a4;
- (NSMutableDictionary)errors;
- (NSMutableDictionary)failedSigs;
- (NSOperation)finishedOp;
- (NSUUID)backgroundOpId;
- (void)groupStart;
- (void)setBackgroundOpId:(id)a3;
- (void)setDeps:(id)a3;
- (void)setErrors:(id)a3;
- (void)setFailedSigs:(id)a3;
- (void)setFinishedOp:(id)a3;
@end

@implementation KTVerifyPendingSignaturesOperation

- (KTVerifyPendingSignaturesOperation)initWithDependencies:(id)a3 opId:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)KTVerifyPendingSignaturesOperation;
  v9 = [(KTGroupOperation *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_deps, a3);
    [(KTVerifyPendingSignaturesOperation *)v10 setBackgroundOpId:v8];
    v11 = +[NSMutableDictionary dictionary];
    [(KTVerifyPendingSignaturesOperation *)v10 setErrors:v11];

    v12 = +[NSMutableDictionary dictionary];
    [(KTVerifyPendingSignaturesOperation *)v10 setFailedSigs:v12];

    [(KTGroupOperation *)v10 setName:@"Signature"];
  }

  return v10;
}

- (void)groupStart
{
  if (qword_1003266A0 != -1) {
    dispatch_once(&qword_1003266A0, &stru_1002B73D0);
  }
  v3 = qword_1003266A8;
  if (os_log_type_enabled((os_log_t)qword_1003266A8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "VerifyPendingSignatures: start", buf, 2u);
  }
  uint64_t v4 = kKTApplicationIdentifierIDS;
  id v83 = 0;
  unsigned __int8 v5 = [(KTVerifyPendingSignaturesOperation *)self verifySMTsWithPendingSignatures:kKTApplicationIdentifierIDS error:&v83];
  id v6 = v83;
  if ((v5 & 1) == 0)
  {
    if (qword_1003266A0 != -1) {
      dispatch_once(&qword_1003266A0, &stru_1002B73F0);
    }
    id v7 = qword_1003266A8;
    if (os_log_type_enabled((os_log_t)qword_1003266A8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v89 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Verify pending IDS SMT signatures failed: %@", buf, 0xCu);
    }
    id v8 = +[NSString stringWithFormat:@"%@-SMTs", v4];
    v9 = [(KTVerifyPendingSignaturesOperation *)self errors];
    [v9 setObject:v6 forKeyedSubscript:v8];

    id v6 = 0;
  }
  id v82 = v6;
  unsigned __int8 v10 = [(KTVerifyPendingSignaturesOperation *)self verifyHeadsWithPendingSignatures:v4 error:&v82];
  id v11 = v82;

  if ((v10 & 1) == 0)
  {
    if (qword_1003266A0 != -1) {
      dispatch_once(&qword_1003266A0, &stru_1002B7410);
    }
    v12 = qword_1003266A8;
    if (os_log_type_enabled((os_log_t)qword_1003266A8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v89 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Verify pending IDS Head signatures failed: %@", buf, 0xCu);
    }
    v13 = +[NSString stringWithFormat:@"%@-STHs", v4];
    objc_super v14 = [(KTVerifyPendingSignaturesOperation *)self errors];
    [v14 setObject:v11 forKeyedSubscript:v13];

    id v11 = 0;
  }
  uint64_t v15 = kKTApplicationIdentifierTLT;
  id v81 = v11;
  unsigned __int8 v16 = [(KTVerifyPendingSignaturesOperation *)self verifyHeadsWithPendingSignatures:kKTApplicationIdentifierTLT error:&v81];
  id v17 = v81;

  if ((v16 & 1) == 0)
  {
    if (qword_1003266A0 != -1) {
      dispatch_once(&qword_1003266A0, &stru_1002B7430);
    }
    v18 = qword_1003266A8;
    if (os_log_type_enabled((os_log_t)qword_1003266A8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v89 = v17;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Verify pending IDS Head signatures failed: %@", buf, 0xCu);
    }
    v19 = [(KTVerifyPendingSignaturesOperation *)self errors];
    [v19 setObject:v17 forKeyedSubscript:v15];

    id v17 = 0;
  }
  uint64_t v20 = kKTApplicationIdentifierIDSMultiplex;
  id v80 = v17;
  unsigned __int8 v21 = [(KTVerifyPendingSignaturesOperation *)self verifySMTsWithPendingSignatures:kKTApplicationIdentifierIDSMultiplex error:&v80];
  id v22 = v80;

  if ((v21 & 1) == 0)
  {
    if (qword_1003266A0 != -1) {
      dispatch_once(&qword_1003266A0, &stru_1002B7450);
    }
    v23 = qword_1003266A8;
    if (os_log_type_enabled((os_log_t)qword_1003266A8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v89 = v22;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Verify pending MP SMT signatures failed: %@", buf, 0xCu);
    }

    id v22 = 0;
  }
  id v79 = v22;
  unsigned __int8 v24 = [(KTVerifyPendingSignaturesOperation *)self verifyHeadsWithPendingSignatures:v20 error:&v79];
  id v25 = v79;

  if ((v24 & 1) == 0)
  {
    if (qword_1003266A0 != -1) {
      dispatch_once(&qword_1003266A0, &stru_1002B7470);
    }
    v26 = qword_1003266A8;
    if (os_log_type_enabled((os_log_t)qword_1003266A8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v89 = v25;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Verify pending MP Head signatures failed: %@", buf, 0xCu);
    }

    id v25 = 0;
  }
  uint64_t v27 = kKTApplicationIdentifierIDSFaceTime;
  id v78 = v25;
  unsigned __int8 v28 = [(KTVerifyPendingSignaturesOperation *)self verifySMTsWithPendingSignatures:kKTApplicationIdentifierIDSFaceTime error:&v78];
  id v29 = v78;

  if ((v28 & 1) == 0)
  {
    if (qword_1003266A0 != -1) {
      dispatch_once(&qword_1003266A0, &stru_1002B7490);
    }
    v30 = qword_1003266A8;
    if (os_log_type_enabled((os_log_t)qword_1003266A8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v89 = v29;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Verify pending FT SMT signatures failed: %@", buf, 0xCu);
    }

    id v29 = 0;
  }
  id v77 = v29;
  unsigned __int8 v31 = [(KTVerifyPendingSignaturesOperation *)self verifyHeadsWithPendingSignatures:v27 error:&v77];
  id v32 = v77;

  if ((v31 & 1) == 0)
  {
    if (qword_1003266A0 != -1) {
      dispatch_once(&qword_1003266A0, &stru_1002B74B0);
    }
    v33 = qword_1003266A8;
    if (os_log_type_enabled((os_log_t)qword_1003266A8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v89 = v32;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "Verify pending FT Head signatures failed: %@", buf, 0xCu);
    }

    id v32 = 0;
  }
  v34 = [(KTVerifyPendingSignaturesOperation *)self errors];
  id v35 = [v34 count];

  if (v35)
  {
    id v66 = v32;
    v36 = [(KTVerifyPendingSignaturesOperation *)self errors];
    v37 = [v36 allKeys];

    v65 = v37;
    v38 = [v37 componentsJoinedByString:@","];
    uint64_t v39 = +[NSString stringWithFormat:@"Pending signatures failed for applications: %@", v38];

    v86[0] = NSMultipleUnderlyingErrorsKey;
    v40 = [(KTVerifyPendingSignaturesOperation *)self errors];
    v41 = [v40 allValues];
    v86[1] = NSLocalizedDescriptionKey;
    v87[0] = v41;
    v64 = (void *)v39;
    v87[1] = v39;
    uint64_t v42 = +[NSDictionary dictionaryWithObjects:v87 forKeys:v86 count:2];

    v63 = (void *)v42;
    v43 = +[NSError errorWithDomain:@"TransparencyErrorVerify" code:-384 userInfo:v42];
    [(KTResultOperation *)self setError:v43];

    v44 = +[NSMutableString string];
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    v68 = self;
    id obj = [(KTVerifyPendingSignaturesOperation *)self failedSigs];
    id v45 = [obj countByEnumeratingWithState:&v73 objects:v85 count:16];
    if (v45)
    {
      id v46 = v45;
      uint64_t v47 = *(void *)v74;
      do
      {
        for (i = 0; i != v46; i = (char *)i + 1)
        {
          if (*(void *)v74 != v47) {
            objc_enumerationMutation(obj);
          }
          uint64_t v49 = *(void *)(*((void *)&v73 + 1) + 8 * i);
          [v44 appendFormat:@"%@:", v49];
          long long v71 = 0u;
          long long v72 = 0u;
          long long v69 = 0u;
          long long v70 = 0u;
          v50 = [(KTVerifyPendingSignaturesOperation *)v68 failedSigs];
          v51 = [v50 objectForKeyedSubscript:v49];

          id v52 = [v51 countByEnumeratingWithState:&v69 objects:v84 count:16];
          if (v52)
          {
            id v53 = v52;
            uint64_t v54 = *(void *)v70;
            do
            {
              for (j = 0; j != v53; j = (char *)j + 1)
              {
                if (*(void *)v70 != v54) {
                  objc_enumerationMutation(v51);
                }
                v56 = [*(id *)(*((void *)&v69 + 1) + 8 * (void)j) base64EncodedStringWithOptions:0];
                [v44 appendFormat:@"%@;", v56];
              }
              id v53 = [v51 countByEnumeratingWithState:&v69 objects:v84 count:16];
            }
            while (v53);
          }
        }
        id v46 = [obj countByEnumeratingWithState:&v73 objects:v85 count:16];
      }
      while (v46);
    }

    v57 = [(KTVerifyPendingSignaturesOperation *)v68 backgroundOpId];
    v58 = [(KTVerifyPendingSignaturesOperation *)v68 deps];
    v59 = [v58 smDataStore];
    v60 = [(KTVerifyPendingSignaturesOperation *)v68 name];
    v61 = [(KTResultOperation *)v68 error];
    +[KTBackgroundSystemValidationOperation addErrorToBackgroundOp:v57 smDataStore:v59 failureDataString:v44 type:v60 serverHint:0 failure:v61];

    id v32 = v66;
  }
  if (qword_1003266A0 != -1) {
    dispatch_once(&qword_1003266A0, &stru_1002B74D0);
  }
  v62 = qword_1003266A8;
  if (os_log_type_enabled((os_log_t)qword_1003266A8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEBUG, "VerifyPendingSignatures: end", buf, 2u);
  }
}

- (BOOL)verifySMTsWithPendingSignatures:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v34 = 0;
  id v35 = &v34;
  uint64_t v36 = 0x3032000000;
  v37 = sub_10000F0CC;
  v38 = sub_10000F0DC;
  id v39 = 0;
  id v7 = [(KTVerifyPendingSignaturesOperation *)self deps];
  id v8 = [v7 publicKeyStore];
  v9 = [v8 applicationPublicKeyStore:v6];

  unsigned __int8 v10 = [KTContextVerifier alloc];
  id v11 = [(KTVerifyPendingSignaturesOperation *)self deps];
  v12 = [v11 dataStore];
  v13 = [(KTContextVerifier *)v10 initWithApplicationKeyStore:v9 dataStore:v12 applicationID:v6];

  objc_super v14 = +[NSMutableArray array];
  uint64_t v15 = [(KTVerifyPendingSignaturesOperation *)self deps];
  unsigned __int8 v16 = [v15 dataStore];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10000F0E4;
  v27[3] = &unk_1002B7578;
  id v32 = &v34;
  id v33 = 0;
  id v17 = v13;
  unsigned __int8 v28 = v17;
  id v18 = v6;
  id v29 = v18;
  id v19 = v14;
  id v30 = v19;
  unsigned __int8 v31 = self;
  [v16 performForSMTsWithUnverifiedSignature:v18 error:&v33 block:v27];
  id v20 = v33;

  if (!v20)
  {
    id v22 = v35;
    if (a4)
    {
      v23 = (void *)v35[5];
      if (v23)
      {
        *a4 = v23;
        id v22 = v35;
      }
    }
    if (!v22[5])
    {
      BOOL v21 = 1;
      goto LABEL_11;
    }
    unsigned __int8 v24 = +[NSString stringWithFormat:@"%@-SMTs", v18];
    id v25 = [(KTVerifyPendingSignaturesOperation *)self failedSigs];
    [v25 setObject:v19 forKeyedSubscript:v24];

    goto LABEL_9;
  }
  if (!a4)
  {
LABEL_9:
    BOOL v21 = 0;
    goto LABEL_11;
  }
  BOOL v21 = 0;
  *a4 = v20;
LABEL_11:

  _Block_object_dispose(&v34, 8);
  return v21;
}

- (BOOL)verifyHeadsWithPendingSignatures:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x3032000000;
  v50 = sub_10000F0CC;
  v51 = sub_10000F0DC;
  id v52 = 0;
  id v6 = [(KTVerifyPendingSignaturesOperation *)self deps];
  id v7 = [v6 publicKeyStore];
  id v8 = [v7 applicationPublicKeyStore:v5];

  if ([v5 isEqual:kKTApplicationIdentifierTLT])
  {
    v9 = [(KTVerifyPendingSignaturesOperation *)self deps];
    unsigned __int8 v10 = [v9 publicKeyStore];
    uint64_t v11 = [v10 tltKeyStore];

    id v8 = (void *)v11;
  }
  v12 = [KTContextVerifier alloc];
  v13 = [(KTVerifyPendingSignaturesOperation *)self deps];
  objc_super v14 = [v13 dataStore];
  uint64_t v15 = [(KTContextVerifier *)v12 initWithApplicationKeyStore:v8 dataStore:v14 applicationID:v5];

  unsigned __int8 v16 = +[NSMutableArray array];
  id v17 = [(KTVerifyPendingSignaturesOperation *)self deps];
  id v18 = [v17 dataStore];
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_10000F984;
  v40[3] = &unk_1002B7578;
  id v45 = &v47;
  id v46 = 0;
  id v19 = v15;
  v41 = v19;
  id v20 = v5;
  id v42 = v20;
  id v21 = v16;
  id v43 = v21;
  v44 = self;
  [v18 performForSTHsWithUnverifiedSignature:v20 error:&v46 block:v40];
  id v22 = v46;

  v23 = (id *)(v48 + 5);
  id obj = (id)v48[5];
  unsigned __int8 v24 = [(KTContextVerifier *)v19 failExpiredSTHsForType:0 error:&obj];
  objc_storeStrong(v23, obj);
  if (!v24 || ![v24 count])
  {
    if (v22)
    {
      if (a4)
      {
        BOOL v31 = 0;
        *a4 = v22;
        goto LABEL_19;
      }
    }
    else
    {
      id v32 = v48;
      if (a4)
      {
        id v33 = (void *)v48[5];
        if (v33)
        {
          *a4 = v33;
          id v32 = v48;
        }
      }
      if (!v32[5])
      {
        BOOL v31 = 1;
        goto LABEL_19;
      }
      uint64_t v34 = +[NSString stringWithFormat:@"%@-STHs", v20];
      id v35 = [(KTVerifyPendingSignaturesOperation *)self failedSigs];
      [v35 setObject:v21 forKeyedSubscript:v34];
    }
    BOOL v31 = 0;
    goto LABEL_19;
  }
  v37 = v8;
  id v25 = +[NSString stringWithFormat:@"%@-STHs", v20];
  v26 = [(KTVerifyPendingSignaturesOperation *)self deps];
  uint64_t v27 = [v26 dataStore];
  unsigned __int8 v28 = [v27 failedHeadSignaturesWithRevisions:v24 application:v20];
  id v29 = [(KTVerifyPendingSignaturesOperation *)self failedSigs];
  [v29 setObject:v28 forKeyedSubscript:v25];

  if (a4)
  {
    id v30 = (void *)v48[5];
    if (v30) {
      *a4 = v30;
    }
  }

  BOOL v31 = 0;
  id v8 = v37;
LABEL_19:

  _Block_object_dispose(&v47, 8);
  return v31;
}

- (KTOperationDependencies)deps
{
  return (KTOperationDependencies *)objc_getProperty(self, a2, 120, 1);
}

- (void)setDeps:(id)a3
{
}

- (NSUUID)backgroundOpId
{
  return (NSUUID *)objc_getProperty(self, a2, 128, 1);
}

- (void)setBackgroundOpId:(id)a3
{
}

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 136, 1);
}

- (void)setFinishedOp:(id)a3
{
}

- (NSMutableDictionary)errors
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 144, 1);
}

- (void)setErrors:(id)a3
{
}

- (NSMutableDictionary)failedSigs
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 152, 1);
}

- (void)setFailedSigs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failedSigs, 0);
  objc_storeStrong((id *)&self->_errors, 0);
  objc_storeStrong((id *)&self->_finishedOp, 0);
  objc_storeStrong((id *)&self->_backgroundOpId, 0);

  objc_storeStrong((id *)&self->_deps, 0);
}

@end