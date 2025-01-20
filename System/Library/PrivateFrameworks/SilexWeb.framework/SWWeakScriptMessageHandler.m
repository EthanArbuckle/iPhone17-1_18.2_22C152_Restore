@interface SWWeakScriptMessageHandler
- (SWWeakScriptMessageHandler)initWithScriptMessageHandler:(id)a3;
- (WKScriptMessageHandler)scriptMessageHandler;
- (void)userContentController:(id)a3 didReceiveScriptMessage:(id)a4;
@end

@implementation SWWeakScriptMessageHandler

- (SWWeakScriptMessageHandler)initWithScriptMessageHandler:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SWWeakScriptMessageHandler;
  v5 = [(SWWeakScriptMessageHandler *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_scriptMessageHandler, v4);
  }

  return v6;
}

- (void)userContentController:(id)a3 didReceiveScriptMessage:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SWWeakScriptMessageHandler *)self scriptMessageHandler];
  [v8 userContentController:v7 didReceiveScriptMessage:v6];
}

- (WKScriptMessageHandler)scriptMessageHandler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scriptMessageHandler);
  return (WKScriptMessageHandler *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end