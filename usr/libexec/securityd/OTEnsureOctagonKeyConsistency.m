@interface OTEnsureOctagonKeyConsistency
- (NSOperation)finishOp;
- (OTEnsureOctagonKeyConsistency)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5;
- (OTOperationDependencies)deps;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (void)groupStart;
- (void)setDeps:(id)a3;
- (void)setFinishOp:(id)a3;
- (void)setNextState:(id)a3;
@end

@implementation OTEnsureOctagonKeyConsistency

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishOp, 0);
  objc_storeStrong((id *)&self->_deps, 0);
  objc_storeStrong((id *)&self->_nextState, 0);

  objc_storeStrong((id *)&self->_intendedState, 0);
}

- (void)setFinishOp:(id)a3
{
}

- (NSOperation)finishOp
{
  return (NSOperation *)objc_getProperty(self, a2, 152, 1);
}

- (void)setDeps:(id)a3
{
}

- (OTOperationDependencies)deps
{
  return (OTOperationDependencies *)objc_getProperty(self, a2, 144, 1);
}

- (void)setNextState:(id)a3
{
}

- (OctagonStateString)nextState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 136, 1);
}

- (OctagonStateString)intendedState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 128, 1);
}

- (void)groupStart
{
  v3 = sub_10000B070("octagon-sos");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Beginning ensuring Octagon keys are set properly in SOS", buf, 2u);
  }

  id v4 = objc_alloc_init((Class)NSOperation);
  [(OTEnsureOctagonKeyConsistency *)self setFinishOp:v4];

  v5 = [(OTEnsureOctagonKeyConsistency *)self finishOp];
  [(CKKSGroupOperation *)self dependOnBeforeGroupFinished:v5];

  v6 = [(OTEnsureOctagonKeyConsistency *)self deps];
  v7 = [v6 sosAdapter];
  unsigned __int8 v8 = [v7 sosEnabled];

  if (v8)
  {
    v9 = [(OTEnsureOctagonKeyConsistency *)self deps];
    v10 = [v9 sosAdapter];
    id v65 = 0;
    v11 = [v10 currentSOSSelf:&v65];
    v12 = (OctagonCKKSPeerAdapter *)v65;

    if (!v11 || v12)
    {
      v22 = sub_10000B070("octagon-sos");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v69 = v12;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Failed to get the current SOS self: %@", buf, 0xCu);
      }

      [(CKKSResultOperation *)self setError:v12];
      v17 = [(OTEnsureOctagonKeyConsistency *)self finishOp];
      [(CKKSGroupOperation *)self runBeforeGroupFinished:v17];
      goto LABEL_42;
    }
    v13 = sub_10000B070("octagon");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Fetched SOS Self! Fetching Octagon Adapter now.", buf, 2u);
    }

    v14 = [(OTEnsureOctagonKeyConsistency *)self deps];
    v15 = [v14 stateHolder];
    id v64 = 0;
    v16 = [v15 getEgoPeerID:&v64];
    v17 = (OctagonCKKSPeerAdapter *)v64;

    if (v17)
    {
      v18 = sub_10000B070("octagon");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v69 = v17;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "failed to get peer id: %@", buf, 0xCu);
      }

      [(CKKSResultOperation *)self setError:v17];
      v19 = [(OTEnsureOctagonKeyConsistency *)self finishOp];
      [(CKKSGroupOperation *)self runBeforeGroupFinished:v19];
      goto LABEL_41;
    }
    v61 = v11;
    v23 = [OctagonCKKSPeerAdapter alloc];
    v24 = [(OTEnsureOctagonKeyConsistency *)self deps];
    v25 = [v24 activeAccount];
    v26 = [(OTEnsureOctagonKeyConsistency *)self deps];
    v27 = [v26 personaAdapter];
    v28 = [(OTEnsureOctagonKeyConsistency *)self deps];
    v29 = [v28 cuttlefishXPCWrapper];
    v60 = v16;
    v19 = [(OctagonCKKSPeerAdapter *)v23 initWithPeerID:v16 specificUser:v25 personaAdapter:v27 cuttlefishXPC:v29];

    v30 = sub_10000B070("octagon");
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v69 = v19;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Fetched SOS Self! Fetching Octagon Adapter now: %@", buf, 0xCu);
    }

    id v63 = 0;
    v31 = [(OctagonCKKSPeerAdapter *)v19 fetchSelfPeers:&v63];
    v32 = (OctagonCKKSPeerAdapter *)v63;
    v33 = v32;
    if (!v31 || v32)
    {
      v44 = sub_10000B070("octagon");
      v17 = 0;
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v69 = v33;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "failed to retrieve self peers: %@", buf, 0xCu);
      }

      [(CKKSResultOperation *)self setError:v33];
      v35 = [(OTEnsureOctagonKeyConsistency *)self finishOp];
      [(CKKSGroupOperation *)self runBeforeGroupFinished:v35];
      v11 = v61;
      goto LABEL_40;
    }
    v34 = [v31 currentSelf];
    v35 = v34;
    v17 = 0;
    if (!v34)
    {
      v50 = sub_10000B070("octagon");
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "failed to retrieve current self", buf, 2u);
      }

      NSErrorUserInfoKey v66 = NSLocalizedDescriptionKey;
      CFStringRef v67 = @"failed to retrieve current self";
      v51 = +[NSDictionary dictionaryWithObjects:&v67 forKeys:&v66 count:1];
      v52 = +[NSError errorWithDomain:@"com.apple.security.octagon" code:38 userInfo:v51];
      [(CKKSResultOperation *)self setError:v52];

      v53 = [(OTEnsureOctagonKeyConsistency *)self finishOp];
      [(CKKSGroupOperation *)self runBeforeGroupFinished:v53];
      v11 = v61;
      v16 = v60;
      goto LABEL_39;
    }
    v36 = [v34 publicSigningKey];
    v37 = [v36 keyData];

    v38 = [v35 publicEncryptionKey];
    v59 = [v38 keyData];

    v39 = [v61 publicSigningKey];
    uint64_t v40 = [v39 keyData];

    v41 = [v61 publicEncryptionKey];
    uint64_t v42 = [v41 keyData];

    v57 = (void *)v40;
    v58 = v37;
    v56 = (void *)v42;
    if ([v37 isEqualToData:v40]
      && ([v59 isEqualToData:v42] & 1) != 0)
    {
      v43 = sub_10000B070("octagon");
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "SOS and Octagon keys match!", buf, 2u);
      }
      v16 = v60;
      v33 = 0;
    }
    else
    {
      v55 = v31;
      v45 = sub_10000B070("octagon");
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "SOS and Octagon signing keys do NOT match! updating SOS", buf, 2u);
      }

      v46 = [(OTEnsureOctagonKeyConsistency *)self deps];
      v47 = [v46 sosAdapter];
      id v62 = 0;
      unsigned __int8 v48 = [v47 updateOctagonKeySetWithAccount:v35 error:&v62];
      v43 = v62;

      v33 = 0;
      if ((v48 & 1) == 0)
      {
        [(CKKSResultOperation *)self setError:v43];
        v54 = [(OTEnsureOctagonKeyConsistency *)self finishOp];
        [(CKKSGroupOperation *)self runBeforeGroupFinished:v54];

        v16 = v60;
        v31 = v55;
        goto LABEL_38;
      }
      v16 = v60;
      v31 = v55;
    }

    v49 = [(OTEnsureOctagonKeyConsistency *)self intendedState];
    [(OTEnsureOctagonKeyConsistency *)self setNextState:v49];

    v43 = [(OTEnsureOctagonKeyConsistency *)self finishOp];
    [(CKKSGroupOperation *)self runBeforeGroupFinished:v43];
LABEL_38:

    v11 = v61;
    v53 = v58;
LABEL_39:

LABEL_40:
LABEL_41:

LABEL_42:
    goto LABEL_43;
  }
  NSErrorUserInfoKey v70 = NSLocalizedDescriptionKey;
  CFStringRef v71 = @"sos adapter not enabled";
  v20 = +[NSDictionary dictionaryWithObjects:&v71 forKeys:&v70 count:1];
  v21 = +[NSError errorWithDomain:@"com.apple.security.octagon" code:39 userInfo:v20];
  [(CKKSResultOperation *)self setError:v21];

  v12 = [(OTEnsureOctagonKeyConsistency *)self finishOp];
  [(CKKSGroupOperation *)self runBeforeGroupFinished:v12];
LABEL_43:
}

- (OTEnsureOctagonKeyConsistency)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)OTEnsureOctagonKeyConsistency;
  v12 = [(CKKSGroupOperation *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_deps, a3);
    objc_storeStrong((id *)&v13->_intendedState, a4);
    objc_storeStrong((id *)&v13->_nextState, a5);
  }

  return v13;
}

@end