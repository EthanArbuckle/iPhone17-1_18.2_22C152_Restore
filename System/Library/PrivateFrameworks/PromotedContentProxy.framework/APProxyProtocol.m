@interface APProxyProtocol
+ (APProxyProtocolProperties)properties;
+ (BOOL)canInitWithRequest:(id)a3;
+ (id)canonicalRequestForRequest:(id)a3;
+ (void)invalidateProxyDemultiplexerSessionForId:(id)a3;
+ (void)setProxyURL:(id)a3;
+ (void)start;
+ (void)stop;
- (APNSURLSessionDemultiplexer)sessionDemux;
- (NSArray)modes;
- (NSThread)clientThread;
- (NSURLSessionDataTask)task;
- (double)startTime;
- (id)_currentRunLoopModes;
- (int64_t)requestType;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7;
- (void)dealloc;
- (void)setClientThread:(id)a3;
- (void)setModes:(id)a3;
- (void)setRequestType:(int64_t)a3;
- (void)setSessionDemux:(id)a3;
- (void)setStartTime:(double)a3;
- (void)setTask:(id)a3;
- (void)startLoading;
- (void)stopLoading;
@end

@implementation APProxyProtocol

+ (APProxyProtocolProperties)properties
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2397A7664;
  block[3] = &unk_264DA2D88;
  block[4] = a1;
  if (qword_26AB71E88 != -1) {
    dispatch_once(&qword_26AB71E88, block);
  }
  v2 = (void *)qword_26AB71E90;

  return (APProxyProtocolProperties *)v2;
}

+ (void)start
{
  objc_msgSend_registerClass_(MEMORY[0x263EFC628], a2, (uint64_t)a1, v2, v3);
  objc_msgSend_registerSchemeForCustomProtocol_(MEMORY[0x263F1FA00], v4, @"pc-x-tag-http", v5, v6);
  objc_msgSend_registerSchemeForCustomProtocol_(MEMORY[0x263F1FA00], v7, @"pc-x-tag-https", v8, v9);
  objc_msgSend_registerSchemeForCustomProtocol_(MEMORY[0x263F1FA00], v10, @"pc-video-http", v11, v12);
  objc_msgSend_registerSchemeForCustomProtocol_(MEMORY[0x263F1FA00], v13, @"pc-video-https", v14, v15);
  *MEMORY[0x263F242A0] = 1;
  v16 = APLogForCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_2397A4000, v16, OS_LOG_TYPE_DEFAULT, "Proxy has started.", v17, 2u);
  }
}

+ (void)stop
{
  *MEMORY[0x263F242A0] = 0;
  objc_msgSend_unregisterClass_(MEMORY[0x263EFC628], a2, (uint64_t)a1, v2, v3);
  objc_msgSend_unregisterSchemeForCustomProtocol_(MEMORY[0x263F1FA00], v4, @"pc-x-tag-http", v5, v6);
  objc_msgSend_unregisterSchemeForCustomProtocol_(MEMORY[0x263F1FA00], v7, @"pc-x-tag-https", v8, v9);
  objc_msgSend_unregisterSchemeForCustomProtocol_(MEMORY[0x263F1FA00], v10, @"pc-video-http", v11, v12);
  v16 = (void *)MEMORY[0x263F1FA00];

  objc_msgSend_unregisterSchemeForCustomProtocol_(v16, v13, @"pc-video-https", v14, v15);
}

+ (void)setProxyURL:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (objc_msgSend_length(v4, v5, v6, v7, v8))
  {
    v16 = objc_msgSend_URLWithString_(NSURL, v9, (uint64_t)v4, v10, v11);
    if (v16)
    {
      v17 = objc_msgSend_properties(a1, v12, v13, v14, v15);
      v22 = objc_msgSend_proxySessionConfigurationProvider(v17, v18, v19, v20, v21);
      objc_msgSend_setProxyURL_(v22, v23, (uint64_t)v16, v24, v25);
    }
    else
    {
      v17 = APLogForCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        int v26 = 138543362;
        id v27 = v4;
        _os_log_impl(&dword_2397A4000, v17, OS_LOG_TYPE_ERROR, "Could not form valid URL from %{public}@", (uint8_t *)&v26, 0xCu);
      }
    }
  }
}

