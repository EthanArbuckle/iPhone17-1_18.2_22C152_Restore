@interface OSASubmitter
+ (id)extractAuthenticatedBlob:(id)a3 error:(id *)a4;
+ (id)submissionPathsWithHomeDirectory:(id)a3;
- (BOOL)allowUnsignedBlobs;
- (BOOL)cheaterTaskingWithSets:(id)a3 usingConfig:(id)a4 resultsCallback:(id)a5;
- (BOOL)submitLogsUsingPolicy:(id)a3 resultsCallback:(id)a4;
- (BOOL)taskingNeedsRefreshForRouting:(id)a3 at:(double)a4;
- (NSArray)internalWhitelist;
- (NSDictionary)launchInfo;
- (NSString)connectionType;
- (NSURL)submissionURL;
- (OSASubmitter)init;
- (id)applyTasking:(id)a3 taskId:(id)a4 usingConfig:(id)a5 fromBlob:(id)a6;
- (id)getAdditionalRequestHeaders;
- (id)locateLog:(id)a3 forRouting:(id)a4 usingConfig:(id)a5 options:(id)a6 error:(id *)a7;
- (id)primarySubmissionPaths;
- (id)processJob:(id)a3 forRouting:(id)a4 including:(id)a5 usingConfig:(id)a6 taskings:(id)a7 summarize:(id)a8 additionalRequestHeaders:(id)a9;
- (id)processSubmissionJobs:(id)a3 usingConfig:(id)a4 summarize:(id)a5;
- (id)taskingLastSuccessfulRequest;
- (void)getAdditionalRequestHeaders;
- (void)prefaceSubmission:(id)a3 withData:(id)a4 usingArchive:(id)a5 andHeaders:(id)a6;
- (void)prepConfig:(id)a3;
- (void)setAllowUnsignedBlobs:(BOOL)a3;
- (void)setConnectionType:(id)a3;
- (void)setInternalWhitelist:(id)a3;
- (void)setLaunchInfo:(id)a3;
- (void)updateTaskingLastSuccessfulRequest:(id)a3 at:(double)a4;
@end

@implementation OSASubmitter

- (OSASubmitter)init
{
  v6.receiver = self;
  v6.super_class = (Class)OSASubmitter;
  v2 = [(OSASubmitter *)&v6 init];
  v3 = v2;
  if (v2)
  {
    connectionType = v2->_connectionType;
    v2->_connectionType = (NSString *)@"proxied";
  }
  return v3;
}

- (NSURL)submissionURL
{
  return 0;
}

- (void)prefaceSubmission:(id)a3 withData:(id)a4 usingArchive:(id)a5 andHeaders:(id)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = [v10 objectForKeyedSubscript:@"content"];
  if ([v13 length])
  {
    v14 = [OSAEphemeralLog alloc];
    v15 = [v10 objectForKeyedSubscript:@"metadata"];
    v16 = [(OSAEphemeralLog *)v14 initWithData:v13 andMetadata:v15];

    if (v16)
    {
      uint64_t v17 = objc_msgSend(v11, "copyDeflatedDataFromStream:withCap:", -[OSAEphemeralLog stream](v16, "stream"), 4096);
      if (v17)
      {
        v18 = (void *)v17;
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          uint64_t v19 = [v18 length];
          v20 = [(OSAEphemeralLog *)v16 metaData];
          *(_DWORD *)buf = 134218242;
          uint64_t v27 = v19;
          __int16 v28 = 2112;
          v29 = v20;
          _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "preface payload %ld, metadata: %@", buf, 0x16u);
        }
        v21 = (void *)[v12 mutableCopy];
        v22 = [(OSAEphemeralLog *)v16 metaData];
        [v21 addEntriesFromDictionary:v22];

        v23 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v18, "length"));
        [v21 setValue:v23 forKey:@"length"];

        [v21 setValue:@"deflate" forKey:@"compression"];
        uint64_t v25 = 0;
        v24 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v21 options:0 error:&v25];
        [v9 appendData:v24];
        [v9 appendBytes:"\n" length:1];
        [v9 appendData:v18];
        [v9 appendBytes:"\n" length:1];
        [(OSAEphemeralLog *)v16 closeFileStream];
      }
      else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v27) = 4096;
        _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Submission archive too big (> %u) for submission with preface", buf, 8u);
      }
    }
  }
}

- (id)getAdditionalRequestHeaders
{
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v3 = [MEMORY[0x1E4F83948] fastLane];
  if (v3 >= 1)
  {
    v4 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v3);
    [v2 setObject:v4 forKeyedSubscript:@"x-fast-lane"];
  }
  if ([v2 count] && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    -[OSASubmitter getAdditionalRequestHeaders]((uint64_t)v2);
  }
  return v2;
}

