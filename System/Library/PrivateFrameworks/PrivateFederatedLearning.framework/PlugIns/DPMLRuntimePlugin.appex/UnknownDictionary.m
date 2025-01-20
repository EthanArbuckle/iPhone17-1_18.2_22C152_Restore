@interface UnknownDictionary
+ (id)dataItemToBitString:(id)a3 encodingClient:(id)a4 useCaseEncoding:(id)a5;
+ (id)hexToBitString:(id)a3;
+ (id)ipV4ToBitString:(id)a3;
+ (id)ipV6ToBitString:(id)a3;
+ (id)processData:(id)a3 fragmentSize:(int)a4 prefixSize:(int)a5 prefixDbFiles:(id)a6 encodingDbFiles:(id)a7 useCaseEncoding:(id)a8 urlEncodingParameters:(id)a9 error:(id *)a10;
+ (id)processQueryResults:(id)a3 withCohorts:(id)a4 withNamespaceID:(id)a5;
+ (int)runWithRecipe:(id)a3 data:(id)a4 error:(id *)a5;
@end

@implementation UnknownDictionary

+ (int)runWithRecipe:(id)a3 data:(id)a4 error:(id *)a5
{
  id v6 = a3;
  id v59 = a4;
  v62 = v6;
  v7 = [v6 trialClient];
  v63 = [v7 recipeDictionary];

  v8 = [v63 objectForKey:@"unknownDictionary"];

  if (v8)
  {
    v9 = [v63 objectForKeyedSubscript:@"unknownDictionary"];
    v61 = [v9 objectForKeyedSubscript:@"useCaseEncoding"];
    v10 = [v9 objectForKeyedSubscript:@"iteration"];
    int v11 = [v10 intValue];

    v12 = [v9 objectForKeyedSubscript:@"deployments"];
    if (!v12
      || ([v9 objectForKeyedSubscript:@"deployments"],
          v13 = objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          char isKindOfClass = objc_opt_isKindOfClass(),
          v13,
          v12,
          (isKindOfClass & 1) == 0))
    {
      if (a5)
      {
        *a5 = +[_DPMLRuntimeError errorWithCode:300 description:@"Unknown deployments info in recipe."];
      }
      goto LABEL_57;
    }
    v15 = [v9 objectForKeyedSubscript:@"deployments"];
    if ((unint64_t)[v15 count] <= v11)
    {
      if (!a5)
      {
LABEL_56:

LABEL_57:
        v45 = 0;
        int v43 = -1;
        goto LABEL_58;
      }
      CFStringRef v47 = @"Deployments info is incomplete in recipe.";
LABEL_55:
      *a5 = +[_DPMLRuntimeError errorWithCode:300 description:v47];
      goto LABEL_56;
    }
    if (v11 >= 1)
    {
      uint64_t v16 = 0;
      v17 = 0;
      int v60 = 0;
      while (1)
      {
        v18 = [v15 objectAtIndexedSubscript:v16];
        v19 = [v18 objectForKeyedSubscript:@"fragmentSize"];

        if (!v19) {
          break;
        }
        v60 += [v19 intValue];
        ++v16;
        v17 = v19;
        if (v11 == v16)
        {

          goto LABEL_49;
        }
      }
      if (!a5) {
        goto LABEL_56;
      }
      CFStringRef v47 = @"No fragmentSize in deployment info.";
      goto LABEL_55;
    }
    int v60 = 0;
LABEL_49:
    v48 = [v15 objectAtIndexedSubscript:v11];
    v54 = [v48 objectForKeyedSubscript:@"fragmentSize"];
    v55 = [v9 objectForKeyedSubscript:@"urlEncodingParameters"];
  }
  else
  {
    v61 = [v63 objectForKeyedSubscript:@"useCaseEncoding"];
    v54 = [v63 objectForKeyedSubscript:@"fragmentSize"];
    v9 = [v63 objectForKeyedSubscript:@"prefixSize"];
    int v60 = [v9 intValue];
    v55 = 0;
  }

  if (([v61 isEqualToString:@"ipv4"] & 1) == 0
    && ([v61 isEqualToString:@"ipv6"] & 1) == 0
    && ([v61 isEqualToString:@"huffman"] & 1) == 0
    && !v55)
  {
    if (a5)
    {
      v46 = +[NSString stringWithFormat:@"useCaseEncoding %@ is not supported.", v61];
      *a5 = +[_DPMLRuntimeError errorWithCode:300 description:v46];
    }
    int v43 = -1;
    goto LABEL_40;
  }
  v20 = [v62 cohortNameList];
  v21 = [v62 trialClient];
  v22 = [v21 namespaceIdentifier];
  v58 = [a1 processQueryResults:v59 withCohorts:v20 withNamespaceID:v22];

  if (![v58 count])
  {
    v42 = +[_PFLLog extension];
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "No data after pre process.", buf, 2u);
    }
    int v43 = 0;
    goto LABEL_39;
  }
  v56 = [v62 trialClient];
  v64 = +[NSMutableDictionary dictionary];
  v23 = [v58 allKeys];
  v24 = [v56 downloadDbs:v23 suffix:0];

  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  id v25 = v58;
  id v26 = [v25 countByEnumeratingWithState:&v78 objects:v82 count:16];
  if (!v26) {
    goto LABEL_29;
  }
  uint64_t v27 = *(void *)v79;
  while (2)
  {
    for (i = 0; i != v26; i = (char *)i + 1)
    {
      if (*(void *)v79 != v27) {
        objc_enumerationMutation(v25);
      }
      uint64_t v29 = *(void *)(*((void *)&v78 + 1) + 8 * i);
      v30 = [v24 objectForKeyedSubscript:v29];
      BOOL v31 = v30 == 0;

      if (v31)
      {
        v32 = [v25 objectForKeyedSubscript:v29];
LABEL_26:
        [v64 setObject:v32 forKeyedSubscript:v29];
        goto LABEL_27;
      }
      v32 = +[NSMutableArray array];
      v33 = [v25 objectForKeyedSubscript:v29];
      v34 = [v24 objectForKeyedSubscript:v29];
      id v35 = +[KnownDictionary processTokens:v33 knownTokensFile:v34 unknownTokens:v32 error:a5];

      if (*a5)
      {
        v44 = [v24 allKeys];
        [v56 removeDbs:v44 suffix:0];

        goto LABEL_37;
      }
      if ([v32 count]) {
        goto LABEL_26;
      }
LABEL_27:
    }
    id v26 = [v25 countByEnumeratingWithState:&v78 objects:v82 count:16];
    if (v26) {
      continue;
    }
    break;
  }
