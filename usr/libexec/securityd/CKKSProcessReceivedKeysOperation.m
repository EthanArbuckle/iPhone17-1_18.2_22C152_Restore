@interface CKKSProcessReceivedKeysOperation
- (BOOL)allowFullRefetchResult;
- (CKKSOperationDependencies)deps;
- (CKKSProcessReceivedKeysOperation)initWithDependencies:(id)a3 allowFullRefetchResult:(BOOL)a4 intendedState:(id)a5 errorState:(id)a6;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (id)checkExistingKeyHierarchy:(id)a3 zoneID:(id)a4 currentTrustStates:(id)a5 error:(id *)a6;
- (id)processRemoteKeys:(id)a3 viewState:(id)a4 currentTrustStates:(id)a5 error:(id *)a6;
- (void)main;
- (void)setAllowFullRefetchResult:(BOOL)a3;
- (void)setDeps:(id)a3;
- (void)setNextState:(id)a3;
@end

@implementation CKKSProcessReceivedKeysOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deps, 0);
  objc_storeStrong((id *)&self->_nextState, 0);

  objc_storeStrong((id *)&self->_intendedState, 0);
}

- (void)setAllowFullRefetchResult:(BOOL)a3
{
  self->_allowFullRefetchResult = a3;
}

- (BOOL)allowFullRefetchResult
{
  return self->_allowFullRefetchResult;
}

- (void)setDeps:(id)a3
{
}

- (CKKSOperationDependencies)deps
{
  return (CKKSOperationDependencies *)objc_getProperty(self, a2, 104, 1);
}

- (void)setNextState:(id)a3
{
}

- (OctagonStateString)nextState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 96, 1);
}

- (OctagonStateString)intendedState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 88, 1);
}

- (id)checkExistingKeyHierarchy:(id)a3 zoneID:(id)a4 currentTrustStates:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [v10 error];
  if (v13)
  {
    v14 = (void *)v13;
    v15 = [v10 error];
    v16 = [v15 domain];
    if ([v16 isEqual:@"securityd"])
    {
      v17 = [v10 error];
      id v18 = [v17 code];

      if (v18 == (id)-25300) {
        goto LABEL_9;
      }
    }
    else
    {
    }
    v19 = [v11 zoneName];
    v20 = sub_1000CD884(@"ckkskey", v19);

    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = [v10 error];
      *(_DWORD *)buf = 138412290;
      id v112 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Error examining existing key hierarchy: %@", buf, 0xCu);
    }
  }
