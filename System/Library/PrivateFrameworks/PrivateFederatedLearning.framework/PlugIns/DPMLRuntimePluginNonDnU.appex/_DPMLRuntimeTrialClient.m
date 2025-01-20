@interface _DPMLRuntimeTrialClient
- (NSDictionary)recipeDictionary;
- (NSString)deploymentIdentifier;
- (NSString)experimentIdentifier;
- (NSString)namespaceIdentifier;
- (NSString)treatmentIdentifier;
- (NSURL)recipeURL;
- (TRIClient)trialClient;
- (_DPMLRuntimeTrialClient)initWithTask:(id)a3 error:(id *)a4;
- (id)downloadDbs:(id)a3 suffix:(id)a4;
- (id)downloadFactor:(id)a3 error:(id *)a4;
- (id)updateMetadataWithDPParameters:(id)a3;
- (void)loadRecipeWithError:(id *)a3;
- (void)removeDbs:(id)a3 suffix:(id)a4;
- (void)removeFactor:(id)a3;
- (void)setDeploymentIdentifier:(id)a3;
- (void)setExperimentIdentifier:(id)a3;
- (void)setNamespaceIdentifier:(id)a3;
- (void)setRecipeDictionary:(id)a3;
- (void)setRecipeURL:(id)a3;
- (void)setTreatmentIdentifier:(id)a3;
- (void)setTrialClient:(id)a3;
@end

@implementation _DPMLRuntimeTrialClient

- (_DPMLRuntimeTrialClient)initWithTask:(id)a3 error:(id *)a4
{
  id v7 = a3;
  v52.receiver = self;
  v52.super_class = (Class)_DPMLRuntimeTrialClient;
  v8 = [(_DPMLRuntimeTrialClient *)&v52 init];
  v9 = v8;
  if (!v8) {
    goto LABEL_25;
  }
  v49 = a4;
  v51 = v8;
  v48 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v47 = [v48 pathForResource:@"dpmlruntime-allowed-namespaces" ofType:@"plist"];
  v50 = +[NSDictionary dictionaryWithContentsOfFile:](NSDictionary, "dictionaryWithContentsOfFile:");
  v10 = [v50 objectForKey:@"allowed-namespaces"];
  if (![v10 count])
  {
LABEL_13:
    if (a4)
    {
      +[_DPMLRuntimeError errorWithCode:300 description:@"Could not find any matching namespace on client"];
      int v22 = 0;
      v4 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      int v22 = 1;
    }
    v9 = v51;
    v24 = (void *)v47;
    v23 = v48;
    goto LABEL_24;
  }
  v4 = 0;
  *(void *)&long long v11 = 138412546;
  long long v46 = v11;
  while (1)
  {
    v12 = +[_PFLLog extension];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v21 = [v10 objectAtIndexedSubscript:v4];
      *(_DWORD *)buf = 138412290;
      v54 = v21;
      _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Checking for namespace: %@", buf, 0xCu);
    }
    v13 = [v7 triClient];
    v14 = [v10 objectAtIndexedSubscript:v4];
    v15 = [v13 levelForFactor:@"recipe" withNamespaceName:v14];

    v16 = +[_PFLLog extension];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = v46;
      v54 = v15;
      __int16 v55 = 2112;
      CFStringRef v56 = @"recipe";
      _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Got level: %@ for factor %@", buf, 0x16u);
    }

    v17 = [v15 fileValue];
    if (([v17 hasPath] & 1) == 0)
    {

      goto LABEL_12;
    }
    v18 = [v15 fileValue];
    v19 = [v18 path];
    id v20 = [v19 rangeOfString:@".recipe"];

    if (v20 != (id)0x7FFFFFFFFFFFFFFFLL) {
      break;
    }
