@interface CKKSPeerProviderState
+ (id)createFromProvider:(id)a3;
+ (id)noPeersState:(id)a3;
- (BOOL)essential;
- (BOOL)unwrapKey:(id)a3 fromShares:(id)a4 error:(id *)a5;
- (CKKSPeerProviderState)initWithPeerProviderID:(id)a3 essential:(BOOL)a4 selfPeers:(id)a5 selfPeersError:(id)a6 trustedPeers:(id)a7 trustedPeersError:(id)a8;
- (CKKSSelves)currentSelfPeers;
- (NSError)currentSelfPeersError;
- (NSError)currentTrustedPeersError;
- (NSSet)currentTrustedPeerIDs;
- (NSSet)currentTrustedPeers;
- (NSString)peerProviderID;
- (id)description;
- (void)setEssential:(BOOL)a3;
- (void)setPeerProviderID:(id)a3;
@end

@implementation CKKSPeerProviderState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTrustedPeersError, 0);
  objc_storeStrong((id *)&self->_currentTrustedPeerIDs, 0);
  objc_storeStrong((id *)&self->_currentTrustedPeers, 0);
  objc_storeStrong((id *)&self->_currentSelfPeersError, 0);
  objc_storeStrong((id *)&self->_currentSelfPeers, 0);

  objc_storeStrong((id *)&self->_peerProviderID, 0);
}

- (NSError)currentTrustedPeersError
{
  return self->_currentTrustedPeersError;
}

- (NSSet)currentTrustedPeerIDs
{
  return self->_currentTrustedPeerIDs;
}

- (NSSet)currentTrustedPeers
{
  return self->_currentTrustedPeers;
}

- (NSError)currentSelfPeersError
{
  return self->_currentSelfPeersError;
}

- (CKKSSelves)currentSelfPeers
{
  return self->_currentSelfPeers;
}

- (void)setEssential:(BOOL)a3
{
  self->_essential = a3;
}

- (BOOL)essential
{
  return self->_essential;
}

- (void)setPeerProviderID:(id)a3
{
}

