@interface KTEnrollmentRegistrationSignature
- (BOOL)forceUpdate;
- (KTCheckIDSRegistrationInterface)idsRegistrationInterface;
- (KTEnrollmentRegistrationSignature)initWithDependencies:(id)a3 forceUpdate:(BOOL)a4 intendedState:(id)a5 errorState:(id)a6 idsRegistrationInterface:(id)a7 signatureTracker:(id)a8;
- (KTOperationDependencies)deps;
- (KTSignatureTracker)signatureTracker;
- (KTStateString)intendedState;
- (KTStateString)nextState;
- (void)groupStart;
- (void)recordKeyState:(int)a3 application:(id)a4;
- (void)setDeps:(id)a3;
- (void)setForceUpdate:(BOOL)a3;
- (void)setIdsRegistrationInterface:(id)a3;
- (void)setNextState:(id)a3;
- (void)setSignatureTracker:(id)a3;
@end

@implementation KTEnrollmentRegistrationSignature

- (KTEnrollmentRegistrationSignature)initWithDependencies:(id)a3 forceUpdate:(BOOL)a4 intendedState:(id)a5 errorState:(id)a6 idsRegistrationInterface:(id)a7 signatureTracker:(id)a8
{
  BOOL v11 = a4;
  id v13 = a3;
  id v14 = a5;
  id v15 = a7;
  id v16 = a8;
  v21.receiver = self;
  v21.super_class = (Class)KTEnrollmentRegistrationSignature;
  v17 = [(KTGroupOperation *)&v21 init];
  v18 = v17;
  if (v17)
  {
    [(KTEnrollmentRegistrationSignature *)v17 setDeps:v13];
    [(KTEnrollmentRegistrationSignature *)v18 setForceUpdate:v11];
    [(KTEnrollmentRegistrationSignature *)v18 setNextState:v14];
    [(KTEnrollmentRegistrationSignature *)v18 setIdsRegistrationInterface:v15];
    [(KTEnrollmentRegistrationSignature *)v18 setSignatureTracker:v16];
    v19 = v18;
  }

  return v18;
}

- (void)recordKeyState:(int)a3 application:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v10 = [(KTEnrollmentRegistrationSignature *)self deps];
  v7 = [v10 logger];
  v8 = +[NSNumber numberWithUnsignedInt:v4];
  v9 = +[NSString stringWithFormat:@"TBS-%@-%@", @"k", v6];

  [v7 setNumberProperty:v8 forKey:v9];
}

