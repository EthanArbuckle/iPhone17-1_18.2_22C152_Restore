@interface NSPServerODoH
- (void)reportErrorForDNSAgent:(id)a3 error:(int)a4 withOptions:(id)a5;
@end

@implementation NSPServerODoH

- (void)reportErrorForDNSAgent:(id)a3 error:(int)a4 withOptions:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  long long buffer = 0u;
  memset(v40, 0, sizeof(v40));
  v10 = [v9 objectForKeyedSubscript:NWNetworkAgentStartOptionClientUUID];
  if (!v10)
  {
    v12 = 0;
    goto LABEL_7;
  }
  v11 = +[NWPath pathForClientID:v10];
  v12 = v11;
  if (!v11)
  {
LABEL_7:
    v17 = 0;
    v13 = 0;
    goto LABEL_13;
  }
  v13 = [v11 interface];
  v14 = [v12 parameters];
  int v15 = [v14 pid];
  if (!v15)
  {
LABEL_11:
    v17 = 0;
    goto LABEL_12;
  }
  int v16 = v15;
  if (proc_pidinfo(v15, 13, 1uLL, &buffer, 64) != 64)
  {
    v18 = nplog_obj();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 67109120;
      HIDWORD(buf) = v16;
      _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Failed to convert from PID (%d) to process name", (uint8_t *)&buf, 8u);
    }

    goto LABEL_11;
  }
  v17 = (const char *)v40;
LABEL_12:

LABEL_13:
  v19 = nplog_obj();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    if (v17) {
      v20 = v17;
    }
    else {
      v20 = "none";
    }
    v21 = [v13 interfaceName];
    LODWORD(buf) = 67109634;
    HIDWORD(buf) = v6;
    __int16 v35 = 2080;
    v36 = v20;
    __int16 v37 = 2112;
    v38 = v21;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Received DNS error (%d) from %s on interface %@", (uint8_t *)&buf, 0x1Cu);
  }
  objc_initWeak(&buf, self);
  v22 = NPGetInternalQueue();
  v26 = _NSConcreteStackBlock;
  uint64_t v27 = 3221225472;
  v28 = sub_10005574C;
  v29 = &unk_100105F18;
  objc_copyWeak(&v32, &buf);
  int v33 = v6;
  id v23 = v13;
  id v30 = v23;
  v31 = self;
  dispatch_async(v22, &v26);

  if (v6)
  {
    if (self) {
      self = (NSPServerODoH *)objc_loadWeakRetained((id *)&self->_delegate);
    }
    v24 = [v8 resolver:v26 v27 v28 v29];
    v25 = [v24 dohURL];
    [(NSPServerODoH *)self handleDNSAgentErrorReport:v25 error:v6];
  }
  objc_destroyWeak(&v32);
  objc_destroyWeak(&buf);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toggleStats, 0);
  objc_storeStrong((id *)&self->_lastOutageReasonStats, 0);
  objc_storeStrong((id *)&self->_lastResolverSwitchedDate, 0);
  objc_storeStrong((id *)&self->_candidateResolverRestoreTimer, 0);
  objc_storeStrong((id *)&self->_candidateResolvers, 0);
  objc_storeStrong((id *)&self->_resolvers, 0);
  objc_storeStrong((id *)&self->_networkCharacteristics, 0);
  objc_storeStrong((id *)&self->_lastPrimaryInterfaceChangedDate, 0);
  objc_storeStrong((id *)&self->_lastPathUnsatisfiedDate, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_bootstrapDNSAgentRegistration, 0);
  objc_storeStrong((id *)&self->_bootstrapDNSAgent, 0);
  objc_storeStrong((id *)&self->_privacyProxyDNSAgentRegistration, 0);
  objc_storeStrong((id *)&self->_privacyProxyDNSAgent, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_overridePreferredResolver, 0);
}

@end