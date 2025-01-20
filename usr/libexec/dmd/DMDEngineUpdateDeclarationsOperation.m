@interface DMDEngineUpdateDeclarationsOperation
- (DMFUpdateDeclarationsRequest)request;
- (void)performDatabaseModificationOperationWithManagedObjectContext:(id)a3;
- (void)setRequest:(id)a3;
@end

@implementation DMDEngineUpdateDeclarationsOperation

- (void)performDatabaseModificationOperationWithManagedObjectContext:(id)a3
{
  id v4 = a3;
  v5 = [(DMDEngineUpdateDeclarationsOperation *)self request];
  v6 = [v5 organizationIdentifier];
  v7 = +[DMDDeclarationPayloadMetadata fetchRequestForFailedDeclarationsFromOrganizationWithIdentifier:v6];

  id v118 = 0;
  v88 = v4;
  v8 = [v4 executeFetchRequest:v7 error:&v118];
  id v9 = v118;
  long long v114 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  id v10 = v8;
  id v11 = [v10 countByEnumeratingWithState:&v114 objects:v125 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v115;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v115 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v114 + 1) + 8 * i) setFailed:0];
      }
      id v12 = [v10 countByEnumeratingWithState:&v114 objects:v125 count:16];
    }
    while (v12);
  }

  v15 = [(DMDEngineUpdateDeclarationsOperation *)self request];
  v16 = [v15 removeDeclarations];

  id v92 = v10;
  v83 = self;
  if ([v16 count])
  {
    v17 = [v16 valueForKey:DMFDeclarationPayloadIdentifierKey];
    v18 = +[NSNull null];
    v19 = +[NSPredicate predicateWithFormat:@"self != %@", v18];
    uint64_t v20 = [v17 filteredArrayUsingPredicate:v19];

    v21 = [(DMDEngineUpdateDeclarationsOperation *)self request];
    v22 = [v21 organizationIdentifier];
    v84 = (void *)v20;
    v23 = +[DMDDeclarationPayloadMetadata fetchRequestForDeclarationsFromOrganizationWithIdentifier:v22 withIdentifiers:v20];

    id v113 = v9;
    v24 = [v23 execute:&v113];
    id v81 = v113;

    if (!v24)
    {
      v71 = DMFConfigurationEngineLog();
      if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR)) {
        sub_1000851A0(v81);
      }

      [(DMDEngineUpdateDeclarationsOperation *)v83 setError:v81];
      id v32 = v81;
      v34 = (void *)v20;
      goto LABEL_70;
    }
    v78 = v7;
    v80 = v16;
    long long v111 = 0u;
    long long v112 = 0u;
    long long v109 = 0u;
    long long v110 = 0u;
    id v25 = v24;
    id v26 = [v25 countByEnumeratingWithState:&v109 objects:v124 count:16];
    if (v26)
    {
      id v27 = v26;
      uint64_t v28 = *(void *)v110;
      do
      {
        for (j = 0; j != v27; j = (char *)j + 1)
        {
          if (*(void *)v110 != v28) {
            objc_enumerationMutation(v25);
          }
          v30 = *(void **)(*((void *)&v109 + 1) + 8 * (void)j);
          v31 = DMFConfigurationEngineLog();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            v123 = v30;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "Marking configuration for removal: %{public}@", buf, 0xCu);
          }

          [v30 setAvailable:0];
        }
        id v27 = [v25 countByEnumeratingWithState:&v109 objects:v124 count:16];
      }
      while (v27);
    }

    v7 = v78;
    id v32 = v81;
    self = v83;
    id v10 = v92;
  }
  else
  {
    v80 = v16;
    id v32 = v9;
  }
  v33 = [(DMDEngineUpdateDeclarationsOperation *)self request];
  v34 = [v33 upsertDeclarations];

  if (![v34 count])
  {
    v16 = v80;
LABEL_65:
    v74 = v32;
    id v94 = v32;
    unsigned __int8 v75 = [v88 save:&v94];
    id v32 = v94;

    if (v75)
    {
      [(DMDEngineUpdateDeclarationsOperation *)self setResultObject:0];
    }
    else
    {
      v76 = DMFConfigurationEngineLog();
      if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR)) {
        sub_100085014(v32);
      }

      [(DMDEngineUpdateDeclarationsOperation *)self setError:v32];
    }
    goto LABEL_70;
  }
  v35 = [(DMDEngineUpdateDeclarationsOperation *)self request];
  [v35 organizationIdentifier];
  v37 = v36 = v32;
  v38 = +[DMDDeclarationPayloadMetadata fetchRequestForActiveDeclarationsFromOrganizationWithIdentifier:v37];

  id v108 = v36;
  v77 = v38;
  v39 = [v38 execute:&v108];
  id v40 = v108;

  if (v39)
  {
    v85 = v34;
    v79 = v7;
    v93 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v39 count]);
    long long v104 = 0u;
    long long v105 = 0u;
    long long v106 = 0u;
    long long v107 = 0u;
    id obj = v39;
    id v41 = [obj countByEnumeratingWithState:&v104 objects:v121 count:16];
    if (v41)
    {
      id v42 = v41;
      uint64_t v43 = *(void *)v105;
      do
      {
        for (k = 0; k != v42; k = (char *)k + 1)
        {
          if (*(void *)v105 != v43) {
            objc_enumerationMutation(obj);
          }
          v45 = *(void **)(*((void *)&v104 + 1) + 8 * (void)k);
          v46 = [v45 identifier];
          v47 = [v93 objectForKeyedSubscript:v46];
          v48 = v47;
          if (v47) {
            id v49 = v47;
          }
          else {
            id v49 = (id)objc_opt_new();
          }
          v50 = v49;

          [v50 addObject:v45];
          v51 = [v45 identifier];
          [v93 setObject:v50 forKeyedSubscript:v51];
        }
        id v42 = [obj countByEnumeratingWithState:&v104 objects:v121 count:16];
      }
      while (v42);
    }

    self = v83;
    v52 = [(DMDEngineUpdateDeclarationsOperation *)v83 request];
    v53 = [v52 organizationIdentifier];
    id v103 = v40;
    v54 = +[DMDDeclarationPayloadMetadata declarationsWithDictionaries:v85 organizationIdentifier:v53 context:v88 error:&v103];
    id v82 = v103;

    id v55 = [v54 mutableCopy];
    if (v55)
    {
      long long v101 = 0u;
      long long v102 = 0u;
      long long v99 = 0u;
      long long v100 = 0u;
      v87 = v55;
      id v86 = [v55 allValues];
      id v91 = [v86 countByEnumeratingWithState:&v99 objects:v120 count:16];
      if (v91)
      {
        uint64_t v90 = *(void *)v100;
        do
        {
          for (m = 0; m != v91; m = (char *)m + 1)
          {
            if (*(void *)v100 != v90) {
              objc_enumerationMutation(v86);
            }
            v57 = *(void **)(*((void *)&v99 + 1) + 8 * (void)m);
            v58 = [v57 identifier];
            v59 = [v93 objectForKeyedSubscript:v58];

            long long v97 = 0u;
            long long v98 = 0u;
            long long v95 = 0u;
            long long v96 = 0u;
            id v60 = v59;
            id v61 = [v60 countByEnumeratingWithState:&v95 objects:v119 count:16];
            if (v61)
            {
              id v62 = v61;
              uint64_t v63 = *(void *)v96;
              while (2)
              {
                for (n = 0; n != v62; n = (char *)n + 1)
                {
                  if (*(void *)v96 != v63) {
                    objc_enumerationMutation(v60);
                  }
                  v65 = *(void **)(*((void *)&v95 + 1) + 8 * (void)n);
                  v66 = [v57 serverHash];
                  v67 = [v65 serverHash];
                  unsigned int v68 = [v66 isEqualToString:v67];

                  if (v68)
                  {
                    v69 = DMFConfigurationEngineLog();
                    if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138543362;
                      v123 = v57;
                      _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_INFO, "Declaration already installed, skipping: %{public}@", buf, 0xCu);
                    }

                    [v88 deleteObject:v57];
                    v70 = [v57 identifier];
                    [v87 removeObjectForKey:v70];

                    id v10 = v92;
                    goto LABEL_51;
                  }
                  [v65 setAvailable:0];
                }
                id v62 = [v60 countByEnumeratingWithState:&v95 objects:v119 count:16];
                id v10 = v92;
                if (v62) {
                  continue;
                }
                break;
              }
            }
LABEL_51:
          }
          id v91 = [v86 countByEnumeratingWithState:&v99 objects:v120 count:16];
        }
        while (v91);
      }

      v7 = v79;
      v16 = v80;
      self = v83;
      v34 = v85;
      id v32 = v82;
      id v55 = v87;
    }
    else
    {
      v73 = DMFConfigurationEngineLog();
      v7 = v79;
      id v32 = v82;
      if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR)) {
        sub_10008511C(v82);
      }

      [(DMDEngineUpdateDeclarationsOperation *)v83 setError:v82];
      v16 = v80;
      v34 = v85;
    }

    if (v55) {
      goto LABEL_65;
    }
  }
  else
  {
    v72 = DMFConfigurationEngineLog();
    v16 = v80;
    if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR)) {
      sub_100085098(v40);
    }

    [(DMDEngineUpdateDeclarationsOperation *)self setError:v40];
    id v32 = v40;
  }
LABEL_70:
}

- (DMFUpdateDeclarationsRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (void).cxx_destruct
{
}

@end