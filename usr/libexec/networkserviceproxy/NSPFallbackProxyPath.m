@interface NSPFallbackProxyPath
- (BOOL)proxyPathIsValid:(id)a3 proxyPathList:(id)a4;
- (void)resetMultiHopProxyAgent;
- (void)resetSingleHopProxyAgent;
- (void)setupMultiHopProxyRegistrations;
- (void)setupSingleHopProxyRegistrations;
@end

@implementation NSPFallbackProxyPath

- (void)setupSingleHopProxyRegistrations
{
  v3 = [(NSPProxyPath *)self singleHopRegistration];

  if (!v3)
  {
    v4 = [NSPPrivacyProxySingleHopFallbackNetworkRegistration alloc];
    if ([(NSPProxyPath *)self forceFallback]) {
      +[NSPPrivacyProxyAgentManager singleHopProxyAgentUUID];
    }
    else {
    v5 = +[NSPPrivacyProxyAgentManager singleHopFallbackProxyAgentUUID];
    }
    v6 = sub_10004C7C8((id *)&v4->super.super.isa, v5, self);
    [(NSPProxyPath *)self setSingleHopRegistration:v6];

    v7 = [(NSPProxyPath *)self singleHopRegistration];

    if (!v7)
    {
      v8 = nplog_obj();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        int v9 = 136315138;
        v10 = "-[NSPFallbackProxyPath setupSingleHopProxyRegistrations]";
        _os_log_fault_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "%s called with null self.singleHopRegistration", (uint8_t *)&v9, 0xCu);
      }
    }
  }
}

- (void)setupMultiHopProxyRegistrations
{
  v3 = [(NSPProxyPath *)self multiHopRegistration];

  if (!v3)
  {
    v4 = [NSPPrivacyProxyMultiHopFallbackNetworkRegistration alloc];
    if ([(NSPProxyPath *)self forceFallback]) {
      +[NSPPrivacyProxyAgentManager multiHopProxyAgentUUID];
    }
    else {
    v5 = +[NSPPrivacyProxyAgentManager multiHopFallbackProxyAgentUUID];
    }
    v6 = sub_10004BD4C((id *)&v4->super.super.isa, v5, self);
    [(NSPProxyPath *)self setMultiHopRegistration:v6];

    v7 = [(NSPProxyPath *)self multiHopRegistration];

    if (!v7)
    {
      v8 = nplog_obj();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        int v9 = 136315138;
        v10 = "-[NSPFallbackProxyPath setupMultiHopProxyRegistrations]";
        _os_log_fault_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "%s called with null self.multiHopRegistration", (uint8_t *)&v9, 0xCu);
      }
    }
  }
}