LABEL_29:

  v36 = [v24 allKeys];
  [v56 removeDbs:v36 suffix:0];

  if ([v64 count])
  {
    if (v54)
    {
      id v37 = [v54 intValue];
      v38 = [v64 allKeys];
      v39 = [v56 downloadDbs:v38 suffix:@"encoding"];

      if (v60 < 1)
      {
        v41 = &__NSDictionary0__struct;
      }
      else
      {
        v40 = [v64 allKeys];
        v41 = [v56 downloadDbs:v40 suffix:@"prefix"];
      }
      v51 = [a1 processData:v64 fragmentSize:v37 prefixSize:v60 prefixDbFiles:v41 encodingDbFiles:v39 useCaseEncoding:v61 urlEncodingParameters:v55 error:a5];
      v52 = [v41 allKeys];
      [v56 removeDbs:v52 suffix:@"prefix"];

      v53 = [v39 allKeys];
      [v56 removeDbs:v53 suffix:@"encoding"];

      int v43 = -1;
      if (!*a5 && v51)
      {
        *(void *)buf = 0;
        v75 = buf;
        uint64_t v76 = 0x2020000000;
        int v77 = 0;
        v66[0] = _NSConcreteStackBlock;
        v66[1] = 3221225472;
        v66[2] = sub_10000D784;
        v66[3] = &unk_100030760;
        int v72 = v60;
        id v67 = v41;
        v71 = a5;
        v68 = v56;
        int v73 = (int)v37;
        id v69 = v62;
        v70 = buf;
        [v51 enumerateKeysAndObjectsUsingBlock:v66];
        int v43 = *((_DWORD *)v75 + 6);

        _Block_object_dispose(buf, 8);
      }
    }
    else
    {
      if (a5)
      {
        *a5 = +[_DPMLRuntimeError errorWithCode:300 description:@"No fragmentSize in recipe."];
      }
LABEL_37:
      int v43 = -1;
    }
  }
  else
  {
    v49 = +[_PFLLog extension];
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG)) {
      sub_10001F944();
    }

    int v43 = 0;
  }

  v42 = v56;