LABEL_9:
  v22 = [v10 currentTLKPointer];
  if (v22 || ([v10 currentClassAPointer], (v22 = objc_claimAutoreleasedReturnValue()) != 0))
  {

LABEL_12:
    v23 = [(CKKSProcessReceivedKeysOperation *)self deps];
    id v106 = 0;
    unsigned __int8 v24 = [v23 considerSelfTrusted:v12 error:&v106];
    id v25 = v106;

    if ((v24 & 1) != 0 || !v25)
    {
      if (v24)
      {
LABEL_19:
        uint64_t v31 = [v10 tlk];
        if (v31)
        {
          v32 = (void *)v31;
          uint64_t v33 = [v10 classA];
          if (v33)
          {
            v34 = (void *)v33;
            v35 = [v10 classC];

            if (v35)
            {
              v36 = [v10 tlk];
              id v105 = 0;
              unsigned __int8 v37 = [v36 loadKeyMaterialFromKeychain:&v105];
              id v38 = v105;

              if ((v37 & 1) == 0)
              {
                if (v38)
                {
                  v39 = [(CKKSProcessReceivedKeysOperation *)self deps];
                  v40 = [v39 lockStateTracker];
                  unsigned __int8 v41 = [v40 isLockedError:v38];

                  if ((v41 & 1) == 0)
                  {
                    v89 = [v11 zoneName];
                    v90 = sub_1000CD884(@"ckkskey", v89);

                    if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
                    {
                      v91 = [v10 tlk];
                      *(_DWORD *)buf = 138412546;
                      id v112 = v91;
                      __int16 v113 = 2112;
                      id v114 = v38;
                      _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_ERROR, "Error loading TLK(%@): %@", buf, 0x16u);
                    }
                    if (a6) {
                      *a6 = v38;
                    }
                    v67 = @"unhealthy";
                    v92 = @"unhealthy";
                    goto LABEL_72;
                  }
                }
                v42 = [v11 zoneName];
                v43 = sub_1000CD884(@"ckkskey", v42);

                if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
                {
                  v44 = [v10 tlk];
                  *(_DWORD *)buf = 138412546;
                  id v112 = v44;
                  __int16 v113 = 2112;
                  id v114 = v38;
                  _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "Soft error loading TLK(%@), maybe locked: %@", buf, 0x16u);
                }
              }
              v45 = [v10 classA];
              id v104 = 0;
              unsigned __int8 v46 = [v45 loadKeyMaterialFromKeychain:&v104];
              id v47 = v104;

              if ((v46 & 1) == 0)
              {
                if (v47)
                {
                  v48 = [(CKKSProcessReceivedKeysOperation *)self deps];
                  v49 = [v48 lockStateTracker];
                  unsigned __int8 v50 = [v49 isLockedError:v47];

                  if ((v50 & 1) == 0)
                  {
                    v93 = [v11 zoneName];
                    v94 = sub_1000CD884(@"ckkskey", v93);

                    if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
                    {
                      v95 = [v10 classA];
                      *(_DWORD *)buf = 138412546;
                      id v112 = v95;
                      __int16 v113 = 2112;
                      id v114 = v47;
                      _os_log_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_ERROR, "Error loading classA key(%@): %@", buf, 0x16u);
                    }
                    if (a6) {
                      *a6 = v47;
                    }
                    v67 = @"unhealthy";
                    v96 = @"unhealthy";
                    goto LABEL_71;
                  }
                }
                v51 = [v11 zoneName];
                v52 = sub_1000CD884(@"ckkskey", v51);

                if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
                {
                  v53 = [v10 classA];
                  *(_DWORD *)buf = 138412546;
                  id v112 = v53;
                  __int16 v113 = 2112;
                  id v114 = v47;
                  _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, "Soft error loading classA key(%@), maybe locked: %@", buf, 0x16u);
                }
              }
              v54 = [v10 classC];
              id v103 = 0;
              unsigned __int8 v55 = [v54 loadKeyMaterialFromKeychain:&v103];
              id v56 = v103;

              if ((v55 & 1) == 0)
              {
                v80 = [v11 zoneName];
                v81 = sub_1000CD884(@"ckkskey", v80);

                if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
                {
                  v82 = [v10 classC];
                  *(_DWORD *)buf = 138412546;
                  id v112 = v82;
                  __int16 v113 = 2112;
                  id v114 = v56;
                  _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_ERROR, "Error loading classC(%@): %@", buf, 0x16u);
                }
                if (a6) {
                  *a6 = v56;
                }
                v67 = @"unhealthy";
                v83 = @"unhealthy";
                goto LABEL_70;
              }
              id v100 = v56;
              id v101 = v47;
              id v102 = v38;
              v57 = [v10 classA];
              v58 = [v57 parentKeyUUID];
              v59 = [v10 tlk];
              v60 = [v59 uuid];
              unsigned __int8 v61 = [v58 isEqualToString:v60];

              if (v61)
              {
                v62 = [v10 classC];
                v63 = [v62 parentKeyUUID];
                v64 = [v10 tlk];
                v65 = [v64 uuid];
                unsigned __int8 v66 = [v63 isEqualToString:v65];

                if (v66)
                {
                  v67 = @"ready";
                  v68 = @"ready";
                  id v47 = v101;
                  id v38 = v102;
                  id v56 = v100;
LABEL_70:

LABEL_71:
LABEL_72:

                  goto LABEL_56;
                }
                NSErrorUserInfoKey v107 = NSLocalizedDescriptionKey;
                CFStringRef v108 = @"Current class C key does not wrap to current TLK";
                v97 = +[NSDictionary dictionaryWithObjects:&v108 forKeys:&v107 count:1];
                v85 = +[NSError errorWithDomain:@"CKKSServerExtensionErrorDomain" code:9 userInfo:v97];

                v98 = [v11 zoneName];
                v99 = sub_1000CD884(@"ckkskey", v98);

                id v56 = v100;
                if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  id v112 = v85;
                  _os_log_impl((void *)&_mh_execute_header, v99, OS_LOG_TYPE_ERROR, "Key hierarchy unhealthy: %@", buf, 0xCu);
                }

                id v47 = v101;
                id v38 = v102;
                if (!a6)
                {
LABEL_69:
                  v67 = @"unhealthy";
                  v88 = @"unhealthy";

                  goto LABEL_70;
                }
              }
              else
              {
                NSErrorUserInfoKey v109 = NSLocalizedDescriptionKey;
                CFStringRef v110 = @"Current class A key does not wrap to current TLK";
                v84 = +[NSDictionary dictionaryWithObjects:&v110 forKeys:&v109 count:1];
                v85 = +[NSError errorWithDomain:@"CKKSServerExtensionErrorDomain" code:9 userInfo:v84];

                v86 = [v11 zoneName];
                v87 = sub_1000CD884(@"ckkskey", v86);

                if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  id v112 = v85;
                  _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_ERROR, "Key hierarchy unhealthy: %@", buf, 0xCu);
                }

                id v47 = v101;
                id v38 = v102;
                id v56 = v100;
                if (!a6) {
                  goto LABEL_69;
                }
              }
              *a6 = v85;
              goto LABEL_69;
            }
          }
          else
          {
          }
        }
        v75 = [v11 zoneName];
        v76 = sub_1000CD884(@"ckkskey", v75);

        if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v112 = v10;
          _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_ERROR, "Error examining existing key hierarchy (missing at least one key): %@", buf, 0xCu);
        }

        if (a6)
        {
          *a6 = [v10 error];
        }
        v67 = @"unhealthy";
