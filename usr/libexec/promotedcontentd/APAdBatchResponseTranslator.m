@interface APAdBatchResponseTranslator
+ (Class)translatesClass;
- (NSMutableSet)internalReps;
- (id)contentDataWithError:(id)a3 identifier:(id)a4 journeyStartRelayValues:(id)a5;
- (id)fixupFormattedText:(id)a3;
- (id)translate:(id *)a3;
- (void)_addContentDataWithErrorForError:(id)a3 identifier:(id)a4 toResults:(id)a5 journeyStartRelayValues:(id)a6;
- (void)setInternalReps:(id)a3;
@end

@implementation APAdBatchResponseTranslator

+ (Class)translatesClass
{
  return (Class)objc_opt_class();
}

- (id)contentDataWithError:(id)a3 identifier:(id)a4 journeyStartRelayValues:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  v8 = [v6 domain];
  unsigned int v9 = [v8 isEqualToString:@"com.apple.ap.AdValidationErrorDomain"];

  if (v9)
  {
    v10 = (char *)[v6 code];
    if ((unint64_t)(v10 - 4505) >= 5) {
      uint64_t v11 = 1021;
    }
    else {
      uint64_t v11 = qword_1001D72D0[(void)(v10 - 4505)];
    }
  }
  else
  {
    v12 = [v6 domain];
    unsigned int v13 = [v12 isEqualToString:@"com.apple.ap.DaemonDiscardedErrorDomain"];

    if (v13)
    {
      if ([v6 code] == (id)2600)
      {
        uint64_t v11 = 1020;
      }
      else
      {
        v16 = APLogForCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          int v22 = 134217984;
          id v23 = [v6 code];
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%ld is not a valid discard reason.", (uint8_t *)&v22, 0xCu);
        }

        uint64_t v11 = 0;
      }
    }
    else
    {
      v14 = [v6 domain];
      unsigned int v15 = [v14 isEqualToString:NSURLErrorDomain];

      if (v15) {
        uint64_t v11 = 1010;
      }
      else {
        uint64_t v11 = 0;
      }
    }
  }
  v17 = [APContentDataInternal alloc];
  v18 = +[NSUUID UUID];
  v19 = [v18 UUIDString];
  v20 = -[APContentDataInternal initWithUnfilledReason:error:contentIdentifier:contextIdentifier:containerSize:placementType:journeyStartRelayValues:](v17, "initWithUnfilledReason:error:contentIdentifier:contextIdentifier:containerSize:placementType:journeyStartRelayValues:", v11, v6, v19, 0, -1, v7, 0.0, 0.0);

  return v20;
}