- (id)processSubmissionJobs:(id)a3 usingConfig:(id)a4 summarize:(id)a5
{
  uint64_t v115 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = self;
  id v11 = v9;
  id v88 = a5;
  double Current = CFAbsoluteTimeGetCurrent();
  self->_unsigned int jobCount = 0;
  unint64_t v13 = 0x1E4F1C000uLL;
  v14 = [MEMORY[0x1E4F1CA60] dictionary];
  v15 = [v11 identifier];
  [v14 setObject:v15 forKeyedSubscript:@"name"];

  unint64_t v16 = 0x1E4F1C000uLL;
  v84 = [MEMORY[0x1E4F1CA48] array];
  v82 = [MEMORY[0x1E4F1CA60] dictionary];
  v81 = [(OSASubmitter *)v10 getAdditionalRequestHeaders];
  v92 = objc_alloc_init(OSAStreamDeflater);
  long long v105 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  id obj = v8;
  v93 = v10;
  uint64_t v77 = [obj countByEnumeratingWithState:&v105 objects:v114 count:16];
  if (v77)
  {
    uint64_t v78 = *(void *)v106;
    id v85 = v11;
    v76 = v14;
    while (2)
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v106 != v78) {
          objc_enumerationMutation(obj);
        }
        uint64_t v80 = v17;
        v18 = *(void **)(*((void *)&v105 + 1) + 8 * v17);
        uint64_t v19 = [v18 objectForKey:@"routing"];
        v20 = [v18 objectForKeyedSubscript:@"<inactive>"];

        if (v20)
        {
          v109[0] = @"<inactive>";
          id v21 = [v18 objectForKeyedSubscript:@"<inactive>"];
          v109[1] = @"routing";
          v110[0] = v21;
          v110[1] = v19;
          v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v110 forKeys:v109 count:2];
          [v84 addObject:v22];
        }
        else
        {
          v83 = v18;
          v23 = [v18 objectForKey:@"logs"];
          v86 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithCapacity:0x80000];
          v95 = objc_msgSend(*(id *)(v16 + 2632), "arrayWithCapacity:", objc_msgSend(v23, "count"));
          v24 = v19;
          unsigned int v25 = ([v19 isEqualToString:@"anon"] & 1) != 0
             || ([v19 isEqualToString:@"beta"] & 1) != 0
             || [v19 isEqualToString:@"session"];
          if ([v19 isEqualToString:@"anon"]) {
            v25 |= 2u;
          }
          if ([v19 isEqualToString:@"ca1"]) {
            uint64_t v26 = v25 | 4;
          }
          else {
            uint64_t v26 = v25;
          }
          uint64_t v27 = [v11 assembleMetadataAt:v26 withOptions:Current];
          __int16 v28 = [v83 objectForKey:@"submission_info"];
          v87 = v27;
          [v27 setValue:v28 forKey:@"submission_info"];

          v29 = [*(id *)(v13 + 2656) dictionary];
          uint64_t v30 = [v83 objectForKeyedSubscript:@"<metadata>"];

          if (v30)
          {
            v31 = NSNumber;
            v32 = [v83 objectForKeyedSubscript:@"<metadata>"];
            v33 = objc_msgSend(v31, "numberWithBool:", objc_msgSend(v32, "BOOLValue"));
            [v29 setObject:v33 forKeyedSubscript:@"<metadata>"];

            id v10 = v93;
          }
          if ([(NSArray *)v10->_internalWhitelist count]) {
            [v29 setObject:v10->_internalWhitelist forKeyedSubscript:@"<whitelist>"];
          }
          v97 = v29;
          long long v103 = 0u;
          long long v104 = 0u;
          long long v101 = 0u;
          long long v102 = 0u;
          id v21 = v23;
          uint64_t v98 = [v21 countByEnumeratingWithState:&v101 objects:v113 count:16];
          if (v98)
          {
            uint64_t v96 = *(void *)v102;
            id v94 = v21;
            do
            {
              for (uint64_t i = 0; i != v98; ++i)
              {
                if (*(void *)v102 != v96) {
                  objc_enumerationMutation(v94);
                }
                v35 = *(void **)(*((void *)&v101 + 1) + 8 * i);
                v36 = (void *)MEMORY[0x1E0197840]();
                id v100 = 0;
                v37 = v24;
                v38 = [(OSASubmitter *)v10 locateLog:v35 forRouting:v24 usingConfig:v11 options:v97 error:&v100];
                id v39 = v100;
                id v40 = v35;
                if (getxattr((const char *)[v40 UTF8String], "DoNotSubmit", 0, 0, 0, 0) < 1)
                {
                  if (v38)
                  {
                    uint64_t v41 = -[OSAStreamDeflater copyDeflatedDataFromStream:withCap:](v92, "copyDeflatedDataFromStream:withCap:", [v38 stream], 10477568);
                    if (v41)
                    {
                      v42 = (void *)v41;
                      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
                      {
                        uint64_t v57 = [v42 length];
                        v58 = [v38 metaData];
                        *(_DWORD *)buf = 138412802;
                        *(void *)v112 = v40;
                        *(_WORD *)&v112[8] = 2048;
                        *(void *)&v112[10] = v57;
                        *(_WORD *)&v112[18] = 2112;
                        *(void *)&v112[20] = v58;
                        _os_log_debug_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "'%@' payload %ld, metadata: %@", buf, 0x20u);
                      }
                      v43 = (void *)[v87 mutableCopy];
                      v44 = [v38 metaData];
                      [v43 addEntriesFromDictionary:v44];

                      v45 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v42, "length"));
                      [v43 setValue:v45 forKey:@"length"];

                      [v43 setValue:@"deflate" forKey:@"compression"];
                      id v99 = 0;
                      v46 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v43 options:0 error:&v99];
                      id v90 = v99;
                      v91 = v46;
                      uint64_t v47 = [v46 length];
                      uint64_t v48 = [v42 length];
                      v49 = v86;
                      if ([v86 length]
                        && (unint64_t)(v47 + v48 + [v86 length] + 2) > 0x80000)
                      {
                        v50 = [(OSASubmitter *)v93 processJob:v86 forRouting:v37 including:v95 usingConfig:v85 taskings:v82 summarize:v88 additionalRequestHeaders:v81];
                        [v84 addObject:v50];
                        v51 = [v50 objectForKeyedSubscript:@"complete"];
                        char v89 = [v51 BOOLValue];

                        v49 = v86;
                      }
                      else
                      {
                        char v89 = 1;
                      }
                      if (![v49 length])
                      {
                        v55 = [v83 objectForKeyedSubscript:@"<preface>"];
                        [(OSASubmitter *)v93 prefaceSubmission:v49 withData:v55 usingArchive:v92 andHeaders:v87];
                      }
                      [v49 appendData:v91];
                      [v49 appendBytes:"\n" length:1];
                      [v49 appendData:v42];
                      [v49 appendBytes:"\n" length:1];
                      [v38 closeFileStream];
                      [v95 addObject:v38];

                      id v11 = v85;
                      id v10 = v93;
                      if ((v89 & 1) == 0)
                      {

                        id v21 = v94;

                        v24 = v37;
                        goto LABEL_57;
                      }
                    }
                    else
                    {
                      if ([(OSAStreamDeflater *)v92 capViolation])
                      {
                        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)buf = 67109378;
                          *(_DWORD *)v112 = 10485760;
                          *(_WORD *)&v112[4] = 2112;
                          *(void *)&v112[6] = v40;
                          _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Submission archive too big (> %u) for submission with file %@", buf, 0x12u);
                        }
                        AnalyticsSendEvent();
                      }
                      v56 = [v38 bugType];
                      [v88 _recordRetirement:v56 reason:@"rejected-capviolation"];

                      [v38 retire:"rejected-capviolation"];
                    }
                  }
                  else if ([v39 code] == 2)
                  {
                    v52 = [v39 userInfo];
                    v53 = [v52 objectForKeyedSubscript:@"bug_type"];
                    v54 = [v39 localizedDescription];
                    [v88 _recordRetirement:v53 reason:v54];

                    id v10 = v93;
                  }
                }
                else
                {
                  [v95 addObject:v38];
                  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138543362;
                    *(void *)v112 = v40;
                    _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Skipping DoNotSubmit tagged report at %{public}@", buf, 0xCu);
                  }
                }

                v24 = v37;
              }
              id v21 = v94;
              uint64_t v98 = [v94 countByEnumeratingWithState:&v101 objects:v113 count:16];
            }
            while (v98);
          }

          v59 = [(OSASubmitter *)v10 processJob:v86 forRouting:v24 including:v95 usingConfig:v11 taskings:v82 summarize:v88 additionalRequestHeaders:v81];
          [v84 addObject:v59];
          v60 = [v59 objectForKeyedSubscript:@"complete"];
          char v61 = [v60 BOOLValue];

          if ((v61 & 1) == 0)
          {
LABEL_57:
            v14 = v76;
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
            {
              unsigned int jobCount = v93->_jobCount;
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)v112 = jobCount;
              _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Submission aborted after %u jobs", buf, 8u);
            }

            uint64_t v63 = 0;
            goto LABEL_61;
          }

          v14 = v76;
          id v10 = v93;
          unint64_t v13 = 0x1E4F1C000;
          unint64_t v16 = 0x1E4F1C000;
          uint64_t v19 = v24;
          v22 = v86;
        }

        uint64_t v17 = v80 + 1;
      }
      while (v80 + 1 != v77);
      uint64_t v62 = [obj countByEnumeratingWithState:&v105 objects:v114 count:16];
      uint64_t v63 = 1;
      uint64_t v77 = v62;
      if (v62) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v63 = 1;
  }
