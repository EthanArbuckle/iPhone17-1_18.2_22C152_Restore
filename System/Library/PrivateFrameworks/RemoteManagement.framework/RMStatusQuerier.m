@interface RMStatusQuerier
- (NSArray)statusPublishers;
- (RMStatusQuerier)init;
- (RMStatusQuerier)initWithStatusPublishers:(id)a3;
- (id)_findStatusPublishersForKeyPaths:(id)a3;
- (id)_queryForFilteredStatusWithKeyPaths:(id)a3 lastAcknowledgedDateByKeyPath:(id)a4 onBehalfOfManagementChannel:(id)a5;
- (id)queryForStatusWithKeyPaths:(id)a3 onBehalfOfManagementChannel:(id)a4;
- (id)queryForUnacknowledgedStatusWithKeyPaths:(id)a3 lastAcknowledgedDateByKeyPath:(id)a4 onBehalfOfManagementChannel:(id)a5;
@end

@implementation RMStatusQuerier

- (RMStatusQuerier)init
{
  v3 = +[RMClientCapabilitiesController sharedController];
  v10[0] = v3;
  v4 = +[RMInternalStatusPublisher sharedPublisher];
  v10[1] = v4;
  v5 = +[NSArray arrayWithObjects:v10 count:2];

  if (+[RMFeatureFlags isHTTPConduitEnabled])
  {
    v6 = +[RMPushController sharedController];
    uint64_t v7 = [v5 arrayByAddingObject:v6];

    v5 = (void *)v7;
  }
  v8 = [(RMStatusQuerier *)self initWithStatusPublishers:v5];

  return v8;
}

- (RMStatusQuerier)initWithStatusPublishers:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RMStatusQuerier;
  v5 = [(RMStatusQuerier *)&v9 init];
  if (v5)
  {
    v6 = (NSArray *)[v4 copy];
    statusPublishers = v5->_statusPublishers;
    v5->_statusPublishers = v6;
  }
  return v5;
}

