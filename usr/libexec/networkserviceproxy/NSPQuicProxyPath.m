@interface NSPQuicProxyPath
- (BOOL)proxyPathIsValid:(id)a3 proxyPathList:(id)a4;
- (NSPQUICProxyPathDelegate)quicProxyPathDelegate;
- (NSPQuicProxyPath)initWithDelegate:(id)a3 ingressProxy:(id)a4 egressProxy:(id)a5 proxyPathWeight:(unint64_t)a6 allowFallback:(BOOL)a7 fallbackToQUIC:(BOOL)a8 forceFallback:(BOOL)a9 allowFailOpen:(BOOL)a10 geohashSharingEnabled:(BOOL)a11 configEpoch:(id)a12 networkCharacteristics:(id)a13;
- (void)enableFallback:(BOOL)a3;
- (void)resetMultiHopProxyAgent;
- (void)resetSingleHopProxyAgent;
- (void)setQuicProxyPathDelegate:(id)a3;
- (void)setupMultiHopProxyRegistrations;
- (void)setupNetworkSpecificMultiHopProxyRegistrations:(id)a3;
- (void)setupSingleHopProxyRegistrations;
- (void)tearDownMultiHopRegistration;
@end

@implementation NSPQuicProxyPath

- (NSPQuicProxyPath)initWithDelegate:(id)a3 ingressProxy:(id)a4 egressProxy:(id)a5 proxyPathWeight:(unint64_t)a6 allowFallback:(BOOL)a7 fallbackToQUIC:(BOOL)a8 forceFallback:(BOOL)a9 allowFailOpen:(BOOL)a10 geohashSharingEnabled:(BOOL)a11 configEpoch:(id)a12 networkCharacteristics:(id)a13
{
  BOOL v13 = a8;
  BOOL v14 = a7;
  id v19 = a3;
  id v20 = a4;
  id v21 = a5;
  id v22 = a12;
  id v23 = a13;
  v24 = v23;
  if (!v20)
  {
    v29 = nplog_obj();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
    {
LABEL_10:

      v27 = 0;
      goto LABEL_6;
    }
    *(_DWORD *)buf = 136315138;
    v34 = "-[NSPQuicProxyPath initWithDelegate:ingressProxy:egressProxy:proxyPathWeight:allowFallback:fallbackToQUIC:forc"
          "eFallback:allowFailOpen:geohashSharingEnabled:configEpoch:networkCharacteristics:]";
    v30 = "%s called with null ingressProxy";
LABEL_12:
    _os_log_fault_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_FAULT, v30, buf, 0xCu);
    goto LABEL_10;
  }
  if (!v21)
  {
    v29 = nplog_obj();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
      goto LABEL_10;
    }
    *(_DWORD *)buf = 136315138;
    v34 = "-[NSPQuicProxyPath initWithDelegate:ingressProxy:egressProxy:proxyPathWeight:allowFallback:fallbackToQUIC:forc"
          "eFallback:allowFailOpen:geohashSharingEnabled:configEpoch:networkCharacteristics:]";
    v30 = "%s called with null egressProxy";
    goto LABEL_12;
  }
  v32.receiver = self;
  v32.super_class = (Class)NSPQuicProxyPath;
  *(_WORD *)((char *)&v31 + 1) = __PAIR16__(a11, a10);
  LOBYTE(v31) = a9;
  v25 = -[NSPProxyPath initWithDelegate:ingressProxy:egressProxy:proxyPathWeight:allowFallback:fallbackToQUIC:forceFallback:allowFailOpen:geohashSharingEnabled:configEpoch:networkCharacteristics:](&v32, "initWithDelegate:ingressProxy:egressProxy:proxyPathWeight:allowFallback:fallbackToQUIC:forceFallback:allowFailOpen:geohashSharingEnabled:configEpoch:networkCharacteristics:", v19, v20, v21, a6, v14, v13, v31, v22, v23);
  v26 = v25;
  if (v25) {
    objc_storeWeak((id *)&v25->_quicProxyPathDelegate, v19);
  }
  self = v26;
  v27 = self;
LABEL_6:

  return v27;
}

