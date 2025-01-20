@interface DMDEngineSetDeclarationsOperation
- (DMFSetDeclarationsRequest)request;
- (void)performDatabaseModificationOperationWithManagedObjectContext:(id)a3;
- (void)setRequest:(id)a3;
@end

@implementation DMDEngineSetDeclarationsOperation

- (void)performDatabaseModificationOperationWithManagedObjectContext:(id)a3
{
  id v4 = a3;
  v5 = [(DMDEngineSetDeclarationsOperation *)self request];
  v6 = [v5 organizationIdentifier];
  v7 = +[DMDDeclarationPayloadMetadata fetchRequestForFailedDeclarationsFromOrganizationWithIdentifier:v6];

  id v64 = 0;
  v52 = v4;
  v8 = [v4 executeFetchRequest:v7 error:&v64];
  id v9 = v64;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v10 = v8;
  id v11 = [v10 countByEnumeratingWithState:&v60 objects:v68 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v61;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v61 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v60 + 1) + 8 * i) setFailed:0];
      }
      id v12 = [v10 countByEnumeratingWithState:&v60 objects:v68 count:16];
    }
    while (v12);
  }

  v15 = [(DMDEngineSetDeclarationsOperation *)self request];
  v16 = [v15 organizationIdentifier];
  v17 = +[DMDDeclarationPayloadMetadata fetchRequestForActiveDeclarationsFromOrganizationWithIdentifier:v16];

  id v59 = v9;
  v18 = [v17 execute:&v59];
  id v19 = v59;

  if (v18)
  {
    v51 = v18;
    v20 = [(DMDEngineSetDeclarationsOperation *)self request];
    v21 = [v20 declarations];
    v50 = self;
    v22 = [(DMDEngineSetDeclarationsOperation *)self request];
    v23 = [v22 organizationIdentifier];
    id v58 = v19;
    v24 = +[DMDDeclarationPayloadMetadata declarationsWithDictionaries:v21 organizationIdentifier:v23 context:v52 error:&v58];
    id v49 = v58;

    id v25 = [v24 mutableCopy];
    v26 = DMFConfigurationEngineLog();
    v27 = v26;
    if (v25)
    {
      v46 = v17;
      id v47 = v10;
      v48 = v7;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        v28 = [(DMDEngineSetDeclarationsOperation *)v50 request];
        v29 = [v28 organizationIdentifier];
        *(_DWORD *)buf = 138543362;
        v67 = v29;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Start set declarations for %{public}@", buf, 0xCu);
      }
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      id v30 = v51;
      id v31 = [v30 countByEnumeratingWithState:&v54 objects:v65 count:16];
      if (v31)
      {
        id v32 = v31;
        uint64_t v33 = *(void *)v55;
        do
        {
          for (j = 0; j != v32; j = (char *)j + 1)
          {
            if (*(void *)v55 != v33) {
              objc_enumerationMutation(v30);
            }
            v35 = *(void **)(*((void *)&v54 + 1) + 8 * (void)j);
            [v35 setAvailable:0, v46];
            v36 = [v35 identifier];
            v37 = [v25 objectForKeyedSubscript:v36];

            v38 = [v37 serverHash];
            v39 = [v35 serverHash];
            unsigned int v40 = [v38 isEqualToString:v39];

            if (v40)
            {
              v41 = DMFConfigurationEngineLog();
              if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138543362;
                v67 = v37;
                _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "Declaration already present, skipping: %{public}@", buf, 0xCu);
              }

              [v52 deleteObject:v37];
              v42 = [v37 identifier];
              [v25 removeObjectForKey:v42];

              [v35 setAvailable:1];
            }
          }
          id v32 = [v30 countByEnumeratingWithState:&v54 objects:v65 count:16];
        }
        while (v32);
      }

      id v53 = v49;
      unsigned __int8 v43 = [v52 save:&v53];
      id v19 = v53;

      if (v43)
      {
        [(DMDEngineSetDeclarationsOperation *)v50 setResultObject:0];
        id v10 = v47;
        v7 = v48;
      }
      else
      {
        v45 = DMFConfigurationEngineLog();
        id v10 = v47;
        v7 = v48;
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
          sub_100084E7C(v19);
        }

        [(DMDEngineSetDeclarationsOperation *)v50 setError:v19];
      }
      v17 = v46;
    }
    else
    {
      id v19 = v49;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        sub_100084DF4(v49);
      }

      [(DMDEngineSetDeclarationsOperation *)v50 setError:v49];
    }
    v18 = v51;
  }
  else
  {
    v44 = DMFConfigurationEngineLog();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
      sub_100084D6C(v19);
    }

    [(DMDEngineSetDeclarationsOperation *)self setError:v19];
  }
}

- (DMFSetDeclarationsRequest)request
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