LABEL_12:

    v4 = (_DPMLRuntimeTrialClient *)((char *)v4 + 1);
    if (v4 >= [v10 count]) {
      goto LABEL_13;
    }
  }
  v25 = [v15 fileValue];
  v26 = [v25 path];
  uint64_t v27 = +[NSURL fileURLWithPath:v26];
  v9 = v51;
  recipeURL = v51->_recipeURL;
  v51->_recipeURL = (NSURL *)v27;

  [(_DPMLRuntimeTrialClient *)v51 loadRecipeWithError:v49];
  if (v51->_recipeDictionary)
  {
    uint64_t v29 = [v10 objectAtIndexedSubscript:v4];
    namespaceIdentifier = v51->_namespaceIdentifier;
    v51->_namespaceIdentifier = (NSString *)v29;

    v31 = [v7 triClient];
    [v31 refresh];
    v32 = [v10 objectAtIndexedSubscript:v4];
    v33 = [v31 experimentIdentifiersWithNamespaceName:v32];

    if (v33)
    {
      uint64_t v34 = [v33 experimentId];
      experimentIdentifier = v51->_experimentIdentifier;
      v51->_experimentIdentifier = (NSString *)v34;

      v36 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v33 deploymentId]);
      uint64_t v37 = [v36 stringValue];
      deploymentIdentifier = v51->_deploymentIdentifier;
      v51->_deploymentIdentifier = (NSString *)v37;

      uint64_t v39 = [v33 treatmentId];
      treatmentIdentifier = v51->_treatmentIdentifier;
      v51->_treatmentIdentifier = (NSString *)v39;
    }
    else
    {
      v41 = v51->_experimentIdentifier;
      v51->_experimentIdentifier = 0;

      v42 = v51->_deploymentIdentifier;
      v51->_deploymentIdentifier = 0;

      treatmentIdentifier = v51->_treatmentIdentifier;
      v51->_treatmentIdentifier = 0;
    }
    v24 = (void *)v47;
    v23 = v48;

    uint64_t v43 = [v7 triClient];
    trialClient = v51->_trialClient;
    v51->_trialClient = (TRIClient *)v43;

    v4 = v51;
  }
  else
  {
    v4 = 0;
    v24 = (void *)v47;
    v23 = v48;
  }

  int v22 = 0;
LABEL_24:

  if (v22) {
LABEL_25:
  }
    v4 = v9;

  return v4;
}

- (NSDictionary)recipeDictionary
{
  recipeDictionary = self->_recipeDictionary;
  if (!recipeDictionary)
  {
    [(_DPMLRuntimeTrialClient *)self loadRecipeWithError:0];
    recipeDictionary = self->_recipeDictionary;
  }
  return recipeDictionary;
}

- (void)loadRecipeWithError:(id *)a3
{
  p_recipeURL = (uint64_t *)&self->_recipeURL;
  v6 = +[NSData dataWithContentsOfURL:self->_recipeURL options:1 error:a3];
  if (v6)
  {
    uint64_t v7 = +[NSJSONSerialization JSONObjectWithData:v6 options:0 error:a3];
    recipeDictionary = self->_recipeDictionary;
    p_recipeDictionary = (uint64_t *)&self->_recipeDictionary;
    uint64_t *p_recipeDictionary = v7;

    v10 = +[_PFLLog extension];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_100020A84(p_recipeURL, p_recipeDictionary, v10);
    }

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      long long v11 = +[_PFLLog extension];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_100020A40(v11);
      }

      v12 = (void *)*p_recipeDictionary;
      uint64_t *p_recipeDictionary = 0;

      if (a3 && !*a3)
      {
        *a3 = +[_DPMLRuntimeError errorWithCode:300 description:@"Recipe is not dictionary format"];
      }
    }
  }
}

- (id)updateMetadataWithDPParameters:(id)a3
{
  id v4 = [a3 mutableCopy];
  [v4 setObject:&stru_100031EA0 forKeyedSubscript:kDPMetadataVersionHash];
  v5 = [(_DPMLRuntimeTrialClient *)self recipeDictionary];
  uint64_t v6 = kDPMetadataDediscoTaskConfig;
  uint64_t v7 = [v5 objectForKeyedSubscript:kDPMetadataDediscoTaskConfig];

  if (v7)
  {
    [v4 setObject:v7 forKey:v6];
    v8 = +[_PFLLog extension];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412290;
      id v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "New metadata: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    v8 = +[_PFLLog extension];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_100020B0C(v6, v8);
    }
  }

  return v4;
}