+ (void)invalidateProxyDemultiplexerSessionForId:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_class();
  objc_msgSend_properties(v4, v5, v6, v7, v8);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = objc_msgSend_sessionDemultiplexerManager(v17, v9, v10, v11, v12);
  objc_msgSend_unregisterSessionDemultiplexerWithIdentifier_(v13, v14, (uint64_t)v3, v15, v16);
}

- (void)dealloc
{
  uint64_t v6 = objc_msgSend_sessionDemux(self, a2, v2, v3, v4);
  uint64_t v11 = objc_msgSend_task(self, v7, v8, v9, v10);
  objc_msgSend_removeTask_(v6, v12, (uint64_t)v11, v13, v14);

  v15.receiver = self;
  v15.super_class = (Class)APProxyProtocol;
  [(NSURLProtocol *)&v15 dealloc];
}

+ (BOOL)canInitWithRequest:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_recursiveRequestFlag(v3, v4, v5, v6, v7))
  {
    char isEqualToString = 0;
  }
  else
  {
    uint64_t v13 = objc_msgSend_URL(v3, v8, v9, v10, v11);
    v18 = objc_msgSend_scheme(v13, v14, v15, v16, v17);
    if (objc_msgSend_isEqualToString_(v18, v19, @"pc-x-tag-http", v20, v21))
    {
      char isEqualToString = 1;
    }
    else
    {
      int v26 = objc_msgSend_URL(v3, v22, v23, v24, v25);
      v31 = objc_msgSend_scheme(v26, v27, v28, v29, v30);
      if (objc_msgSend_isEqualToString_(v31, v32, @"pc-x-tag-https", v33, v34))
      {
        char isEqualToString = 1;
      }
      else
      {
        v39 = objc_msgSend_URL(v3, v35, v36, v37, v38);
        v44 = objc_msgSend_scheme(v39, v40, v41, v42, v43);
        if (objc_msgSend_isEqualToString_(v44, v45, @"pc-video-http", v46, v47))
        {
          char isEqualToString = 1;
        }
        else
        {
          v52 = objc_msgSend_URL(v3, v48, v49, v50, v51);
          v57 = objc_msgSend_scheme(v52, v53, v54, v55, v56);
          char isEqualToString = objc_msgSend_isEqualToString_(v57, v58, @"pc-video-https", v59, v60);
        }
      }
    }
  }

  return isEqualToString;
}

+ (id)canonicalRequestForRequest:(id)a3
{
  id v3 = a3;
  uint64_t v8 = objc_msgSend_mutableCopy(v3, v4, v5, v6, v7);
  uint64_t v13 = objc_msgSend_URL(v3, v9, v10, v11, v12);
  v18 = objc_msgSend_scheme(v13, v14, v15, v16, v17);

  if (objc_msgSend_isEqualToString_(v18, v19, @"pc-x-tag-http", v20, v21))
  {
    int v26 = objc_msgSend_URL(v3, v22, v23, v24, v25);
    objc_msgSend_changeSchemeToString_(v26, v27, @"http", v28, v29);
    v45 = LABEL_7:;

LABEL_8:
    objc_msgSend_setRequestType_(v8, v46, 1, v47, v48);
    objc_msgSend_setURL_(v8, v49, (uint64_t)v45, v50, v51);
    goto LABEL_18;
  }
  if (objc_msgSend_isEqualToString_(v18, v22, @"pc-video-http", v24, v25))
  {
    uint64_t v34 = objc_msgSend_URL(v3, v30, v31, v32, v33);
    objc_msgSend_changeSchemeToString_(v34, v35, @"http", v36, v37);
  }
  else
  {
    if (objc_msgSend_isEqualToString_(v18, v30, @"pc-x-tag-https", v32, v33))
    {
      int v26 = objc_msgSend_URL(v3, v38, v39, v40, v41);
      objc_msgSend_changeSchemeToString_(v26, v42, @"https", v43, v44);
      goto LABEL_7;
    }
    if (!objc_msgSend_isEqualToString_(v18, v38, @"pc-video-https", v40, v41))
    {
      v45 = 0;
      goto LABEL_8;
    }
    uint64_t v34 = objc_msgSend_URL(v3, v46, v52, v47, v48);
    objc_msgSend_changeSchemeToString_(v34, v53, @"https", v54, v55);
  v45 = };

  objc_msgSend_setRequestType_(v8, v56, 2, v57, v58);
  v63 = objc_msgSend_absoluteString(v45, v59, v60, v61, v62);
  v68 = objc_msgSend_stringByRemovingPercentEncoding(v63, v64, v65, v66, v67);

  if (v68)
  {
    uint64_t v72 = objc_msgSend_URLWithString_(NSURL, v69, (uint64_t)v68, v70, v71);
    v76 = (void *)v72;
    if (v72) {
      objc_msgSend_setURL_(v8, v73, v72, v74, v75);
    }
    else {
      objc_msgSend_setURL_(v8, v73, (uint64_t)v45, v74, v75);
    }
  }
  else
  {
    objc_msgSend_setURL_(v8, v69, (uint64_t)v45, v70, v71);
  }

LABEL_18:

  return v8;
}