LABEL_39:

LABEL_40:
  v45 = v54;
LABEL_58:

  return v43;
}

+ (id)processQueryResults:(id)a3 withCohorts:(id)a4 withNamespaceID:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v55 = a5;
  v9 = +[NSMutableDictionary dictionary];
  v51 = v7;
  if ([v8 count])
  {
    long long v73 = 0uLL;
    long long v74 = 0uLL;
    long long v71 = 0uLL;
    long long v72 = 0uLL;
    id obj = v7;
    id v58 = [obj countByEnumeratingWithState:&v71 objects:v87 count:16];
    if (!v58) {
      goto LABEL_67;
    }
    id v56 = *(id *)v72;
    id v52 = v8;
    while (1)
    {
      for (id i = 0; i != v58; id i = v23 + 1)
      {
        if (*(id *)v72 != v56) {
          objc_enumerationMutation(obj);
        }
        int v60 = (char *)i;
        int v11 = *(void **)(*((void *)&v71 + 1) + 8 * i);
        long long v67 = 0u;
        long long v68 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        id v12 = v11;
        id v13 = [v12 countByEnumeratingWithState:&v67 objects:v86 count:16];
        if (!v13)
        {
          v15 = 0;
          int v17 = 1;
          goto LABEL_21;
        }
        id v14 = v13;
        v15 = 0;
        uint64_t v16 = *(void *)v68;
        int v17 = 1;
        do
        {
          for (j = 0; j != v14; j = (char *)j + 1)
          {
            if (*(void *)v68 != v16) {
              objc_enumerationMutation(v12);
            }
            v19 = *(void **)(*((void *)&v67 + 1) + 8 * (void)j);
            if (objc_msgSend(v19, "isEqualToString:", @"TokenCount", v51))
            {
              v20 = [v12 objectForKeyedSubscript:v19];
              int v17 = [v20 intValue];
            }
            else
            {
              if ([v8 containsObject:v19]) {
                continue;
              }
              [v12 objectForKeyedSubscript:v19];
              v15 = v20 = v15;
            }
          }
          id v14 = [v12 countByEnumeratingWithState:&v67 objects:v86 count:16];
        }
        while (v14);
LABEL_21:

        if ([v15 length])
        {
          id v66 = 0;
          v21 = +[FedStatsDataCohort keysForCohorts:v8 namespaceID:v55 parameters:v12 possibleError:&v66];
          if (v66)
          {
            v22 = +[_PFLLog extension];
            v23 = v60;
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v85 = v66;
              _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Invalid query result %@.", buf, 0xCu);
            }
          }
          else
          {
            id v25 = +[NSMutableArray array];
            long long v62 = 0u;
            long long v63 = 0u;
            long long v64 = 0u;
            long long v65 = 0u;
            v53 = v21;
            id v26 = v21;
            id v27 = [v26 countByEnumeratingWithState:&v62 objects:v83 count:16];
            if (v27)
            {
              id v28 = v27;
              uint64_t v29 = *(void *)v63;
              do
              {
                for (k = 0; k != v28; k = (char *)k + 1)
                {
                  if (*(void *)v63 != v29) {
                    objc_enumerationMutation(v26);
                  }
                  BOOL v31 = *(void **)(*((void *)&v62 + 1) + 8 * (void)k);
                  if (objc_msgSend(v31, "length", v51))
                  {
                    v32 = [v31 componentsSeparatedByString:@"/"];
                    [v25 addObjectsFromArray:v32];
                  }
                }
                id v28 = [v26 countByEnumeratingWithState:&v62 objects:v83 count:16];
              }
              while (v28);
            }

            v22 = v25;
            if ([v25 count])
            {
              v33 = [v25 componentsJoinedByString:@"_"];
              v34 = [v33 lowercaseString];

              id v35 = [v9 objectForKeyedSubscript:v34];

              if (!v35)
              {
                v36 = +[NSMutableArray array];
                [v9 setObject:v36 forKeyedSubscript:v34];
              }
              id v8 = v52;
              v21 = v53;
              if (v17 >= 1)
              {
                do
                {
                  id v37 = objc_msgSend(v9, "objectForKeyedSubscript:", v34, v51);
                  [v37 addObject:v15];

                  --v17;
                }
                while (v17);
              }
              v23 = v60;
            }
            else
            {
              v34 = +[_PFLLog extension];
              if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                id v85 = v12;
                _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "FedStatsDataCohort has no keys: %@.", buf, 0xCu);
              }
              id v8 = v52;
              v23 = v60;
              v21 = v53;
            }
          }
        }
        else
        {
          v24 = +[_PFLLog extension];
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v85 = v12;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Query result has no data: %@.", buf, 0xCu);
          }

          v23 = v60;
        }
      }
      id v58 = [obj countByEnumeratingWithState:&v71 objects:v87 count:16];
      if (!v58) {
        goto LABEL_67;
      }
    }
  }
  long long v81 = 0uLL;
  long long v82 = 0uLL;
  long long v79 = 0uLL;
  long long v80 = 0uLL;
  id v57 = v7;
  id v61 = [v57 countByEnumeratingWithState:&v79 objects:v89 count:16];
  if (v61)
  {
    uint64_t v59 = *(void *)v80;
    do
    {
      for (m = 0; m != v61; m = (char *)m + 1)
      {
        if (*(void *)v80 != v59) {
          objc_enumerationMutation(v57);
        }
        v39 = *(void **)(*((void *)&v79 + 1) + 8 * (void)m);
        long long v75 = 0u;
        long long v76 = 0u;
        long long v77 = 0u;
        long long v78 = 0u;
        id v40 = v39;
        id v41 = [v40 countByEnumeratingWithState:&v75 objects:v88 count:16];
        if (v41)
        {
          id v42 = v41;
          uint64_t v43 = *(void *)v76;
          do
          {
            for (n = 0; n != v42; n = (char *)n + 1)
            {
              if (*(void *)v76 != v43) {
                objc_enumerationMutation(v40);
              }
              uint64_t v45 = *(void *)(*((void *)&v75 + 1) + 8 * (void)n);
              v46 = objc_msgSend(v9, "objectForKeyedSubscript:", v45, v51);

              if (!v46)
              {
                CFStringRef v47 = +[NSMutableArray array];
                [v9 setObject:v47 forKeyedSubscript:v45];
              }
              v48 = [v9 objectForKeyedSubscript:v45];
              v49 = [v40 objectForKeyedSubscript:v45];
              [v48 addObject:v49];
            }
            id v42 = [v40 countByEnumeratingWithState:&v75 objects:v88 count:16];
          }
          while (v42);
        }
      }
      id v61 = [v57 countByEnumeratingWithState:&v79 objects:v89 count:16];
    }
    while (v61);
  }