- (id)translate:(id *)a3
{
  if (a3)
  {
    v3 = a3;
    if (+[APSystemInternal isAppleInternalInstall])
    {
      v5 = +[APMockAdServerSettings settings];
      id v6 = [v5 logAdResponsesAsText];

      if (v6)
      {
        id v7 = [(APResponseDataTranslator *)self response];
        v8 = [v7 formattedText];
        unsigned int v9 = [(APAdBatchResponseTranslator *)self fixupFormattedText:v8];

        v10 = APLogForCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138477827;
          v107 = v9;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "APPBAdBatchResponse text:\n%{private}@", buf, 0xCu);
        }
      }
    }
    uint64_t v11 = +[NSMutableArray array];
    v98 = self;
    if (*v3)
    {
      v12 = [*v3 domain];
      unsigned int v13 = [v12 isEqualToString:@"com.apple.ap.HTTPError"];

      if (v13)
      {
        v14 = (char *)[*v3 code];
        uint64_t v15 = 4509;
        if ((unint64_t)(v14 - 500) >= 0x64) {
          uint64_t v15 = 0;
        }
        if ((unint64_t)(v14 - 400) >= 0x64) {
          uint64_t v16 = v15;
        }
        else {
          uint64_t v16 = 4508;
        }
        v17 = [(APResponseDataTranslator *)self requester];
        v18 = [v17 requestIdentifier];
        v19 = +[NSString stringWithFormat:@"Server returned HTTP error %ld for request %@", v14, v18];
        id *v3 = +[APLegacyInterfaceError validationErrorWithCode:v16 andReason:v19];
      }
      id v20 = *v3;
      v21 = [(APResponseDataTranslator *)self requester];
      int v22 = [v21 requestIdentifier];
      id v23 = self;
      goto LABEL_16;
    }
    v27 = [(APResponseDataTranslator *)self response];
    unsigned int v28 = [v27 hasError];

    if (!v28)
    {
LABEL_34:
      if (*v3)
      {
LABEL_41:
        v57 = APLogForCategory();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
        {
          v58 = [(APResponseDataTranslator *)self requester];
          v59 = [v58 requestIdentifier];
          id v60 = [*v3 code];
          v61 = [*v3 localizedDescription];
          *(_DWORD *)buf = 138543874;
          v107 = v59;
          __int16 v108 = 2048;
          *(void *)v109 = v60;
          self = v98;
          *(_WORD *)&v109[8] = 2114;
          v110 = v61;
          _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_INFO, "Content with ID %{public}@ failed verification with error code %ld: %{public}@", buf, 0x20u);
        }
LABEL_44:
        v62 = [(APResponseDataTranslator *)self response];
        uint64_t v63 = [v62 ads];
        if (v63)
        {
          v64 = (void *)v63;
          v65 = [(APResponseDataTranslator *)self response];
          v66 = [v65 ads];
          id v67 = [v66 count];

          if (v67)
          {
            v97 = v11;
            v95 = v3;
            v96 = +[NSDate date];
            long long v101 = 0u;
            long long v102 = 0u;
            long long v103 = 0u;
            long long v104 = 0u;
            v68 = v98;
            v69 = [(APResponseDataTranslator *)v98 response];
            v70 = [v69 ads];

            id obj = v70;
            id v100 = [v70 countByEnumeratingWithState:&v101 objects:v105 count:16];
            if (v100)
            {
              uint64_t v99 = *(void *)v102;
              uint64_t v71 = 1;
              do
              {
                for (i = 0; i != v100; i = (char *)i + 1)
                {
                  if (*(void *)v102 != v99) {
                    objc_enumerationMutation(obj);
                  }
                  v73 = *(void **)(*((void *)&v101 + 1) + 8 * i);
                  v74 = [(APResponseDataTranslator *)v68 requester];
                  v75 = [v73 adOriginalRequesterId];
                  v76 = [v74 requestFromRequestID:v75];

                  if (v76)
                  {
                    v77 = [APAdDataResponseTranslator alloc];
                    v78 = [(APResponseDataTranslator *)v68 requester];
                    v79 = [v76 identifier];
                    v80 = [v79 UUIDString];
                    v81 = [v76 context];
                    v82 = -[APAdDataResponseTranslator initWithResponse:forRequester:contentIdentifier:withContext:placement:](v77, "initWithResponse:forRequester:contentIdentifier:withContext:placement:", v73, v78, v80, v81, [v76 placementType]);

                    v83 = [(APAdDataResponseTranslator *)v82 translate:v95];
                    if ([v76 placementType] == (id)7) {
                      +[NSUUID UUID];
                    }
                    else {
                    v84 = [v76 identifier];
                    }
                    v85 = [v84 UUIDString];
                    v86 = [v83 content];
                    [v86 setIdentifier:v85];

                    v87 = [v83 content];
                    [v87 setReceivedReferenceTime:v96];

                    v88 = [v83 privateContent];
                    [v88 setSequenceNumber:v71];

                    v68 = v98;
                    v89 = [(APResponseDataTranslator *)v98 response];
                    v90 = [v89 batchId];
                    v91 = [v83 privateContent];
                    [v91 setBatchResponseID:v90];

                    v92 = [v73 adOriginalRequesterId];
                    [v83 setAdOriginalRequesterId:v92];

                    [v97 addObject:v83];
                    uint64_t v71 = (v71 + 1);
                  }
                }
                id v100 = [obj countByEnumeratingWithState:&v101 objects:v105 count:16];
              }
              while (v100);
            }

            v24 = v97;
            v25 = v24;
            goto LABEL_21;
          }
        }
        else
        {
        }
        id v20 = *v3;
        if (!*v3) {
          goto LABEL_17;
        }
        v21 = [(APResponseDataTranslator *)v98 requester];
        int v22 = [v21 requestIdentifier];
        id v23 = v98;
LABEL_16:
        [(APAdBatchResponseTranslator *)v23 _addContentDataWithErrorForError:v20 identifier:v22 toResults:v11 journeyStartRelayValues:0];

LABEL_17:
        v24 = v11;
        v25 = v24;
        goto LABEL_21;
      }
      v48 = [(APResponseDataTranslator *)self response];
      uint64_t v49 = [v48 ads];
      if (v49)
      {
        v50 = (void *)v49;
        v51 = [(APResponseDataTranslator *)self response];
        v52 = [v51 ads];
        id v53 = [v52 count];

        self = v98;
        if (v53) {
          goto LABEL_40;
        }
      }
      else
      {
      }
      v54 = [(APResponseDataTranslator *)self requester];
      v55 = [v54 requestIdentifier];
      v56 = +[NSString stringWithFormat:@"AdBatchResponse contained no ads for request %@", v55];
      id *v3 = +[APLegacyInterfaceError validationErrorWithCode:4504 andReason:v56];

      self = v98;