LABEL_55:
        v78 = v67;
LABEL_56:

        goto LABEL_57;
      }
    }
    else
    {
      v26 = [(CKKSProcessReceivedKeysOperation *)self deps];
      v27 = [v26 lockStateTracker];
      unsigned int v28 = [v27 isLockedError:v25];

      if (v28)
      {
        v29 = [v11 zoneName];
        v30 = sub_1000CD884(@"ckkskey", v29);

        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v112 = v25;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Trust system reports device locked: %@", buf, 0xCu);
        }

        id v25 = 0;
        goto LABEL_19;
      }
    }
    v69 = [v11 zoneName];
    v70 = sub_1000CD884(@"ckkskey", v69);

    if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v112 = v25;
      _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "Not proceeding due to trust system failure: %@", buf, 0xCu);
    }

    if (a6)
    {
      if (v25)
      {
        *a6 = v25;
      }
      else
      {
        id v77 = +[NSError errorWithDomain:@"CKKSErrorDomain" code:52 description:@"No trust states available"];
        *a6 = v77;
      }
    }
    v67 = @"waitfortrust";
    goto LABEL_55;
  }
  v71 = [v10 currentClassCPointer];

  if (v71) {
    goto LABEL_12;
  }
  v72 = [v11 zoneName];
  v73 = sub_1000CD884(@"ckkskey", v72);

  if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v112 = v10;
    _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_ERROR, "No existing key hierarchy (missing all CKPs): %@", buf, 0xCu);
  }

  v67 = @"waitfortlkcreation";
  v74 = @"waitfortlkcreation";
LABEL_57:

  return v67;
}