LABEL_67:

  return v9;
}

+ (id)processData:(id)a3 fragmentSize:(int)a4 prefixSize:(int)a5 prefixDbFiles:(id)a6 encodingDbFiles:(id)a7 useCaseEncoding:(id)a8 urlEncodingParameters:(id)a9 error:(id *)a10
{
  id v13 = a10;
  id v14 = a3;
  id v15 = a6;
  id v16 = a7;
  id v79 = a8;
  id v78 = a9;
  long long v76 = +[FedStatsDataSampler samplerWithCount:10];
  long long v94 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  id v17 = v14;
  id v71 = v16;
  id v73 = [v17 countByEnumeratingWithState:&v94 objects:v105 count:16];
  if (v73)
  {
    uint64_t v72 = *(void *)v95;
    id v68 = v15;
    id v69 = v17;
    do
    {
      v18 = 0;
      do
      {
        if (*(void *)v95 != v72) {
          objc_enumerationMutation(v17);
        }
        uint64_t v19 = *(void *)(*((void *)&v94 + 1) + 8 * (void)v18);
        if (a5 < 1)
        {
          p_super = 0;
        }
        else
        {
          v20 = [v15 objectForKeyedSubscript:*(void *)(*((void *)&v94 + 1) + 8 * (void)v18)];

          if (!v20)
          {
            v49 = +[_PFLLog extension];
            if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)v101 = v19;
              _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_INFO, "Found no prefix database for  %@.", buf, 0xCu);
            }
            goto LABEL_46;
          }
          v21 = [SqliteClient alloc];
          [v15 objectForKeyedSubscript:v19];
          v23 = uint64_t v22 = v19;
          v24 = [(SqliteClient *)v21 initWithFile:v23 error:v13];

          uint64_t v19 = v22;
          p_super = &v24->super;
          if (!v24)
          {
            long long v65 = +[_PFLLog extension];
            if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
              sub_10001FA40(v22, v65);
            }

            if (v13)
            {
              +[_DPMLRuntimeError errorWithCode:300 description:@"Failed to load sqlite DB."];
              v51 = 0;
              id *v13 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v51 = 0;
            }
            id v52 = v17;
            goto LABEL_69;
          }
        }
        id v25 = objc_msgSend(v16, "objectForKeyedSubscript:", v19, v68);

        long long v74 = v18;
        if (v25)
        {
          id v26 = [SqliteClient alloc];
          [v16 objectForKeyedSubscript:v19];
          v28 = uint64_t v27 = v19;
          id v85 = [(SqliteClient *)v26 initWithFile:v28 error:v13];
        }
        else
        {
          id v85 = 0;
          uint64_t v27 = v19;
        }
        id v30 = v78;
        id v29 = v79;
        long long v92 = 0u;
        long long v93 = 0u;
        long long v90 = 0u;
        long long v91 = 0u;
        uint64_t v77 = v27;
        id obj = [v17 objectForKeyedSubscript:v27];
        id v31 = [obj countByEnumeratingWithState:&v90 objects:v104 count:16];
        if (v31)
        {
          id v32 = v31;
          unsigned int v84 = 0;
          uint64_t v33 = *(void *)v91;
          do
          {
            for (id i = 0; i != v32; id i = (char *)i + 1)
            {
              if (*(void *)v91 != v33) {
                objc_enumerationMutation(obj);
              }
              uint64_t v35 = *(void *)(*((void *)&v90 + 1) + 8 * i);
              if (v30) {
                +[URLEncoding bitStringFromURL:*(void *)(*((void *)&v90 + 1) + 8 * i) encodingOption:v29 urlEncodingParameters:v30 encodingClient:v85 error:a10];
              }
              else {
              v36 = [a1 dataItemToBitString:*(void *)(*((void *)&v90 + 1) + 8 * i) encodingClient:v85 useCaseEncoding:v29];
              }
              id v37 = v36;
              if (v36)
              {
                if ((unint64_t)[v36 length] > a5)
                {
                  signed int v38 = a5 + a4 - [v37 length];
                  int v39 = v38 & ~(v38 >> 31);
                  uint64_t v40 = objc_msgSend(v37, "substringWithRange:", a5, a4 - v39);
                  id v41 = (void *)v40;
                  if (v38 < 1)
                  {
                    uint64_t v43 = v40;
                  }
                  else
                  {
                    unsigned int v42 = v39 + 1;
                    do
                    {
                      uint64_t v43 = [v41 stringByAppendingString:@"0"];

                      --v42;
                      id v41 = v43;
                    }
                    while (v42 > 1);
                  }
                  if (a5 >= 1)
                  {
                    v44 = objc_msgSend(v37, "substringWithRange:", 0, a5);
                    unsigned int v84 = [p_super findWord:v44 error:a10];
                    if (v84 == -1)
                    {
                      unsigned int v84 = -1;
LABEL_42:

                      id v30 = v78;
                      id v29 = v79;
                      goto LABEL_43;
                    }
                    uint64_t v45 = +[_PFLLog extension];
                    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138412290;
                      *(void *)v101 = v44;
                      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "prefix %@.", buf, 0xCu);
                    }
                  }
                  unsigned int v46 = +[FedStatsUtil bitStringToInt:v43];
                  CFStringRef v47 = +[_PFLLog extension];
                  if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 67109632;
                    *(_DWORD *)v101 = v46;
                    *(_WORD *)&v101[4] = 1024;
                    *(_DWORD *)&v101[6] = v84;
                    __int16 v102 = 1024;
                    int v103 = (v84 << a4) + v46 + 1;
                    _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_INFO, "fragmentIndex %i, prefixIndex %i, indexToRecord %i.", buf, 0x14u);
                  }

                  v99[0] = v77;
                  v44 = +[NSNumber numberWithInt:(v84 << a4) + v46 + 1];
                  v99[1] = v44;
                  v48 = +[NSArray arrayWithObjects:v99 count:2];
                  [v76 addItem:v48];

                  goto LABEL_42;
                }
                uint64_t v43 = +[_PFLLog extension];
                if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  *(void *)v101 = v35;
                  _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "There is no enough data for this iteration %@.", buf, 0xCu);
                }
              }
              else
              {
                uint64_t v43 = +[_PFLLog extension];
                if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  *(void *)v101 = v35;
                  _os_log_error_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "Drop bad data item %@.", buf, 0xCu);
                }
              }
