@interface NSPCandidateProxyPath
+ (BOOL)supportsSecureCoding;
- (BOOL)matchEgress:(id)a3;
- (BOOL)matchIngress:(id)a3;
- (BOOL)proxyPathReady;
- (NSArray)preferredPathPatterns;
- (NSData)domainFilter;
- (NSPCandidateProxyPath)initWithCoder:(id)a3;
- (NSPCandidateProxyPath)initWithIngressProxy:(id)a3 egressProxy:(id)a4 proxyPathWeight:(unint64_t)a5 preferredPathConfigURI:(id)a6 preferredPathPatterns:(id)a7;
- (NSPProxyTokenInfo)egressProxy;
- (NSPProxyTokenInfo)ingressProxy;
- (NSString)preferredPathConfigURI;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)proxyPathWeight;
- (void)encodeWithCoder:(id)a3;
- (void)fetchDomainFilter:(id)a3;
- (void)setDomainFilter:(id)a3;
- (void)setEgressProxy:(id)a3;
- (void)setIngressProxy:(id)a3;
- (void)setPreferredPathConfigURI:(id)a3;
- (void)setPreferredPathPatterns:(id)a3;
- (void)setProxyPathWeight:(unint64_t)a3;
@end

@implementation NSPCandidateProxyPath

- (NSPCandidateProxyPath)initWithIngressProxy:(id)a3 egressProxy:(id)a4 proxyPathWeight:(unint64_t)a5 preferredPathConfigURI:(id)a6 preferredPathPatterns:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  if (!v13)
  {
    v22 = nplog_obj();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
LABEL_10:

      v20 = 0;
      goto LABEL_6;
    }
    *(_DWORD *)buf = 136315138;
    v26 = "-[NSPCandidateProxyPath initWithIngressProxy:egressProxy:proxyPathWeight:preferredPathConfigURI:preferredPathPatterns:]";
    v23 = "%s called with null ingressProxy";
LABEL_12:
    _os_log_fault_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_FAULT, v23, buf, 0xCu);
    goto LABEL_10;
  }
  if (!v14)
  {
    v22 = nplog_obj();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
      goto LABEL_10;
    }
    *(_DWORD *)buf = 136315138;
    v26 = "-[NSPCandidateProxyPath initWithIngressProxy:egressProxy:proxyPathWeight:preferredPathConfigURI:preferredPathPatterns:]";
    v23 = "%s called with null egressProxy";
    goto LABEL_12;
  }
  v24.receiver = self;
  v24.super_class = (Class)NSPCandidateProxyPath;
  v17 = [(NSPCandidateProxyPath *)&v24 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_ingressProxy, a3);
    objc_storeStrong((id *)&v18->_egressProxy, a4);
    v18->_proxyPathWeight = a5;
    objc_storeStrong((id *)&v18->_preferredPathConfigURI, a6);
    objc_storeStrong((id *)&v18->_preferredPathPatterns, a7);
    domainFilter = v18->_domainFilter;
    v18->_domainFilter = 0;
  }
  self = v18;
  v20 = self;