- (void)setupSingleHopProxyRegistrations
{
  v3 = [(NSPProxyPath *)self singleHopRegistration];

  if (!v3)
  {
    v4 = [NSPPrivacyProxySingleHopNetworkRegistration alloc];
    v5 = +[NSPPrivacyProxyAgentManager singleHopProxyAgentUUID];
    v6 = sub_10004AFA4((id *)&v4->super.super.isa, v5, self);
    [(NSPProxyPath *)self setSingleHopRegistration:v6];

    v7 = [(NSPProxyPath *)self singleHopRegistration];

    if (!v7)
    {
      v8 = nplog_obj();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        int v9 = 136315138;
        v10 = "-[NSPQuicProxyPath setupSingleHopProxyRegistrations]";
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
    if ([(NSPProxyPath *)self fallbackToQUIC])
    {
      v4 = [(NSPProxyPath *)self nonDefaultAgentUUID];

      if (!v4)
      {
        v5 = +[NSUUID UUID];
        [(NSPProxyPath *)self setNonDefaultAgentUUID:v5];
      }
      v6 = [(NSPProxyPath *)self nonDefaultAgentUUID];
      v7 = [NSPPrivacyProxyMultiHopNetworkRegistration alloc];
      v8 = [(NSPProxyPath *)self egressProxy];
      int v9 = v8;
      if (v8) {
        v8 = (id *)v8[3];
      }
      v10 = [v8 vendor];
      v11 = sub_100048BDC((id *)&v7->super.super.isa, v6, 0, v10, self);
      [(NSPProxyPath *)self setMultiHopRegistration:v11];
    }
    else
    {
      v12 = [NSPPrivacyProxyMultiHopNetworkRegistration alloc];
      v6 = +[NSPPrivacyProxyAgentManager multiHopProxyAgentUUID];
      int v9 = sub_10004A234((id *)&v12->super.super.isa, v6, self);
      [(NSPProxyPath *)self setMultiHopRegistration:v9];
    }

    BOOL v13 = [(NSPProxyPath *)self multiHopRegistration];

    if (!v13)
    {
      BOOL v14 = nplog_obj();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        int v15 = 136315138;
        v16 = "-[NSPQuicProxyPath setupMultiHopProxyRegistrations]";
        _os_log_fault_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_FAULT, "%s called with null self.multiHopRegistration", (uint8_t *)&v15, 0xCu);
      }
    }
  }
}