- (void)resetSingleHopProxyAgent
{
  v3 = [(NSPProxyPath *)self ingressProxy];

  if (v3)
  {
    [(NSPFallbackProxyPath *)self setupSingleHopProxyRegistrations];
    uint64_t v4 = [(NSPProxyPath *)self singleHopRegistration];
    uint64_t v5 = [(NSPProxyPath *)self ingressProxy];
    v58 = (void *)v5;
    if (v5) {
      v6 = *(void **)(v5 + 24);
    }
    else {
      v6 = 0;
    }
    id v7 = v6;
    v8 = [v7 tcpProxyFqdn];
    uint64_t v9 = [(NSPProxyPath *)self ingressProxy];
    v56 = (void *)v9;
    if (v9) {
      v10 = *(void **)(v9 + 24);
    }
    else {
      v10 = 0;
    }
    id v11 = v10;
    v54 = [v11 proxyKeyInfos];
    uint64_t v12 = [(NSPProxyPath *)self ingressProxy];
    v53 = (void *)v12;
    if (v12) {
      v13 = *(void **)(v12 + 24);
    }
    else {
      v13 = 0;
    }
    id v14 = v13;
    v59 = [v14 proxyVersion];
    uint64_t v15 = [(NSPProxyPath *)self ingressProxy];
    v51 = (void *)v15;
    if (v15) {
      v16 = *(void **)(v15 + 24);
    }
    else {
      v16 = 0;
    }
    id v17 = v16;
    unsigned int v18 = [v17 supportsResumption];
    uint64_t v19 = [(NSPProxyPath *)self ingressProxy];
    v57 = v7;
    v49 = (void *)v19;
    int v47 = v18;
    if (v19) {
      v20 = *(void **)(v19 + 24);
    }
    else {
      v20 = 0;
    }
    id v21 = v20;
    unsigned int v22 = [v21 algorithm];
    uint64_t v23 = [(NSPProxyPath *)self ingressProxy];
    BOOL v24 = sub_10000EDFC(v23);
    v55 = v11;
    if (v24)
    {
      uint64_t v25 = [(NSPProxyPath *)self ingressProxy];
      v44 = (void *)v25;
      if (v25) {
        v26 = *(void **)(v25 + 48);
      }
      else {
        v26 = 0;
      }
      id v45 = v26;
    }
    else
    {
      id v45 = 0;
    }
    uint64_t v27 = [(NSPProxyPath *)self ingressProxy];
    v28 = (void *)v27;
    v52 = v14;
    v50 = v17;
    v48 = (void *)v23;
    BOOL v46 = v24;
    v29 = (void *)v4;
    if (v27) {
      v30 = *(void **)(v27 + 24);
    }
    else {
      v30 = 0;
    }
    id v31 = v30;
    v32 = [v31 tokenChallenge];
    unsigned __int8 v33 = [(NSPProxyPath *)self allowFailOpen];
    v34 = [(NSPProxyPath *)self configEpoch];
    LOBYTE(v43) = v33;
    sub_10004C7E4((uint64_t)v29, v8, v54, v59, v47, v22 == 2, v45, v32 != 0, v43, v34);

    if (v46)
    {
    }
    unsigned int v35 = [(NSPProxyPath *)self singleHopRegistered];
    uint64_t v36 = [(NSPProxyPath *)self singleHopRegistration];
    if (v36)
    {
      v37 = (void *)v36;
      unsigned int v38 = [*(id *)(v36 + 24) isRegistered];

      if (v35 == v38) {
        return;
      }
    }
    else if ((v35 & 1) == 0)
    {
      return;
    }
    uint64_t v39 = [(NSPProxyPath *)self singleHopRegistration];
    v40 = (void *)v39;
    if (v39) {
      id v41 = [*(id *)(v39 + 24) isRegistered];
    }
    else {
      id v41 = 0;
    }
    [(NSPProxyPath *)self setSingleHopRegistered:v41];

    v60 = [(NSPProxyPath *)self delegate];
    [v60 singleHopAgentRegistered:self];
  }
  else
  {
    v42 = nplog_obj();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v62 = "-[NSPFallbackProxyPath resetSingleHopProxyAgent]";
      _os_log_fault_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_FAULT, "%s called with null self.ingressProxy", buf, 0xCu);
    }
  }
}