LABEL_43:
            }
            id v32 = [obj countByEnumeratingWithState:&v90 objects:v104 count:16];
          }
          while (v32);
        }

        id v15 = v68;
        id v17 = v69;
        id v16 = v71;
        id v13 = a10;
        v18 = v74;
        v49 = p_super;
LABEL_46:

        v18 = (char *)v18 + 1;
      }
      while (v18 != v73);
      id v50 = [v17 countByEnumeratingWithState:&v94 objects:v105 count:16];
      id v73 = v50;
    }
    while (v50);
  }

  v51 = +[NSMutableDictionary dictionary];
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  id v52 = [v76 getResults];
  id v53 = [v52 countByEnumeratingWithState:&v86 objects:v98 count:16];
  if (v53)
  {
    id v54 = v53;
    id v70 = v17;
    uint64_t v55 = *(void *)v87;
    do
    {
      for (j = 0; j != v54; j = (char *)j + 1)
      {
        if (*(void *)v87 != v55) {
          objc_enumerationMutation(v52);
        }
        id v57 = *(void **)(*((void *)&v86 + 1) + 8 * (void)j);
        if ((unint64_t)objc_msgSend(v57, "count", v68) >= 2)
        {
          id v58 = [v57 objectAtIndexedSubscript:0];
          uint64_t v59 = [v51 objectForKeyedSubscript:v58];

          if (!v59)
          {
            int v60 = +[NSMutableArray array];
            id v61 = [v57 objectAtIndexedSubscript:0];
            [v51 setObject:v60 forKeyedSubscript:v61];
          }
          long long v62 = [v57 objectAtIndexedSubscript:0];
          long long v63 = [v51 objectForKeyedSubscript:v62];
          long long v64 = [v57 objectAtIndexedSubscript:1];
          [v63 addObject:v64];
        }
      }
      id v54 = [v52 countByEnumeratingWithState:&v86 objects:v98 count:16];
    }
    while (v54);
    id v17 = v70;
    id v16 = v71;
  }