- (NSString)peerProviderID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)unwrapKey:(id)a3 fromShares:(id)a4 error:(id *)a5
{
  id v78 = a3;
  id v8 = a4;
  v9 = [(CKKSPeerProviderState *)self currentSelfPeers];
  uint64_t v10 = [v9 currentSelf];
  if (!v10)
  {

LABEL_10:
    v16 = v78;
    v23 = [v78 zoneName];
    v24 = sub_1000CD884(@"ckksshare", v23);

    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = [(CKKSPeerProviderState *)self peerProviderID];
      v26 = [(CKKSPeerProviderState *)self currentSelfPeersError];
      *(_DWORD *)buf = 138412546;
      v98 = v25;
      __int16 v99 = 2112;
      id v100 = v26;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Don't have self peers for %@: %@", buf, 0x16u);

      v16 = v78;
    }

    if (a5)
    {
      v20 = [(CKKSPeerProviderState *)self currentSelfPeersError];
      CFStringRef v21 = @"Key unwrap failed";
      uint64_t v22 = 38;
      goto LABEL_14;
    }
LABEL_16:
    BOOL v27 = 0;
    goto LABEL_17;
  }
  v11 = (void *)v10;
  v12 = [(CKKSPeerProviderState *)self currentSelfPeersError];

  if (v12) {
    goto LABEL_10;
  }
  uint64_t v13 = [(CKKSPeerProviderState *)self currentTrustedPeers];
  if (v13)
  {
    v14 = (void *)v13;
    v15 = [(CKKSPeerProviderState *)self currentTrustedPeersError];

    if (!v15)
    {
      long long v95 = 0u;
      long long v96 = 0u;
      long long v93 = 0u;
      long long v94 = 0u;
      v29 = [(CKKSPeerProviderState *)self currentSelfPeers];
      v30 = [v29 allSelves];

      id obj = v30;
      v16 = v78;
      id v70 = [v30 countByEnumeratingWithState:&v93 objects:v107 count:16];
      v20 = 0;
      if (v70)
      {
        uint64_t v71 = *(void *)v94;
        v74 = v8;
        v69 = a5;
        v79 = self;
        do
        {
          context = v20;
          id v31 = 0;
          do
          {
            if (*(void *)v94 != v71) {
              objc_enumerationMutation(obj);
            }
            v72 = (char *)v31;
            v32 = *(void **)(*((void *)&v93 + 1) + 8 * (void)v31);
            v82 = +[NSMutableArray array];
            long long v89 = 0u;
            long long v90 = 0u;
            long long v91 = 0u;
            long long v92 = 0u;
            id v33 = v74;
            id v34 = [v33 countByEnumeratingWithState:&v89 objects:v106 count:16];
            if (v34)
            {
              id v35 = v34;
              uint64_t v36 = *(void *)v90;
              do
              {
                for (i = 0; i != v35; i = (char *)i + 1)
                {
                  if (*(void *)v90 != v36) {
                    objc_enumerationMutation(v33);
                  }
                  v38 = *(void **)(*((void *)&v89 + 1) + 8 * i);
                  v39 = [v38 share];
                  v40 = [v39 receiverPeerID];
                  v41 = [v32 peerID];
                  unsigned int v42 = [v40 isEqualToString:v41];

                  if (v42) {
                    [v82 addObject:v38];
                  }
                }
                id v35 = [v33 countByEnumeratingWithState:&v89 objects:v106 count:16];
              }
              while (v35);
            }

            v43 = v82;
            if ([v82 count])
            {
              long long v87 = 0u;
              long long v88 = 0u;
              long long v85 = 0u;
              long long v86 = 0u;
              v44 = v82;
              v16 = v78;
              v45 = v79;
              id v77 = [v44 countByEnumeratingWithState:&v85 objects:v105 count:16];
              if (v77)
              {
                uint64_t v76 = *(void *)v86;
                id v46 = context;
                while (2)
                {
                  for (j = 0; j != v77; j = (char *)j + 1)
                  {
                    v48 = v46;
                    if (*(void *)v86 != v76) {
                      objc_enumerationMutation(v44);
                    }
                    v49 = *(void **)(*((void *)&v85 + 1) + 8 * (void)j);
                    v50 = [v78 zoneName];
                    v51 = sub_1000CD884(@"ckksshare", v50);

                    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412546;
                      v98 = v49;
                      __int16 v99 = 2112;
                      id v100 = v32;
                      _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "Checking possible TLK share %@ as %@", buf, 0x16u);
                    }

                    v52 = [(CKKSPeerProviderState *)v45 currentTrustedPeers];
                    id v84 = 0;
                    v53 = [v49 recoverTLK:v32 trustedPeers:v52 error:&v84];
                    id v54 = v84;

                    if (v53) {
                      BOOL v55 = v54 == 0;
                    }
                    else {
                      BOOL v55 = 0;
                    }
                    if (v55)
                    {
                      v75 = v48;
                      v61 = v44;
                      v62 = [v53 aessivkey];
                      id v83 = 0;
                      unsigned int v63 = [v78 trySelfWrappedKeyCandidate:v62 error:&v83];
                      id v54 = v83;

                      v64 = [v78 zoneName];
                      v59 = sub_1000CD884(@"ckksshare", v64);

                      if (v63 && !v54)
                      {
                        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)buf = 138412802;
                          v98 = v49;
                          __int16 v99 = 2112;
                          id v100 = v78;
                          __int16 v101 = 2112;
                          id v102 = v32;
                          _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "TLKShare(%@) unlocked TLK(%@) as %@", buf, 0x20u);
                        }

                        BOOL v27 = 1;
                        v20 = v75;
                        id v8 = v74;
                        goto LABEL_66;
                      }
                      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
                      {
                        v65 = [(CKKSPeerProviderState *)v79 currentSelfPeers];
                        v66 = [v65 currentSelf];
                        *(_DWORD *)buf = 138413058;
                        v98 = v49;
                        __int16 v99 = 2112;
                        id v100 = v78;
                        __int16 v101 = 2112;
                        id v102 = v66;
                        __int16 v103 = 2112;
                        id v104 = v54;
                        _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_ERROR, "Unwrapped TLKShare(%@) does not unwrap proposed TLK(%@) as %@: %@", buf, 0x2Au);
                      }
                      v44 = v61;
                      v48 = v75;
                    }
                    else
                    {
                      v56 = [v78 zoneName];
                      v57 = sub_1000CD884(@"ckksshare", v56);

                      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138412802;
                        v98 = v49;
                        __int16 v99 = 2112;
                        id v100 = v32;
                        __int16 v101 = 2112;
                        id v102 = v54;
                        _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_ERROR, "Unable to unwrap TLKShare(%@) as %@: %@", buf, 0x20u);
                      }

                      v58 = [v78 zoneName];
                      v59 = sub_1000CD884(@"ckksshare", v58);

                      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
                      {
                        v60 = [(CKKSPeerProviderState *)v79 currentTrustedPeers];
                        *(_DWORD *)buf = 138412290;
                        v98 = v60;
                        _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_ERROR, "Current trust set: %@", buf, 0xCu);
                      }
                    }

                    id v46 = v54;
                    v45 = v79;
                  }
                  id v77 = [v44 countByEnumeratingWithState:&v85 objects:v105 count:16];
                  if (v77) {
                    continue;
                  }
                  break;
                }
                context = v46;
                v67 = v72;
                v43 = v82;
              }
              else
              {
                v67 = v72;
              }
            }
            else
            {
              v16 = v78;
              v68 = [v78 zoneName];
              v44 = sub_1000CD884(@"ckksshare", v68);

              v67 = v72;
              if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v98 = v32;
                __int16 v99 = 2112;
                id v100 = v78;
                _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "No CKKSTLKShares to %@ for %@", buf, 0x16u);
              }
            }

            id v31 = v67 + 1;
            a5 = v69;
            id v8 = v74;
          }
          while (v31 != v70);
          id v70 = [obj countByEnumeratingWithState:&v93 objects:v107 count:16];
          v20 = context;
        }
        while (v70);
      }

      if (a5)
      {
        id obj = +[NSString stringWithFormat:@"No trusted TLKShares for %@", v16];
        +[NSError errorWithDomain:code:description:underlying:](NSError, "errorWithDomain:code:description:underlying:", @"CKKSErrorDomain", 35);
        BOOL v27 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_66:
      }
      else
      {
        BOOL v27 = 0;
      }
      goto LABEL_15;
    }
  }
  v16 = v78;
  v17 = [v78 zoneName];
  v18 = sub_1000CD884(@"ckksshare", v17);

  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    v19 = [(CKKSPeerProviderState *)self currentTrustedPeersError];
    *(_DWORD *)buf = 138412290;
    v98 = v19;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Don't have trusted peers: %@", buf, 0xCu);
  }
  if (!a5) {
    goto LABEL_16;
  }
  v20 = [(CKKSPeerProviderState *)self currentTrustedPeersError];
  CFStringRef v21 = @"No trusted peers";
  uint64_t v22 = 24;
