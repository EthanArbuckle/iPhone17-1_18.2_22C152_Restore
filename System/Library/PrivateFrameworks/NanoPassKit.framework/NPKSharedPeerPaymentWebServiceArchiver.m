@interface NPKSharedPeerPaymentWebServiceArchiver
- (NPKCompanionAgentConnection)connection;
- (NPKSharedPeerPaymentWebServiceArchiver)initWithCompanionAgentConnection:(id)a3;
- (void)archiveContext:(id)a3;
- (void)setConnection:(id)a3;
@end

@implementation NPKSharedPeerPaymentWebServiceArchiver

- (NPKSharedPeerPaymentWebServiceArchiver)initWithCompanionAgentConnection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NPKSharedPeerPaymentWebServiceArchiver;
  v6 = [(NPKSharedPeerPaymentWebServiceArchiver *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_connection, a3);
  }

  return v7;
}

- (void)archiveContext:(id)a3
{
  id v4 = a3;
  id v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Telling daemon to archive peer payment web service context", v10, 2u);
    }
  }
  v8 = [(NPKSharedPeerPaymentWebServiceArchiver *)self connection];
  objc_super v9 = NPKPairedOrPairingDevice();
  [v8 setSharedPeerPaymentWebServiceContext:v4 forDevice:v9];
}

- (NPKCompanionAgentConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end