LABEL_61:

  v65 = [MEMORY[0x1E4F83948] sharedInstance];
  v66 = [v65 logDomain];

  if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
  {
    if (v63) {
      v67 = @"SUCCESS";
    }
    else {
      v67 = @"ABORTED";
    }
    unsigned int v68 = v93->_jobCount;
    CFAbsoluteTime v69 = CFAbsoluteTimeGetCurrent();
    *(_DWORD *)buf = 138543874;
    *(void *)v112 = v67;
    *(_WORD *)&v112[8] = 1024;
    *(_DWORD *)&v112[10] = v68;
    *(_WORD *)&v112[14] = 2048;
    *(double *)&v112[16] = v69 - Current;
    _os_log_impl(&dword_1DBFFE000, v66, OS_LOG_TYPE_DEFAULT, "Submission Result: %{public}@ after %u job(s), elapsed time %.2f s", buf, 0x1Cu);
  }

  if (v63)
  {
    [v14 setObject:@"success" forKeyedSubscript:@"result"];
  }
  else
  {
    v70 = NSString;
    responseError = v93->_responseError;
    if (responseError)
    {
      v72 = [(NSError *)v93->_responseError localizedDescription];
    }
    else
    {
      v72 = @"other";
    }
    v73 = [v70 stringWithFormat:@"ABORTED - %@", v72];
    [v14 setObject:v73 forKeyedSubscript:@"result"];

    if (responseError) {
  }
    }
  v74 = [NSNumber numberWithBool:v63];
  [v14 setObject:v74 forKeyedSubscript:@"complete"];

  [v14 setObject:v84 forKeyedSubscript:@"jobs"];
  [v14 setObject:v82 forKeyedSubscript:@"taskings"];

  return v14;
}

- (void)prepConfig:(id)a3
{
}

- (id)locateLog:(id)a3 forRouting:(id)a4 usingConfig:(id)a5 options:(id)a6 error:(id *)a7
{
  id v11 = (objc_class *)MEMORY[0x1E4F83930];
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  unint64_t v16 = (void *)[[v11 alloc] initWithPath:v15 forRouting:v14 usingConfig:v13 options:v12 error:a7];

  return v16;
}

- (id)applyTasking:(id)a3 taskId:(id)a4 usingConfig:(id)a5 fromBlob:(id)a6
{
  v19[4] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ([v11 isProxy]) {
    [MEMORY[0x1E4F83950] proxyTasking:v9 taskId:v10 usingConfig:v11 fromBlob:v12];
  }
  else {
  id v13 = [MEMORY[0x1E4F83950] applyTasking:v9 taskId:v10 fromBlob:v12];
  }
  if (([v10 isEqualToString:@"-1"] & 1) == 0)
  {
    v18[0] = @"action";
    v18[1] = @"routing";
    v19[0] = @"received";
    v19[1] = v9;
    v19[2] = v10;
    v18[2] = @"taskId";
    v18[3] = @"blob";
    id v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v12, "length"));
    v19[3] = v14;
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:4];
    unint64_t v16 = (void *)[v15 mutableCopy];

    if ([v11 isProxy]) {
      [v16 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"proxied"];
    }
    AnalyticsSendEvent();
  }
  return v13;
}