- (void)startLoading
{
  uint64_t v212 = *MEMORY[0x263EF8340];
  uint64_t v6 = objc_msgSend_request(self, a2, v2, v3, v4);
  uint64_t v11 = objc_msgSend_requestType(v6, v7, v8, v9, v10);
  objc_msgSend_setRequestType_(self, v12, v11, v13, v14);

  objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x263EFF910], v15, v16, v17, v18);
  objc_msgSend_setStartTime_(self, v19, v20, v21, v22);
  id v27 = objc_msgSend_currentThread(MEMORY[0x263F08B88], v23, v24, v25, v26);
  objc_msgSend_setClientThread_(self, v28, (uint64_t)v27, v29, v30);

  uint64_t v35 = objc_msgSend_requestType(self, v31, v32, v33, v34);
  uint64_t v40 = objc_msgSend_request(self, v36, v37, v38, v39);
  v45 = v40;
  if (v35 == 1)
  {
    uint64_t v46 = objc_msgSend_adIdentifier(v40, v41, v42, v43, v44);

    uint64_t v51 = objc_msgSend_request(self, v47, v48, v49, v50);
    v45 = objc_msgSend_maximumRequestCount(v51, v52, v53, v54, v55);

    if (v45)
    {
      uint64_t v60 = (int)objc_msgSend_intValue(v45, v56, v57, v58, v59);
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v61 = objc_msgSend_URL(v40, v41, v42, v43, v44);
    uint64_t v46 = objc_msgSend_videoAdIdentifier(v61, v62, v63, v64, v65);
  }
  uint64_t v60 = -1;
LABEL_6:

  if (objc_msgSend_length(v46, v66, v67, v68, v69))
  {
    uint64_t v74 = objc_msgSend_request(self, v70, v71, v72, v73);
    v79 = objc_msgSend_mutableCopy(v74, v75, v76, v77, v78);

    if (objc_msgSend_requestType(self, v80, v81, v82, v83) == 2)
    {
      v88 = objc_msgSend_URL(v79, v84, v85, v86, v87);
      v93 = objc_msgSend_removeVideoAdIdentifier(v88, v89, v90, v91, v92);
      objc_msgSend_setURL_(v79, v94, (uint64_t)v93, v95, v96);
    }
    objc_msgSend_setRecursiveRequestFlag(v79, v84, v85, v86, v87);
    v101 = objc_msgSend__currentRunLoopModes(self, v97, v98, v99, v100);
    objc_msgSend_setModes_(self, v102, (uint64_t)v101, v103, v104);

    v105 = objc_opt_class();
    v110 = objc_msgSend_properties(v105, v106, v107, v108, v109);
    v115 = objc_msgSend_sessionDemultiplexerManager(v110, v111, v112, v113, v114);
    v118 = objc_msgSend_sessionDemultiplexerForAdByIdentifier_maximumRequestCount_(v115, v116, (uint64_t)v46, v60, v117);
    objc_msgSend_setSessionDemux_(self, v119, (uint64_t)v118, v120, v121);

    v126 = objc_msgSend_sessionDemux(self, v122, v123, v124, v125);
    v131 = objc_msgSend_modes(self, v127, v128, v129, v130);
    v133 = objc_msgSend_dataTaskWithRequest_delegate_modes_(v126, v132, (uint64_t)v79, (uint64_t)self, (uint64_t)v131);
    objc_msgSend_setTask_(self, v134, (uint64_t)v133, v135, v136);

    v141 = objc_msgSend_task(self, v137, v138, v139, v140);
    objc_msgSend_setTaskDescription_(v141, v142, (uint64_t)v46, v143, v144);

    v145 = APLogForCategory();
    if (os_log_type_enabled(v145, OS_LOG_TYPE_DEFAULT))
    {
      v202 = objc_msgSend_task(self, v146, v147, v148, v149);
      v154 = objc_msgSend_taskDescription(v202, v150, v151, v152, v153);
      objc_msgSend_task(self, v155, v156, v157, v158);
      v159 = v203 = v115;
      v164 = objc_msgSend_description(v159, v160, v161, v162, v163);
      v169 = objc_msgSend_URL(v79, v165, v166, v167, v168);
      objc_msgSend_absoluteString(v169, v170, v171, v172, v173);
      v174 = v46;
      v176 = v175 = v110;
      *(_DWORD *)buf = 136643587;
      v205 = "-[APProxyProtocol startLoading]";
      __int16 v206 = 2114;
      v207 = v154;
      __int16 v208 = 2114;
      v209 = v164;
      __int16 v210 = 2114;
      v211 = v176;
      _os_log_impl(&dword_2397A4000, v145, OS_LOG_TYPE_DEFAULT, "%{sensitive}s: %{public}@ starting request %{public}@ for %{public}@", buf, 0x2Au);

      v110 = v175;
      uint64_t v46 = v174;

      v115 = v203;
    }

    v181 = objc_msgSend_task(self, v177, v178, v179, v180);

    if (v181)
    {
      v186 = objc_msgSend_task(self, v182, v183, v184, v185);
      objc_msgSend_resume(v186, v187, v188, v189, v190);
    }
    else
    {
      v186 = objc_msgSend_client(self, v182, v183, v184, v185);
      v199 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v198, *MEMORY[0x263F07F70], 3328, 0);
      objc_msgSend_URLProtocol_didFailWithError_(v186, v200, (uint64_t)self, (uint64_t)v199, v201);
    }
  }
  else
  {
    v79 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v70, *MEMORY[0x263F07F70], 3328, 0);
    v195 = objc_msgSend_client(self, v191, v192, v193, v194);
    objc_msgSend_URLProtocol_didFailWithError_(v195, v196, (uint64_t)self, (uint64_t)v79, v197);
  }
}

