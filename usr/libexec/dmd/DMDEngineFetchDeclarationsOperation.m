@interface DMDEngineFetchDeclarationsOperation
- (DMFFetchDeclarationsRequest)request;
- (id)completionHandler;
- (void)performDatabaseModificationOperationWithManagedObjectContext:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setRequest:(id)a3;
@end

@implementation DMDEngineFetchDeclarationsOperation

- (void)performDatabaseModificationOperationWithManagedObjectContext:(id)a3
{
  v4 = [(DMDEngineFetchDeclarationsOperation *)self request];
  v5 = [v4 payloadIdentifiers];

  if (v5)
  {
    v6 = [v4 payloadIdentifiers];
    v7 = +[NSPredicate predicateWithFormat:@"identifier IN %@", v6];
  }
  else
  {
    v7 = 0;
  }
  v8 = [v4 organizationIdentifier];
  v9 = +[DMDPayloadMetadata fetchRequestForPayloadMetadatasFromOrganizationWithIdentifier:v8 matchingPredicate:v7];

  id v64 = 0;
  v10 = [v9 execute:&v64];
  id v11 = v64;
  v12 = v11;
  if (v10)
  {
    id v41 = v11;
    v42 = v9;
    v43 = v7;
    v44 = self;
    v13 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v10 count]);
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    v40 = v10;
    id obj = v10;
    id v14 = [obj countByEnumeratingWithState:&v60 objects:v66 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v61;
      uint64_t v17 = DMFDeclarationPayloadIdentifierKey;
      uint64_t v18 = DMFDeclarationPayloadTypeKey;
      uint64_t v53 = DMFDeclarationStatusMessageStateKey;
      uint64_t v45 = DMFDeclarationPayloadDataKey;
      uint64_t v46 = DMFDeclarationPayloadTypeKey;
      v49 = v13;
      v50 = v4;
      uint64_t v47 = DMFDeclarationPayloadIdentifierKey;
      uint64_t v48 = *(void *)v61;
      do
      {
        uint64_t v19 = 0;
        id v51 = v15;
        do
        {
          if (*(void *)v61 != v16) {
            objc_enumerationMutation(obj);
          }
          uint64_t v54 = v19;
          v20 = *(void **)(*((void *)&v60 + 1) + 8 * v19);
          v21 = objc_opt_new();
          v22 = [v20 identifier];
          [v21 setObject:v22 forKeyedSubscript:v17];

          v23 = [v20 type];
          [v21 setObject:v23 forKeyedSubscript:v18];

          v24 = [v20 stateDictionary];
          v55 = v21;
          [v21 setObject:v24 forKeyedSubscript:v53];

          if ([v4 includePayloadContents])
          {
            v25 = [v20 payload];
            v26 = [v25 payloadDictionary];
            [v55 setObject:v26 forKeyedSubscript:v45];
          }
          if ([v4 includeInternalState])
          {
            v27 = objc_opt_new();
            long long v56 = 0u;
            long long v57 = 0u;
            long long v58 = 0u;
            long long v59 = 0u;
            v28 = [v20 descriptiveProperties];
            id v29 = [v28 countByEnumeratingWithState:&v56 objects:v65 count:16];
            if (v29)
            {
              id v30 = v29;
              uint64_t v31 = *(void *)v57;
              do
              {
                for (i = 0; i != v30; i = (char *)i + 1)
                {
                  if (*(void *)v57 != v31) {
                    objc_enumerationMutation(v28);
                  }
                  uint64_t v33 = *(void *)(*((void *)&v56 + 1) + 8 * i);
                  v34 = [v20 valueForKeyPath:v33];
                  if (v34)
                  {
                    [v27 setObject:v34 forKeyedSubscript:v33];
                  }
                  else
                  {
                    v35 = +[NSNull null];
                    [v27 setObject:v35 forKeyedSubscript:v33];
                  }
                }
                id v30 = [v28 countByEnumeratingWithState:&v56 objects:v65 count:16];
              }
              while (v30);
            }

            [v55 setObject:v27 forKeyedSubscript:@"Debug"];
            v13 = v49;
            v4 = v50;
            uint64_t v17 = v47;
            uint64_t v16 = v48;
            id v15 = v51;
            uint64_t v18 = v46;
          }
          [v13 addObject:v55];

          uint64_t v19 = v54 + 1;
        }
        while ((id)(v54 + 1) != v15);
        id v15 = [obj countByEnumeratingWithState:&v60 objects:v66 count:16];
      }
      while (v15);
    }

    [v13 sortUsingComparator:&stru_1000CAF00];
    v36 = [(DMDEngineFetchDeclarationsOperation *)v44 completionHandler];

    if (v36)
    {
      v37 = [(DMDEngineFetchDeclarationsOperation *)v44 completionHandler];
      ((void (**)(void, void *, void))v37)[2](v37, v13, 0);
    }
    [(DMDEngineFetchDeclarationsOperation *)v44 setResultObject:0];

    v9 = v42;
    v7 = v43;
    v10 = v40;
    v12 = v41;
  }
  else
  {
    v38 = [(DMDEngineFetchDeclarationsOperation *)self completionHandler];

    if (v38)
    {
      v39 = [(DMDEngineFetchDeclarationsOperation *)self completionHandler];
      ((void (**)(void, void, void *))v39)[2](v39, 0, v12);
    }
    [(DMDEngineFetchDeclarationsOperation *)self setError:v12];
  }
}

- (DMFFetchDeclarationsRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);

  objc_storeStrong((id *)&self->_request, 0);
}

@end