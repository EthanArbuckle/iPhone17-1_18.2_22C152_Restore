@interface PKPrintdRPC_BrowseClient
- (PKPrintdRPC_BrowseClient)initWithInfo:(id)a3 provenance:(unint64_t)a4 delegate:(id)a5;
- (id)ptConn_locked;
- (void)invalidate;
- (void)ptConn_locked;
- (void)startBrowsing;
@end

@implementation PKPrintdRPC_BrowseClient

- (PKPrintdRPC_BrowseClient)initWithInfo:(id)a3 provenance:(unint64_t)a4 delegate:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PKPrintdRPC_BrowseClient;
  v10 = [(PKPrinterTool_Client *)&v14 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    infoDictionary = v10->_infoDictionary;
    v10->_infoDictionary = (NSDictionary *)v11;

    v10->_provenance = a4;
    objc_storeStrong((id *)&v10->_delegate, a5);
  }

  return v10;
}

- (id)ptConn_locked
{
  v11.receiver = self;
  v11.super_class = (Class)PKPrintdRPC_BrowseClient;
  v3 = [(PKPrinterTool_Client *)&v11 ptConn_locked];
  if (v3)
  {
    v4 = getPrintdRPCBrowseProtocolInterface();
    [(NSXPCConnection *)self->super._conn_needsLock setExportedInterface:v4];

    [(NSXPCConnection *)self->super._conn_needsLock setExportedObject:self->_delegate];
  }
  else
  {
    v6 = _PKLogCategory(PKLogCategoryFramework);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_22EA54000, v6, OS_LOG_TYPE_ERROR, "Cannot connect to PrinterTool", v10, 2u);
    }

    v7 = (const char **)_CFGetProgname();
    if (v7)
    {
      id v8 = *v7;
      if (v8)
      {
        if (!strcmp(v8, "grappler"))
        {
          id v9 = _PKLogCategory(PKLogCategoryFramework);
          -[PKPrintdRPC_BrowseClient ptConn_locked](v9);

          abort();
        }
      }
    }
  }

  return v3;
}

- (void)startBrowsing
{
  v3 = [(PKPrinterTool_Client *)self ptConn];
  id v4 = [v3 remoteObjectProxy];

  if (v4) {
    [v4 startBrowsing:self->_infoDictionary provenance:self->_provenance];
  }
}

- (void)invalidate
{
  v2.receiver = self;
  v2.super_class = (Class)PKPrintdRPC_BrowseClient;
  [(PKPrinterTool_Client *)&v2 invalidate];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);

  objc_storeStrong((id *)&self->_infoDictionary, 0);
}

- (void)ptConn_locked
{
  if (os_log_type_enabled(a1, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)objc_super v2 = 0;
    _os_log_impl(&dword_22EA54000, a1, OS_LOG_TYPE_ERROR, "XPC Service not found, check for valid installation or use GRAPPLER_IS_PRINTERTOOL", v2, 2u);
  }
}

@end