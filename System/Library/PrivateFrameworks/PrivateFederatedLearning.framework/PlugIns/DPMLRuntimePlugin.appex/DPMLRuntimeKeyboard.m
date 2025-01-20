@interface DPMLRuntimeKeyboard
+ (int)runWithTrialClient:(id)a3 error:(id *)a4;
@end

@implementation DPMLRuntimeKeyboard

+ (int)runWithTrialClient:(id)a3 error:(id *)a4
{
  id v4 = a3;
  v5 = +[NSLocale currentLocale];
  uint64_t v6 = [v5 languageCode];
  if (!v6)
  {

    goto LABEL_32;
  }
  v7 = (void *)v6;
  v8 = +[NSLocale currentLocale];
  v9 = [v8 countryCode];

  if (!v9)
  {
LABEL_32:
    v47 = +[_PFLLog extension];
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
      sub_10001F630(v47);
    }

    if (a4)
    {
      *a4 = +[_DPMLRuntimeError errorWithCode:300 description:@"Cannot determine locale."];
    }
    int v15 = -1;
    goto LABEL_48;
  }
  v10 = +[BiomeKeyboardClient readDataWithCount:20];
  v11 = [v10 allKeys];
  v63 = [v4 downloadDbs:v11 suffix:0];

  if ([v10 count])
  {
    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    v12 = v10;
    id v13 = [v12 countByEnumeratingWithState:&v72 objects:v84 count:16];
    if (v13)
    {
      id v14 = v13;
      int v15 = 0;
      uint64_t v16 = *(void *)v73;
      uint64_t v56 = kDPMetadataAlgorithmParameters;
      uint64_t v55 = kDPMetadataAlgoParamDimensionality;
      id v57 = v4;
      v53 = v10;
      v59 = v12;
      uint64_t v51 = *(void *)v73;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v73 != v16) {
            objc_enumerationMutation(v12);
          }
          uint64_t v54 = v17;
          v18 = *(void **)(*((void *)&v72 + 1) + 8 * v17);
          v19 = [v63 objectForKeyedSubscript:v18];

          if (v19)
          {
            unsigned int v20 = [v18 isEqualToString:@"emojis"];
            CFStringRef v21 = @"fedstats:com.apple.insights.keyboard.Emoji";
            if (!v20) {
              CFStringRef v21 = @"fedstats:com.apple.insights.keyboard.WordUnigram";
            }
            CFStringRef v62 = v21;
            long long v68 = 0u;
            long long v69 = 0u;
            long long v70 = 0u;
            long long v71 = 0u;
            uint64_t v65 = (uint64_t)v18;
            id obj = [v12 objectForKeyedSubscript:v18];
            id v61 = [obj countByEnumeratingWithState:&v68 objects:v83 count:16];
            if (v61)
            {
              uint64_t v60 = *(void *)v69;
              id v52 = v14;
              while (2)
              {
                int v64 = v15;
                v22 = 0;
                v23 = v63;
                do
                {
                  v24 = v4;
                  v25 = v12;
                  if (*(void *)v69 != v60) {
                    objc_enumerationMutation(obj);
                  }
                  uint64_t v26 = *(void *)(*((void *)&v68 + 1) + 8 * (void)v22);
                  uint64_t v27 = +[NSString stringWithFormat:@"token+%@|%@", v65, v26];
                  v82[0] = v62;
                  v82[1] = v27;
                  v66 = (void *)v27;
                  v28 = [v24 experimentIdentifier];
                  v82[2] = v28;
                  v29 = [v24 deploymentIdentifier];
                  v82[3] = v29;
                  v30 = v24;
                  v31 = [v24 treatmentIdentifier];
                  v82[4] = v31;
                  v32 = +[NSArray arrayWithObjects:v82 count:5];

                  v33 = [v32 componentsJoinedByString:@":"];
                  v34 = [v25 objectForKeyedSubscript:v65];
                  v35 = [v34 objectForKeyedSubscript:v26];
                  v36 = [v23 objectForKeyedSubscript:v65];
                  v37 = +[KnownDictionary processTokens:v35 knownTokensFile:v36 unknownTokens:0 error:a4];

                  if (*a4) {
                    goto LABEL_46;
                  }
                  if ([v37 count])
                  {
                    v38 = [SqliteClient alloc];
                    v39 = [v23 objectForKeyedSubscript:v65];
                    v40 = [(SqliteClient *)v38 initWithFile:v39 error:a4];

                    if (!v40)
                    {
                      v49 = +[_PFLLog extension];
                      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
                        sub_10001F674(v65, v49);
                      }

LABEL_45:
LABEL_46:

                      int v15 = -1;
                      v10 = v53;
                      id v4 = v30;
                      v48 = v59;
                      goto LABEL_47;
                    }
                    unsigned int v41 = [(SqliteClient *)v40 getTotalCount:a4];
                    if (*a4) {
                      goto LABEL_45;
                    }
                    uint64_t v80 = v56;
                    uint64_t v78 = v55;
                    v42 = +[NSNumber numberWithInt:v41 + 1];
                    v79 = v42;
                    v43 = +[NSDictionary dictionaryWithObjects:&v79 forKeys:&v78 count:1];
                    v81 = v43;
                    v44 = +[NSDictionary dictionaryWithObjects:&v81 forKeys:&v80 count:1];
                    v45 = [v30 updateMetadataWithDPParameters:v44];

                    v46 = +[_PFLLog extension];
                    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 138412290;
                      v77 = v45;
                      _os_log_debug_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEBUG, "Record metadata %@.", buf, 0xCu);
                    }

                    +[KnownDictionary recordData:v37 baseKey:v33 metadata:v45];
                    v64 += [v37 count];

                    id v4 = v57;
                    v23 = v63;
                  }
                  else
                  {
                    id v4 = v30;
                  }
                  v12 = v59;

                  v22 = (char *)v22 + 1;
                }
                while (v61 != v22);
                v10 = v53;
                int v15 = v64;
                uint64_t v16 = v51;
                id v14 = v52;
                id v61 = [obj countByEnumeratingWithState:&v68 objects:v83 count:16];
                if (v61) {
                  continue;
                }
                break;
              }
            }
          }
          uint64_t v17 = v54 + 1;
        }
        while ((id)(v54 + 1) != v14);
        id v14 = [v12 countByEnumeratingWithState:&v72 objects:v84 count:16];
      }
      while (v14);
    }
    else
    {
      int v15 = 0;
    }

    v48 = [v63 allKeys];
    [v4 removeDbs:v48 suffix:0];
  }
  else
  {
    v48 = +[_PFLLog extension];
    if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_INFO, "Biome did not return any message.", buf, 2u);
    }
    int v15 = 0;
  }
LABEL_47:

LABEL_48:
  return v15;
}

@end