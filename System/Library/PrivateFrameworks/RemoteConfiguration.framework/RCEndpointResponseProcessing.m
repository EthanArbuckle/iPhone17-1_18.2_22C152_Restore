@interface RCEndpointResponseProcessing
+ (id)_configurationErrorForErrorDicts:(id)a3;
+ (void)parseEndpointResponse:(id)a3 configurationSettings:(id)a4 maxAge:(id)a5 loggingPrefix:(id)a6 completion:(id)a7;
+ (void)parseEndpointResponseDict:(id)a3 parsingError:(id)a4 configurationSettings:(id)a5 maxAge:(id)a6 loggingPrefix:(id)a7 completion:(id)a8;
@end

@implementation RCEndpointResponseProcessing

+ (void)parseEndpointResponse:(id)a3 configurationSettings:(id)a4 maxAge:(id)a5 loggingPrefix:(id)a6 completion:(id)a7
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v17 = objc_msgSend(v12, "rc_gzipInflate");
  v18 = (void *)v17;
  if (v17) {
    id v19 = (id)v17;
  }
  else {
    id v19 = v12;
  }
  id v23 = 0;
  v20 = objc_msgSend(MEMORY[0x1E4F1C9E8], "rc_dictionaryFromData:error:", v19, &v23);
  id v21 = v23;
  if (v21)
  {
    v22 = RCSharedLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v25 = v15;
      __int16 v26 = 2114;
      id v27 = v21;
      _os_log_impl(&dword_1A4AB3000, v22, OS_LOG_TYPE_ERROR, "%{public}@ parseEndpointResponse - JSON parsing failed with error: %{public}@", buf, 0x16u);
    }
  }
  [a1 parseEndpointResponseDict:v20 parsingError:v21 configurationSettings:v13 maxAge:v14 loggingPrefix:v15 completion:v16];
}