- (id)downloadFactor:(id)a3 error:(id *)a4
{
  id v5 = a3;
  trialClient = self->_trialClient;
  uint64_t v7 = [(_DPMLRuntimeTrialClient *)self namespaceIdentifier];
  v8 = [(TRIClient *)trialClient factorLevelsWithNamespaceName:v7];

  long long v61 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v58 = 0u;
  v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v58 objects:v67 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v59;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v59 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v58 + 1) + 8 * i);
        v15 = [v14 factor];
        v16 = [v15 name];
        unsigned int v17 = [v16 isEqualToString:v5];

        if (v17)
        {
          v21 = [v14 level];
          int v22 = [v21 fileValue];
          unsigned int v23 = [v22 hasPath];

          if (v23)
          {
            v24 = +[_PFLLog extension];
            if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
            {
              v25 = [v14 level];
              v26 = [v25 fileValue];
              uint64_t v27 = [v26 path];
              *(_DWORD *)buf = 138412290;
              id v64 = v27;
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%@ file exists.", buf, 0xCu);
            }
            v28 = [v14 level];
            uint64_t v29 = [v28 fileValue];
            id v20 = [v29 path];

            v19 = v9;
          }
          else
          {

            dispatch_semaphore_t v30 = dispatch_semaphore_create(0);
            v31 = +[_PFLLog extension];
            if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
            {
              v32 = [(_DPMLRuntimeTrialClient *)self namespaceIdentifier];
              *(_DWORD *)buf = 138412546;
              id v64 = v5;
              __int16 v65 = 2112;
              v66 = v32;
              _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "Downloading factor %@ for namespace %@", buf, 0x16u);
            }
            id v33 = [objc_alloc((Class)TRIDownloadOptions) initWithAllowsCellular:0 discretionaryBehavior:0];
            uint64_t v34 = self->_trialClient;
            id v62 = v5;
            v35 = +[NSArray arrayWithObjects:&v62 count:1];
            v36 = [(_DPMLRuntimeTrialClient *)self namespaceIdentifier];
            uint64_t v37 = dispatch_get_global_queue(0, 0);
            v56[0] = _NSConcreteStackBlock;
            v56[1] = 3221225472;
            v56[2] = sub_10001D21C;
            v56[3] = &unk_1000309B0;
            id v57 = v5;
            v53[0] = _NSConcreteStackBlock;
            v53[1] = 3221225472;
            v53[2] = sub_10001D280;
            v53[3] = &unk_1000309D8;
            id v38 = v57;
            id v54 = v38;
            v19 = v30;
            __int16 v55 = v19;
            v51 = v33;
            [(TRIClient *)v34 downloadLevelsForFactors:v35 withNamespace:v36 queue:v37 options:v33 progress:v56 completion:v53];

            dispatch_time_t v39 = dispatch_time(0, 600000000000);
            dispatch_semaphore_wait(v19, v39);
            v40 = [(_DPMLRuntimeTrialClient *)self trialClient];
            [v40 refresh];

            v41 = [(_DPMLRuntimeTrialClient *)self trialClient];
            uint64_t v42 = [(_DPMLRuntimeTrialClient *)self namespaceIdentifier];
            uint64_t v43 = [v41 levelForFactor:v38 withNamespaceName:v42];

            v44 = [v43 fileValue];
            LOBYTE(v42) = [v44 hasPath];

            if (v42)
            {
              v45 = +[_PFLLog extension];
              if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
              {
                long long v46 = [v43 fileValue];
                uint64_t v47 = [v46 path];
                *(_DWORD *)buf = 138412546;
                id v64 = v38;
                __int16 v65 = 2112;
                v66 = v47;
                _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "Downloaded file for %@: %@", buf, 0x16u);
              }
              v48 = [v43 fileValue];
              id v20 = [v48 path];
            }
            else
            {
              v49 = [(_DPMLRuntimeTrialClient *)self namespaceIdentifier];
              v48 = +[NSString stringWithFormat:@"Factor %@ of namespace %@ does not have a file downloaded", v38, v49];

              if (a4)
              {
                +[_DPMLRuntimeError errorWithCode:300 description:v48];
                id v20 = 0;
                *a4 = (id)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                id v20 = 0;
              }
            }
          }
          goto LABEL_26;
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v58 objects:v67 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  v18 = [(_DPMLRuntimeTrialClient *)self namespaceIdentifier];
  v19 = +[NSString stringWithFormat:@"Could not find any matching factor %@ for namespace %@", v5, v18];

  if (a4)
  {
    +[_DPMLRuntimeError errorWithCode:300 description:v19];
    id v20 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v20 = 0;
  }