- (void)stopLoading
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  uint64_t v3 = APLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = objc_msgSend_task(self, v4, v5, v6, v7);
    uint64_t v13 = objc_msgSend_taskDescription(v8, v9, v10, v11, v12);
    objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x263EFF910], v14, v15, v16, v17);
    double v19 = v18;
    objc_msgSend_startTime(self, v20, v21, v22, v23);
    int v55 = 136643331;
    uint64_t v56 = "-[APProxyProtocol stopLoading]";
    __int16 v57 = 2114;
    uint64_t v58 = v13;
    __int16 v59 = 2048;
    double v60 = v19 - v24;
    _os_log_impl(&dword_2397A4000, v3, OS_LOG_TYPE_DEFAULT, "%{sensitive}s: %{public}@ Request stopped after: (elapsed %.1f)", (uint8_t *)&v55, 0x20u);
  }
  uint64_t v29 = objc_msgSend_task(self, v25, v26, v27, v28);

  if (v29)
  {
    uint64_t v34 = objc_msgSend_task(self, v30, v31, v32, v33);
    objc_msgSend_cancel(v34, v35, v36, v37, v38);

    uint64_t v43 = objc_msgSend_sessionDemux(self, v39, v40, v41, v42);
    uint64_t v48 = objc_msgSend_task(self, v44, v45, v46, v47);
    objc_msgSend_removeTask_(v43, v49, (uint64_t)v48, v50, v51);

    objc_msgSend_setTask_(self, v52, 0, v53, v54);
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  uint64_t v15 = (void (**)(id, uint64_t))a6;
  id v8 = a5;
  uint64_t v13 = objc_msgSend_client(self, v9, v10, v11, v12);
  objc_msgSend_URLProtocol_didReceiveResponse_cacheStoragePolicy_(v13, v14, (uint64_t)self, (uint64_t)v8, 2);

  v15[2](v15, 1);
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v6 = a5;
  objc_msgSend_client(self, v7, v8, v9, v10);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_URLProtocol_didLoadData_(v13, v11, (uint64_t)self, (uint64_t)v6, v12);
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v14 = a5;
  if (!v14)
  {
    uint64_t v30 = objc_msgSend_response(v9, v10, v11, v12, v13);
    uint64_t v49 = objc_msgSend_client(self, v45, v46, v47, v48);
    objc_msgSend_URLProtocolDidFinishLoading_(v49, v50, (uint64_t)self, v51, v52);

    if (v30 && objc_msgSend_statusCode(v30, v53, v54, v55, v56) != 200)
    {
      __int16 v57 = APLogForCategory();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v62 = objc_msgSend_taskDescription(v9, v58, v59, v60, v61);
        int v67 = 136643331;
        uint64_t v68 = "-[APProxyProtocol URLSession:task:didCompleteWithError:]";
        __int16 v69 = 2114;
        uint64_t v70 = v62;
        __int16 v71 = 2050;
        uint64_t v72 = objc_msgSend_statusCode(v30, v63, v64, v65, v66);
        _os_log_impl(&dword_2397A4000, v57, OS_LOG_TYPE_DEFAULT, "%{sensitive}s: %{public}@ -- Finished load with HTTP error: %{public}ld", (uint8_t *)&v67, 0x20u);
      }
    }
    goto LABEL_12;
  }
  uint64_t v15 = APLogForCategory();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = objc_msgSend_taskDescription(v9, v16, v17, v18, v19);
    uint64_t v25 = objc_msgSend_localizedDescription(v14, v21, v22, v23, v24);
    int v67 = 136643331;
    uint64_t v68 = "-[APProxyProtocol URLSession:task:didCompleteWithError:]";
    __int16 v69 = 2114;
    uint64_t v70 = v20;
    __int16 v71 = 2114;
    uint64_t v72 = (uint64_t)v25;
    _os_log_impl(&dword_2397A4000, v15, OS_LOG_TYPE_DEFAULT, "%{sensitive}s: %{public}@ -- Finished load with error: %{public}@", (uint8_t *)&v67, 0x20u);
  }
  uint64_t v30 = objc_msgSend_domain(v14, v26, v27, v28, v29);
  if (objc_msgSend_isEqual_(v30, v31, *MEMORY[0x263F08570], v32, v33))
  {
LABEL_12:

    goto LABEL_13;
  }
  uint64_t v38 = objc_msgSend_code(v14, v34, v35, v36, v37);

  if (v38 != -999)
  {
    uint64_t v30 = objc_msgSend_client(self, v39, v40, v41, v42);
    objc_msgSend_URLProtocol_didFailWithError_(v30, v43, (uint64_t)self, (uint64_t)v14, v44);
    goto LABEL_12;
  }