- (id)processJob:(id)a3 forRouting:(id)a4 including:(id)a5 usingConfig:(id)a6 taskings:(id)a7 summarize:(id)a8 additionalRequestHeaders:(id)a9
{
  uint64_t v235 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v182 = a8;
  id v19 = a9;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v21 = v20;
  if ((([v15 isEqualToString:@"da3"] & 1) != 0
     || ([v15 isEqualToString:@"awd"] & 1) != 0
     || [v15 isEqualToString:@"ca1"])
    && ([v18 objectForKeyedSubscript:v15],
        v22 = objc_claimAutoreleasedReturnValue(),
        v22,
        !v22))
  {
    v24 = self;
    if ([v15 isEqualToString:@"awd"]) {
      [v17 awdReporterKey];
    }
    else {
    v23 = [v17 crashReporterKey];
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
      -[OSASubmitter processJob:forRouting:including:usingConfig:taskings:summarize:additionalRequestHeaders:]((uint64_t)v15, (uint64_t)v23);
    }
  }
  else
  {
    v23 = 0;
    v24 = self;
  }
  v177 = v18;
  v178 = v23;
  v180 = v14;
  if ([v15 isEqualToString:@"ca1"])
  {
    id v25 = v19;
    uint64_t v26 = objc_opt_new();
    long long v204 = 0u;
    long long v205 = 0u;
    long long v206 = 0u;
    long long v207 = 0u;
    id v27 = v16;
    uint64_t v28 = [v27 countByEnumeratingWithState:&v204 objects:v234 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v205;
      do
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v205 != v30) {
            objc_enumerationMutation(v27);
          }
          v32 = [*(id *)(*((void *)&v204 + 1) + 8 * i) filepath];
          [v26 addObject:v32];
        }
        uint64_t v29 = [v27 countByEnumeratingWithState:&v204 objects:v234 count:16];
      }
      while (v29);
    }

    v33 = (void *)MEMORY[0x1E4F83940];
    uint64_t v34 = *MEMORY[0x1E4F839C0];
    uint64_t v232 = *MEMORY[0x1E4F839C8];
    v233 = v26;
    v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v233 forKeys:&v232 count:1];
    [v33 recordEvent:v34 with:v35];

    id v18 = v177;
    v23 = v178;
    id v19 = v25;
    v24 = self;
    id v14 = v180;
  }
  v24->_int64_t responseCode = 0;
  if (![v14 length]
    && (!v23 || ![(OSASubmitter *)v24 taskingNeedsRefreshForRouting:v15 at:v21]))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      v54 = [v17 identifier];
      *(_DWORD *)buf = 138412546;
      id v227 = v54;
      __int16 v228 = 2112;
      *(void *)v229 = v15;
      _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "nothing to do for %@-%@", buf, 0x16u);
    }
    v209[0] = MEMORY[0x1E4F1CC38];
    v208[0] = @"complete";
    v208[1] = @"logCount";
    uint64_t v55 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v16, "count"));
    v208[2] = @"routing";
    v179 = (void *)v55;
    v209[1] = v55;
    v209[2] = v15;
    id v186 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v209 forKeys:v208 count:3];
    goto LABEL_126;
  }
  ++v24->_jobCount;
  v36 = NSString;
  v37 = [v17 identifier];
  v179 = [v36 stringWithFormat:@"job_%@-%u-%@", v37, v24->_jobCount, v15];

  v38 = NSString;
  id v39 = [v17 productVersion];
  id v40 = [v17 releaseType];
  uint64_t v41 = [v38 stringWithFormat:@"%@-%@", v39, v40];

  v231[0] = @"application/vnd.apple.ips";
  v230[0] = @"Content-Type";
  v230[1] = @"x-hardware-model";
  v42 = [v17 modelCode];
  v231[1] = v42;
  v230[2] = @"x-os-version";
  v43 = [v17 buildVersion];
  v231[2] = v43;
  v230[3] = @"x-os-train";
  v44 = [v17 osTrain];
  v231[3] = v44;
  v230[4] = @"x-target-audience";
  v45 = [v17 targetAudience];
  v231[4] = v45;
  v170 = (void *)v41;
  v231[5] = v41;
  v230[5] = @"x-product-release";
  v230[6] = @"x-routing";
  v231[6] = v15;
  v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v231 forKeys:v230 count:7];
  uint64_t v47 = (void *)[v46 mutableCopy];

  uint64_t v48 = [v17 currentTaskingIDByRouting];
  uint64_t v49 = [v48 objectForKeyedSubscript:v15];

  if (v178) {
    BOOL v50 = v49 == 0;
  }
  else {
    BOOL v50 = 1;
  }
  int v51 = !v50;
  int v167 = v51;
  if (v50)
  {
    [v47 setObject:@"NO" forKeyedSubscript:@"x-tasking-requested"];
    v53 = self;
    v52 = v47;
  }
  else
  {
    [v47 setObject:@"YES" forKeyedSubscript:@"x-tasking-requested"];
    [v47 setObject:v178 forKeyedSubscript:@"x-crashreporter-key"];
    v52 = v47;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      id v227 = v15;
      __int16 v228 = 2114;
      *(void *)v229 = v178;
      *(_WORD *)&v229[8] = 2114;
      *(void *)&v229[10] = v49;
      _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Requesting tasking for routing %{public}@ using key %{public}@ with task_id %{public}@", buf, 0x20u);
    }
    [v47 setObject:v49 forKeyedSubscript:@"x-task-id"];
    v53 = self;
  }
  v56 = v180;
  id v171 = v19;
  [v52 addEntriesFromDictionary:v19];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v57 = [v180 length];
    uint64_t v58 = [v16 count];
    *(_DWORD *)buf = 138412802;
    id v227 = v179;
    __int16 v228 = 2048;
    *(void *)v229 = v57;
    *(_WORD *)&v229[8] = 2048;
    *(void *)&v229[10] = v58;
    _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "'%@' posting content of %lu bytes from %lu logs", buf, 0x20u);
  }
  v173 = (void *)v49;
  id v175 = v17;
  if ([v15 isEqualToString:@"ca1"])
  {
    v59 = v52;
    v60 = objc_opt_new();
    long long v200 = 0u;
    long long v201 = 0u;
    long long v202 = 0u;
    long long v203 = 0u;
    id v61 = v16;
    uint64_t v62 = [v61 countByEnumeratingWithState:&v200 objects:v225 count:16];
    if (v62)
    {
      uint64_t v63 = v62;
      uint64_t v64 = *(void *)v201;
      do
      {
        for (uint64_t j = 0; j != v63; ++j)
        {
          if (*(void *)v201 != v64) {
            objc_enumerationMutation(v61);
          }
          v66 = [*(id *)(*((void *)&v200 + 1) + 8 * j) filepath];
          [v60 addObject:v66];
        }
        uint64_t v63 = [v61 countByEnumeratingWithState:&v200 objects:v225 count:16];
      }
      while (v63);
    }

    v67 = (void *)MEMORY[0x1E4F83940];
    uint64_t v68 = *MEMORY[0x1E4F839A8];
    uint64_t v69 = *MEMORY[0x1E4F839B8];
    v224[0] = v60;
    uint64_t v70 = *MEMORY[0x1E4F839B0];
    v223[0] = v69;
    v223[1] = v70;
    v56 = v180;
    v71 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v180, "length"));
    v224[1] = v71;
    v72 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v224 forKeys:v223 count:2];
    [v67 recordEvent:v68 with:v72];

    id v17 = v175;
    v53 = self;
    v52 = v59;
  }
  double Current = CFAbsoluteTimeGetCurrent();
  v172 = v52;
  [(OSASubmitter *)v53 postContent:v56 withHeaders:v52];
  double v74 = CFAbsoluteTimeGetCurrent() - Current;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int64_t responseCode = v53->_responseCode;
    uint64_t v76 = [(NSData *)v53->_responseData length];
    *(_DWORD *)buf = 138412802;
    id v227 = v179;
    __int16 v228 = 1024;
    *(_DWORD *)v229 = responseCode;
    *(_WORD *)&v229[4] = 2048;
    *(void *)&v229[6] = v76;
    _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "'%@' server responded %d with %lu-byte payload", buf, 0x1Cu);
  }
  uint64_t v77 = [v17 modelCode];
  uint64_t v78 = [MEMORY[0x1E4F83948] sharedInstance];
  v79 = [v78 modelCode];
  uint64_t v80 = [v77 isEqualToString:v79] ^ 1;

  v221[0] = @"response";
  v81 = [NSNumber numberWithInteger:v53->_responseCode];
  connectionType = v53->_connectionType;
  v222[0] = v81;
  v222[1] = connectionType;
  v221[1] = @"connection";
  v221[2] = @"routing";
  v222[2] = v15;
  v221[3] = @"bytes";
  v83 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v56, "length"));
  v222[3] = v83;
  v221[4] = @"logs";
  v84 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v16, "count"));
  v222[4] = v84;
  v221[5] = @"seconds";
  id v85 = [NSNumber numberWithDouble:v74];
  v222[5] = v85;
  v221[6] = @"proxied";
  v86 = v16;
  uint64_t v87 = v80;
  id v88 = [NSNumber numberWithBool:v80];
  v222[6] = v88;
  char v89 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v222 forKeys:v221 count:7];
  AnalyticsSendEvent();

  id v90 = self;
  v174 = objc_opt_new();
  int64_t v91 = self->_responseCode;
  BOOL v92 = v91 == 200;
  if (v91 == 304) {
    BOOL v92 = 1;
  }
  BOOL v169 = v92;
  id v183 = v15;
  v93 = v86;
  v176 = v86;
  int64_t v168 = self->_responseCode;
  if (v91 != 304 && v91 != 200)
  {
    v118 = (void *)MEMORY[0x1E4F83940];
    uint64_t v119 = *MEMORY[0x1E4F83990];
    uint64_t v215 = *MEMORY[0x1E4F83988];
    v120 = objc_msgSend(NSNumber, "numberWithInteger:");
    v216 = v120;
    v121 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v216 forKeys:&v215 count:1];
    [v118 recordEvent:v119 with:v121];

    unint64_t v107 = 0x1E4F83000;
    long long v106 = v93;
    goto LABEL_100;
  }
  long long v198 = 0u;
  long long v199 = 0u;
  long long v196 = 0u;
  long long v197 = 0u;
  id obj = v86;
  uint64_t v94 = [obj countByEnumeratingWithState:&v196 objects:v220 count:16];
  if (v94)
  {
    uint64_t v95 = v94;
    uint64_t v96 = *(void *)v197;
    do
    {
      for (uint64_t k = 0; k != v95; ++k)
      {
        if (*(void *)v197 != v96) {
          objc_enumerationMutation(obj);
        }
        uint64_t v98 = *(void **)(*((void *)&v196 + 1) + 8 * k);
        v218[0] = @"bugType";
        uint64_t v99 = [v98 bugType];
        id v100 = (void *)v99;
        uint64_t v101 = (uint64_t)v183;
        if (v99) {
          uint64_t v101 = v99;
        }
        v219[0] = v101;
        v218[1] = @"proxied";
        long long v102 = [NSNumber numberWithBool:v87];
        v218[2] = @"logCount";
        v219[1] = v102;
        v219[2] = &unk_1F3613600;
        long long v103 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v219 forKeys:v218 count:3];
        AnalyticsSendEvent();
      }
      uint64_t v95 = [obj countByEnumeratingWithState:&v196 objects:v220 count:16];
    }
    while (v95);
  }

  long long v194 = 0u;
  long long v195 = 0u;
  long long v192 = 0u;
  long long v193 = 0u;
  id v90 = self;
  long long v104 = self->_responseHeaders;
  uint64_t v105 = [(NSDictionary *)v104 countByEnumeratingWithState:&v192 objects:v217 count:16];
  long long v106 = v86;
  unint64_t v107 = 0x1E4F83000uLL;
  if (!v105) {
    goto LABEL_98;
  }
  uint64_t v108 = v105;
  uint64_t v109 = *(void *)v193;
  while (2)
  {
    for (uint64_t m = 0; m != v108; ++m)
    {
      if (*(void *)v193 != v109) {
        objc_enumerationMutation(v104);
      }
      v111 = *(void **)(*((void *)&v192 + 1) + 8 * m);
      if (![v111 compare:@"x-task-id" options:1])
      {
        if (v173) {
          [v174 setObject:v173 forKeyedSubscript:@"lastId"];
        }
        id v90 = self;
        int64_t v112 = self->_responseCode;
        v113 = v177;
        if (v112 == 304)
        {
          [v174 setObject:@"affirmed" forKeyedSubscript:@"action"];
          [v174 setObject:v173 forKeyedSubscript:@"taskId"];
          [v174 removeObjectForKey:@"lastId"];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v227 = v183;
            uint64_t v115 = MEMORY[0x1E4F14500];
            v116 = "device is already in the correct %@ investigation";
            os_log_type_t v117 = OS_LOG_TYPE_DEFAULT;
            goto LABEL_82;
          }
LABEL_97:
          [v113 setObject:v174 forKeyedSubscript:v183];
          goto LABEL_98;
        }
        if (v112 != 200) {
          goto LABEL_97;
        }
        v114 = [v177 objectForKeyedSubscript:v183];

        if (v114)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v227 = v183;
            uint64_t v115 = MEMORY[0x1E4F14500];
            v116 = "Unexpected response data; already installed tasking blob of type %@ this session";
            os_log_type_t v117 = OS_LOG_TYPE_INFO;
LABEL_82:
            _os_log_impl(&dword_1DBFFE000, v115, v117, v116, buf, 0xCu);
            goto LABEL_97;
          }
          goto LABEL_97;
        }
        v122 = [(NSDictionary *)self->_responseHeaders objectForKeyedSubscript:v111];
        if (![v122 length])
        {
          [v174 setObject:@"unchanged" forKeyedSubscript:@"action"];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v227 = v183;
            _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "no tasking id returned for %@", buf, 0xCu);
          }
          goto LABEL_96;
        }
        v123 = [MEMORY[0x1E4F83948] sharedInstance];
        if ([v123 appleInternal])
        {
          BOOL allowUnsignedBlobs = self->_allowUnsignedBlobs;

          if (allowUnsignedBlobs)
          {
            v125 = self->_responseData;
            goto LABEL_94;
          }
        }
        else
        {
        }
        if ([(NSData *)self->_responseData length])
        {
          responseData = self->_responseData;
          id v191 = 0;
          v125 = +[OSASubmitter extractAuthenticatedBlob:responseData error:&v191];
          id v127 = v191;
          v128 = v127;
          if (v127)
          {
            v129 = [v127 localizedDescription];
            [v174 setObject:v129 forKeyedSubscript:@"authenticationError"];
          }
          goto LABEL_95;
        }
        v125 = 0;