LABEL_69:

  return v51;
}

+ (id)dataItemToBitString:(id)a3 encodingClient:(id)a4 useCaseEncoding:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v10 isEqualToString:@"ipv4"])
  {
    uint64_t v11 = [a1 ipV4ToBitString:v8];
LABEL_5:
    id v12 = (id)v11;
    goto LABEL_6;
  }
  if ([v10 isEqualToString:@"ipv6"])
  {
    uint64_t v11 = [a1 ipV6ToBitString:v8];
    goto LABEL_5;
  }
  if (!v9)
  {
    id v17 = +[_PFLLog extension];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10001FAB8();
    }
    goto LABEL_18;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v17 = +[_PFLLog extension];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10001FAEC();
    }
LABEL_18:

    id v12 = 0;
    goto LABEL_6;
  }
  id v14 = [v9 huffmanCode:@"<UT>" error:0];
  if (!v14)
  {
    id v15 = +[_PFLLog extension];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "No unknown token found in database.", buf, 2u);
    }
    goto LABEL_24;
  }
  id v15 = [v9 huffmanCode:@"<ET>" error:0];
  if (!v15)
  {
    v18 = +[_PFLLog extension];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "No end token found in database.", buf, 2u);
    }

LABEL_24:
    id v12 = 0;
    goto LABEL_25;
  }
  *(void *)buf = 0;
  v24 = buf;
  uint64_t v25 = 0x3032000000;
  id v26 = sub_10000EF38;
  uint64_t v27 = sub_10000EF48;
  id v28 = +[NSMutableString string];
  id v16 = [v8 length];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10000EF50;
  v19[3] = &unk_100030788;
  id v20 = v9;
  id v21 = v14;
  uint64_t v22 = buf;
  objc_msgSend(v8, "enumerateSubstringsInRange:options:usingBlock:", 0, v16, 2, v19);
  [*((id *)v24 + 5) appendString:v15];
  id v12 = *((id *)v24 + 5);

  _Block_object_dispose(buf, 8);