LABEL_40:
      if (!*v3) {
        goto LABEL_44;
      }
      goto LABEL_41;
    }
    v29 = [(APResponseDataTranslator *)self response];
    unsigned int v30 = [v29 error];

    if (v30 == 1)
    {
      v31 = [(APResponseDataTranslator *)self response];
      id v37 = [v31 errorDetails];
      v33 = [(APResponseDataTranslator *)self requester];
      v34 = [v33 requestIdentifier];
      v35 = +[NSString stringWithFormat:@"Server returned No_Qualified error %u for request %@", v37, v34];
      uint64_t v36 = 4510;
    }
    else
    {
      if (v30 != 2)
      {
        v94 = v3;
        v38 = APLogForCategory();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          v39 = [(APResponseDataTranslator *)self requester];
          v40 = [v39 requestIdentifier];
          v41 = [(APResponseDataTranslator *)self response];
          unsigned int v42 = [v41 error];
          v43 = [(APResponseDataTranslator *)v98 response];
          unsigned int v44 = [v43 errorDetails];
          *(_DWORD *)buf = 138543874;
          v107 = v40;
          __int16 v108 = 1024;
          *(_DWORD *)v109 = v42;
          *(_WORD *)&v109[4] = 1024;
          *(_DWORD *)&v109[6] = v44;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "Serving returned AdBatchRequest for content %{public}@ with unknown error %u and error details %u", buf, 0x18u);

          self = v98;
        }

        v31 = [(APResponseDataTranslator *)self response];
        id v45 = [v31 error];
        v33 = [(APResponseDataTranslator *)self response];
        id v46 = [v33 errorDetails];
        v34 = [(APResponseDataTranslator *)self requester];
        v35 = [v34 requestIdentifier];
        v47 = +[NSString stringWithFormat:@"Server returned unrecognized error %u with details %u for request %@", v45, v46, v35];
        +[APLegacyInterfaceError validationErrorWithCode:4510 andReason:v47];
        v3 = v94;
        id *v94 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_33;
      }
      v31 = [(APResponseDataTranslator *)self response];
      id v32 = [v31 errorDetails];
      v33 = [(APResponseDataTranslator *)self requester];
      v34 = [v33 requestIdentifier];
      v35 = +[NSString stringWithFormat:@"Server returned configuration error %u for request %@", v32, v34];
      uint64_t v36 = 4505;
    }
    id *v3 = +[APLegacyInterfaceError validationErrorWithCode:v36 andReason:v35];
LABEL_33:

    self = v98;
    goto LABEL_34;
  }
  v24 = APLogForCategory();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Error is nil.", buf, 2u);
  }
  v25 = &__NSArray0__struct;
LABEL_21:

  return v25;
}

- (void)_addContentDataWithErrorForError:(id)a3 identifier:(id)a4 toResults:(id)a5 journeyStartRelayValues:(id)a6
{
  id v10 = a3;
  if (v10)
  {
    id v11 = a5;
    v12 = [(APAdBatchResponseTranslator *)self contentDataWithError:v10 identifier:a4 journeyStartRelayValues:a6];
    [v11 addObject:v12];

    unsigned int v13 = APLogForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = [v12 content];
      uint64_t v15 = [v14 identifier];
      int v16 = 138543618;
      v17 = v15;
      __int16 v18 = 2114;
      id v19 = v10;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Content %{public}@ is being returned with an error: %{public}@", (uint8_t *)&v16, 0x16u);
    }
  }
}