- (id)_findStatusPublishersForKeyPaths:(id)a3
{
  id v4 = a3;
  v5 = +[RMExternalStatusPublisher sharedPublisher];
  v6 = +[NSMutableArray arrayWithObject:v5];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = [(RMStatusQuerier *)self statusPublishers];
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v13 = [v12 supportedKeyPaths];
        v14 = RMFilterSupportedKeyPathsByRequestedKeyPaths(v13, v4);

        if ([v14 count]) {
          [v6 addObject:v12];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  return v6;
}

- (id)queryForStatusWithKeyPaths:(id)a3 onBehalfOfManagementChannel:(id)a4
{
  return [(RMStatusQuerier *)self _queryForFilteredStatusWithKeyPaths:a3 lastAcknowledgedDateByKeyPath:0 onBehalfOfManagementChannel:a4];
}

- (id)queryForUnacknowledgedStatusWithKeyPaths:(id)a3 lastAcknowledgedDateByKeyPath:(id)a4 onBehalfOfManagementChannel:(id)a5
{
  return [(RMStatusQuerier *)self _queryForFilteredStatusWithKeyPaths:a3 lastAcknowledgedDateByKeyPath:a4 onBehalfOfManagementChannel:a5];
}

- (id)_queryForFilteredStatusWithKeyPaths:(id)a3 lastAcknowledgedDateByKeyPath:(id)a4 onBehalfOfManagementChannel:(id)a5
{
  id v73 = a3;
  id v74 = a4;
  id v71 = a5;
  id v8 = +[RMLog statusQuerier];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100066E9C((uint64_t)v73, v8);
  }

  if (![v73 count])
  {
    v63 = (RMStatusQueryResult *)objc_opt_new();
    goto LABEL_78;
  }
  v68 = objc_opt_new();
  v66 = objc_opt_new();
  id v9 = [(RMStatusQuerier *)self _findStatusPublishersForKeyPaths:v73];
  v70 = +[NSMutableSet setWithSet:v73];
  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  id obj = v9;
  id v72 = [obj countByEnumeratingWithState:&v82 objects:v90 count:16];
  if (!v72) {
    goto LABEL_63;
  }
  uint64_t v69 = *(void *)v83;
  *(void *)&long long v10 = 138543362;
  long long v65 = v10;
  do
  {
    uint64_t v11 = 0;
    do
    {
      if (*(void *)v83 != v69)
      {
        uint64_t v12 = v11;
        objc_enumerationMutation(obj);
        uint64_t v11 = v12;
      }
      uint64_t v75 = v11;
      v13 = *(void **)(*((void *)&v82 + 1) + 8 * v11);
      v14 = objc_msgSend(v13, "supportedKeyPaths", v65);
      v15 = RMFilterSupportedKeyPathsByRequestedKeyPaths(v14, v73);

      [v70 minusSet:v15];
      id v16 = v15;
      long long v17 = objc_opt_new();
      long long v88 = 0u;
      long long v89 = 0u;
      long long v86 = 0u;
      long long v87 = 0u;
      id v79 = v16;
      id v18 = [v79 countByEnumeratingWithState:&v86 objects:buf count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v87;
        do
        {
          for (i = 0; i != v18; i = (char *)i + 1)
          {
            if (*(void *)v87 != v19) {
              objc_enumerationMutation(v79);
            }
            id v21 = *(id *)(*((void *)&v86 + 1) + 8 * i);
            id v22 = [v21 rangeOfString:@"/"];
            if (v23)
            {
              v24 = [v21 substringToIndex:v22];

              if (v24)
              {
                [v17 addObject:v24];

                continue;
              }
            }
            else
            {
            }
            [v17 addObject:v21];
          }
          id v18 = [v79 countByEnumeratingWithState:&v86 objects:buf count:16];
        }
        while (v18);
      }

      if (v74)
      {
        uint64_t v80 = 0;
        v77 = [v13 queryForUnacknowledgedStatusWithKeyPaths:v17 lastAcknowledgedDateByKeyPath:v74 onBehalfOfManagementChannel:v71 error:&v80];
        v25 = (id *)&v80;
      }
      else
      {
        uint64_t v81 = 0;
        v77 = [v13 queryForStatusWithKeyPaths:v17 onBehalfOfManagementChannel:v71 error:&v81];
        v25 = (id *)&v81;
      }
      id v76 = *v25;
      if (v77)
      {
        id v26 = v68;
        id v27 = v77;
        id v28 = v79;
        long long v86 = 0u;
        long long v87 = 0u;
        long long v88 = 0u;
        long long v89 = 0u;
        id v78 = v28;
        id v29 = [v78 countByEnumeratingWithState:&v86 objects:buf count:16];
        if (!v29) {
          goto LABEL_48;
        }
        uint64_t v30 = *(void *)v87;
        while (1)
        {
          for (j = 0; j != v29; j = (char *)j + 1)
          {
            if (*(void *)v87 != v30) {
              objc_enumerationMutation(v78);
            }
            id v32 = *(id *)(*((void *)&v86 + 1) + 8 * (void)j);
            id v33 = [v32 rangeOfString:@"/"];
            if (v34)
            {
              v35 = [v32 substringToIndex:v33];

              if (v35)
              {
                sub_100034F1C(v26, v35);
                v36 = [v27 valueForKeyPath:v35];
                v37 = [v26 valueForKeyPath:v35];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    uint64_t v38 = sub_100066BCC(v37, v36);

                    v36 = (void *)v38;
                    goto LABEL_44;
                  }
                }
                if (!v37)
                {
LABEL_44:
                  [v26 setValue:v36 forKeyPath:v35];
                  v37 = 0;
                }

                goto LABEL_46;
              }
            }
            else
            {
            }
            v39 = [v32 pathExtension];
            BOOL v40 = [v39 length] == 0;

            if (!v40)
            {
              v41 = [v32 stringByDeletingPathExtension];
              sub_100034F1C(v26, v41);
            }
            v35 = [v27 valueForKeyPath:v32];
            v36 = [v26 valueForKeyPath:v32];
            objc_opt_class();
            if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
            {
              uint64_t v42 = sub_100066BCC(v36, v35);

              v35 = (void *)v42;
            }
            else if (v36)
            {
              goto LABEL_46;
            }
            [v26 setValue:v35 forKeyPath:v32];
            v36 = 0;
LABEL_46:
          }
          id v29 = [v78 countByEnumeratingWithState:&v86 objects:buf count:16];
          if (!v29)
          {
LABEL_48:

            goto LABEL_61;
          }
        }
      }
      v43 = +[RMLog statusQuerier];
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = v65;
        id v92 = v76;
        _os_log_error_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "Failed to query status: %{public}@", buf, 0xCu);
      }

      id v44 = v66;
      id v45 = v76;
      id v46 = v79;
      long long v86 = 0u;
      long long v87 = 0u;
      long long v88 = 0u;
      long long v89 = 0u;
      id v47 = [v46 countByEnumeratingWithState:&v86 objects:buf count:16];
      if (v47)
      {
        uint64_t v48 = *(void *)v87;
        do
        {
          for (k = 0; k != v47; k = (char *)k + 1)
          {
            if (*(void *)v87 != v48) {
              objc_enumerationMutation(v46);
            }
            uint64_t v50 = *(void *)(*((void *)&v86 + 1) + 8 * (void)k);
            v51 = [v44 objectForKeyedSubscript:v50];
            BOOL v52 = v51 == 0;

            if (v52) {
              [v44 setObject:v45 forKeyedSubscript:v50];
            }
          }
          id v47 = [v46 countByEnumeratingWithState:&v86 objects:buf count:16];
        }
        while (v47);
      }

LABEL_61:
      uint64_t v11 = v75 + 1;
    }
    while ((id)(v75 + 1) != v72);
    id v72 = [obj countByEnumeratingWithState:&v82 objects:v90 count:16];
  }
  while (v72);
LABEL_63:

  if ([v70 count])
  {
    v53 = +[RMLog statusQuerier];
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG)) {
      sub_100066E24((uint64_t)v70, v53);
    }

    id v54 = v66;
    id v55 = v70;
    long long v86 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    id v56 = [v55 countByEnumeratingWithState:&v86 objects:buf count:16];
    if (v56)
    {
      uint64_t v57 = *(void *)v87;
      do
      {
        for (m = 0; m != v56; m = (char *)m + 1)
        {
          if (*(void *)v87 != v57) {
            objc_enumerationMutation(v55);
          }
          uint64_t v59 = *(void *)(*((void *)&v86 + 1) + 8 * (void)m);
          v60 = [v54 objectForKeyedSubscript:v59];
          BOOL v61 = v60 == 0;

          if (v61)
          {
            v62 = +[RMErrorUtilities createUnsupportedStatusValueErrorWithKeyPath:v59];
            [v54 setObject:v62 forKeyedSubscript:v59];
          }
        }
        id v56 = [v55 countByEnumeratingWithState:&v86 objects:buf count:16];
      }
      while (v56);
    }
  }
  v63 = [[RMStatusQueryResult alloc] initWithStatusKeyPaths:v73 statusByKeyPath:v68 errorByKeyPath:v66];

LABEL_78:

  return v63;
}

- (NSArray)statusPublishers
{
  return self->_statusPublishers;
}

- (void).cxx_destruct
{
}

@end