LABEL_94:
        v128 = 0;
LABEL_95:
        v130 = [(OSASubmitter *)self applyTasking:v183 taskId:v122 usingConfig:v175 fromBlob:v125];
        [v174 addEntriesFromDictionary:v130];

        v113 = v177;
LABEL_96:

        goto LABEL_97;
      }
    }
    uint64_t v108 = [(NSDictionary *)v104 countByEnumeratingWithState:&v192 objects:v217 count:16];
    id v90 = self;
    if (v108) {
      continue;
    }
    break;
  }
LABEL_98:

  id v15 = v183;
  if (v167) {
    [(OSASubmitter *)v90 updateTaskingLastSuccessfulRequest:v183 at:v21];
  }
LABEL_100:
  v131 = [*(id *)(v107 + 2376) sharedInstance];
  int v132 = [v131 appleInternal];

  if (v132)
  {
    v133 = [*(id *)(v107 + 2376) sharedInstance];
    v134 = [v133 pathDiagnostics];
    v135 = [v134 stringByAppendingPathComponent:v179];
    v136 = [v135 stringByAppendingPathExtension:@"ips"];

    [v180 writeToFile:v136 atomically:0];
    v213[0] = @"logs";
    v137 = [v106 valueForKey:@"getFilenames"];
    v214[0] = v137;
    v214[1] = v172;
    v213[1] = @"postHeaders";
    v213[2] = @"response";
    uint64_t v138 = [NSNumber numberWithInteger:v90->_responseCode];
    v139 = (void *)v138;
    responseHeaders = (NSDictionary *)MEMORY[0x1E4F1CC08];
    responseError = v90->_responseError;
    if (v90->_responseHeaders) {
      responseHeaders = v90->_responseHeaders;
    }
    v214[2] = v138;
    v214[3] = responseHeaders;
    v213[3] = @"responseHeaders";
    v213[4] = @"responseError";
    if (responseError)
    {
      v142 = [(NSError *)responseError localizedDescription];
    }
    else
    {
      v142 = &stru_1F360EEC0;
    }
    v214[4] = v142;
    v213[5] = @"payloadLength";
    v143 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSData length](v90->_responseData, "length"));
    v214[5] = v143;
    v144 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v214 forKeys:v213 count:6];

    if (responseError) {
    v145 = [*(id *)(v107 + 2376) sharedInstance];
    }
    v146 = [v145 pathDiagnostics];
    v147 = [v146 stringByAppendingPathComponent:v179];
    v148 = [v147 stringByAppendingPathExtension:@"diagnostics"];
    [v144 writeToFile:v148 atomically:1];

    id v15 = v183;
    long long v106 = v176;
  }
  if (v168 == 304 || v168 == 200)
  {
    long long v189 = 0u;
    long long v190 = 0u;
    long long v187 = 0u;
    long long v188 = 0u;
    id v149 = v106;
    uint64_t v150 = [v149 countByEnumeratingWithState:&v187 objects:v212 count:16];
    if (v150)
    {
      uint64_t v151 = v150;
      LODWORD(v152) = 0;
      uint64_t v153 = *(void *)v188;
      do
      {
        for (uint64_t n = 0; n != v151; ++n)
        {
          if (*(void *)v188 != v153) {
            objc_enumerationMutation(v149);
          }
          v155 = *(void **)(*((void *)&v187 + 1) + 8 * n);
          v156 = [v155 bugType];
          int v157 = [v156 isEqualToString:@"193"];

          dryRuuint64_t n = self->_dryRun;
          v159 = [v155 bugType];
          if (dryRun)
          {
            [v182 _recordRetirement:v159 reason:@"pending"];
          }
          else
          {
            [v182 _recordRetirement:v159 reason:@"submitted"];

            [v155 retire:"submitted"];
          }
          uint64_t v152 = (v152 + v157);
        }
        uint64_t v151 = [v149 countByEnumeratingWithState:&v187 objects:v212 count:16];
      }
      while (v151);
    }
    else
    {
      uint64_t v152 = 0;
    }

    id v15 = v183;
  }
  else
  {
    uint64_t v152 = 0;
  }
  v210[0] = @"complete";
  v184 = [NSNumber numberWithBool:v169];
  v211[0] = v184;
  v211[1] = v15;
  v210[1] = @"routing";
  v210[2] = @"logCount";
  id v16 = v176;
  v160 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v176, "count"));
  v211[2] = v160;
  v210[3] = @"aggdCount";
  v161 = [NSNumber numberWithInt:v152];
  v211[3] = v161;
  v210[4] = @"contentLength";
  id v14 = v180;
  v162 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v180, "length"));
  v211[4] = v162;
  v210[5] = @"response";
  v163 = [NSNumber numberWithInteger:self->_responseCode];
  v211[5] = v163;
  v210[6] = @"payloadLength";
  v164 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSData length](self->_responseData, "length"));
  v211[6] = v164;
  v211[7] = v174;
  v210[7] = @"tasking";
  v210[8] = @"seconds";
  v165 = [NSNumber numberWithDouble:v74];
  v211[8] = v165;
  id v186 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v211 forKeys:v210 count:9];

  [v176 removeAllObjects];
  [v180 setLength:0];

  id v17 = v175;
  id v18 = v177;
  v23 = v178;
  id v19 = v171;
LABEL_126:

  return v186;
}

