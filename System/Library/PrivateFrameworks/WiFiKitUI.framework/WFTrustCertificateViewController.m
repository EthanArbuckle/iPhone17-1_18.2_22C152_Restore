@interface WFTrustCertificateViewController
- (BOOL)wantsModalPresentation;
- (WFCertificateProviderContext)credentialsContext;
- (WFTrustCertificateViewController)initWithCertificateProviderContext:(id)a3;
- (void)setCredentialsContext:(id)a3;
- (void)trustCertificateViewController:(id)a3 finishedWithReturnCode:(int)a4;
@end

@implementation WFTrustCertificateViewController

- (WFTrustCertificateViewController)initWithCertificateProviderContext:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WFTrustCertificateViewController;
  v6 = -[TrustCertificateViewController initWithTrust:action:delegate:](&v11, sel_initWithTrust_action_delegate_, [v5 certificateTrust], 2, self);
  v7 = v6;
  if (!v6)
  {
LABEL_10:

    v7 = 0;
    goto LABEL_4;
  }
  if (!v5)
  {
    v9 = WFLogForCategory(0);
    os_log_type_t v10 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v9 && os_log_type_enabled(v9, v10))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[WFTrustCertificateViewController initWithCertificateProviderContext:]";
      _os_log_impl(&dword_2257EC000, v9, v10, "%s: nil credentials provider context", buf, 0xCu);
    }

    goto LABEL_10;
  }
  objc_storeStrong((id *)&v6->_credentialsContext, a3);
  v7->_wantsModalPresentation = 1;
LABEL_4:

  return v7;
}

- (void)trustCertificateViewController:(id)a3 finishedWithReturnCode:(int)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v6 = WFLogForCategory(0);
  os_log_type_t v7 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v6 && os_log_type_enabled(v6, v7))
  {
    int v10 = 136315394;
    objc_super v11 = "-[WFTrustCertificateViewController trustCertificateViewController:finishedWithReturnCode:]";
    __int16 v12 = 1024;
    int v13 = a4;
    _os_log_impl(&dword_2257EC000, v6, v7, "%s- returnCode %d", (uint8_t *)&v10, 0x12u);
  }

  v8 = [(WFTrustCertificateViewController *)self credentialsContext];
  v9 = v8;
  if (a4 == 1) {
    [v8 accept];
  }
  else {
    [v8 cancel];
  }
}

- (BOOL)wantsModalPresentation
{
  return self->_wantsModalPresentation;
}

- (WFCertificateProviderContext)credentialsContext
{
  return self->_credentialsContext;
}

- (void)setCredentialsContext:(id)a3
{
}

- (void).cxx_destruct
{
}

@end