LABEL_6:

  return v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSPCandidateProxyPath)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)NSPCandidateProxyPath;
  v5 = [(NSPCandidateProxyPath *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"candidateProxyPathIngressProxy"];
    ingressProxy = v5->_ingressProxy;
    v5->_ingressProxy = (NSPProxyTokenInfo *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"candidateProxyPathEgressProxy"];
    egressProxy = v5->_egressProxy;
    v5->_egressProxy = (NSPProxyTokenInfo *)v8;

    v5->_proxyPathWeight = (unint64_t)[v4 decodeIntegerForKey:@"candidateProxyPathWeight"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"candidateProxyPreferredPathConfigURI"];
    preferredPathConfigURI = v5->_preferredPathConfigURI;
    v5->_preferredPathConfigURI = (NSString *)v10;

    uint64_t v12 = objc_opt_class();
    id v13 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"candidateProxyPreferredPathPatterns"];
    preferredPathPatterns = v5->_preferredPathPatterns;
    v5->_preferredPathPatterns = (NSArray *)v14;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(NSPCandidateProxyPath *)self ingressProxy];
  [v4 encodeObject:v5 forKey:@"candidateProxyPathIngressProxy"];

  uint64_t v6 = [(NSPCandidateProxyPath *)self egressProxy];
  [v4 encodeObject:v6 forKey:@"candidateProxyPathEgressProxy"];

  [v4 encodeInteger:-[NSPCandidateProxyPath proxyPathWeight](self, "proxyPathWeight") forKey:@"candidateProxyPathWeight"];
  v7 = [(NSPCandidateProxyPath *)self preferredPathConfigURI];
  [v4 encodeObject:v7 forKey:@"candidateProxyPreferredPathConfigURI"];

  id v8 = [(NSPCandidateProxyPath *)self preferredPathPatterns];
  [v4 encodeObject:v8 forKey:@"candidateProxyPreferredPathPatterns"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[NSPCandidateProxyPath allocWithZone:a3] init];
  v5 = [(NSPCandidateProxyPath *)self ingressProxy];
  [(NSPCandidateProxyPath *)v4 setIngressProxy:v5];

  uint64_t v6 = [(NSPCandidateProxyPath *)self egressProxy];
  [(NSPCandidateProxyPath *)v4 setEgressProxy:v6];

  [(NSPCandidateProxyPath *)v4 setProxyPathWeight:[(NSPCandidateProxyPath *)self proxyPathWeight]];
  v7 = [(NSPCandidateProxyPath *)self preferredPathConfigURI];
  [(NSPCandidateProxyPath *)v4 setPreferredPathConfigURI:v7];

  id v8 = [(NSPCandidateProxyPath *)self preferredPathPatterns];
  [(NSPCandidateProxyPath *)v4 setPreferredPathPatterns:v8];

  v9 = [(NSPCandidateProxyPath *)self domainFilter];
  [(NSPCandidateProxyPath *)v4 setDomainFilter:v9];

  return v4;
}

- (BOOL)proxyPathReady
{
  uint64_t v3 = [(NSPCandidateProxyPath *)self preferredPathConfigURI];
  if (v3)
  {
    id v4 = (void *)v3;
    v5 = [(NSPCandidateProxyPath *)self domainFilter];

    if (!v5)
    {
      v11 = nplog_obj();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        LOWORD(v41) = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "proxy path is not ready due to absent domain filter", (uint8_t *)&v41, 2u);
      }
      goto LABEL_26;
    }
  }
  uint64_t v6 = [(NSPCandidateProxyPath *)self ingressProxy];
  if (sub_10000EDFC((uint64_t)v6))
  {
    v7 = [(NSPCandidateProxyPath *)self ingressProxy];
    unint64_t v8 = sub_100010F2C((uint64_t)v7);
    v9 = [(NSPCandidateProxyPath *)self ingressProxy];
    unint64_t v10 = sub_100011C74((uint64_t)v9);

    if (v8 <= v10)
    {
      v11 = nplog_obj();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        uint64_t v12 = [(NSPCandidateProxyPath *)self ingressProxy];
        uint64_t v13 = sub_100010F2C((uint64_t)v12);
        uint64_t v14 = [(NSPCandidateProxyPath *)self ingressProxy];
        id v15 = (void *)v14;
        if (v14) {
          id v16 = *(void **)(v14 + 24);
        }
        else {
          id v16 = 0;
        }
        id v17 = v16;
        v18 = [v17 vendor];
        v19 = [(NSPCandidateProxyPath *)self ingressProxy];
        int v41 = 134218498;
        uint64_t v42 = v13;
        __int16 v43 = 2112;
        v44 = v18;
        __int16 v45 = 2048;
        uint64_t v46 = sub_100011C74((uint64_t)v19);
        v20 = "proxy path is not ready due to insufficient ingress proxy tokens (cache+agent: %lu) for [%@], (ingress pro"
              "xy low-water mark: %lu)";
LABEL_16:
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, v20, (uint8_t *)&v41, 0x20u);

        goto LABEL_26;
      }
      goto LABEL_26;
    }
  }
  else
  {
  }
  v21 = [(NSPCandidateProxyPath *)self egressProxy];
  if (sub_10000EDFC((uint64_t)v21))
  {
    v22 = [(NSPCandidateProxyPath *)self egressProxy];
    unint64_t v23 = sub_100010F2C((uint64_t)v22);
    objc_super v24 = [(NSPCandidateProxyPath *)self egressProxy];
    unint64_t v25 = sub_100011C74((uint64_t)v24);

    if (v23 <= v25)
    {
      v11 = nplog_obj();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        uint64_t v12 = [(NSPCandidateProxyPath *)self egressProxy];
        uint64_t v26 = sub_100010F2C((uint64_t)v12);
        uint64_t v27 = [(NSPCandidateProxyPath *)self egressProxy];
        id v15 = (void *)v27;
        if (v27) {
          v28 = *(void **)(v27 + 24);
        }
        else {
          v28 = 0;
        }
        id v17 = v28;
        v18 = [v17 vendor];
        v19 = [(NSPCandidateProxyPath *)self egressProxy];
        int v41 = 134218498;
        uint64_t v42 = v26;
        __int16 v43 = 2112;
        v44 = v18;
        __int16 v45 = 2048;
        uint64_t v46 = sub_100011C74((uint64_t)v19);
        v20 = "proxy path is not ready due to insufficient egress proxy tokens (cache+agent: %lu) for [%@], (egress proxy"
              " low-water mark: %lu)";
        goto LABEL_16;
      }
LABEL_26:
      BOOL v29 = 0;
      goto LABEL_27;
    }
  }
  else
  {
  }
  v11 = nplog_obj();
  BOOL v29 = 1;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v30 = [(NSPCandidateProxyPath *)self ingressProxy];
    v31 = (void *)v30;
    if (v30) {
      v32 = *(void **)(v30 + 24);
    }
    else {
      v32 = 0;
    }
    id v33 = v32;
    v34 = [v33 vendor];
    uint64_t v35 = [(NSPCandidateProxyPath *)self egressProxy];
    v36 = (void *)v35;
    if (v35) {
      v37 = *(void **)(v35 + 24);
    }
    else {
      v37 = 0;
    }
    id v38 = v37;
    v39 = [v38 vendor];
    int v41 = 138412546;
    uint64_t v42 = (uint64_t)v34;
    __int16 v43 = 2112;
    v44 = v39;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "proxy path [%@:%@] is ready", (uint8_t *)&v41, 0x16u);
  }