- (BOOL)cheaterTaskingWithSets:(id)a3 usingConfig:(id)a4 resultsCallback:(id)a5
{
  id v8 = (void (**)(id, void *))a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_opt_new();
  id v12 = [(OSASubmitter *)self processSubmissionJobs:v10 usingConfig:v9 summarize:v11];

  if (v8) {
    v8[2](v8, v12);
  }
  if (v12)
  {
    id v13 = [v12 objectForKeyedSubscript:@"complete"];
    char v14 = [v13 BOOLValue];
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

- (BOOL)submitLogsUsingPolicy:(id)a3 resultsCallback:(id)a4
{
  v167[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, void *, void *))a4;
  v116 = objc_opt_new();
  v111 = objc_opt_new();
  id v8 = [MEMORY[0x1E4F83948] sharedInstance];
  int v9 = [v8 appleInternal];

  if (v9)
  {
    id v10 = [MEMORY[0x1E4F83948] sharedInstance];
    id v11 = [v10 pathDiagnostics];

    if (v11)
    {
      id v12 = (void *)MEMORY[0x1E4F83930];
      uint64_t v166 = *MEMORY[0x1E4F83A00];
      v167[0] = v11;
      id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v167 forKeys:&v166 count:1];
      [v12 iterateLogsWithOptions:v13 usingBlock:&__block_literal_global];
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Not clearing past submission artifacts because path is not available.", buf, 2u);
    }
  }
  char v14 = (void *)MEMORY[0x1E4F83930];
  id v15 = [MEMORY[0x1E4F83948] sharedInstance];
  id v16 = [v15 pathSubmission];
  id v17 = [v14 scanProxies:v16];

  if ([MEMORY[0x1E4F83930] isDataVaultEnabled])
  {
    id v18 = [MEMORY[0x1E4F83948] sharedInstance];
    id v19 = [v18 pathSubmissionDataVault];

    if (v19)
    {
      double v20 = [MEMORY[0x1E4F83930] scanProxies:v19];
      uint64_t v21 = [v17 arrayByAddingObjectsFromArray:v20];

      id v17 = (void *)v21;
    }
    else
    {
      BOOL v22 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
      if (v22) {
        -[OSASubmitter submitLogsUsingPolicy:resultsCallback:](v22, v23, v24, v25, v26, v27, v28, v29);
      }
    }
  }
  if ([v6 ignoreProxies])
  {
    uint64_t v30 = &unk_1F36137C0;
  }
  else
  {
    uint64_t v30 = [&unk_1F36137D8 arrayByAddingObjectsFromArray:v17];
  }
  uint64_t v109 = v17;
  long long v146 = 0u;
  long long v147 = 0u;
  long long v144 = 0u;
  long long v145 = 0u;
  id obj = v30;
  v124 = v6;
  v113 = v7;
  uint64_t v115 = [obj countByEnumeratingWithState:&v144 objects:v165 count:16];
  if (v115)
  {
    uint64_t v114 = *(void *)v145;
    uint64_t v125 = *MEMORY[0x1E4F839A0];
    uint64_t v126 = *MEMORY[0x1E4F83998];
    v122 = self;
LABEL_18:
    uint64_t v31 = 0;
    while (1)
    {
      if (*(void *)v145 != v114) {
        objc_enumerationMutation(obj);
      }
      uint64_t v119 = v31;
      v32 = *(void **)(*((void *)&v144 + 1) + 8 * v31);
      context = (void *)MEMORY[0x1E0197840]();
      if ([v32 length])
      {
        v121 = [v32 lastPathComponent];
        v164 = v32;
        v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v164 count:1];
      }
      else
      {
        v33 = [(OSASubmitter *)self primarySubmissionPaths];
        v121 = @"Primary";
      }
      long long v142 = 0u;
      long long v143 = 0u;
      long long v140 = 0u;
      long long v141 = 0u;
      id v127 = v33;
      uint64_t v34 = [v127 countByEnumeratingWithState:&v140 objects:v163 count:16];
      if (v34)
      {
        uint64_t v35 = v34;
        uint64_t v36 = *(void *)v141;
        do
        {
          for (uint64_t i = 0; i != v35; ++i)
          {
            if (*(void *)v141 != v36) {
              objc_enumerationMutation(v127);
            }
            [(OSASubmitter *)self prepConfig:*(void *)(*((void *)&v140 + 1) + 8 * i)];
          }
          uint64_t v35 = [v127 countByEnumeratingWithState:&v140 objects:v163 count:16];
        }
        while (v35);
      }

      if ([v32 length])
      {
        uint64_t v38 = [objc_alloc(MEMORY[0x1E4F83938]) initFromPath:v32];
      }
      else
      {
        uint64_t v38 = [MEMORY[0x1E4F83948] sharedInstance];
      }
      id v39 = (__CFString *)v38;
      id v40 = v121;
      uint64_t v41 = MEMORY[0x1E4F14500];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v160 = v121;
        _os_log_impl(&dword_1DBFFE000, v41, OS_LOG_TYPE_DEFAULT, "----- '%{public}@' -----", buf, 0xCu);
      }
      if (!v39)
      {
        v148[0] = @"name";
        v148[1] = @"result";
        v149[0] = v121;
        v149[1] = @"skipped - no metadata for proxy device";
        v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v149 forKeys:v148 count:2];
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v160 = v121;
          _os_log_impl(&dword_1DBFFE000, v41, OS_LOG_TYPE_DEFAULT, "No submission parameters found from '%{public}@'", buf, 0xCu);
        }
        LODWORD(v47) = 1;
        goto LABEL_90;
      }
      v42 = [v6 buildSubmissionTemplateForConfig:v39];
      v43 = (__CFString *)[v42 copy];

      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v160 = v39;
        __int16 v161 = 2112;
        v162 = v43;
        _os_log_debug_impl(&dword_1DBFFE000, v41, OS_LOG_TYPE_DEBUG, "config: %@\npolicy: %@", buf, 0x16u);
      }
      v118 = v39;
      v44 = (void *)MEMORY[0x1E4F83930];
      v45 = [v6 scanOptions];
      os_log_type_t v117 = v43;
      if ([v44 scanLogs:v43 from:v127 options:v45])
      {
      }
      else
      {
        char v48 = [v6 hasTasking];

        if ((v48 & 1) == 0)
        {
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v160 = v121;
            _os_log_impl(&dword_1DBFFE000, v41, OS_LOG_TYPE_DEFAULT, "No logs/tasking found for submission from '%{public}@'", buf, 0xCu);
          }
          uint64_t v77 = [MEMORY[0x1E4F1CA60] dictionary];
          uint64_t v78 = [(__CFString *)v118 identifier];
          [v77 setObject:v78 forKeyedSubscript:@"name"];

          [v77 setObject:@"empty" forKeyedSubscript:@"result"];
          uint64_t v69 = objc_opt_new();
          v110 = v77;
          [v77 setObject:v69 forKeyedSubscript:@"jobs"];
          long long v130 = 0u;
          long long v131 = 0u;
          long long v128 = 0u;
          long long v129 = 0u;
          v123 = v43;
          uint64_t v79 = [(__CFString *)v123 countByEnumeratingWithState:&v128 objects:v154 count:16];
          if (v79)
          {
            uint64_t v80 = v79;
            uint64_t v81 = *(void *)v129;
            do
            {
              for (uint64_t j = 0; j != v80; ++j)
              {
                if (*(void *)v129 != v81) {
                  objc_enumerationMutation(v123);
                }
                v83 = *(void **)(*((void *)&v128 + 1) + 8 * j);
                v84 = [v83 objectForKeyedSubscript:@"routing"];
                id v85 = [v83 objectForKeyedSubscript:@"<inactive>"];

                if (v85)
                {
                  v150[0] = @"<inactive>";
                  v86 = [v83 objectForKeyedSubscript:@"<inactive>"];
                  v150[1] = @"routing";
                  v151[0] = v86;
                  v151[1] = v84;
                  uint64_t v87 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v151 forKeys:v150 count:2];
                  [v69 addObject:v87];
                }
                else
                {
                  if (!v122->_dryRun) {
                    [v124 registerRouting:v84 result:1];
                  }
                  v152[0] = @"logCount";
                  v152[1] = @"routing";
                  v153[0] = &unk_1F3613618;
                  v153[1] = v84;
                  v86 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v153 forKeys:v152 count:2];
                  [v69 addObject:v86];
                }
              }
              uint64_t v80 = [(__CFString *)v123 countByEnumeratingWithState:&v128 objects:v154 count:16];
            }
            while (v80);
          }

          LODWORD(v47) = 1;
          self = v122;