- (void)setupNetworkSpecificMultiHopProxyRegistrations:(id)a3
{
  id v4 = a3;
  v5 = [(NSPProxyPath *)self multiHopRegistration];

  if (!v5)
  {
    if ([(NSPProxyPath *)self fallbackToQUIC])
    {
      v6 = [(NSPProxyPath *)self nonDefaultAgentUUID];

      if (!v6)
      {
        v7 = +[NSUUID UUID];
        [(NSPProxyPath *)self setNonDefaultAgentUUID:v7];
      }
      v8 = [(NSPProxyPath *)self nonDefaultAgentUUID];
      int v9 = [NSPPrivacyProxyMultiHopNetworkRegistration alloc];
      v10 = [(NSPProxyPath *)self ingressProxy];
      v11 = v10;
      if (v10) {
        v10 = (id *)v10[3];
      }
      v12 = [v10 vendor];
      BOOL v13 = sub_100048BDC((id *)&v9->super.super.isa, v8, v4, v12, self);
      [(NSPProxyPath *)self setMultiHopRegistration:v13];
    }
    else
    {
      BOOL v14 = [NSPPrivacyProxyMultiHopNetworkRegistration alloc];
      v8 = +[NSPPrivacyProxyAgentManager multiHopProxyAgentUUID];
      v11 = sub_10004A234((id *)&v14->super.super.isa, v8, self);
      [(NSPProxyPath *)self setMultiHopRegistration:v11];
    }

    int v15 = [(NSPProxyPath *)self multiHopRegistration];

    if (!v15)
    {
      v75 = nplog_obj();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v135 = "-[NSPQuicProxyPath setupNetworkSpecificMultiHopProxyRegistrations:]";
        v76 = "%s called with null self.multiHopRegistration";
        goto LABEL_72;
      }
      goto LABEL_73;
    }
  }
  v16 = [(NSPProxyPath *)self ingressProxy];

  if (!v16)
  {
    v75 = nplog_obj();
    if (os_log_type_enabled(v75, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v135 = "-[NSPQuicProxyPath setupNetworkSpecificMultiHopProxyRegistrations:]";
      v76 = "%s called with null self.ingressProxy";
LABEL_72:
      _os_log_fault_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_FAULT, v76, buf, 0xCu);
    }
LABEL_73:

    goto LABEL_65;
  }
  v17 = [(NSPProxyPath *)self egressProxy];

  if (!v17)
  {
    v75 = nplog_obj();
    if (os_log_type_enabled(v75, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v135 = "-[NSPQuicProxyPath setupNetworkSpecificMultiHopProxyRegistrations:]";
      v76 = "%s called with null self.egressProxy";
      goto LABEL_72;
    }
    goto LABEL_73;
  }
  if ([(NSPProxyPath *)self allowFallback])
  {
    v133 = +[NSPPrivacyProxyAgentManager multiHopFallbackProxyAgentUUID];
    v18 = [(NSPQuicProxyPath *)self quicProxyPathDelegate];
    v132 = [v18 multiHopFallbackProxyConfigHash:self];
  }
  else
  {
    v132 = 0;
    v133 = 0;
  }
  uint64_t v19 = [(NSPProxyPath *)self multiHopRegistration];
  uint64_t v20 = [(NSPProxyPath *)self ingressProxy];
  v124 = (void *)v20;
  if (v20) {
    id v21 = *(void **)(v20 + 24);
  }
  else {
    id v21 = 0;
  }
  id v123 = v21;
  v122 = [v123 proxyURL];
  uint64_t v22 = [(NSPProxyPath *)self egressProxy];
  v121 = (void *)v22;
  if (v22) {
    id v23 = *(void **)(v22 + 24);
  }
  else {
    id v23 = 0;
  }
  id v120 = v23;
  uint64_t v24 = [v120 proxyURL];
  uint64_t v25 = [(NSPProxyPath *)self ingressProxy];
  v118 = (void *)v25;
  if (v25) {
    v26 = *(void **)(v25 + 24);
  }
  else {
    v26 = 0;
  }
  id v117 = v26;
  uint64_t v27 = [v117 proxyKeyInfos];
  uint64_t v28 = [(NSPProxyPath *)self egressProxy];
  v115 = (void *)v28;
  if (v28) {
    v29 = *(void **)(v28 + 24);
  }
  else {
    v29 = 0;
  }
  id v114 = v29;
  v131 = [v114 proxyKeyInfos];
  uint64_t v30 = [(NSPProxyPath *)self ingressProxy];
  v113 = (void *)v30;
  if (v30) {
    int v31 = *(void **)(v30 + 24);
  }
  else {
    int v31 = 0;
  }
  id v112 = v31;
  v130 = [v112 proxyVersion];
  uint64_t v32 = [(NSPProxyPath *)self egressProxy];
  v111 = (void *)v32;
  if (v32) {
    v33 = *(void **)(v32 + 24);
  }
  else {
    v33 = 0;
  }
  id v110 = v33;
  v129 = [v110 proxyVersion];
  uint64_t v34 = [(NSPProxyPath *)self ingressProxy];
  v109 = (void *)v34;
  if (v34) {
    v35 = *(void **)(v34 + 24);
  }
  else {
    v35 = 0;
  }
  id v108 = v35;
  v128 = [v108 allowedNextHops];
  uint64_t v36 = [(NSPProxyPath *)self egressProxy];
  v107 = (void *)v36;
  if (v36) {
    v37 = *(void **)(v36 + 24);
  }
  else {
    v37 = 0;
  }
  id v106 = v37;
  v127 = [v106 allowedNextHops];
  uint64_t v38 = [(NSPProxyPath *)self ingressProxy];
  v105 = (void *)v38;
  if (v38) {
    v39 = *(void **)(v38 + 24);
  }
  else {
    v39 = 0;
  }
  id v104 = v39;
  char v96 = [v104 supportsResumption];
  uint64_t v40 = [(NSPProxyPath *)self egressProxy];
  v103 = (void *)v40;
  if (v40) {
    v41 = *(void **)(v40 + 24);
  }
  else {
    v41 = 0;
  }
  id v102 = v41;
  char v94 = [v102 supportsResumption];
  uint64_t v42 = [(NSPProxyPath *)self ingressProxy];
  v101 = (void *)v42;
  if (v42) {
    v43 = *(void **)(v42 + 24);
  }
  else {
    v43 = 0;
  }
  id v100 = v43;
  unsigned int v44 = [v100 algorithm];
  uint64_t v45 = [(NSPProxyPath *)self egressProxy];
  v99 = (void *)v45;
  if (v45) {
    v46 = *(void **)(v45 + 24);
  }
  else {
    v46 = 0;
  }
  id v98 = v46;
  unsigned int v47 = [v98 algorithm];
  v97 = [(NSPProxyPath *)self ingressProxy];
  BOOL v95 = sub_10000EDFC((uint64_t)v97);
  if (v95)
  {
    uint64_t v48 = [(NSPProxyPath *)self ingressProxy];
    v79 = (void *)v48;
    if (v48) {
      v49 = *(void **)(v48 + 48);
    }
    else {
      v49 = 0;
    }
    id v126 = v49;
  }
  else
  {
    id v126 = 0;
  }
  v93 = [(NSPProxyPath *)self egressProxy];
  BOOL v92 = sub_10000EDFC((uint64_t)v93);
  if (v92)
  {
    uint64_t v50 = [(NSPProxyPath *)self egressProxy];
    v78 = (void *)v50;
    if (v50) {
      v51 = *(void **)(v50 + 48);
    }
    else {
      v51 = 0;
    }
    id v91 = v51;
  }
  else
  {
    id v91 = 0;
  }
  uint64_t v52 = [(NSPProxyPath *)self ingressProxy];
  v90 = (void *)v52;
  if (v52) {
    v53 = *(void **)(v52 + 24);
  }
  else {
    v53 = 0;
  }
  id v89 = v53;
  uint64_t v54 = [v89 tokenChallenge];
  uint64_t v55 = [(NSPProxyPath *)self egressProxy];
  v88 = (void *)v55;
  if (v55) {
    v56 = *(void **)(v55 + 24);
  }
  else {
    v56 = 0;
  }
  id v87 = v56;
  v57 = [v87 tokenChallenge];
  char v82 = [(NSPProxyPath *)self allowFailOpen];
  char v81 = [(NSPProxyPath *)self geohashSharingEnabled];
  v86 = [(NSPProxyPath *)self delegate];
  v85 = [v86 geohashOverride];
  v84 = [(NSPProxyPath *)self delegate];
  char v80 = [v84 dnsFilteringHintEnabled];
  uint64_t v58 = [(NSPProxyPath *)self ingressProxy];
  v59 = (void *)v58;
  v125 = (void *)v19;
  v119 = (void *)v24;
  v116 = (void *)v27;
  if (v58) {
    v60 = *(void **)(v58 + 24);
  }
  else {
    v60 = 0;
  }
  v83 = (void *)v54;
  BOOL v61 = v54 != 0;
  char v62 = v47 == 2;
  char v63 = v44 == 2;
  id v64 = v60;
  char v65 = [v64 fallbackSupportsUDPProxying];
  v66 = [(NSPProxyPath *)self configEpoch];
  BYTE1(v77) = v57 != 0;
  LOBYTE(v77) = v61;
  sub_10004A250((uint64_t)v125, v122, v119, v116, v131, v130, v129, v128, v127, v96, v94, v63, v62, v126, v91, v77, v133, v82, v81,
    v85,
    v80,
    0,
    0,
    v132,
    v65,
    v66);

  if (v92)
  {
  }
  if (v95)
  {
  }
  unsigned int v67 = [(NSPProxyPath *)self multiHopRegistered];
  uint64_t v68 = [(NSPProxyPath *)self multiHopRegistration];
  if (v68)
  {
    v69 = (void *)v68;
    unsigned int v70 = [*(id *)(v68 + 24) isRegistered];

    if (v67 != v70)
    {
LABEL_61:
      uint64_t v71 = [(NSPProxyPath *)self multiHopRegistration];
      v72 = (void *)v71;
      if (v71) {
        id v73 = [*(id *)(v71 + 24) isRegistered];
      }
      else {
        id v73 = 0;
      }
      [(NSPProxyPath *)self setMultiHopRegistered:v73];

      v74 = [(NSPProxyPath *)self delegate];
      [v74 multiHopAgentRegistered:self];
    }
  }
  else if (v67)
  {
    goto LABEL_61;
  }

LABEL_65:
}

