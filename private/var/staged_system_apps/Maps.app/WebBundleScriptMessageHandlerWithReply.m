@interface WebBundleScriptMessageHandlerWithReply
- (WebBundleScriptMessageHandlerWithReply)initWithDelegate:(id)a3;
- (void)userContentController:(id)a3 didReceiveScriptMessage:(id)a4 replyHandler:(id)a5;
@end

@implementation WebBundleScriptMessageHandlerWithReply

- (WebBundleScriptMessageHandlerWithReply)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WebBundleScriptMessageHandlerWithReply;
  v5 = [(WebBundleScriptMessageHandlerWithReply *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

- (void)userContentController:(id)a3 didReceiveScriptMessage:(id)a4 replyHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = [a4 body];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v11 = v10;
  }
  else {
    v11 = 0;
  }
  id v12 = v11;

  if (v12)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained didReceiveMessageFromUserContentController:v8 message:v12 replyHandler:v9];
  }
  else
  {
    WeakRetained = sub_1000B8184();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138412290;
      uint64_t v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, WeakRetained, OS_LOG_TYPE_ERROR, "Incorrect message from web module: %@", (uint8_t *)&v14, 0xCu);
    }
  }
}

- (void).cxx_destruct
{
}

@end