- (void)groupStart
{
  v2 = +[NSMutableArray array];
  uint64_t v65 = 0;
  v66 = &v65;
  uint64_t v67 = 0x2020000000;
  char v68 = 0;
  v3 = objc_alloc_init(KDeviceSet);
  uint64_t v61 = 0;
  v62 = &v61;
  uint64_t v63 = 0x2020000000;
  char v64 = 0;
  uint64_t v4 = [(KTEnrollmentRegistrationSignature *)self deps];
  v5 = [v4 accountOperations];
  id v60 = 0;
  v44 = [v5 primaryAccount:&v60];
  id v42 = v60;

  id v6 = [v44 aa_altDSID];
  if (!v6)
  {
    if (qword_10032EEF0 != -1) {
      dispatch_once(&qword_10032EEF0, &stru_1002C4C58);
    }
    v7 = qword_10032EEF8;
    if (os_log_type_enabled((os_log_t)qword_10032EEF8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v71 = v42;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Can't get AltDSID: %@", buf, 0xCu);
    }
  }
  v8 = [v44 aa_personID];
  if (!v8)
  {
    if (qword_10032EEF0 != -1) {
      dispatch_once(&qword_10032EEF0, &stru_1002C4C78);
    }
    v9 = qword_10032EEF8;
    if (os_log_type_enabled((os_log_t)qword_10032EEF8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v71 = v42;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Can't get DSID: %@", buf, 0xCu);
    }
  }
  id v10 = [(KTEnrollmentRegistrationSignature *)self deps];
  BOOL v11 = [v10 smDataStore];
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = sub_100199944;
  v53[3] = &unk_1002C4E08;
  v53[4] = self;
  v43 = v3;
  v54 = v43;
  id v45 = v2;
  id v55 = v45;
  id v41 = v8;
  id v56 = v41;
  id v40 = v6;
  id v57 = v40;
  v58 = &v65;
  v59 = &v61;
  [v11 fetchDeviceSignature:0 complete:v53];

  if (qword_10032EEF0 != -1) {
    dispatch_once(&qword_10032EEF0, &stru_1002C4E28);
  }
  v12 = (id)qword_10032EEF8;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v13 = [v45 count];
    *(_DWORD *)buf = 67109120;
    LODWORD(v71) = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Updating registration datas: %d", buf, 8u);
  }

  if ([v45 count])
  {
    id v14 = [(KTEnrollmentRegistrationSignature *)self deps];
    id v15 = [v14 smDataStore];
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = sub_10019AA70;
    v52[3] = &unk_1002B9BA8;
    v52[4] = self;
    [v15 storeDeviceSignature:v45 complete:v52];

    *((unsigned char *)v62 + 24) = 1;
  }
  id v16 = [(KTEnrollmentRegistrationSignature *)self deps];
  v17 = [(KTPendingFlag *)v16 cloudRecords];
  if (!v17 || !*((unsigned char *)v62 + 24)) {
    goto LABEL_32;
  }
  v18 = [(KDeviceSet *)v43 devices];
  BOOL v19 = [v18 count] == 0;

  if (!v19)
  {
    if (qword_10032EEF0 != -1) {
      dispatch_once(&qword_10032EEF0, &stru_1002C4E48);
    }
    v20 = (id)qword_10032EEF8;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      objc_super v21 = [(KDeviceSet *)v43 devices];
      unsigned int v22 = [v21 count];
      *(_DWORD *)buf = 67109120;
      LODWORD(v71) = v22;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Updating cloud devices: %d", buf, 8u);
    }
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    v23 = [(KDeviceSet *)v43 devices];
    v24 = [v23 allObjects];

    id v25 = [v24 countByEnumeratingWithState:&v48 objects:v69 count:16];
    if (v25)
    {
      uint64_t v26 = *(void *)v49;
      do
      {
        for (i = 0; i != v25; i = (char *)i + 1)
        {
          if (*(void *)v49 != v26) {
            objc_enumerationMutation(v24);
          }
          v28 = *(void **)(*((void *)&v48 + 1) + 8 * i);
          v29 = [(KTEnrollmentRegistrationSignature *)self deps];
          v30 = [v29 cloudRecords];
          v31 = [v28 pushToken];
          v32 = [v28 registrationData];
          v33 = [v28 apps];
          v34 = [v33 allObjects];
          [v30 updateSelfCloudDeviceWithPushToken:v31 tbsRegistrationData:v32 applications:v34];
        }
        id v25 = [v24 countByEnumeratingWithState:&v48 objects:v69 count:16];
      }
      while (v25);
    }

    id v16 = [[KTPendingFlag alloc] initWithFlag:@"CloudKitOutgoing" conditions:2 delayInSeconds:1.0];
    v17 = [(KTEnrollmentRegistrationSignature *)self deps];
    v35 = [v17 flagHandler];
    [v35 handlePendingFlag:v16];

LABEL_32:
  }
  if ((*((unsigned char *)v66 + 24) || [(KTEnrollmentRegistrationSignature *)self forceUpdate])
    && !*((unsigned char *)v62 + 24))
  {
    v36 = [(KTEnrollmentRegistrationSignature *)self signatureTracker];
    v37 = [v36 signatureQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10019AB48;
    block[3] = &unk_1002B6CF8;
    block[4] = self;
    dispatch_async(v37, block);

    v38 = [(KTEnrollmentRegistrationSignature *)self deps];
    v39 = [v38 flagHandler];
    [v39 cancelPendingFlag:@"ValidateSelf"];
  }
  _Block_object_dispose(&v61, 8);

  _Block_object_dispose(&v65, 8);
}

- (KTStateString)intendedState
{
  return (KTStateString *)objc_getProperty(self, a2, 126, 1);
}

- (KTStateString)nextState
{
  return (KTStateString *)objc_getProperty(self, a2, 134, 1);
}

- (void)setNextState:(id)a3
{
}

- (KTOperationDependencies)deps
{
  return (KTOperationDependencies *)objc_getProperty(self, a2, 142, 1);
}

- (void)setDeps:(id)a3
{
}

- (BOOL)forceUpdate
{
  return self->_forceUpdate;
}

- (void)setForceUpdate:(BOOL)a3
{
  self->_forceUpdate = a3;
}

- (KTCheckIDSRegistrationInterface)idsRegistrationInterface
{
  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->_deps + 6));

  return (KTCheckIDSRegistrationInterface *)WeakRetained;
}

- (void)setIdsRegistrationInterface:(id)a3
{
}

- (KTSignatureTracker)signatureTracker
{
  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->_idsRegistrationInterface + 6));

  return (KTSignatureTracker *)WeakRetained;
}

- (void)setSignatureTracker:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)((char *)&self->_idsRegistrationInterface + 6));
  objc_destroyWeak((id *)((char *)&self->_deps + 6));
  objc_storeStrong((id *)((char *)&self->_nextState + 6), 0);
  objc_storeStrong((id *)((char *)&self->_intendedState + 6), 0);

  objc_storeStrong((id *)(&self->_forceUpdate + 6), 0);
}

@end