- (void)tearDownMultiHopRegistration
{
  id v2 = [(NSPProxyPath *)self multiHopRegistration];
  sub_100049E70((uint64_t)v2);
}

- (void)resetSingleHopProxyAgent
{
  v3 = [(NSPProxyPath *)self ingressProxy];

  if (v3)
  {
    if ([(NSPProxyPath *)self fallbackToQUIC]) {
      return;
    }
    [(NSPQuicProxyPath *)self setupSingleHopProxyRegistrations];
    if ([(NSPProxyPath *)self allowFallback])
    {
      unsigned int v67 = +[NSPPrivacyProxyAgentManager singleHopFallbackProxyAgentUUID];
      id v4 = [(NSPQuicProxyPath *)self quicProxyPathDelegate];
      v69 = [v4 singleHopFallbackProxyConfigHash:self];
    }
    else
    {
      v69 = 0;
      unsigned int v67 = 0;
    }
    v5 = [(NSPProxyPath *)self singleHopRegistration];
    uint64_t v6 = sub_10004A110((uint64_t)v5);

    uint64_t v7 = [(NSPProxyPath *)self singleHopRegistration];
    uint64_t v8 = [(NSPProxyPath *)self ingressProxy];
    v66 = (void *)v8;
    if (v8) {
      int v9 = *(void **)(v8 + 24);
    }
    else {
      int v9 = 0;
    }
    id v10 = v9;
    v11 = [v10 proxyURL];
    uint64_t v12 = [(NSPProxyPath *)self ingressProxy];
    id v64 = (void *)v12;
    if (v12) {
      BOOL v13 = *(void **)(v12 + 24);
    }
    else {
      BOOL v13 = 0;
    }
    id v14 = v13;
    char v63 = [v14 proxyKeyInfos];
    uint64_t v15 = [(NSPProxyPath *)self ingressProxy];
    char v62 = (void *)v15;
    if (v15) {
      v16 = *(void **)(v15 + 24);
    }
    else {
      v16 = 0;
    }
    id v17 = v16;
    uint64_t v68 = [v17 proxyVersion];
    uint64_t v18 = [(NSPProxyPath *)self ingressProxy];
    v53 = (void *)v6;
    v60 = (void *)v18;
    if (v18) {
      uint64_t v19 = *(void **)(v18 + 24);
    }
    else {
      uint64_t v19 = 0;
    }
    id v20 = v19;
    unsigned int v21 = [v20 supportsResumption];
    uint64_t v22 = [(NSPProxyPath *)self ingressProxy];
    char v65 = v10;
    uint64_t v58 = (void *)v22;
    int v55 = v21;
    if (v22) {
      id v23 = *(void **)(v22 + 24);
    }
    else {
      id v23 = 0;
    }
    id v24 = v23;
    unsigned int v25 = [v24 algorithm];
    uint64_t v26 = [(NSPProxyPath *)self ingressProxy];
    BOOL v27 = sub_10000EDFC(v26);
    BOOL v61 = v17;
    if (v27)
    {
      uint64_t v28 = [(NSPProxyPath *)self ingressProxy];
      v51 = (void *)v28;
      if (v28) {
        v29 = *(void **)(v28 + 48);
      }
      else {
        v29 = 0;
      }
      id v52 = v29;
    }
    else
    {
      id v52 = 0;
    }
    uint64_t v30 = [(NSPProxyPath *)self ingressProxy];
    int v31 = (void *)v30;
    v59 = v20;
    v56 = (void *)v26;
    v57 = v24;
    BOOL v54 = v27;
    uint64_t v32 = (void *)v7;
    if (v30) {
      v33 = *(void **)(v30 + 24);
    }
    else {
      v33 = 0;
    }
    id v34 = v33;
    v35 = [v34 tokenChallenge];
    unsigned __int8 v36 = [(NSPProxyPath *)self allowFailOpen];
    v37 = [(NSPProxyPath *)self configEpoch];
    LOBYTE(v50) = v36;
    sub_10004AFC0((uint64_t)v32, v11, v63, v68, v55, v25 == 2, v52, v35 != 0, v67, v50, v69, v37);

    if (v54)
    {
    }
    uint64_t v38 = [(NSPProxyPath *)self singleHopRegistration];
    v39 = sub_10004A110((uint64_t)v38);

    unsigned int v40 = [(NSPProxyPath *)self singleHopRegistered];
    uint64_t v41 = [(NSPProxyPath *)self singleHopRegistration];
    uint64_t v42 = (void *)v41;
    if (v41)
    {
      v43 = v53;
      if (v40 != [*(id *)(v41 + 24) isRegistered])
      {
LABEL_27:

        goto LABEL_39;
      }
    }
    else
    {
      v43 = v53;
      if (v40) {
        goto LABEL_27;
      }
    }
    unsigned __int8 v45 = [v39 isEqualToData:v43];

    if (v45)
    {
LABEL_42:

      return;
    }
LABEL_39:
    uint64_t v46 = [(NSPProxyPath *)self singleHopRegistration];
    unsigned int v47 = (void *)v46;
    if (v46) {
      id v48 = [*(id *)(v46 + 24) isRegistered];
    }
    else {
      id v48 = 0;
    }
    [(NSPProxyPath *)self setSingleHopRegistered:v48];

    v49 = [(NSPProxyPath *)self delegate];
    [v49 singleHopAgentRegistered:self];

    goto LABEL_42;
  }
  unsigned int v44 = nplog_obj();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v71 = "-[NSPQuicProxyPath resetSingleHopProxyAgent]";
    _os_log_fault_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_FAULT, "%s called with null self.ingressProxy", buf, 0xCu);
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
LABEL_74:

      return;
    }
    *(_DWORD *)buf = 136315138;
    v132 = "-[NSPQuicProxyPath resetMultiHopProxyAgent]";
    unsigned int v70 = "%s called with null self.ingressProxy";
