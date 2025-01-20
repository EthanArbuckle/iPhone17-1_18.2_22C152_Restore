@interface WFWAPICertificatePromptOperation
- (BOOL)otherNetworkViewController:(id)a3 isValidPassword:(id)a4;
- (BOOL)userCancelled;
- (NSArray)wapiIdentityMapping;
- (NSData)WAPIIdentityPEMBlob;
- (UINavigationController)navigationController;
- (UIViewController)rootViewController;
- (WFNetworkScanRecord)network;
- (WFOtherNetworkViewController)promptViewController;
- (WFWAPICertificatePromptOperation)initWithRootViewController:(id)a3 network:(id)a4;
- (__SecIdentity)WAPIRootCertificate;
- (void)finish;
- (void)otherNetworkViewControllerUserDidTapCancel:(id)a3;
- (void)otherNetworkViewControllerUserDidTapJoin:(id)a3;
- (void)setNavigationController:(id)a3;
- (void)setNetwork:(id)a3;
- (void)setPromptViewController:(id)a3;
- (void)setRootViewController:(id)a3;
- (void)setUserCancelled:(BOOL)a3;
- (void)setWAPIIdentityPEMBlob:(id)a3;
- (void)setWAPIRootCertificate:(__SecIdentity *)a3;
- (void)setWapiIdentityMapping:(id)a3;
- (void)start;
@end

@implementation WFWAPICertificatePromptOperation

- (WFWAPICertificatePromptOperation)initWithRootViewController:(id)a3 network:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)WFWAPICertificatePromptOperation;
  v9 = [(WFWAPICertificatePromptOperation *)&v14 init];
  v10 = v9;
  if (!v7) {
    goto LABEL_6;
  }
  if (!v9)
  {
    network = 0;
    goto LABEL_5;
  }
  objc_storeStrong((id *)&v9->_rootViewController, a3);
  if (v8)
  {
    v11 = (WFNetworkScanRecord *)v8;
    network = v10->_network;
    v10->_network = v11;
  }
  else
  {
LABEL_6:
    network = v10;
    v10 = 0;
  }
LABEL_5:

  return v10;
}

- (void)finish
{
  v4.receiver = self;
  v4.super_class = (Class)WFWAPICertificatePromptOperation;
  [(WFOperation *)&v4 finish];
  v3 = [(WFWAPICertificatePromptOperation *)self rootViewController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (void)start
{
  v15.receiver = self;
  v15.super_class = (Class)WFWAPICertificatePromptOperation;
  [(WFOperation *)&v15 start];
  v3 = (void *)[objc_alloc(MEMORY[0x263F863D8]) initWithOtherNetworkStyle:2];
  objc_super v4 = [(WFWAPICertificatePromptOperation *)self network];
  v5 = [v4 ssid];
  [v3 setNetworkName:v5];

  [v3 setDelegate:self];
  CFArrayRef theArray = 0;
  if (!WFWAPIRootCertificateListCreate((CFTypeRef *)&theArray) && CFArrayGetCount(theArray)) {
    [v3 setWAPIRootCertificates:theArray];
  }
  if (theArray)
  {
    CFRelease(theArray);
    CFArrayRef theArray = 0;
  }
  id obj = 0;
  CFArrayRef v13 = 0;
  if (!WFWAPIIdentityListCreate(&v13, (__CFArray **)&obj) && CFArrayGetCount(v13))
  {
    [v3 setWAPIIdentities:v13];
    objc_storeStrong((id *)&self->_wapiIdentityMapping, obj);
  }
  [(WFWAPICertificatePromptOperation *)self setPromptViewController:v3];
  id v6 = objc_alloc(MEMORY[0x263F1C7F8]);
  id v7 = [(WFWAPICertificatePromptOperation *)self promptViewController];
  id v8 = (void *)[v6 initWithRootViewController:v7];

  v9 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v10 = [v9 userInterfaceIdiom];

  if (v10 == 1) {
    [v8 setModalPresentationStyle:2];
  }
  v11 = [(WFWAPICertificatePromptOperation *)self rootViewController];
  [v11 presentViewController:v8 animated:1 completion:0];

  [(WFWAPICertificatePromptOperation *)self setNavigationController:v8];
}

- (void)otherNetworkViewControllerUserDidTapCancel:(id)a3
{
  [(WFWAPICertificatePromptOperation *)self setUserCancelled:1];
  [(WFWAPICertificatePromptOperation *)self finish];
}

- (void)otherNetworkViewControllerUserDidTapJoin:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v5 = self->_wapiIdentityMapping;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v11 = (const void *)objc_msgSend(v10, "valueForKey:", @"certRef", (void)v15);
        v12 = [v4 WAPIIdentity];
        LODWORD(v11) = CFEqual(v11, v12);

        if (v11)
        {
          CFArrayRef v13 = [v10 valueForKey:@"pemData"];
          [(WFWAPICertificatePromptOperation *)self setWAPIIdentityPEMBlob:v13];
        }
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  objc_super v14 = [v4 WAPIRootCertificate];
  [(WFWAPICertificatePromptOperation *)self setWAPIRootCertificate:v14];

  [(WFWAPICertificatePromptOperation *)self finish];
}

- (BOOL)otherNetworkViewController:(id)a3 isValidPassword:(id)a4
{
  return 1;
}

- (BOOL)userCancelled
{
  return self->_userCancelled;
}

- (void)setUserCancelled:(BOOL)a3
{
  self->_userCancelled = a3;
}

- (__SecIdentity)WAPIRootCertificate
{
  return self->_WAPIRootCertificate;
}

- (void)setWAPIRootCertificate:(__SecIdentity *)a3
{
  self->_WAPIRootCertificate = a3;
}

- (NSData)WAPIIdentityPEMBlob
{
  return self->_WAPIIdentityPEMBlob;
}

- (void)setWAPIIdentityPEMBlob:(id)a3
{
}

- (UIViewController)rootViewController
{
  return self->_rootViewController;
}

- (void)setRootViewController:(id)a3
{
}

- (WFNetworkScanRecord)network
{
  return self->_network;
}

- (void)setNetwork:(id)a3
{
}

- (WFOtherNetworkViewController)promptViewController
{
  return self->_promptViewController;
}

- (void)setPromptViewController:(id)a3
{
}

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
}

- (NSArray)wapiIdentityMapping
{
  return self->_wapiIdentityMapping;
}

- (void)setWapiIdentityMapping:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wapiIdentityMapping, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_promptViewController, 0);
  objc_storeStrong((id *)&self->_network, 0);
  objc_storeStrong((id *)&self->_rootViewController, 0);
  objc_storeStrong((id *)&self->_WAPIIdentityPEMBlob, 0);
}

@end