LABEL_87:
          id v39 = v118;
LABEL_88:

          id v6 = v124;
          v7 = v113;
          v46 = v110;
          goto LABEL_89;
        }
      }
      uint64_t v49 = [MEMORY[0x1E4F83948] sharedInstance];
      BOOL v50 = [v49 logDomain];

      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        int v51 = [MEMORY[0x1E4F83948] sharedInstance];
        int v52 = [v51 optInApple];
        *(_DWORD *)buf = 138543618;
        v53 = @"OUT";
        if (v52) {
          v53 = @"IN";
        }
        v160 = v121;
        __int16 v161 = 2112;
        v162 = v53;
        _os_log_impl(&dword_1DBFFE000, v50, OS_LOG_TYPE_DEFAULT, "Initiating submission for '%{public}@' optIn: %@", buf, 0x16u);
      }
      long long v138 = 0u;
      long long v139 = 0u;
      long long v136 = 0u;
      long long v137 = 0u;
      v54 = v43;
      uint64_t v55 = [(__CFString *)v54 countByEnumeratingWithState:&v136 objects:v158 count:16];
      if (v55)
      {
        uint64_t v56 = v55;
        uint64_t v57 = *(void *)v137;
        do
        {
          for (uint64_t k = 0; k != v56; ++k)
          {
            if (*(void *)v137 != v57) {
              objc_enumerationMutation(v54);
            }
            v59 = *(void **)(*((void *)&v136 + 1) + 8 * k);
            v60 = [v59 objectForKeyedSubscript:@"routing"];
            int v61 = [v60 isEqualToString:@"ca1"];

            if (v61)
            {
              uint64_t v62 = (void *)MEMORY[0x1E4F83940];
              uint64_t v156 = v125;
              uint64_t v63 = [v59 objectForKeyedSubscript:@"logs"];
              uint64_t v64 = (void *)v63;
              uint64_t v65 = MEMORY[0x1E4F1CBF0];
              if (v63) {
                uint64_t v65 = v63;
              }
              uint64_t v157 = v65;
              v66 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v157 forKeys:&v156 count:1];
              [v62 recordEvent:v126 with:v66];
            }
          }
          uint64_t v56 = [(__CFString *)v54 countByEnumeratingWithState:&v136 objects:v158 count:16];
        }
        while (v56);
      }

      id v39 = v118;
      v67 = [(OSASubmitter *)self processSubmissionJobs:v54 usingConfig:v118 summarize:v111];
      uint64_t v68 = [v67 objectForKeyedSubscript:@"complete"];
      uint64_t v47 = [v68 BOOLValue];

      if (!self->_dryRun)
      {
        long long v134 = 0u;
        long long v135 = 0u;
        long long v132 = 0u;
        long long v133 = 0u;
        v110 = v67;
        uint64_t v69 = [v67 objectForKeyedSubscript:@"jobs"];
        uint64_t v70 = [v69 countByEnumeratingWithState:&v132 objects:v155 count:16];
        if (v70)
        {
          uint64_t v71 = v70;
          uint64_t v72 = *(void *)v133;
          do
          {
            for (uint64_t m = 0; m != v71; ++m)
            {
              if (*(void *)v133 != v72) {
                objc_enumerationMutation(v69);
              }
              double v74 = *(void **)(*((void *)&v132 + 1) + 8 * m);
              v75 = [v74 objectForKeyedSubscript:@"<inactive>"];

              if (!v75)
              {
                uint64_t v76 = [v74 objectForKeyedSubscript:@"routing"];
                [v124 registerRouting:v76 result:v47];
              }
            }
            uint64_t v71 = [v69 countByEnumeratingWithState:&v132 objects:v155 count:16];
          }
          while (v71);
          goto LABEL_87;
        }
        goto LABEL_88;
      }
      id v6 = v124;
      v7 = v113;
      v46 = v67;
LABEL_89:

      id v40 = v121;
LABEL_90:
      [v116 addObject:v46];
      if (v7) {
        v7[2](v7, v46, v39);
      }

      if (!v47)
      {
        BOOL v88 = 0;
        goto LABEL_97;
      }
      uint64_t v31 = v119 + 1;
      if (v119 + 1 == v115)
      {
        uint64_t v115 = [obj countByEnumeratingWithState:&v144 objects:v165 count:16];
        if (v115) {
          goto LABEL_18;
        }
        break;
      }
    }
  }
  BOOL v88 = 1;
LABEL_97:

  if (!self->_dryRun) {
    [v6 persist];
  }
  char v89 = [MEMORY[0x1E4F83948] sharedInstance];
  int v90 = [v89 appleInternal];

  if (v90)
  {
    launchInfo = self->_launchInfo;
    if (launchInfo) {
      uint64_t v92 = [(NSDictionary *)launchInfo mutableCopy];
    }
    else {
      uint64_t v92 = objc_opt_new();
    }
    v93 = (void *)v92;
    uint64_t v94 = [(NSDictionary *)self->_launchInfo objectForKeyedSubscript:@"time"];
    if (!v94)
    {
      uint64_t v94 = [MEMORY[0x1E4F1C9C8] date];
      [v93 setObject:v94 forKeyedSubscript:@"time"];
    }
    uint64_t v95 = [MEMORY[0x1E4F83948] sharedInstance];
    uint64_t v96 = [v95 pathDiagnostics];
    v97 = NSString;
    uint64_t v98 = OSANSDateFormat();
    uint64_t v99 = [v97 stringWithFormat:@"submission-%@", v98];
    id v100 = [v96 stringByAppendingPathComponent:v99];
    uint64_t v101 = [v100 stringByAppendingPathExtension:@"results"];

    [v93 setObject:v116 forKeyedSubscript:@"submissions"];
    [v93 setObject:v111 forKeyedSubscript:@"retirement-summary"];
    long long v102 = [(OSASubmitter *)self submissionURL];
    long long v103 = [v102 absoluteString];
    [v93 setObject:v103 forKeyedSubscript:@"url"];

    [v93 setObject:self->_connectionType forKeyedSubscript:@"connection"];
    long long v104 = [MEMORY[0x1E4F83948] sharedInstance];
    uint64_t v105 = [v104 buildVersion];
    [v93 setObject:v105 forKeyedSubscript:@"version"];

    if ([v93 writeToFile:v101 atomically:1])
    {
      id v6 = v124;
      v7 = v113;
    }
    else
    {
      id v6 = v124;
      v7 = v113;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "failed to write results file, saving as txt", buf, 2u);
      }
      uint64_t v106 = [v101 stringByAppendingPathExtension:@"txt"];

      unint64_t v107 = [v93 description];
      [v107 writeToFile:v106 atomically:1 encoding:4 error:0];

      uint64_t v101 = (void *)v106;
    }
  }
  return v88;
}

