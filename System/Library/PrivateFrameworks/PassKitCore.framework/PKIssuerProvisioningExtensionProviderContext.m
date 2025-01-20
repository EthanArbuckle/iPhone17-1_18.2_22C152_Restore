@interface PKIssuerProvisioningExtensionProviderContext
- (PKIssuerProvisioningExtensionHandler)handler;
- (id)remoteObjectProxyWithErrorHandler:(id)a3;
- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (void)connect;
- (void)generateRequestWithEntryIdentifier:(id)a3 configuration:(id)a4 certificateChain:(id)a5 nonce:(id)a6 nonceSignature:(id)a7 completionHandler:(id)a8;
- (void)passEntriesWithCompletion:(id)a3;
- (void)remotePassEntriesWithCompletion:(id)a3;
- (void)setHandler:(id)a3;
- (void)statusWithCompletion:(id)a3;
@end

@implementation PKIssuerProvisioningExtensionProviderContext

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = [(PKIssuerProvisioningExtensionProviderContext *)self _auxiliaryConnection];
  v6 = [v5 remoteObjectProxyWithErrorHandler:v4];

  return v6;
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = [(PKIssuerProvisioningExtensionProviderContext *)self _auxiliaryConnection];
  v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v4];

  return v6;
}

- (void)statusWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  if (v4)
  {
    v7 = v4;
    v5 = (void *)MEMORY[0x192FDC630]();
    handler = self->_handler;
    if (handler) {
      [(PKIssuerProvisioningExtensionHandler *)handler statusWithCompletion:v7];
    }
    else {
      v7[2](v7, 0);
    }
    id v4 = v7;
  }
}

- (void)passEntriesWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  if (v4)
  {
    v7 = v4;
    v5 = (void *)MEMORY[0x192FDC630]();
    handler = self->_handler;
    if (handler) {
      [(PKIssuerProvisioningExtensionHandler *)handler passEntriesWithCompletion:v7];
    }
    else {
      v7[2](v7, MEMORY[0x1E4F1CBF0]);
    }
    id v4 = v7;
  }
}

- (void)remotePassEntriesWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  if (v4)
  {
    v7 = v4;
    v5 = (void *)MEMORY[0x192FDC630]();
    handler = self->_handler;
    if (handler) {
      [(PKIssuerProvisioningExtensionHandler *)handler remotePassEntriesWithCompletion:v7];
    }
    else {
      v7[2](v7, MEMORY[0x1E4F1CBF0]);
    }
    id v4 = v7;
  }
}

- (void)generateRequestWithEntryIdentifier:(id)a3 configuration:(id)a4 certificateChain:(id)a5 nonce:(id)a6 nonceSignature:(id)a7 completionHandler:(id)a8
{
  id v21 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v18 = (void (**)(id, void))a8;
  if (v18)
  {
    v19 = (void *)MEMORY[0x192FDC630]();
    handler = self->_handler;
    if (handler) {
      [(PKIssuerProvisioningExtensionHandler *)handler generateAddPaymentPassRequestForPassEntryWithIdentifier:v21 configuration:v14 certificateChain:v15 nonce:v16 nonceSignature:v17 completionHandler:v18];
    }
    else {
      v18[2](v18, 0);
    }
  }
}

- (void)connect
{
  id v2 = [(PKIssuerProvisioningExtensionProviderContext *)self synchronousRemoteObjectProxyWithErrorHandler:0];
  [v2 connectWithCompletion:&__block_literal_global_73];
}

- (PKIssuerProvisioningExtensionHandler)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end