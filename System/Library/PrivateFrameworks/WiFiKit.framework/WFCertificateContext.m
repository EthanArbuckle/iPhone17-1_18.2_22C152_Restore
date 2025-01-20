@interface WFCertificateContext
- (BOOL)needsDismissal;
- (NSArray)certificateChain;
- (WFCertificateContext)initWithNetwork:(id)a3 profile:(id)a4 certificateChain:(id)a5;
- (WFNetworkProfile)profile;
- (WFNetworkScanRecord)network;
- (WFNetworkView)provider;
- (__SecTrust)certificateTrust;
- (id)completionHandler;
- (int64_t)requestedFields;
- (void)accept;
- (void)cancel;
- (void)dealloc;
- (void)launchSettings;
- (void)setCertificateChain:(id)a3;
- (void)setCertificateTrust:(__SecTrust *)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setNetwork:(id)a3;
- (void)setProfile:(id)a3;
- (void)setProvider:(id)a3;
- (void)setRequestedFields:(int64_t)a3;
@end

@implementation WFCertificateContext

- (WFCertificateContext)initWithNetwork:(id)a3 profile:(id)a4 certificateChain:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v24.receiver = self;
  v24.super_class = (Class)WFCertificateContext;
  v12 = [(WFCertificateContext *)&v24 init];
  v13 = v12;
  if (!v12) {
    goto LABEL_28;
  }
  if (!v9)
  {
    v17 = WFLogForCategory(0);
    os_log_type_t v18 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v17 || !os_log_type_enabled(v17, v18)) {
      goto LABEL_27;
    }
    *(_DWORD *)buf = 136315138;
    v26 = "-[WFCertificateContext initWithNetwork:profile:certificateChain:]";
    v19 = "%s: nil network";
LABEL_16:
    v20 = v17;
    os_log_type_t v21 = v18;
    uint32_t v22 = 12;
LABEL_26:
    _os_log_impl(&dword_226071000, v20, v21, v19, buf, v22);
LABEL_27:

LABEL_28:
    v13 = 0;
    goto LABEL_7;
  }
  if (!v10)
  {
    v17 = WFLogForCategory(0);
    os_log_type_t v18 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v17 || !os_log_type_enabled(v17, v18)) {
      goto LABEL_27;
    }
    *(_DWORD *)buf = 136315138;
    v26 = "-[WFCertificateContext initWithNetwork:profile:certificateChain:]";
    v19 = "%s: nil profile";
    goto LABEL_16;
  }
  objc_storeStrong((id *)&v12->_network, a3);
  objc_storeStrong((id *)&v13->_profile, a4);
  if (!v11)
  {
    v17 = WFLogForCategory(0);
    os_log_type_t v23 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v17 || !os_log_type_enabled(v17, v23)) {
      goto LABEL_27;
    }
    *(_WORD *)buf = 0;
    v19 = "certificateChain is nil";
LABEL_25:
    v20 = v17;
    os_log_type_t v21 = v23;
    uint32_t v22 = 2;
    goto LABEL_26;
  }
  objc_storeStrong((id *)&v13->_certificateChain, a5);
  v14 = [(WFCertificateContext *)v13 certificateChain];
  v15 = (__SecTrust *)WFCreateSecTrustFromCertificateChain(v14);

  if (!v15)
  {
    v17 = WFLogForCategory(0);
    os_log_type_t v23 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v17 || !os_log_type_enabled(v17, v23)) {
      goto LABEL_27;
    }
    *(_WORD *)buf = 0;
    v19 = "failed to create certificate trust";
    goto LABEL_25;
  }
  v13->_certificateTrust = v15;
  v13->_requestedFields = 4;
LABEL_7:

  return v13;
}

- (void)dealloc
{
  if ([(WFCertificateContext *)self certificateTrust])
  {
    CFRelease([(WFCertificateContext *)self certificateTrust]);
    [(WFCertificateContext *)self setCertificateTrust:0];
  }
  v3.receiver = self;
  v3.super_class = (Class)WFCertificateContext;
  [(WFCertificateContext *)&v3 dealloc];
}

- (BOOL)needsDismissal
{
  return 1;
}

- (void)cancel
{
  v2 = [(WFCertificateContext *)self completionHandler];
  v2[2](v2, 0);
}

- (void)accept
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  objc_super v3 = WFLogForCategory(0);
  os_log_type_t v4 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v3)
  {
    v5 = v3;
    if (os_log_type_enabled(v5, v4))
    {
      v6 = [(WFCertificateContext *)self certificateChain];
      int v8 = 138412290;
      id v9 = v6;
      _os_log_impl(&dword_226071000, v5, v4, "User trusted provided certificate chain %@", (uint8_t *)&v8, 0xCu);
    }
  }

  v7 = [(WFCertificateContext *)self completionHandler];
  v7[2](v7, 1);
}

- (void)launchSettings
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  objc_super v3 = WFLogForCategory(0);
  os_log_type_t v4 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v3)
  {
    v5 = v3;
    if (os_log_type_enabled(v5, v4))
    {
      v6 = [(WFCertificateContext *)self network];
      int v8 = 136315650;
      id v9 = "-[WFCertificateContext launchSettings]";
      __int16 v10 = 2112;
      id v11 = v6;
      __int16 v12 = 2112;
      v13 = self;
      _os_log_impl(&dword_226071000, v5, v4, "%s: opening settings for %@ (context: %@)", (uint8_t *)&v8, 0x20u);
    }
  }

  v7 = [(WFCertificateContext *)self network];
  WFScanRecordArchiveToEnterprisePath(v7);

  WFOpenSettingsURLWithType(1uLL);
  [(WFCertificateContext *)self cancel];
}

- (int64_t)requestedFields
{
  return self->_requestedFields;
}

- (void)setRequestedFields:(int64_t)a3
{
  self->_requestedFields = a3;
}

- (NSArray)certificateChain
{
  return self->_certificateChain;
}

- (void)setCertificateChain:(id)a3
{
}

- (__SecTrust)certificateTrust
{
  return self->_certificateTrust;
}

- (void)setCertificateTrust:(__SecTrust *)a3
{
  self->_certificateTrust = a3;
}

- (WFNetworkView)provider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
  return (WFNetworkView *)WeakRetained;
}

- (void)setProvider:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (WFNetworkProfile)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
}

- (WFNetworkScanRecord)network
{
  return self->_network;
}

- (void)setNetwork:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_network, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_destroyWeak((id *)&self->_provider);
  objc_storeStrong((id *)&self->_certificateChain, 0);
}

@end