LABEL_25:

LABEL_6:
  return v12;
}

+ (id)ipV4ToBitString:(id)a3
{
  id v3 = a3;
  v4 = +[NSMutableString string];
  v5 = [v3 componentsSeparatedByString:@"."];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (id i = 0; i != v7; id i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = +[FedStatsUtil intToBitString:length:](FedStatsUtil, "intToBitString:length:", [*(id *)(*((void *)&v12 + 1) + 8 * i) intValue], 8);
        [v4 appendString:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)ipV6ToBitString:(id)a3
{
  id v4 = a3;
  v5 = +[NSMutableString string];
  id v6 = [v4 componentsSeparatedByString:@":"];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (id i = 0; i != v8; id i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [a1 hexToBitString:*(void *)(*((void *)&v15 + 1) + 8 * i)];
        [v5 appendString:v11];
      }
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
  id v12 = [v6 count];
  if (7 - (uint64_t)v12 >= 1)
  {
    unint64_t v13 = 8 - (void)v12;
    do
    {
      [v5 appendString:@"0000000000000000"];
      --v13;
    }
    while (v13 > 1);
  }

  return v5;
}

+ (id)hexToBitString:(id)a3
{
  id v3 = +[NSScanner scannerWithString:a3];
  unsigned int v6 = 0;
  [v3 scanHexInt:&v6];
  id v4 = +[FedStatsUtil intToBitString:v6 length:16];

  return v4;
}

@end