LABEL_27:

  return v29;
}

- (BOOL)matchIngress:(id)a3
{
  id v4 = (id *)a3;
  if (!v4)
  {
    uint64_t v14 = nplog_obj();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
LABEL_10:

      unsigned __int8 v12 = 0;
      goto LABEL_6;
    }
    int v16 = 136315138;
    id v17 = "-[NSPCandidateProxyPath matchIngress:]";
    id v15 = "%s called with null proxyTokenInfo";
LABEL_12:
    _os_log_fault_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_FAULT, v15, (uint8_t *)&v16, 0xCu);
    goto LABEL_10;
  }
  v5 = [(NSPCandidateProxyPath *)self ingressProxy];

  if (!v5)
  {
    uint64_t v14 = nplog_obj();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      goto LABEL_10;
    }
    int v16 = 136315138;
    id v17 = "-[NSPCandidateProxyPath matchIngress:]";
    id v15 = "%s called with null self.ingressProxy";
    goto LABEL_12;
  }
  uint64_t v6 = [(NSPCandidateProxyPath *)self ingressProxy];
  v7 = (void *)v6;
  if (v6) {
    unint64_t v8 = *(void **)(v6 + 24);
  }
  else {
    unint64_t v8 = 0;
  }
  id v9 = v8;
  unint64_t v10 = [v9 proxyURL];
  v11 = [v4[3] proxyURL];
  unsigned __int8 v12 = [v10 isEqualToString:v11];

LABEL_6:
  return v12;
}

- (BOOL)matchEgress:(id)a3
{
  id v4 = (id *)a3;
  if (!v4)
  {
    uint64_t v14 = nplog_obj();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
LABEL_10:

      unsigned __int8 v12 = 0;
      goto LABEL_6;
    }
    int v16 = 136315138;
    id v17 = "-[NSPCandidateProxyPath matchEgress:]";
    id v15 = "%s called with null proxyTokenInfo";
LABEL_12:
    _os_log_fault_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_FAULT, v15, (uint8_t *)&v16, 0xCu);
    goto LABEL_10;
  }
  v5 = [(NSPCandidateProxyPath *)self egressProxy];

  if (!v5)
  {
    uint64_t v14 = nplog_obj();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      goto LABEL_10;
    }
    int v16 = 136315138;
    id v17 = "-[NSPCandidateProxyPath matchEgress:]";
    id v15 = "%s called with null self.egressProxy";
    goto LABEL_12;
  }
  uint64_t v6 = [(NSPCandidateProxyPath *)self egressProxy];
  v7 = (void *)v6;
  if (v6) {
    unint64_t v8 = *(void **)(v6 + 24);
  }
  else {
    unint64_t v8 = 0;
  }
  id v9 = v8;
  unint64_t v10 = [v9 proxyURL];
  v11 = [v4[3] proxyURL];
  unsigned __int8 v12 = [v10 isEqualToString:v11];