+ (void)parseEndpointResponseDict:(id)a3 parsingError:(id)a4 configurationSettings:(id)a5 maxAge:(id)a6 loggingPrefix:(id)a7 completion:(id)a8
{
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v66 = a7;
  id v18 = a8;
  v71 = v14;
  if (v14)
  {
    id v19 = RCJSONDictionaryValue(v14, @"errorWrapper");
    v20 = RCJSONArrayValue(v19, @"errors");
    if ([v20 count])
    {
      v82[0] = MEMORY[0x1E4F143A8];
      v82[1] = 3221225472;
      v82[2] = __125__RCEndpointResponseProcessing_parseEndpointResponseDict_parsingError_configurationSettings_maxAge_loggingPrefix_completion___block_invoke_2;
      v82[3] = &unk_1E5B76D00;
      id v85 = a1;
      id v83 = v20;
      id v84 = v18;
      __125__RCEndpointResponseProcessing_parseEndpointResponseDict_parsingError_configurationSettings_maxAge_loggingPrefix_completion___block_invoke_2((uint64_t)v82);

      id v21 = v83;
    }
    else
    {
      v58 = v20;
      v59 = v19;
      id v60 = v18;
      id v61 = v15;
      v22 = RCJSONDictionaryValue(v71, @"userInfo");
      id v23 = RCJSONArrayValue(v22, @"treatmentIds");
      v57 = v22;
      v70 = RCJSONArrayValue(v22, @"segmentSetIds");
      v69 = [MEMORY[0x1E4F1CA60] dictionary];
      long long v78 = 0u;
      long long v79 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      id obj = [v16 requestInfos];
      uint64_t v72 = [obj countByEnumeratingWithState:&v78 objects:v103 count:16];
      if (v72)
      {
        uint64_t v68 = *(void *)v79;
        id v63 = v17;
        id v64 = v16;
        v62 = v23;
        do
        {
          for (uint64_t i = 0; i != v72; ++i)
          {
            if (*(void *)v79 != v68) {
              objc_enumerationMutation(obj);
            }
            id v25 = *(void **)(*((void *)&v78 + 1) + 8 * i);
            uint64_t v26 = MEMORY[0x1A6261E80]();
            id v27 = [v25 responseKey];
            uint64_t v28 = RCJSONDictionaryValue(v71, v27);

            uint64_t v29 = RCJSONDictionaryValue(v28, @"configuration");
            v76 = (void *)v26;
            if (v29)
            {
              v30 = (void *)v29;
              v31 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v29 options:0 error:0];
            }
            else
            {
              v31 = 0;
              v30 = 0;
            }
            v32 = objc_alloc_init(RCConfigurationResource);
            v74 = v25;
            v33 = [v25 requestCacheKey];
            [(RCConfigurationResource *)v32 setRequestKey:v33];

            v77 = v31;
            v34 = objc_msgSend(v31, "rc_gzipDeflate");
            [(RCConfigurationResource *)v32 setGzippedConfigurationData:v34];

            v35 = [v16 debugOverrides];
            v73 = v30;
            v36 = +[RCUserSegmentationConfiguration userSegmentationConfigurationWithConfigDict:environment:](RCUserSegmentationConfiguration, "userSegmentationConfigurationWithConfigDict:environment:", v30, [v35 debugEnvironment]);
            [(RCConfigurationResource *)v32 setUserSegmentationConfiguration:v36];

            [(RCConfigurationResource *)v32 setTreatmentIDs:v23];
            [(RCConfigurationResource *)v32 setSegmentSetIDs:v70];
            v37 = [v16 userID];
            [(RCConfigurationResource *)v32 setUserID:v37];

            v38 = [v16 storefrontID];
            [(RCConfigurationResource *)v32 setStorefrontID:v38];

            v39 = RCJSONStringValue(v28, @"id", 0);
            [(RCConfigurationResource *)v32 setConfigurationID:v39];

            v40 = RCJSONStringValue(v28, @"changeTag", 0);
            [(RCConfigurationResource *)v32 setContentHash:v40];

            v75 = v28;
            v41 = RCJSONStringValue(v28, @"lastModified", 0);
            [(RCConfigurationResource *)v32 setLastModifiedString:v41];

            v42 = [MEMORY[0x1E4F1C9C8] date];
            [(RCConfigurationResource *)v32 setLastFetchedDate:v42];

            [(RCConfigurationResource *)v32 setEndpointMaxAge:v17];
            v43 = RCSharedLog();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
            {
              v44 = [(RCConfigurationResource *)v32 configurationID];
              [(RCConfigurationResource *)v32 lastModifiedString];
              v45 = uint64_t v67 = i;
              v46 = [(RCConfigurationResource *)v32 lastFetchedDate];
              v47 = [(RCConfigurationResource *)v32 endpointMaxAge];
              v48 = [(RCConfigurationResource *)v32 treatmentIDs];
              v49 = objc_msgSend(v48, "rc_description");
              v50 = [(RCConfigurationResource *)v32 segmentSetIDs];
              v51 = objc_msgSend(v50, "rc_description");
              *(_DWORD *)buf = 138544898;
              id v90 = v66;
              __int16 v91 = 2114;
              v92 = v44;
              __int16 v93 = 2114;
              v94 = v45;
              __int16 v95 = 2114;
              v96 = v46;
              __int16 v97 = 2112;
              v98 = v47;
              __int16 v99 = 2114;
              v100 = v49;
              __int16 v101 = 2114;
              v102 = v51;
              _os_log_impl(&dword_1A4AB3000, v43, OS_LOG_TYPE_DEFAULT, "%{public}@ endpoint: received configuration with configurationID: %{public}@ lastModified: %{public}@ lastFetched: %{public}@ maxAge: %@ treatmentIDs: %{public}@ segmentSetIDs: %{public}@", buf, 0x48u);

              id v23 = v62;
              uint64_t i = v67;

              id v16 = v64;
              id v17 = v63;
            }

            v52 = [v16 debugOverrides];
            int v53 = [v52 enableExtraLogs];

            if (v53)
            {
              v54 = RCSharedLog();
              if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
              {
                v55 = (void *)[[NSString alloc] initWithData:v77 encoding:4];
                *(_DWORD *)buf = 138543618;
                id v90 = v66;
                __int16 v91 = 2112;
                v92 = v55;
                _os_log_impl(&dword_1A4AB3000, v54, OS_LOG_TYPE_DEFAULT, "%{public}@ Endpoint JSON response: %@", buf, 0x16u);
              }
            }
            v56 = [v74 requestCacheKey];
            [v69 setObject:v32 forKeyedSubscript:v56];
          }
          uint64_t v72 = [obj countByEnumeratingWithState:&v78 objects:v103 count:16];
        }
        while (v72);
      }

      id v18 = v60;
      (*((void (**)(id, void *, void))v60 + 2))(v60, v69, 0);

      id v15 = v61;
      v20 = v58;
      id v19 = v59;
      id v21 = v57;
    }
  }
  else
  {
    v86[0] = MEMORY[0x1E4F143A8];
    v86[1] = 3221225472;
    v86[2] = __125__RCEndpointResponseProcessing_parseEndpointResponseDict_parsingError_configurationSettings_maxAge_loggingPrefix_completion___block_invoke;
    v86[3] = &unk_1E5B75FF8;
    id v87 = v15;
    id v88 = v18;
    __125__RCEndpointResponseProcessing_parseEndpointResponseDict_parsingError_configurationSettings_maxAge_loggingPrefix_completion___block_invoke((uint64_t)v86);

    id v19 = v87;
  }
}

void __125__RCEndpointResponseProcessing_parseEndpointResponseDict_parsingError_configurationSettings_maxAge_loggingPrefix_completion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v3 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "rc_parsingError");
    id v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v4 = v3;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __125__RCEndpointResponseProcessing_parseEndpointResponseDict_parsingError_configurationSettings_maxAge_loggingPrefix_completion___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 48) _configurationErrorForErrorDicts:*(void *)(a1 + 32)];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (id)_configurationErrorForErrorDicts:(id)a3
{
  id v3 = objc_msgSend(a3, "rc_arrayByTransformingWithBlock:", &__block_literal_global_8);
  id v4 = objc_msgSend(MEMORY[0x1E4F28C58], "rc_endpointErrorWithUnderlyingEndpointErrors:", v3);

  return v4;
}

RCEndpointError *__65__RCEndpointResponseProcessing__configurationErrorForErrorDicts___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[RCEndpointError endpointErrorWithDictionary:a2];
}

@end