- (id)fixupFormattedText:(id)a3
{
  id v3 = a3;
  id v81 = 0;
  id v4 = [objc_alloc((Class)NSRegularExpression) initWithPattern:@"unfilledReasonCode:\\ \"(\\w+)\\\"" options:0 error:&v81];
  id v5 = v81;
  id v6 = [v4 firstMatchInString:v3 options:0 range:[v3 length]];
  id v7 = v6;
  if (v6) {
    BOOL v8 = v5 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8 && (unint64_t)[v6 numberOfRanges] >= 2)
  {
    id v9 = [v7 rangeAtIndex:1];
    [v3 substringWithRange:v9, v10];
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    if ([v11 isEqualToString:@"InventoryUnavailable"])
    {
      uint64_t v12 = 201;
    }
    else if ([v11 isEqualToString:@"GlobalExclusion"])
    {
      uint64_t v12 = 202;
    }
    else if ([v11 isEqualToString:@"PolicyExclusion"])
    {
      uint64_t v12 = 203;
    }
    else if ([v11 isEqualToString:@"LimitExceeded"])
    {
      uint64_t v12 = 204;
    }
    else if ([v11 isEqualToString:@"AdsDisabledInIssue"])
    {
      uint64_t v12 = 205;
    }
    else
    {
      uint64_t v12 = 201;
    }

    unsigned int v13 = +[NSNumber numberWithInt:v12];
    id v14 = [v3 length];
    uint64_t v15 = +[NSString stringWithFormat:@"unfilledReasonCode: %@", v13];
    uint64_t v16 = [v4 stringByReplacingMatchesInString:v3 options:0 range:0 withTemplate:v14];

    id v3 = (id)v16;
  }
  id v80 = v5;
  id v17 = [objc_alloc((Class)NSRegularExpression) initWithPattern:@"specification\\ \\{.\\s+type:\\ \\\"(\\w+)\\\".\\}" options:8 error:&v80];
  id v18 = v80;

  id v19 = [v17 matchesInString:v3 options:0 range:[v3 length]];
  v72 = v19;
  if (v19)
  {
    id v20 = v19;
    if ([v19 count])
    {
      if (!v18)
      {
        uint64_t v71 = v7;
        long long v78 = 0u;
        long long v79 = 0u;
        long long v76 = 0u;
        long long v77 = 0u;
        id v21 = v20;
        id v22 = [v21 countByEnumeratingWithState:&v76 objects:v82 count:16];
        if (v22)
        {
          id v23 = v22;
          uint64_t v24 = *(void *)v77;
          do
          {
            for (i = 0; i != v23; i = (char *)i + 1)
            {
              if (*(void *)v77 != v24) {
                objc_enumerationMutation(v21);
              }
              v26 = *(void **)(*((void *)&v76 + 1) + 8 * i);
              if ((unint64_t)[v26 numberOfRanges] >= 2)
              {
                id v27 = [v26 rangeAtIndex:1];
                [v3 substringWithRange:v27, v28];
                id v29 = (id)objc_claimAutoreleasedReturnValue();
                if ([v29 isEqualToString:@"Banner"])
                {
                  uint64_t v30 = 0;
                }
                else if ([v29 isEqualToString:@"Interstitial"])
                {
                  uint64_t v30 = 2;
                }
                else if ([v29 isEqualToString:@"IABMediumRectangle"])
                {
                  uint64_t v30 = 4;
                }
                else if ([v29 isEqualToString:@"Audio"])
                {
                  uint64_t v30 = 5;
                }
                else if ([v29 isEqualToString:@"Video"])
                {
                  uint64_t v30 = 8;
                }
                else if ([v29 isEqualToString:@"Flexible"])
                {
                  uint64_t v30 = 9;
                }
                else if ([v29 isEqualToString:@"Native"])
                {
                  uint64_t v30 = 10;
                }
                else if ([v29 isEqualToString:@"Sponsorship"])
                {
                  uint64_t v30 = 11;
                }
                else
                {
                  uint64_t v30 = 0;
                }

                v31 = +[NSNumber numberWithInt:v30];
                id v32 = [v3 length];
                v33 = +[NSString stringWithFormat:@"specification {\n   type: %@\n}", v31];
                uint64_t v34 = [v17 stringByReplacingMatchesInString:v3 options:0 range:0 withTemplate:v32];

                id v3 = (id)v34;
              }
            }
            id v23 = [v21 countByEnumeratingWithState:&v76 objects:v82 count:16];
          }
          while (v23);
        }

        id v18 = 0;
        id v7 = v71;
      }
    }
  }
  id v75 = v18;
  id v35 = [objc_alloc((Class)NSRegularExpression) initWithPattern:@"action:\\ \\\"(\\w+)\\\"" options:0 error:&v75];
  id v36 = v75;

  id v37 = [v35 firstMatchInString:v3 options:0 range:[v3 length]];

  if (v37 && !v36 && (unint64_t)[v37 numberOfRanges] >= 2)
  {
    id v38 = [v37 rangeAtIndex:1];
    [v3 substringWithRange:v38, v39];
    id v40 = (id)objc_claimAutoreleasedReturnValue();
    if ([v40 isEqualToString:@"None"])
    {
      uint64_t v41 = 0;
    }
    else if ([v40 isEqualToString:@"Web"])
    {
      uint64_t v41 = 1;
    }
    else if ([v40 isEqualToString:@"Storyboard"])
    {
      uint64_t v41 = 2;
    }
    else if ([v40 isEqualToString:@"iTunesStore"])
    {
      uint64_t v41 = 8;
    }
    else if ([v40 isEqualToString:@"WebView"])
    {
      uint64_t v41 = 10;
    }
    else if ([v40 isEqualToString:@"App"])
    {
      uint64_t v41 = 11;
    }
    else if ([v40 isEqualToString:@"MRAID"])
    {
      uint64_t v41 = 12;
    }
    else if ([v40 isEqualToString:@"WebVideo"])
    {
      uint64_t v41 = 13;
    }
    else
    {
      uint64_t v41 = 0;
    }

    unsigned int v42 = +[NSNumber numberWithInt:v41];
    id v43 = [v3 length];
    unsigned int v44 = +[NSString stringWithFormat:@"action: %@", v42];
    uint64_t v45 = [v35 stringByReplacingMatchesInString:v3 options:0 range:0 withTemplate:v43];

    id v3 = (id)v45;
  }
  id v74 = v36;
  id v46 = [objc_alloc((Class)NSRegularExpression) initWithPattern:@"transitionType:\\ \\\"(\\w+)\\\"" options:0 error:&v74];
  id v47 = v74;

  v48 = [v46 firstMatchInString:v3 options:0 range:[v3 length]];

  if (v48 && !v47 && (unint64_t)[v48 numberOfRanges] >= 2)
  {
    uint64_t v49 = 1;
    id v50 = [v48 rangeAtIndex:1];
    v52 = [v3 substringWithRange:v50, v51];
    if (([v52 isEqualToString:@"Slide"] & 1) == 0)
    {
      if ([v52 isEqualToString:@"Fade"]) {
        uint64_t v49 = 2;
      }
      else {
        uint64_t v49 = 1;
      }
    }
    id v53 = +[NSNumber numberWithInt:v49];
    id v54 = [v3 length];
    v55 = +[NSString stringWithFormat:@"transitionType: %@", v53];
    uint64_t v56 = [v46 stringByReplacingMatchesInString:v3 options:0 range:0 withTemplate:v54];

    id v3 = (id)v56;
  }
  id v73 = v47;
  id v57 = [objc_alloc((Class)NSRegularExpression) initWithPattern:@"adPrivacyMarkPosition:\\ \\\"(\\w+)\\\"" options:0 error:&v73];
  id v58 = v73;

  v59 = [v57 firstMatchInString:v3 options:0 range:[v3 length]];

  if (v59)
  {
    id v60 = v72;
    if (!v58 && (unint64_t)[v59 numberOfRanges] >= 2)
    {
      id v61 = [v59 rangeAtIndex:1];
      [v3 substringWithRange:v61, v62];
      id v63 = (id)objc_claimAutoreleasedReturnValue();
      if ([v63 isEqualToString:@"BottomRight"])
      {
        uint64_t v64 = 0;
      }
      else if ([v63 isEqualToString:@"TopRight"])
      {
        uint64_t v64 = 1;
      }
      else if ([v63 isEqualToString:@"TopLeft"])
      {
        uint64_t v64 = 2;
      }
      else if ([v63 isEqualToString:@"BottomLeft"])
      {
        uint64_t v64 = 3;
      }
      else if ([v63 isEqualToString:@"NoAdPrivacyMark"])
      {
        uint64_t v64 = 4;
      }
      else
      {
        uint64_t v64 = 0;
      }

      v65 = +[NSNumber numberWithInt:v64];
      id v66 = [v3 length];
      id v67 = +[NSString stringWithFormat:@"adPrivacyMarkPosition: %@", v65];
      uint64_t v68 = [v57 stringByReplacingMatchesInString:v3 options:0 range:0 withTemplate:v66];

      id v3 = (id)v68;
    }
  }
  else
  {
    id v60 = v72;
  }
  id v69 = v3;

  return v69;
}

- (NSMutableSet)internalReps
{
  return (NSMutableSet *)objc_getProperty(self, a2, 24, 1);
}

- (void)setInternalReps:(id)a3
{
}

- (void).cxx_destruct
{
}

@end