- (void)resetMultiHopProxyAgent
{
  v3 = [(NSPProxyPath *)self ingressProxy];

  if (!v3)
  {
    v69 = nplog_obj();
    if (!os_log_type_enabled(v69, OS_LOG_TYPE_FAULT))
    {
LABEL_57:

      return;
    }
    *(_DWORD *)buf = 136315138;
    v128 = "-[NSPFallbackProxyPath resetMultiHopProxyAgent]";
    v70 = "%s called with null self.ingressProxy";
LABEL_60:
    _os_log_fault_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_FAULT, v70, buf, 0xCu);
    goto LABEL_57;
  }
  uint64_t v4 = [(NSPProxyPath *)self egressProxy];

  if (!v4)
  {
    v69 = nplog_obj();
    if (!os_log_type_enabled(v69, OS_LOG_TYPE_FAULT)) {
      goto LABEL_57;
    }
    *(_DWORD *)buf = 136315138;
    v128 = "-[NSPFallbackProxyPath resetMultiHopProxyAgent]";
    v70 = "%s called with null self.egressProxy";
    goto LABEL_60;
  }
  [(NSPFallbackProxyPath *)self setupMultiHopProxyRegistrations];
  uint64_t v5 = [(NSPProxyPath *)self multiHopRegistration];
  uint64_t v6 = [(NSPProxyPath *)self ingressProxy];
  v118 = (void *)v6;
  if (v6) {
    id v7 = *(void **)(v6 + 24);
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;
  uint64_t v9 = [v8 tcpProxyFqdn];
  uint64_t v10 = [(NSPProxyPath *)self egressProxy];
  v124 = (void *)v9;
  v116 = (void *)v10;
  if (v10) {
    id v11 = *(void **)(v10 + 24);
  }
  else {
    id v11 = 0;
  }
  id v12 = v11;
  uint64_t v13 = [v12 tcpProxyFqdn];
  uint64_t v14 = [(NSPProxyPath *)self ingressProxy];
  v114 = (void *)v13;
  v115 = v12;
  v113 = (void *)v14;
  if (v14) {
    uint64_t v15 = *(void **)(v14 + 24);
  }
  else {
    uint64_t v15 = 0;
  }
  id v16 = v15;
  uint64_t v17 = [v16 proxyKeyInfos];
  uint64_t v18 = [(NSPProxyPath *)self egressProxy];
  v110 = (void *)v18;
  if (v18) {
    uint64_t v19 = *(void **)(v18 + 24);
  }
  else {
    uint64_t v19 = 0;
  }
  id v20 = v19;
  uint64_t v21 = [v20 proxyKeyInfos];
  uint64_t v22 = [(NSPProxyPath *)self ingressProxy];
  v107 = (void *)v22;
  if (v22) {
    uint64_t v23 = *(void **)(v22 + 24);
  }
  else {
    uint64_t v23 = 0;
  }
  id v106 = v23;
  v123 = [v106 proxyVersion];
  uint64_t v24 = [(NSPProxyPath *)self egressProxy];
  v105 = (void *)v24;
  if (v24) {
    uint64_t v25 = *(void **)(v24 + 24);
  }
  else {
    uint64_t v25 = 0;
  }
  id v104 = v25;
  v122 = [v104 proxyVersion];
  uint64_t v26 = [(NSPProxyPath *)self ingressProxy];
  v103 = (void *)v26;
  if (v26) {
    uint64_t v27 = *(void **)(v26 + 24);
  }
  else {
    uint64_t v27 = 0;
  }
  id v102 = v27;
  v121 = [v102 allowedNextHops];
  uint64_t v28 = [(NSPProxyPath *)self egressProxy];
  v101 = (void *)v28;
  if (v28) {
    v29 = *(void **)(v28 + 24);
  }
  else {
    v29 = 0;
  }
  id v100 = v29;
  v120 = [v100 allowedNextHops];
  uint64_t v30 = [(NSPProxyPath *)self ingressProxy];
  v99 = (void *)v30;
  if (v30) {
    id v31 = *(void **)(v30 + 24);
  }
  else {
    id v31 = 0;
  }
  id v98 = v31;
  char v90 = [v98 supportsResumption];
  uint64_t v32 = [(NSPProxyPath *)self egressProxy];
  v97 = (void *)v32;
  if (v32) {
    unsigned __int8 v33 = *(void **)(v32 + 24);
  }
  else {
    unsigned __int8 v33 = 0;
  }
  id v96 = v33;
  char v88 = [v96 supportsResumption];
  uint64_t v34 = [(NSPProxyPath *)self ingressProxy];
  v95 = (void *)v34;
  unsigned int v35 = (void *)v5;
  if (v34) {
    uint64_t v36 = *(void **)(v34 + 24);
  }
  else {
    uint64_t v36 = 0;
  }
  id v94 = v36;
  unsigned int v37 = [v94 algorithm];
  uint64_t v38 = [(NSPProxyPath *)self egressProxy];
  v93 = (void *)v38;
  if (v38) {
    uint64_t v39 = *(void **)(v38 + 24);
  }
  else {
    uint64_t v39 = 0;
  }
  id v92 = v39;
  unsigned int v40 = [v92 algorithm];
  v91 = [(NSPProxyPath *)self ingressProxy];
  BOOL v89 = sub_10000EDFC((uint64_t)v91);
  if (v89)
  {
    uint64_t v41 = [(NSPProxyPath *)self ingressProxy];
    v73 = (void *)v41;
    if (v41) {
      v42 = *(void **)(v41 + 48);
    }
    else {
      v42 = 0;
    }
    id v119 = v42;
  }
  else
  {
    id v119 = 0;
  }
  v87 = [(NSPProxyPath *)self egressProxy];
  BOOL v86 = sub_10000EDFC((uint64_t)v87);
  if (v86)
  {
    uint64_t v43 = [(NSPProxyPath *)self egressProxy];
    v72 = (void *)v43;
    if (v43) {
      v44 = *(void **)(v43 + 48);
    }
    else {
      v44 = 0;
    }
    id v85 = v44;
  }
  else
  {
    id v85 = 0;
  }
  uint64_t v45 = [(NSPProxyPath *)self ingressProxy];
  v84 = (void *)v45;
  if (v45) {
    BOOL v46 = *(void **)(v45 + 24);
  }
  else {
    BOOL v46 = 0;
  }
  id v83 = v46;
  uint64_t v47 = [v83 tokenChallenge];
  uint64_t v48 = [(NSPProxyPath *)self egressProxy];
  v117 = v8;
  v112 = v16;
  v82 = (void *)v48;
  if (v48) {
    v49 = *(void **)(v48 + 24);
  }
  else {
    v49 = 0;
  }
  id v81 = v49;
  uint64_t v50 = [v81 tokenChallenge];
  char v77 = [(NSPProxyPath *)self allowFailOpen];
  char v75 = [(NSPProxyPath *)self geohashSharingEnabled];
  v80 = [(NSPProxyPath *)self delegate];
  v79 = [v80 geohashOverride];
  v78 = [(NSPProxyPath *)self delegate];
  char v74 = [v78 dnsFilteringHintEnabled];
  uint64_t v51 = [(NSPProxyPath *)self ingressProxy];
  v52 = (void *)v51;
  v125 = v35;
  v111 = (void *)v17;
  v108 = (void *)v21;
  v109 = v20;
  if (v51) {
    v53 = *(void **)(v51 + 24);
  }
  else {
    v53 = 0;
  }
  BOOL v54 = v50 != 0;
  v76 = (void *)v50;
  v55 = (void *)v47;
  BOOL v56 = v47 != 0;
  char v57 = v40 == 2;
  char v58 = v37 == 2;
  id v59 = v53;
  char v60 = [v59 fallbackSupportsUDPProxying];
  v61 = [(NSPProxyPath *)self configEpoch];
  HIBYTE(v71) = v54;
  LOBYTE(v71) = v56;
  sub_10004BD68((uint64_t)v125, v124, v114, v111, v108, v123, v122, v121, v120, v90, v88, v58, v57, v119, v85, v71, v77, v75, v79,
    v74,
    v60,
    v61);

  if (v86)
  {
  }
  if (v89)
  {
  }
  unsigned int v62 = [(NSPProxyPath *)self multiHopRegistered];
  uint64_t v63 = [(NSPProxyPath *)self multiHopRegistration];
  if (v63)
  {
    v64 = (void *)v63;
    unsigned int v65 = [*(id *)(v63 + 24) isRegistered];

    if (v62 == v65) {
      return;
    }
  }
  else if ((v62 & 1) == 0)
  {
    return;
  }
  uint64_t v66 = [(NSPProxyPath *)self multiHopRegistration];
  v67 = (void *)v66;
  if (v66) {
    id v68 = [*(id *)(v66 + 24) isRegistered];
  }
  else {
    id v68 = 0;
  }
  [(NSPProxyPath *)self setMultiHopRegistered:v68];

  v126 = [(NSPProxyPath *)self delegate];
  [v126 multiHopAgentRegistered:self];
}

- (BOOL)proxyPathIsValid:(id)a3 proxyPathList:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(NSPProxyPath *)self ingressProxy];
  uint64_t v9 = (void *)v8;
  if (v8) {
    uint64_t v10 = *(void **)(v8 + 24);
  }
  else {
    uint64_t v10 = 0;
  }
  id v11 = v10;
  uint64_t v12 = [(NSPProxyPath *)self egressProxy];
  uint64_t v13 = (void *)v12;
  if (v12) {
    uint64_t v14 = *(void **)(v12 + 24);
  }
  else {
    uint64_t v14 = 0;
  }
  id v15 = v14;
  BOOL v16 = +[NSPPrivacyProxyAgentManager proxiesMatch:v7 proxyPathList:v6 ingressProxy:v11 egressProxy:v15 pathWeight:[(NSPProxyPath *)self proxyPathWeight] supportsFallback:1];

  return v16;
}

@end