LABEL_14:
  +[NSError errorWithDomain:@"CKKSErrorDomain" code:v22 description:v21 underlying:v20];
  BOOL v27 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_15:

LABEL_17:
  return v27;
}

- (id)description
{
  v3 = [(CKKSPeerProviderState *)self peerProviderID];
  v4 = [(CKKSPeerProviderState *)self currentSelfPeers];
  uint64_t v5 = [(CKKSPeerProviderState *)self currentSelfPeersError];
  v6 = (void *)v5;
  if (v5) {
    CFStringRef v7 = (const __CFString *)v5;
  }
  else {
    CFStringRef v7 = &stru_10030AA90;
  }
  id v8 = [(CKKSPeerProviderState *)self currentTrustedPeers];
  uint64_t v9 = [(CKKSPeerProviderState *)self currentTrustedPeersError];
  uint64_t v10 = (void *)v9;
  if (v9) {
    CFStringRef v11 = (const __CFString *)v9;
  }
  else {
    CFStringRef v11 = &stru_10030AA90;
  }
  v12 = +[NSString stringWithFormat:@"<CKKSPeerProviderState(%@): %@%@ %@%@>", v3, v4, v7, v8, v11];

  return v12;
}

- (CKKSPeerProviderState)initWithPeerProviderID:(id)a3 essential:(BOOL)a4 selfPeers:(id)a5 selfPeersError:(id)a6 trustedPeers:(id)a7 trustedPeersError:(id)a8
{
  id v30 = a3;
  id v29 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v35.receiver = self;
  v35.super_class = (Class)CKKSPeerProviderState;
  v18 = [(CKKSPeerProviderState *)&v35 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_peerProviderID, a3);
    v19->_essential = a4;
    objc_storeStrong((id *)&v19->_currentSelfPeers, a5);
    objc_storeStrong((id *)&v19->_currentSelfPeersError, a6);
    objc_storeStrong((id *)&v19->_currentTrustedPeers, a7);
    objc_storeStrong((id *)&v19->_currentTrustedPeersError, a8);
    if (v19->_currentTrustedPeers)
    {
      v20 = +[NSMutableSet set];
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      CFStringRef v21 = v19->_currentTrustedPeers;
      id v22 = [(NSSet *)v21 countByEnumeratingWithState:&v31 objects:v36 count:16];
      if (v22)
      {
        id v23 = v22;
        uint64_t v24 = *(void *)v32;
        do
        {
          v25 = 0;
          do
          {
            if (*(void *)v32 != v24) {
              objc_enumerationMutation(v21);
            }
            v26 = [*(id *)(*((void *)&v31 + 1) + 8 * (void)v25) peerID];
            [(NSSet *)v20 addObject:v26];

            v25 = (char *)v25 + 1;
          }
          while (v23 != v25);
          id v23 = [(NSSet *)v21 countByEnumeratingWithState:&v31 objects:v36 count:16];
        }
        while (v23);
      }

      currentTrustedPeerIDs = v19->_currentTrustedPeerIDs;
      v19->_currentTrustedPeerIDs = v20;
    }
  }

  return v19;
}