LABEL_76:
    _os_log_fault_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_FAULT, v70, buf, 0xCu);
    goto LABEL_74;
  }
  id v4 = [(NSPProxyPath *)self egressProxy];

  if (!v4)
  {
    v69 = nplog_obj();
    if (!os_log_type_enabled(v69, OS_LOG_TYPE_FAULT)) {
      goto LABEL_74;
    }
    *(_DWORD *)buf = 136315138;
    v132 = "-[NSPQuicProxyPath resetMultiHopProxyAgent]";
    unsigned int v70 = "%s called with null self.egressProxy";
    goto LABEL_76;
  }
  [(NSPQuicProxyPath *)self setupMultiHopProxyRegistrations];
  if ([(NSPProxyPath *)self allowFallback])
  {
    if ([(NSPProxyPath *)self fallbackToQUIC])
    {
      id v120 = +[NSPPrivacyProxyAgentManager multiHopProxyAgentUUID];
      v5 = [(NSPQuicProxyPath *)self quicProxyPathDelegate];
      [v5 multiHopQUICProxyConfigHash:self];
    }
    else
    {
      id v120 = +[NSPPrivacyProxyAgentManager multiHopFallbackProxyAgentUUID];
      v5 = [(NSPQuicProxyPath *)self quicProxyPathDelegate];
      [v5 multiHopFallbackProxyConfigHash:self];
    v121 = };
  }
  else
  {
    id v120 = 0;
    v121 = 0;
  }
  if ([(NSPProxyPath *)self fallbackToQUIC])
  {
    v130 = 0;
  }
  else
  {
    uint64_t v6 = [(NSPQuicProxyPath *)self quicProxyPathDelegate];
    v130 = [v6 alternatePreferredPathAgentUUIDs:self];
  }
  uint64_t v7 = [(NSPProxyPath *)self multiHopRegistration];
  uint64_t v8 = [(NSPProxyPath *)self ingressProxy];
  id v117 = (void *)v8;
  id v87 = (void *)v7;
  if (v8) {
    int v9 = *(void **)(v8 + 24);
  }
  else {
    int v9 = 0;
  }
  id v10 = v9;
  uint64_t v11 = [v10 proxyURL];
  uint64_t v12 = [(NSPProxyPath *)self egressProxy];
  v115 = (void *)v12;
  if (v12) {
    BOOL v13 = *(void **)(v12 + 24);
  }
  else {
    BOOL v13 = 0;
  }
  id v14 = v13;
  uint64_t v15 = [v14 proxyURL];
  uint64_t v16 = [(NSPProxyPath *)self ingressProxy];
  v113 = (void *)v16;
  id v114 = (void *)v15;
  if (v16) {
    id v17 = *(void **)(v16 + 24);
  }
  else {
    id v17 = 0;
  }
  id v18 = v17;
  uint64_t v19 = [v18 proxyKeyInfos];
  uint64_t v20 = [(NSPProxyPath *)self egressProxy];
  id v110 = (void *)v20;
  if (v20) {
    unsigned int v21 = *(void **)(v20 + 24);
  }
  else {
    unsigned int v21 = 0;
  }
  id v22 = v21;
  v129 = [v22 proxyKeyInfos];
  uint64_t v23 = [(NSPProxyPath *)self ingressProxy];
  id v108 = (void *)v23;
  if (v23) {
    id v24 = *(void **)(v23 + 24);
  }
  else {
    id v24 = 0;
  }
  id v25 = v24;
  v128 = [v25 proxyVersion];
  uint64_t v26 = [(NSPProxyPath *)self egressProxy];
  v107 = (void *)v26;
  if (v26) {
    BOOL v27 = *(void **)(v26 + 24);
  }
  else {
    BOOL v27 = 0;
  }
  id v106 = v27;
  v127 = [v106 proxyVersion];
  uint64_t v28 = [(NSPProxyPath *)self ingressProxy];
  v105 = (void *)v28;
  if (v28) {
    v29 = *(void **)(v28 + 24);
  }
  else {
    v29 = 0;
  }
  id v104 = v29;
  id v126 = [v104 allowedNextHops];
  uint64_t v30 = [(NSPProxyPath *)self egressProxy];
  v103 = (void *)v30;
  if (v30) {
    int v31 = *(void **)(v30 + 24);
  }
  else {
    int v31 = 0;
  }
  id v102 = v31;
  v125 = [v102 allowedNextHops];
  uint64_t v32 = [(NSPProxyPath *)self ingressProxy];
  v101 = (void *)v32;
  if (v32) {
    v33 = *(void **)(v32 + 24);
  }
  else {
    v33 = 0;
  }
  id v100 = v33;
  char v91 = [v100 supportsResumption];
  uint64_t v34 = [(NSPProxyPath *)self egressProxy];
  v99 = (void *)v34;
  if (v34) {
    v35 = *(void **)(v34 + 24);
  }
  else {
    v35 = 0;
  }
  id v98 = v35;
  char v90 = [v98 supportsResumption];
  uint64_t v36 = [(NSPProxyPath *)self ingressProxy];
  v97 = (void *)v36;
  v37 = (void *)v11;
  if (v36) {
    uint64_t v38 = *(void **)(v36 + 24);
  }
  else {
    uint64_t v38 = 0;
  }
  id v96 = v38;
  unsigned int v39 = [v96 algorithm];
  uint64_t v40 = [(NSPProxyPath *)self egressProxy];
  BOOL v95 = (void *)v40;
  if (v40) {
    uint64_t v41 = *(void **)(v40 + 24);
  }
  else {
    uint64_t v41 = 0;
  }
  id v94 = v41;
  unsigned int v42 = [v94 algorithm];
  v93 = [(NSPProxyPath *)self ingressProxy];
  BOOL v92 = sub_10000EDFC((uint64_t)v93);
  if (v92)
  {
    uint64_t v43 = [(NSPProxyPath *)self ingressProxy];
    v75 = (void *)v43;
    if (v43) {
      unsigned int v44 = *(void **)(v43 + 48);
    }
    else {
      unsigned int v44 = 0;
    }
    id v119 = v44;
  }
  else
  {
    id v119 = 0;
  }
  id v89 = [(NSPProxyPath *)self egressProxy];
  BOOL v88 = sub_10000EDFC((uint64_t)v89);
  if (v88)
  {
    uint64_t v45 = [(NSPProxyPath *)self egressProxy];
    v74 = (void *)v45;
    if (v45) {
      uint64_t v46 = *(void **)(v45 + 48);
    }
    else {
      uint64_t v46 = 0;
    }
    id v118 = v46;
  }
  else
  {
    id v118 = 0;
  }
  uint64_t v47 = [(NSPProxyPath *)self ingressProxy];
  v86 = (void *)v47;
  if (v47) {
    id v48 = *(void **)(v47 + 24);
  }
  else {
    id v48 = 0;
  }
  id v85 = v48;
  v124 = [v85 tokenChallenge];
  uint64_t v49 = [(NSPProxyPath *)self egressProxy];
  v84 = (void *)v49;
  if (v49) {
    uint64_t v50 = *(void **)(v49 + 24);
  }
  else {
    uint64_t v50 = 0;
  }
  id v83 = v50;
  id v123 = [v83 tokenChallenge];
  char v79 = [(NSPProxyPath *)self allowFailOpen];
  char v78 = [(NSPProxyPath *)self geohashSharingEnabled];
  char v82 = [(NSPProxyPath *)self delegate];
  v122 = [v82 geohashOverride];
  char v81 = [(NSPProxyPath *)self delegate];
  char v76 = [v81 dnsFilteringHintEnabled];
  unsigned int v80 = [(NSPProxyPath *)self fallbackToQUIC];
  id v112 = v18;
  if (v80)
  {
    uint64_t v51 = [(NSPProxyPath *)self egressProxy];
    id v73 = (void *)v51;
    if (v51) {
      id v52 = *(void **)(v51 + 24);
    }
    else {
      id v52 = 0;
    }
    id v72 = v52;
    uint64_t v77 = [v72 preferredPathPatterns];
  }
  else
  {
    uint64_t v77 = 0;
  }
  uint64_t v53 = [(NSPProxyPath *)self ingressProxy];
  BOOL v54 = (void *)v53;
  v116 = v10;
  v111 = (void *)v19;
  v109 = v22;
  if (v53) {
    int v55 = *(void **)(v53 + 24);
  }
  else {
    int v55 = 0;
  }
  char v56 = v42 == 2;
  char v57 = v39 == 2;
  id v58 = v55;
  char v59 = [v58 fallbackSupportsUDPProxying];
  v60 = [(NSPProxyPath *)self configEpoch];
  BYTE1(v71) = v123 != 0;
  LOBYTE(v71) = v124 != 0;
  sub_10004A250((uint64_t)v87, v37, v114, v111, v129, v128, v127, v126, v125, v91, v90, v57, v56, v119, v118, v71, v120, v79, v78,
    v122,
    v76,
    v77,
    v130,
    v121,
    v59,
    v60);

  if (v80)
  {
  }
  if (v88)
  {
  }
  if (v92)
  {
  }
  unsigned int v61 = [(NSPProxyPath *)self multiHopRegistered];
  uint64_t v62 = [(NSPProxyPath *)self multiHopRegistration];
  if (v62)
  {
    char v63 = (void *)v62;
    unsigned int v64 = [*(id *)(v62 + 24) isRegistered];

    if (v61 != v64)
    {
LABEL_65:
      uint64_t v65 = [(NSPProxyPath *)self multiHopRegistration];
      v66 = (void *)v65;
      if (v65) {
        id v67 = [*(id *)(v65 + 24) isRegistered];
      }
      else {
        id v67 = 0;
      }
      [(NSPProxyPath *)self setMultiHopRegistered:v67];

      uint64_t v68 = [(NSPProxyPath *)self delegate];
      [v68 multiHopAgentRegistered:self];
    }
  }
  else if (v61)
  {
    goto LABEL_65;
  }
}