LABEL_13:
}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  uint64_t v163 = *MEMORY[0x263EF8340];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = (void (**)(id, id))a7;
  uint64_t v19 = objc_msgSend_requestType(self, v15, v16, v17, v18);
  uint64_t v20 = APLogForCategory();
  BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_INFO);
  if (v19 == 2)
  {
    if (v21)
    {
      uint64_t v149 = objc_msgSend_currentRequest(v11, v22, v23, v24, v25);
      uint64_t v147 = objc_msgSend_URL(v149, v26, v27, v28, v29);
      uint64_t v34 = objc_msgSend_host(v147, v30, v31, v32, v33);
      v145 = objc_msgSend_URL(v13, v35, v36, v37, v38);
      uint64_t v43 = objc_msgSend_host(v145, v39, v40, v41, v42);
      uint64_t v48 = objc_msgSend_currentRequest(v11, v44, v45, v46, v47);
      uint64_t v53 = objc_msgSend_URL(v48, v49, v50, v51, v52);
      objc_msgSend_absoluteString(v53, v54, v55, v56, v57);
      uint64_t v58 = v151 = v12;
      objc_msgSend_URL(v13, v59, v60, v61, v62);
      uint64_t v63 = v153 = v11;
      uint64_t v68 = objc_msgSend_absoluteString(v63, v64, v65, v66, v67);
      *(_DWORD *)buf = 138544130;
      uint64_t v156 = v34;
      __int16 v157 = 2114;
      uint64_t v158 = v43;
      __int16 v159 = 2114;
      v160 = v58;
      __int16 v161 = 2114;
      uint64_t v162 = v68;
      _os_log_impl(&dword_2397A4000, v20, OS_LOG_TYPE_INFO, "APProxyProtocol: A redirect '%{public}@'->'%{public}@' has been received. Original URL:\n%{public}@\nRedirected URL:\n%{public}@", buf, 0x2Au);

      id v11 = v153;
      id v12 = v151;
    }
    if (v14) {
      v14[2](v14, v13);
    }
  }
  else
  {
    if (v21)
    {
      v150 = objc_msgSend_currentRequest(v11, v22, v23, v24, v25);
      uint64_t v148 = objc_msgSend_URL(v150, v69, v70, v71, v72);
      uint64_t v77 = objc_msgSend_host(v148, v73, v74, v75, v76);
      v146 = objc_msgSend_URL(v13, v78, v79, v80, v81);
      objc_msgSend_host(v146, v82, v83, v84, v85);
      uint64_t v86 = v152 = v12;
      uint64_t v144 = objc_msgSend_currentRequest(v11, v87, v88, v89, v90);
      objc_msgSend_URL(v144, v91, v92, v93, v94);
      uint64_t v95 = v154 = v11;
      uint64_t v100 = objc_msgSend_absoluteString(v95, v96, v97, v98, v99);
      v105 = objc_msgSend_URL(v13, v101, v102, v103, v104);
      v110 = objc_msgSend_absoluteString(v105, v106, v107, v108, v109);
      *(_DWORD *)buf = 138544130;
      uint64_t v156 = v77;
      __int16 v157 = 2114;
      uint64_t v158 = v86;
      __int16 v159 = 2114;
      v160 = v100;
      __int16 v161 = 2114;
      uint64_t v162 = v110;
      _os_log_impl(&dword_2397A4000, v20, OS_LOG_TYPE_INFO, "APProxyProtocol: Blocked redirect '%{public}@'->'%{public}@'. Original URL:\n%{public}@\nRedirected URL:\n%{public}@", buf, 0x2Au);

      id v11 = v154;
      id v12 = v152;
    }
    v115 = objc_msgSend_mutableCopy(v13, v111, v112, v113, v114);
    objc_msgSend_removeRecursiveRequestFlag(v115, v116, v117, v118, v119);
    uint64_t v124 = objc_msgSend_client(self, v120, v121, v122, v123);
    objc_msgSend_URLProtocol_wasRedirectedToRequest_redirectResponse_(v124, v125, (uint64_t)self, (uint64_t)v115, (uint64_t)v12);

    uint64_t v130 = objc_msgSend_task(self, v126, v127, v128, v129);
    objc_msgSend_cancel(v130, v131, v132, v133, v134);

    uint64_t v139 = objc_msgSend_client(self, v135, v136, v137, v138);
    v141 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v140, *MEMORY[0x263F07F70], 3072, 0);
    objc_msgSend_URLProtocol_didFailWithError_(v139, v142, (uint64_t)self, (uint64_t)v141, v143);

    if (v14) {
      v14[2](v14, 0);
    }
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = (void (**)(id, void, void *))a6;
  id v11 = APLogForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v16 = objc_msgSend_currentRequest(v8, v12, v13, v14, v15);
    BOOL v21 = objc_msgSend_URL(v16, v17, v18, v19, v20);
    uint64_t v26 = objc_msgSend_description(v21, v22, v23, v24, v25);
    int v66 = 138543362;
    uint64_t v67 = (uint64_t)v26;
    _os_log_impl(&dword_2397A4000, v11, OS_LOG_TYPE_DEBUG, "Challenge received for url session with request to %{public}@.", (uint8_t *)&v66, 0xCu);
  }
  uint64_t v31 = objc_msgSend_failureResponse(v9, v27, v28, v29, v30);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    goto LABEL_11;
  }
  uint64_t v37 = objc_msgSend_failureResponse(v9, v33, v34, v35, v36);
  uint64_t v42 = objc_msgSend_statusCode(v37, v38, v39, v40, v41);

  uint64_t v43 = APLogForCategory();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
  {
    int v66 = 134217984;
    uint64_t v67 = v42;
    _os_log_impl(&dword_2397A4000, v43, OS_LOG_TYPE_DEBUG, "Challenge failure is related to url response with status code: %ld.", (uint8_t *)&v66, 0xCu);
  }

  if (v42 == 407)
  {
    uint64_t v44 = objc_opt_class();
    uint64_t v49 = objc_msgSend_properties(v44, v45, v46, v47, v48);
    uint64_t v54 = objc_msgSend_proxyURLCredentialService(v49, v50, v51, v52, v53);

    uint64_t v59 = objc_msgSend_originalRequest(v8, v55, v56, v57, v58);
    uint64_t v62 = objc_msgSend_signedCredentialForRequest_withPersistence_(v54, v60, (uint64_t)v59, 1, v61);

    uint64_t v63 = APLogForCategory();
    uint64_t v64 = v63;
    if (v62)
    {
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v66) = 0;
        _os_log_impl(&dword_2397A4000, v64, OS_LOG_TYPE_DEBUG, "Signed credential was received for challenge.", (uint8_t *)&v66, 2u);
      }

      v10[2](v10, 0, v62);
    }
    else
    {
      if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v66) = 0;
        _os_log_impl(&dword_2397A4000, v64, OS_LOG_TYPE_ERROR, "Signed credential was not received for challenge.", (uint8_t *)&v66, 2u);
      }

      v10[2](v10, 2, 0);
    }
  }
  else
  {
LABEL_11:
    uint64_t v65 = APLogForCategory();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v66) = 0;
      _os_log_impl(&dword_2397A4000, v65, OS_LOG_TYPE_DEBUG, "Challenge does not require proxy authentication.", (uint8_t *)&v66, 2u);
    }

    v10[2](v10, 1, 0);
  }
}

