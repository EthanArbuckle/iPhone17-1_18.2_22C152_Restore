@interface OTPreloadOctagonKeysOperation
- (NSOperation)finishOp;
- (OTOperationDependencies)deps;
- (OTPreloadOctagonKeysOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (void)groupStart;
- (void)setDeps:(id)a3;
- (void)setFinishOp:(id)a3;
- (void)setNextState:(id)a3;
@end

@implementation OTPreloadOctagonKeysOperation

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
  v3 = sub_10000B070("octagon-preload-keys");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Beginning operation that preloads the SOSAccount with newly created Octagon Keys", buf, 2u);
  }

  id v4 = objc_alloc_init((Class)NSOperation);
  [(OTPreloadOctagonKeysOperation *)self setFinishOp:v4];

  v5 = [(OTPreloadOctagonKeysOperation *)self finishOp];
  [(CKKSGroupOperation *)self dependOnBeforeGroupFinished:v5];

  v6 = [(OTPreloadOctagonKeysOperation *)self deps];
  v7 = [v6 sosAdapter];
  unsigned __int8 v8 = [v7 sosEnabled];

  if (v8)
  {
    v9 = [(OTPreloadOctagonKeysOperation *)self deps];
    v10 = [v9 octagonAdapter];
    id v27 = 0;
    v11 = [v10 fetchSelfPeers:&v27];
    id v12 = v27;

    if (!v11 || v12)
    {
      v21 = sub_10000B070("octagon-preload-keys");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v31 = v12;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "failed to retrieve self peers: %@", buf, 0xCu);
      }

      [(CKKSResultOperation *)self setError:v12];
      v13 = [(OTPreloadOctagonKeysOperation *)self finishOp];
      [(CKKSGroupOperation *)self runBeforeGroupFinished:v13];
    }
    else
    {
      v13 = [v11 currentSelf];
      if (v13)
      {
        v14 = [(OTPreloadOctagonKeysOperation *)self deps];
        v15 = [v14 sosAdapter];
        id v26 = 0;
        unsigned __int8 v16 = [v15 preloadOctagonKeySetOnAccount:v13 error:&v26];
        id v17 = v26;

        if (v16)
        {
          v18 = [(OTPreloadOctagonKeysOperation *)self intendedState];
          [(OTPreloadOctagonKeysOperation *)self setNextState:v18];
        }
        else
        {
          [(CKKSResultOperation *)self setError:v17];
        }
        v25 = [(OTPreloadOctagonKeysOperation *)self finishOp];
        [(CKKSGroupOperation *)self runBeforeGroupFinished:v25];
      }
      else
      {
        v22 = sub_10000B070("octagon-preload-keys");
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "failed to retrieve current self", buf, 2u);
        }

        NSErrorUserInfoKey v28 = NSLocalizedDescriptionKey;
        CFStringRef v29 = @"failed to retrieve current self";
        v23 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
        v24 = +[NSError errorWithDomain:@"com.apple.security.octagon" code:38 userInfo:v23];
        [(CKKSResultOperation *)self setError:v24];

        id v17 = [(OTPreloadOctagonKeysOperation *)self finishOp];
        [(CKKSGroupOperation *)self runBeforeGroupFinished:v17];
      }
    }
  }
  else
  {
    NSErrorUserInfoKey v32 = NSLocalizedDescriptionKey;
    CFStringRef v33 = @"sos adapter not enabled";
    v19 = +[NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
    v20 = +[NSError errorWithDomain:@"com.apple.security.octagon" code:39 userInfo:v19];
    [(CKKSResultOperation *)self setError:v20];

    id v12 = [(OTPreloadOctagonKeysOperation *)self finishOp];
    [(CKKSGroupOperation *)self runBeforeGroupFinished:v12];
  }
}

- (OTPreloadOctagonKeysOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)OTPreloadOctagonKeysOperation;
  id v12 = [(CKKSGroupOperation *)&v15 init];
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