LABEL_26:

  return v20;
}

- (void)removeFactor:(id)a3
{
  id v4 = a3;
  id v5 = +[_PFLLog extension];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100020C74((uint64_t)v4, self, v5);
  }

  trialClient = self->_trialClient;
  id v14 = v4;
  uint64_t v7 = +[NSArray arrayWithObjects:&v14 count:1];
  v8 = [(_DPMLRuntimeTrialClient *)self namespaceIdentifier];
  v9 = dispatch_get_global_queue(0, 0);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001D468;
  v11[3] = &unk_1000309D8;
  id v12 = v4;
  v13 = self;
  id v10 = v4;
  [(TRIClient *)trialClient removeLevelsForFactors:v7 withNamespace:v8 queue:v9 completion:v11];
}

- (id)downloadDbs:(id)a3 suffix:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v20 = +[NSMutableDictionary dictionary];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v6;
  id v8 = [obj countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v8)
  {
    id v9 = v8;
    id v10 = 0;
    uint64_t v11 = *(void *)v23;
    do
    {
      id v12 = 0;
      v13 = v10;
      do
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(id *)(*((void *)&v22 + 1) + 8 * (void)v12);
        v15 = v14;
        if ([v7 length])
        {
          v15 = +[NSString stringWithFormat:@"%@_%@", v14, v7];
        }
        id v21 = v13;
        v16 = [(_DPMLRuntimeTrialClient *)self downloadFactor:v15 error:&v21];
        id v10 = v21;

        if (v16)
        {
          [v20 setObject:v16 forKeyedSubscript:v14];
        }
        else
        {
          unsigned int v17 = +[_PFLLog extension];
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            id v27 = v14;
            __int16 v28 = 2112;
            id v29 = v10;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Found no database for  %@, %@.", buf, 0x16u);
          }
        }
        id v12 = (char *)v12 + 1;
        v13 = v10;
      }
      while (v9 != v12);
      id v9 = [obj countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v9);
  }
  return v20;
}

- (void)removeDbs:(id)a3 suffix:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(id *)(*((void *)&v14 + 1) + 8 * (void)v11);
        if ([v7 length])
        {
          uint64_t v13 = +[NSString stringWithFormat:@"%@_%@", v12, v7];

          id v12 = (id)v13;
        }
        [(_DPMLRuntimeTrialClient *)self removeFactor:v12];

        uint64_t v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
}

- (NSURL)recipeURL
{
  return self->_recipeURL;
}

- (void)setRecipeURL:(id)a3
{
}

- (NSString)namespaceIdentifier
{
  return self->_namespaceIdentifier;
}

- (void)setNamespaceIdentifier:(id)a3
{
}

- (NSString)experimentIdentifier
{
  return self->_experimentIdentifier;
}

- (void)setExperimentIdentifier:(id)a3
{
}

- (NSString)deploymentIdentifier
{
  return self->_deploymentIdentifier;
}

- (void)setDeploymentIdentifier:(id)a3
{
}

- (NSString)treatmentIdentifier
{
  return self->_treatmentIdentifier;
}

- (void)setTreatmentIdentifier:(id)a3
{
}

- (TRIClient)trialClient
{
  return self->_trialClient;
}

- (void)setTrialClient:(id)a3
{
}

- (void)setRecipeDictionary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipeDictionary, 0);
  objc_storeStrong((id *)&self->_trialClient, 0);
  objc_storeStrong((id *)&self->_treatmentIdentifier, 0);
  objc_storeStrong((id *)&self->_deploymentIdentifier, 0);
  objc_storeStrong((id *)&self->_experimentIdentifier, 0);
  objc_storeStrong((id *)&self->_namespaceIdentifier, 0);
  objc_storeStrong((id *)&self->_recipeURL, 0);
}

@end