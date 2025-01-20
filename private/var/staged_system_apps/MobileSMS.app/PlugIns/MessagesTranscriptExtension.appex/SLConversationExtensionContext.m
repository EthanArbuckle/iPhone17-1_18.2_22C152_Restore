@interface SLConversationExtensionContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (id)remoteProxy;
- (void)openURL:(id)a3 completionHandler:(id)a4;
- (void)requestDismissal;
@end

@implementation SLConversationExtensionContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (qword_100008E20 != -1) {
    dispatch_once(&qword_100008E20, &stru_100004200);
  }
  v2 = (void *)qword_100008E18;

  return v2;
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (qword_100008E30 != -1) {
    dispatch_once(&qword_100008E30, &stru_100004220);
  }
  v2 = (void *)qword_100008E28;

  return v2;
}

- (id)remoteProxy
{
  v2 = [(SLConversationExtensionContext *)self _auxiliaryConnection];
  v3 = [v2 remoteObjectProxy];

  return v3;
}

- (void)requestDismissal
{
  id v2 = [(SLConversationExtensionContext *)self remoteProxy];
  [v2 requestDismissal];
}

- (void)openURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SLConversationExtensionContext *)self remoteProxy];
  [v8 openURL:v7 completionHandler:v6];
}

@end