void __54__OSASubmitter_submitLogsUsingPolicy_resultsCallback___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 pathExtension];
  if (([v3 isEqualToString:@"ips"] & 1) != 0
    || [v3 isEqualToString:@"diagnostics"])
  {
    v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v4 removeItemAtURL:v2 error:0];
  }
  else
  {
    if (![v3 isEqualToString:@"results"]) {
      goto LABEL_5;
    }
    v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v6 = [v2 path];
    uint64_t v11 = 0;
    v4 = [v5 attributesOfItemAtPath:v6 error:&v11];

    if (v4)
    {
      v7 = [v4 fileModificationDate];
      [v7 timeIntervalSinceNow];
      double v9 = fabs(v8);

      if (v9 > 604800.0)
      {
        id v10 = [MEMORY[0x1E4F28CB8] defaultManager];
        [v10 removeItemAtURL:v2 error:0];
      }
    }
  }

LABEL_5:
}

- (BOOL)taskingNeedsRefreshForRouting:(id)a3 at:(double)a4
{
  id v6 = a3;
  v7 = [(OSASubmitter *)self taskingLastSuccessfulRequest];
  double v8 = v7;
  if (v7)
  {
    double v9 = [v7 objectForKeyedSubscript:v6];
    if (v9)
    {
      id v10 = [v8 objectForKeyedSubscript:v6];
      [v10 doubleValue];
      double v12 = v11;
    }
    else
    {
      double v12 = 0.0;
    }
  }
  else
  {
    double v12 = 0.0;
  }
  double v13 = a4 - v12;
  if (v13 >= 43200.0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    -[OSASubmitter taskingNeedsRefreshForRouting:at:]((uint64_t)v6, v13);
  }

  return v13 >= 43200.0;
}

+ (id)submissionPathsWithHomeDirectory:(id)a3
{
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", a3);
  if ([MEMORY[0x1E4F83930] isDataVaultEnabled])
  {
    v4 = [MEMORY[0x1E4F83948] sharedInstance];
    v5 = [v4 pathSubmissionDataVault];

    if ([v5 length])
    {
      [v3 addObject:v5];
    }
    else
    {
      BOOL v6 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
      if (v6) {
        -[OSASubmitter submitLogsUsingPolicy:resultsCallback:](v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
  }
  char v14 = [MEMORY[0x1E4F83948] sharedInstance];
  id v15 = [v14 pathSubmission];

  if ([v15 length])
  {
    [v3 addObject:v15];
  }
  else
  {
    BOOL v16 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v16) {
      +[OSASubmitter submissionPathsWithHomeDirectory:](v16, v17, v18, v19, v20, v21, v22, v23);
    }
  }
  uint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithArray:v3];

  return v24;
}

- (id)primarySubmissionPaths
{
  id v2 = [(OSASubmitter *)self launchInfo];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"legacy-homePath"];
  v4 = +[OSASubmitter submissionPathsWithHomeDirectory:v3];

  return v4;
}

+ (id)extractAuthenticatedBlob:(id)a3 error:(id *)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t ApplePinned = SecPolicyCreateApplePinned();
  if (ApplePinned)
  {
    uint64_t v7 = (const void *)ApplePinned;
    SecTrustRef trust = 0;
    uint64_t v20 = 0;
    uint64_t v8 = SecCMSVerifyCopyDataAndAttributes();
    if (v8)
    {
      uint64_t v9 = [NSString stringWithFormat:@"Could not extract signature from blob, error %d", v8];
      uint64_t v10 = (__CFString *)v9;
      if (a4)
      {
        uint64_t v11 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v23 = *MEMORY[0x1E4F28568];
        uint64_t v24 = v9;
        uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
        *a4 = [v11 errorWithDomain:@"OSASubmitter" code:1 userInfo:v12];
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v26 = v10;
        _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
      }

      uint64_t v13 = 0;
    }
    else
    {
      CFErrorRef error = 0;
      if (SecTrustEvaluateWithError(trust, &error))
      {
        uint64_t v13 = v20;
      }
      else
      {
        CFErrorRef v16 = error;
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v26 = (__CFString *)v16;
          _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Signature on blob is not trusted, %@", buf, 0xCu);
        }
        if (a4) {
          *a4 = v16;
        }

        uint64_t v13 = 0;
      }
      CFRelease(trust);
    }
    CFRelease(v7);
  }
  else
  {
    if (a4)
    {
      char v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v21 = *MEMORY[0x1E4F28568];
      uint64_t v22 = @"Unable to create pinned policy";
      id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      *a4 = [v14 errorWithDomain:@"OSASubmitter" code:2 userInfo:v15];
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v26 = @"Unable to create pinned policy";
      _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }
    uint64_t v13 = 0;
  }

  return v13;
}

- (void)updateTaskingLastSuccessfulRequest:(id)a3 at:(double)a4
{
  id v6 = a3;
  uint64_t v7 = [(OSASubmitter *)self taskingLastSuccessfulRequest];
  uint64_t v8 = (void *)[v7 mutableCopy];
  uint64_t v9 = v8;
  if (v8) {
    id v10 = v8;
  }
  else {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  id v13 = v10;

  uint64_t v11 = [NSNumber numberWithDouble:a4];
  [v13 setObject:v11 forKeyedSubscript:v6];

  uint64_t v12 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v12 setObject:v13 forKey:@"taskingLastSuccessfulRequest"];
}

- (id)taskingLastSuccessfulRequest
{
  id v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v3 = [v2 objectForKey:@"taskingLastSuccessfulRequest"];

  return v3;
}

- (BOOL)allowUnsignedBlobs
{
  return self->_allowUnsignedBlobs;
}

- (void)setAllowUnsignedBlobs:(BOOL)a3
{
  self->_BOOL allowUnsignedBlobs = a3;
}

- (NSArray)internalWhitelist
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setInternalWhitelist:(id)a3
{
}

- (NSString)connectionType
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setConnectionType:(id)a3
{
}

- (NSDictionary)launchInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setLaunchInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchInfo, 0);
  objc_storeStrong((id *)&self->_connectionType, 0);
  objc_storeStrong((id *)&self->_internalWhitelist, 0);
  objc_storeStrong((id *)&self->_responseError, 0);
  objc_storeStrong((id *)&self->_responseHeaders, 0);
  objc_storeStrong((id *)&self->_responseData, 0);
}

- (void)getAdditionalRequestHeaders
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138543362;
  uint64_t v2 = a1;
  _os_log_debug_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Submission jobs will include additional request headers %{public}@", (uint8_t *)&v1, 0xCu);
}

- (void)processJob:(uint64_t)a1 forRouting:(uint64_t)a2 including:usingConfig:taskings:summarize:additionalRequestHeaders:.cold.1(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 138412546;
  uint64_t v3 = a1;
  __int16 v4 = 2112;
  uint64_t v5 = a2;
  _os_log_debug_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%@ tasking key is %@", (uint8_t *)&v2, 0x16u);
}

- (void)submitLogsUsingPolicy:(uint64_t)a3 resultsCallback:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)taskingNeedsRefreshForRouting:(uint64_t)a1 at:(double)a2 .cold.1(uint64_t a1, double a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 138412546;
  uint64_t v3 = a1;
  __int16 v4 = 2048;
  double v5 = a2;
  _os_log_debug_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%@ tasking needs refresh for routing (time elapsed: %f)", (uint8_t *)&v2, 0x16u);
}

+ (void)submissionPathsWithHomeDirectory:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end