- (id)processRemoteKeys:(id)a3 viewState:(id)a4 currentTrustStates:(id)a5 error:(id *)a6
{
  id v179 = a3;
  id v8 = a4;
  id v176 = a5;
  uint64_t v9 = [v8 contextID];
  id v10 = [v8 zoneID];
  id v11 = [v10 zoneName];
  id v12 = sub_1000CD884(@"ckkskey", v11);

  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v214 = v179;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "remote keys: %@", buf, 0xCu);
  }

  uint64_t v13 = [v8 zoneID];
  id v209 = 0;
  v14 = +[CKKSCurrentKeyPointer tryFromDatabase:@"tlk" contextID:v9 zoneID:v13 error:&v209];
  id v15 = v209;

  v16 = [v8 zoneID];
  id v208 = v15;
  v177 = +[CKKSCurrentKeyPointer tryFromDatabase:@"classA" contextID:v9 zoneID:v16 error:&v208];
  id v17 = v208;

  id v18 = [v8 zoneID];
  id v207 = v17;
  v182 = +[CKKSCurrentKeyPointer tryFromDatabase:@"classC" contextID:v9 zoneID:v18 error:&v207];
  id v19 = v207;

  v20 = [v14 currentKeyUUID];
  v21 = (void *)v9;
  if (v20)
  {
    v22 = [v14 currentKeyUUID];
    v23 = [v8 zoneID];
    id v206 = v19;
    v181 = +[CKKSKey tryFromDatabaseAnyState:v22 contextID:v9 zoneID:v23 error:&v206];
    id v24 = v206;

    id v19 = v24;
  }
  else
  {
    v181 = 0;
  }
  id v25 = v14;

  v26 = v177;
  v27 = [v177 currentKeyUUID];
  if (v27)
  {
    unsigned int v28 = [v177 currentKeyUUID];
    v29 = [v8 zoneID];
    id v205 = v19;
    v180 = +[CKKSKey tryFromDatabaseAnyState:v28 contextID:v21 zoneID:v29 error:&v205];
    id v30 = v205;

    id v19 = v30;
  }
  else
  {
    v180 = 0;
  }

  uint64_t v31 = v182;
  v32 = [v182 currentKeyUUID];
  if (v32)
  {
    uint64_t v33 = [v182 currentKeyUUID];
    v34 = [v8 zoneID];
    id v204 = v19;
    v178 = +[CKKSKey tryFromDatabaseAnyState:v33 contextID:v21 zoneID:v34 error:&v204];
    id v35 = v204;

    uint64_t v31 = v182;
    id v19 = v35;
  }
  else
  {
    v178 = 0;
  }

  if (!v25) {
    goto LABEL_51;
  }
  if (!v177) {
    goto LABEL_51;
  }
  if (!v31) {
    goto LABEL_51;
  }
  uint64_t v36 = [v25 currentKeyUUID];
  if (!v36) {
    goto LABEL_51;
  }
  unsigned __int8 v37 = (void *)v36;
  uint64_t v38 = [v177 currentKeyUUID];
  if (!v38)
  {

LABEL_51:
    v70 = [v8 zoneID];
    v71 = [v70 zoneName];
    v72 = sub_1000CD884(@"ckkskey", v71);

    if (!os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
    {
LABEL_54:

      if (a6) {
        *a6 = v19;
      }
      v76 = @"unhealthy";
      id v77 = @"unhealthy";
      v78 = 0;
      v60 = 0;
      goto LABEL_57;
    }
    *(_DWORD *)buf = 138413314;
    id v214 = v25;
    __int16 v215 = 2112;
    id v216 = v177;
    __int16 v217 = 2112;
    v218 = v31;
    __int16 v219 = 2112;
    id v220 = v19;
    __int16 v221 = 2112;
    id v222 = v19;
    v73 = "no current pointer for some keyclass: tlk:%@ a:%@ c:%@ %@ %@";
    v74 = v72;
    uint32_t v75 = 52;
LABEL_53:
    _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_ERROR, v73, buf, v75);
    goto LABEL_54;
  }
  v39 = (void *)v38;
  v40 = [v31 currentKeyUUID];

  if (!v40 || !v181 || !v180 || !v178) {
    goto LABEL_51;
  }
  v173 = v8;
  long long v202 = 0u;
  long long v203 = 0u;
  long long v200 = 0u;
  long long v201 = 0u;
  id v41 = v179;
  id v42 = [v41 countByEnumeratingWithState:&v200 objects:v212 count:16];
  if (!v42)
  {

LABEL_66:
    id v8 = v173;
    v87 = [v173 zoneID];
    v88 = [v87 zoneName];
    v72 = sub_1000CD884(@"ckkskey", v88);

    uint64_t v31 = v182;
    if (!os_log_type_enabled(v72, OS_LOG_TYPE_ERROR)) {
      goto LABEL_54;
    }
    *(_DWORD *)buf = 138412290;
    id v214 = v25;
    v73 = "couldn't find active TLK: %@";
    v74 = v72;
    uint32_t v75 = 12;
    goto LABEL_53;
  }
  id v43 = v42;
  v172 = v21;
  v183 = 0;
  uint64_t v44 = *(void *)v201;
  do
  {
    for (i = 0; i != v43; i = (char *)i + 1)
    {
      if (*(void *)v201 != v44) {
        objc_enumerationMutation(v41);
      }
      unsigned __int8 v46 = *(void **)(*((void *)&v200 + 1) + 8 * i);
      id v47 = [v46 uuid];
      v48 = v25;
      v49 = [v25 currentKeyUUID];
      unsigned int v50 = [v47 isEqualToString:v49];

      if (v50)
      {
        if (![v46 wrapsSelf])
        {
          v80 = [v46 parentKeyUUID];
          v81 = +[NSString stringWithFormat:@"current TLK doesn't wrap itself: %@ %@", v46, v80];
          v82 = +[NSError errorWithDomain:@"CKKSErrorDomain" code:18 description:v81 underlying:v19];

          v83 = [v173 zoneID];
          v84 = [v83 zoneName];
          v85 = sub_1000CD884(@"ckkskey", v84);

          if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v214 = v82;
            _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_ERROR, "Proposed TLK doesn't wrap self: %@", buf, 0xCu);
          }

          v21 = v172;
          id v25 = v48;
          v26 = v177;
          if (a6) {
            *a6 = v82;
          }
          v76 = @"unhealthy";
          v86 = @"unhealthy";

          v60 = 0;
          id v8 = v173;
          uint64_t v31 = v182;
          v78 = v183;
          goto LABEL_57;
        }
        id v51 = v46;

        v183 = v51;
      }
      id v25 = v48;
    }
    id v43 = [v41 countByEnumeratingWithState:&v200 objects:v212 count:16];
  }
  while (v43);

  v21 = v172;
  v26 = v177;
  if (!v183) {
    goto LABEL_66;
  }
  id v199 = v19;
  unsigned __int8 v52 = [v183 validTLK:&v199];
  id v170 = v199;

  uint64_t v31 = v182;
  if ((v52 & 1) == 0)
  {
    v89 = [v173 zoneID];
    v90 = [v89 zoneName];
    v91 = sub_1000CD884(@"ckkskey", v90);

    if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v214 = v183;
      __int16 v215 = 2112;
      id v216 = v170;
      _os_log_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_ERROR, "CKKS claims %@ is not a valid TLK: %@", buf, 0x16u);
    }

    v92 = +[NSError errorWithDomain:@"CKKSErrorDomain" code:34 description:@"invalid TLK from CloudKit" underlying:v170];
    v93 = v92;
    id v25 = v48;
    if (a6) {
      *a6 = v92;
    }
    v76 = @"error";
    v94 = @"error";

    v60 = 0;
    id v19 = v170;
    id v8 = v173;
    v78 = v183;
    goto LABEL_57;
  }
  id v198 = 0;
  unsigned __int8 v53 = [v183 tlkMaterialPresentOrRecoverableViaTLKShareForContextID:v172 forTrustStates:v176 error:&v198];
  id v54 = v198;
  v163 = v54;
  if ((v53 & 1) == 0)
  {
    id v95 = v54;
    v96 = [(CKKSProcessReceivedKeysOperation *)self deps];
    v97 = [v96 lockStateTracker];
    unsigned int v98 = [v97 isLockedError:v95];

    v99 = [v173 zoneID];
    id v100 = [v99 zoneName];
    id v101 = sub_1000CD884(@"ckkskey", v100);

    BOOL v102 = os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT);
    id v103 = v95;
    if (v98)
    {
      id v25 = v48;
      if (v102)
      {
        *(_DWORD *)buf = 138412290;
        id v214 = v183;
        _os_log_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_DEFAULT, "Received a TLK(%@), but keybag appears to be locked. Entering a waiting state.", buf, 0xCu);
      }

      id v8 = v173;
      if (a6) {
        *a6 = v103;
      }
      v76 = @"waitforunlock";
      id v104 = @"waitforunlock";
    }
    else
    {
      id v105 = v95;
      if (v102)
      {
        *(_DWORD *)buf = 138412546;
        id v214 = v183;
        __int16 v215 = 2112;
        id v216 = v170;
        _os_log_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_DEFAULT, "Received a TLK(%@) which we don't have in the local keychain: %@", buf, 0x16u);
      }

      id v106 = [(CKKSProcessReceivedKeysOperation *)self deps];
      id v197 = 0;
      unsigned __int8 v107 = [v106 considerSelfTrusted:v176 error:&v197];
      id v108 = v197;

      if (v107)
      {
        id v25 = v48;
        if (a6) {
          *a6 = v105;
        }
        NSErrorUserInfoKey v109 = &off_100305FF0;
      }
      else
      {
        v134 = [v173 zoneID];
        v135 = [v134 zoneName];
        v136 = sub_1000CD884(@"ckkskey", v135);

        if (os_log_type_enabled(v136, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v214 = v108;
          _os_log_impl((void *)&_mh_execute_header, v136, OS_LOG_TYPE_DEFAULT, "Not proceeding due to trust system failure: %@", buf, 0xCu);
        }

        if (a6)
        {
          if (v108)
          {
            *a6 = v108;
          }
          else
          {
            id v161 = +[NSError errorWithDomain:@"CKKSErrorDomain" code:52 description:@"No trust states available"];
            *a6 = v161;
          }
        }
        NSErrorUserInfoKey v109 = off_100306980;
        id v25 = v48;
      }
      id v8 = v173;
      v76 = *v109;
    }
    v60 = 0;
    goto LABEL_146;
  }
  long long v195 = 0u;
  long long v196 = 0u;
  long long v193 = 0u;
  long long v194 = 0u;
  id obj = v41;
  id v55 = [obj countByEnumeratingWithState:&v193 objects:v211 count:16];
  if (!v55)
  {
    v57 = 0;
    goto LABEL_86;
  }
  id v56 = v55;
  v57 = 0;
  id v167 = *(id *)v194;
  do
  {
    for (j = 0; j != v56; j = (char *)j + 1)
    {
      if (*(id *)v194 != v167) {
        objc_enumerationMutation(obj);
      }
      v59 = *(void **)(*((void *)&v193 + 1) + 8 * (void)j);
      if (v59 == v183) {
        continue;
      }
      id v192 = 0;
      v60 = [v59 topKeyInAnyState:&v192];
      id v61 = v192;

      if (v61)
      {
        id v169 = v61;
LABEL_115:
        uint64_t v31 = v182;
        v145 = [v173 zoneID];
        v146 = [v145 zoneName];
        v147 = sub_1000CD884(@"ckkskey", v146);

        if (os_log_type_enabled(v147, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v214 = v59;
          __int16 v215 = 2112;
          id v216 = v170;
          _os_log_impl((void *)&_mh_execute_header, v147, OS_LOG_TYPE_ERROR, "new key %@ is orphaned (%@)", buf, 0x16u);
        }

        id v25 = v48;
        if (!a6)
        {
          v150 = &off_100306988;
          id v8 = v173;
          goto LABEL_144;
        }
        v148 = +[NSString stringWithFormat:@"orphaned key(%@) in hierarchy", v60];
        id v149 = v169;
        *a6 = +[NSError errorWithDomain:@"CKKSErrorDomain" code:33 description:v148 underlying:v169];

        v150 = &off_100306988;
        id v8 = v173;
LABEL_145:
        v76 = *v150;

        goto LABEL_146;
      }
      v62 = [v60 uuid];
      v63 = [v183 uuid];
      unsigned __int8 v64 = [v62 isEqual:v63];

      if ((v64 & 1) == 0)
      {
        id v169 = 0;
        goto LABEL_115;
      }
      id v191 = 0;
      v65 = [v59 unwrapViaKeyHierarchy:&v191];
      id v66 = v191;

      if (!v65 || v66)
      {
        id v169 = v66;
        if (v66
          && ([(CKKSProcessReceivedKeysOperation *)self deps],
              v151 = objc_claimAutoreleasedReturnValue(),
              [v151 lockStateTracker],
              v152 = objc_claimAutoreleasedReturnValue(),
              unsigned int v153 = [v152 isLockedError:v169],
              v152,
              v151,
              v153))
        {
          v154 = [v173 zoneID];
          v155 = [v154 zoneName];
          v156 = sub_1000CD884(@"ckkskey", v155);

          if (os_log_type_enabled(v156, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v214 = v59;
            _os_log_impl((void *)&_mh_execute_header, v156, OS_LOG_TYPE_DEFAULT, "Couldn't unwrap new key (%@), but keybag appears to be locked. Entering waitforunlock.", buf, 0xCu);
          }

          if (a6)
          {
            id v149 = v169;
            *a6 = v149;
            v150 = off_100305FE8;
            goto LABEL_130;
          }
          v150 = off_100305FE8;
LABEL_143:
          id v25 = v48;
          v21 = v172;
          id v8 = v173;
          v26 = v177;
          uint64_t v31 = v182;
LABEL_144:
          id v149 = v169;
        }
        else
        {
          v157 = [v173 zoneID];
          v158 = [v157 zoneName];
          v159 = sub_1000CD884(@"ckkskey", v158);

          if (os_log_type_enabled(v159, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            id v214 = v60;
            __int16 v215 = 2112;
            id v216 = v169;
            _os_log_impl((void *)&_mh_execute_header, v159, OS_LOG_TYPE_ERROR, "new key %@ claims to wrap to TLK, but we can't unwrap it: %@", buf, 0x16u);
          }

          if (!a6)
          {
            v150 = &off_100306988;
            goto LABEL_143;
          }
          id v149 = v169;
          v160 = +[NSString stringWithFormat:@"unwrappable key(%@) in hierarchy: %@", v60, v169];
          *a6 = +[NSError errorWithDomain:@"CKKSErrorDomain" code:33 description:v160 underlying:v170];

          v150 = &off_100306988;
LABEL_130:
          id v25 = v48;
          v21 = v172;
          id v8 = v173;
          v26 = v177;
          uint64_t v31 = v182;
        }
        goto LABEL_145;
      }
      v67 = [v173 zoneID];
      v68 = [v67 zoneName];
      v69 = sub_1000CD884(@"ckkskey", v68);

      if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v214 = v59;
        __int16 v215 = 2112;
        id v216 = v183;
        _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "New key %@ wraps to tlk %@", buf, 0x16u);
      }

      v57 = v60;
    }
    id v56 = [obj countByEnumeratingWithState:&v193 objects:v211 count:16];
  }
  while (v56);
LABEL_86:
  v162 = v57;

  long long v189 = 0u;
  long long v190 = 0u;
  long long v187 = 0u;
  long long v188 = 0u;
  id v164 = obj;
  id v110 = [v164 countByEnumeratingWithState:&v187 objects:v210 count:16];
  id v111 = v170;
  id v168 = v110;
  if (!v110) {
    goto LABEL_99;
  }
  uint64_t v112 = *(void *)v188;
  __int16 v113 = v170;
  while (2)
  {
    uint64_t v114 = 0;
    while (2)
    {
      if (*(void *)v188 != v112) {
        objc_enumerationMutation(v164);
      }
      v115 = *(void **)(*((void *)&v187 + 1) + 8 * v114);
      [v115 setState:@"local"];
      v116 = [v115 uuid];
      v117 = [v177 currentKeyUUID];
      if ([v116 isEqualToString:v117])
      {

        goto LABEL_94;
      }
      [v115 uuid];
      v118 = id v171 = v115;
      [v182 currentKeyUUID];
      v120 = uint64_t v119 = v112;
      unsigned int obja = [v118 isEqualToString:v120];

      uint64_t v112 = v119;
      v115 = v171;

      if (obja)
      {
LABEL_94:
        v186 = v113;
        v121 = &v186;
        [v115 saveToDatabaseAsOnlyCurrentKeyForClassAndState:&v186];
      }
      else
      {
        v185 = v113;
        v121 = &v185;
        [v171 saveToDatabase:&v185];
      }
      id v122 = *v121;

      id v184 = v122;
      [v115 saveKeyMaterialToKeychain:&v184];
      id v123 = v184;

      if (v123)
      {
        v137 = v115;
        v138 = [(CKKSProcessReceivedKeysOperation *)self deps];
        v139 = [v138 lockStateTracker];
        unsigned int v140 = [v139 isLockedError:v123];

        v141 = [v173 zoneID];
        v142 = [v141 zoneName];
        v143 = sub_1000CD884(@"ckkskey", v142);

        id v170 = v123;
        if (v140)
        {
          if (os_log_type_enabled(v143, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v214 = v137;
            __int16 v215 = 2112;
            id v216 = v123;
            _os_log_impl((void *)&_mh_execute_header, v143, OS_LOG_TYPE_DEFAULT, "Couldn't save newly local key %@ keychain, due to lock state. Entering a waiting state; %@",
              buf,
              0x16u);
          }

          v144 = off_100305FE8;
        }
        else
        {
          if (os_log_type_enabled(v143, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            id v214 = v137;
            __int16 v215 = 2112;
            id v216 = v123;
            _os_log_impl((void *)&_mh_execute_header, v143, OS_LOG_TYPE_ERROR, "couldn't save newly local key %@ to database: %@", buf, 0x16u);
          }

          v144 = &off_100306988;
        }
        id v25 = v48;
        uint64_t v31 = v182;
        if (a6) {
          *a6 = v170;
        }
        v76 = *v144;

        v60 = v162;
        id v8 = v173;
        goto LABEL_146;
      }
      __int16 v113 = 0;
      if (v168 != (id)++v114) {
        continue;
      }
      break;
    }
    id v124 = [v164 countByEnumeratingWithState:&v187 objects:v210 count:16];
    __int16 v113 = 0;
    id v111 = 0;
    id v168 = v124;
    if (v124) {
      continue;
    }
    break;
  }
LABEL_99:
  id v170 = v111;

  v125 = [(CKKSProcessReceivedKeysOperation *)self deps];
  v126 = [v125 savedTLKNotifier];

  v127 = [v173 zoneID];
  v128 = [v127 zoneName];
  v129 = sub_1000CD884(@"ckkstlk", v128);

  if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v214 = v126;
    _os_log_impl((void *)&_mh_execute_header, v129, OS_LOG_TYPE_DEFAULT, "triggering new TLK notification: %@", buf, 0xCu);
  }

  [v126 trigger];
  v130 = [v173 zoneID];
  v131 = [v130 zoneName];
  v132 = sub_1000CD884(@"ckkskey", v131);

  if (os_log_type_enabled(v132, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v132, OS_LOG_TYPE_DEFAULT, "Accepted new key hierarchy", buf, 2u);
  }

  v76 = @"ready";
  v133 = @"ready";

  v60 = v162;
  id v25 = v48;
  v21 = v172;
  id v8 = v173;
  v26 = v177;
  uint64_t v31 = v182;
LABEL_146:
  v78 = v183;

  id v19 = v170;
LABEL_57:

  return v76;
}

- (void)main
{
  v2 = [(CKKSProcessReceivedKeysOperation *)self deps];
  v49 = [v2 databaseProvider];

  v3 = [(CKKSProcessReceivedKeysOperation *)self deps];
  v48 = [v3 currentTrustStates];

  id v4 = objc_alloc((Class)AAFAnalyticsEventSecurity);
  uint64_t v94 = kSecurityRTCFieldNumViews;
  v5 = [(CKKSProcessReceivedKeysOperation *)self deps];
  v6 = [v5 activeManagedViews];
  v7 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v6 count]);
  id v95 = v7;
  id v8 = +[NSDictionary dictionaryWithObjects:&v95 forKeys:&v94 count:1];
  uint64_t v9 = [(CKKSProcessReceivedKeysOperation *)self deps];
  id v10 = [v9 activeAccount];
  id v11 = [v10 altDSID];
  id v12 = [(CKKSProcessReceivedKeysOperation *)self deps];
  id v13 = [v12 sendMetric];
  id v50 = [v4 initWithCKKSMetrics:v8 altDSID:v11 eventName:kSecurityRTCEventNameProcessReceivedKeys testsAreEnabled:0 category:kSecurityRTCEventCategoryAccountDataAccessRecovery sendMetric:v13];

  uint64_t v83 = 0;
  v84 = &v83;
  uint64_t v85 = 0x2020000000;
  char v86 = 1;
  uint64_t v79 = 0;
  v80 = &v79;
  uint64_t v81 = 0x2020000000;
  int v82 = 0;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  v14 = [(CKKSProcessReceivedKeysOperation *)self deps];
  id obj = [v14 activeManagedViews];

  id v15 = [obj countByEnumeratingWithState:&v75 objects:v93 count:16];
  if (v15)
  {
    uint64_t v47 = *(void *)v76;
    *(void *)&long long v16 = 138412546;
    long long v45 = v16;
    do
    {
      id v17 = 0;
      do
      {
        if (*(void *)v76 != v47) {
          objc_enumerationMutation(obj);
        }
        id v18 = *(void **)(*((void *)&v75 + 1) + 8 * (void)v17);
        uint64_t v69 = 0;
        v70 = &v69;
        uint64_t v71 = 0x3032000000;
        v72 = sub_100196DF0;
        v73 = sub_100196E00;
        id v74 = 0;
        v67[0] = 0;
        v67[1] = v67;
        v67[2] = 0x3032000000;
        v67[3] = sub_100196DF0;
        v67[4] = sub_100196E00;
        id v68 = 0;
        uint64_t v61 = 0;
        v62 = &v61;
        uint64_t v63 = 0x3032000000;
        unsigned __int8 v64 = sub_100196DF0;
        v65 = sub_100196E00;
        id v66 = 0;
        v53[0] = _NSConcreteStackBlock;
        v53[1] = 3221225472;
        v53[2] = sub_100196E08;
        v53[3] = &unk_100305FC8;
        v53[4] = self;
        v53[5] = v18;
        id v56 = &v83;
        id v19 = v50;
        id v54 = v19;
        v57 = &v79;
        v58 = &v69;
        id v20 = v48;
        id v55 = v20;
        v59 = v67;
        v60 = &v61;
        [v49 dispatchSyncWithSQLTransaction:v53];
        v21 = (void *)v70[5];
        if (!v21 || [v21 isEqualToString:@"ready"])
        {
          v22 = [v18 zoneID:v45];
          v23 = [v22 zoneName];
          id v24 = sub_1000CD884(@"ckkskey", v23);

          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "Checking consistency of key hierarchy", buf, 2u);
          }

          uint64_t v25 = v62[5];
          v26 = [v18 zoneID];
          id v52 = 0;
          uint64_t v27 = [(CKKSProcessReceivedKeysOperation *)self checkExistingKeyHierarchy:v25 zoneID:v26 currentTrustStates:v20 error:&v52];
          id v28 = v52;
          v29 = (void *)v70[5];
          v70[5] = v27;

          [v19 populateUnderlyingErrorsStartingWithRootError:v28];
          id v30 = [v18 zoneID];
          uint64_t v31 = [v30 zoneName];
          v32 = sub_1000CD884(@"ckkskey", v31);

          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v33 = v70[5];
            *(_DWORD *)buf = v45;
            uint64_t v90 = v33;
            __int16 v91 = 2112;
            id v92 = v28;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Key hierarchy is '%@' (error: %@)", buf, 0x16u);
          }
        }
        [v18 setViewKeyHierarchyState:v70[5], v45];

        _Block_object_dispose(&v61, 8);
        _Block_object_dispose(v67, 8);

        _Block_object_dispose(&v69, 8);
        id v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      id v15 = [obj countByEnumeratingWithState:&v75 objects:v93 count:16];
    }
    while (v15);
  }

  v34 = [(CKKSProcessReceivedKeysOperation *)self deps];
  id v35 = [v34 activeManagedViews];
  if ([v35 count])
  {
    unint64_t v36 = *((int *)v80 + 6);
    unsigned __int8 v37 = [(CKKSProcessReceivedKeysOperation *)self deps];
    uint64_t v38 = [v37 activeManagedViews];
    unint64_t v39 = (unint64_t)[v38 count];

    unint64_t v40 = v36 / v39;
  }
  else
  {
    unint64_t v40 = 0;
  }

  v87[0] = kSecurityRTCFieldAvgRemoteKeys;
  id v41 = +[NSNumber numberWithInt:v40];
  v87[1] = kSecurityRTCFieldTotalRemoteKeys;
  v88[0] = v41;
  id v42 = +[NSNumber numberWithInt:*((unsigned int *)v80 + 6)];
  v88[1] = v42;
  id v43 = +[NSDictionary dictionaryWithObjects:v88 forKeys:v87 count:2];
  [v50 addMetrics:v43];

  +[SecurityAnalyticsReporterRTC sendMetricWithEvent:v50 success:*((unsigned __int8 *)v84 + 24) error:0];
  uint64_t v44 = [(CKKSProcessReceivedKeysOperation *)self intendedState];
  [(CKKSProcessReceivedKeysOperation *)self setNextState:v44];

  _Block_object_dispose(&v79, 8);
  _Block_object_dispose(&v83, 8);
}

- (CKKSProcessReceivedKeysOperation)initWithDependencies:(id)a3 allowFullRefetchResult:(BOOL)a4 intendedState:(id)a5 errorState:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)CKKSProcessReceivedKeysOperation;
  v14 = [(CKKSResultOperation *)&v17 init];
  id v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_deps, a3);
    v15->_allowFullRefetchResult = a4;
    objc_storeStrong((id *)&v15->_intendedState, a5);
    objc_storeStrong((id *)&v15->_nextState, a6);
  }

  return v15;
}

@end