+ (id)createFromProvider:(id)a3
{
  id v3 = a3;
  id v14 = 0;
  uint64_t v5 = [v3 fetchSelfPeers:&v14];
  id v6 = v14;
  id v13 = 0;
  CFStringRef v7 = [v3 fetchTrustedPeers:&v13];
  id v8 = v13;
  uint64_t v9 = [CKKSPeerProviderState alloc];
  uint64_t v10 = [v3 providerID];
  CFStringRef v11 = -[CKKSPeerProviderState initWithPeerProviderID:essential:selfPeers:selfPeersError:trustedPeers:trustedPeersError:](v9, "initWithPeerProviderID:essential:selfPeers:selfPeersError:trustedPeers:trustedPeersError:", v10, [v3 essential], v5, v6, v7, v8);

  return v11;
}

+ (id)noPeersState:(id)a3
{
  id v3 = a3;
  v4 = [CKKSPeerProviderState alloc];
  uint64_t v5 = [v3 providerID];
  id v6 = [v3 essential];

  CFStringRef v7 = +[NSError errorWithDomain:@"CKKSErrorDomain" code:24 description:@"No current self peer available"];
  id v8 = +[NSError errorWithDomain:@"CKKSErrorDomain" code:24 description:@"No current trusted peers available"];
  uint64_t v9 = [(CKKSPeerProviderState *)v4 initWithPeerProviderID:v5 essential:v6 selfPeers:0 selfPeersError:v7 trustedPeers:0 trustedPeersError:v8];

  return v9;
}

@end