- (id)_currentRunLoopModes
{
  uint64_t v4 = *MEMORY[0x263EFF478];
  uint64_t v5 = objc_msgSend_arrayWithObject_(MEMORY[0x263EFF980], a2, *MEMORY[0x263EFF478], v2, v3);
  uint64_t v10 = objc_msgSend_currentRunLoop(MEMORY[0x263EFF9F0], v6, v7, v8, v9);
  uint64_t v15 = objc_msgSend_currentMode(v10, v11, v12, v13, v14);

  if (v15 && (objc_msgSend_isEqualToString_(v15, v16, v4, v18, v19) & 1) == 0) {
    objc_msgSend_addObject_(v5, v16, (uint64_t)v15, v18, v19);
  }
  uint64_t v20 = objc_msgSend_copy(v5, v16, v17, v18, v19);

  return v20;
}

- (NSThread)clientThread
{
  return (NSThread *)objc_getProperty(self, a2, 32, 1);
}

- (void)setClientThread:(id)a3
{
}

- (NSArray)modes
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setModes:(id)a3
{
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (NSURLSessionDataTask)task
{
  return (NSURLSessionDataTask *)objc_getProperty(self, a2, 56, 1);
}

- (void)setTask:(id)a3
{
}

- (APNSURLSessionDemultiplexer)sessionDemux
{
  return (APNSURLSessionDemultiplexer *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSessionDemux:(id)a3
{
}

- (int64_t)requestType
{
  return self->_requestType;
}

- (void)setRequestType:(int64_t)a3
{
  self->_requestType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionDemux, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_modes, 0);

  objc_storeStrong((id *)&self->_clientThread, 0);
}

@end