- (void)enableFallback:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(NSPProxyPath *)self allowFallback] != a3)
  {
    [(NSPProxyPath *)self setAllowFallback:v3];
    [(NSPQuicProxyPath *)self resetSingleHopProxyAgent];
    [(NSPQuicProxyPath *)self resetMultiHopProxyAgent];
  }
}

- (BOOL)proxyPathIsValid:(id)a3 proxyPathList:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(NSPProxyPath *)self ingressProxy];
  int v9 = (void *)v8;
  if (v8) {
    id v10 = *(void **)(v8 + 24);
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;
  uint64_t v12 = [(NSPProxyPath *)self egressProxy];
  BOOL v13 = (void *)v12;
  if (v12) {
    id v14 = *(void **)(v12 + 24);
  }
  else {
    id v14 = 0;
  }
  id v15 = v14;
  BOOL v16 = +[NSPPrivacyProxyAgentManager proxiesMatch:v7 proxyPathList:v6 ingressProxy:v11 egressProxy:v15 pathWeight:[(NSPProxyPath *)self proxyPathWeight] supportsFallback:0];

  return v16;
}

- (NSPQUICProxyPathDelegate)quicProxyPathDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_quicProxyPathDelegate);

  return (NSPQUICProxyPathDelegate *)WeakRetained;
}

- (void)setQuicProxyPathDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end