LABEL_6:
  return v12;
}

- (void)fetchDomainFilter:(id)a3
{
  id v4 = a3;
  v5 = [(NSPCandidateProxyPath *)self preferredPathConfigURI];
  if (v5
    && ([(NSPCandidateProxyPath *)self domainFilter],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        !v6))
  {
    v7 = [(NSPCandidateProxyPath *)self preferredPathConfigURI];
    unint64_t v8 = +[NSURL URLWithString:v7];

    id v9 = +[NSMutableURLRequest requestWithURL:v8];
    if (v9)
    {
      int has_internal_diagnostics = os_variant_has_internal_diagnostics();
      v11 = copyProductTypeString();
      unsigned __int8 v12 = copyOSNameString();
      uint64_t v13 = copyOSVersionString();
      uint64_t v14 = copyOSBuildString();
      id v15 = (void *)v14;
      if (has_internal_diagnostics) {
        CFStringRef v16 = @"<%@> <%@;%@;%@;internal>";
      }
      else {
        CFStringRef v16 = @"<%@> <%@;%@;%@>";
      }
      id v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v16, v11, v12, v13, v14);

      if (v17) {
        [v9 setValue:v17 forHTTPHeaderField:@"X-Mask-Client-Info"];
      }
      *(void *)&long long v38 = 0;
      *((void *)&v38 + 1) = &v38;
      uint64_t v39 = 0x3032000000;
      v40 = sub_100005D5C;
      int v41 = sub_10000F6B0;
      id v42 = (id)os_transaction_create();
      objc_initWeak(&location, self);
      uint64_t v29 = 0;
      uint64_t v30 = (id *)&v29;
      uint64_t v31 = 0x3032000000;
      v32 = sub_100005D5C;
      id v33 = sub_10000F6B0;
      id v34 = 0;
      v18 = nplog_obj();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v37 = v8;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Sending request for %@", buf, 0xCu);
      }

      v19 = +[NPUtilities sharedEmphemeralSession];
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_100021FF4;
      v23[3] = &unk_100105A68;
      uint64_t v26 = &v29;
      objc_copyWeak(&v28, &location);
      id v24 = v8;
      id v25 = v4;
      uint64_t v27 = &v38;
      v20 = [v19 dataTaskWithRequest:v9 completionHandler:v23];

      objc_storeStrong(v30 + 5, v20);
      [v30[5] resume];

      objc_destroyWeak(&v28);
      _Block_object_dispose(&v29, 8);

      objc_destroyWeak(&location);
      _Block_object_dispose(&v38, 8);
    }
    else
    {
      v21 = nplog_obj();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = [(NSPCandidateProxyPath *)self preferredPathConfigURI];
        LODWORD(v38) = 138412290;
        *(void *)((char *)&v38 + 4) = v22;
        _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Failed to create request for preferred path URL %@", (uint8_t *)&v38, 0xCu);
      }
      if (v4) {
        (*((void (**)(id, void))v4 + 2))(v4, 0);
      }
    }
  }
  else if (v4)
  {
    (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
  }
}

- (NSPProxyTokenInfo)ingressProxy
{
  return self->_ingressProxy;
}

- (void)setIngressProxy:(id)a3
{
}

- (NSPProxyTokenInfo)egressProxy
{
  return self->_egressProxy;
}

- (void)setEgressProxy:(id)a3
{
}

- (unint64_t)proxyPathWeight
{
  return self->_proxyPathWeight;
}

- (void)setProxyPathWeight:(unint64_t)a3
{
  self->_proxyPathWeight = a3;
}

- (NSString)preferredPathConfigURI
{
  return self->_preferredPathConfigURI;
}

- (void)setPreferredPathConfigURI:(id)a3
{
}

- (NSArray)preferredPathPatterns
{
  return self->_preferredPathPatterns;
}

- (void)setPreferredPathPatterns:(id)a3
{
}

- (NSData)domainFilter
{
  return self->_domainFilter;
}

- (void)setDomainFilter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainFilter, 0);
  objc_storeStrong((id *)&self->_preferredPathPatterns, 0);
  objc_storeStrong((id *)&self->_preferredPathConfigURI, 0);
  objc_storeStrong((id *)&self->_egressProxy, 0);

  objc_storeStrong((id *)&self->_ingressProxy, 0);
}

@end