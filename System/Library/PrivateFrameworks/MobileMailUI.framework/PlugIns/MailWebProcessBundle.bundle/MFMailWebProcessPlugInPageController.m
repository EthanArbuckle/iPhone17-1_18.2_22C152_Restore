@interface MFMailWebProcessPlugInPageController
- (MFMailWebProcessPlugInPageController)initWithPlugIn:(id)a3 contextController:(id)a4;
- (id)_webProcessDelegateProxy;
- (id)_webProcessPlugInBrowserContextController:(id)a3 pasteboardDataForRange:(id)a4;
- (void)attachmentController:(id)a3 updateToInlineAttachment:(id)a4;
- (void)invalidate;
@end

@implementation MFMailWebProcessPlugInPageController

- (MFMailWebProcessPlugInPageController)initWithPlugIn:(id)a3 contextController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v29.receiver = self;
  v29.super_class = (Class)MFMailWebProcessPlugInPageController;
  v8 = [(MFMailWebProcessPlugInPageController *)&v29 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_controller, a4);
    [v7 _setEditingDelegate:v9];
    v10 = objc_alloc_init(MFMailWebProcessLoadDelegate);
    loadDelegate = v9->_loadDelegate;
    v9->_loadDelegate = v10;

    v12 = [v6 remoteContentProxySchemePrefix];
    [(MFMailWebProcessLoadDelegate *)v9->_loadDelegate setRemoteContentProxySchemePrefix:v12];

    v13 = [v6 remoteContentNoProxySchemePrefix];
    [(MFMailWebProcessLoadDelegate *)v9->_loadDelegate setRemoteContentNoProxySchemePrefix:v13];

    -[MFMailWebProcessLoadDelegate setIsMailPrivacyProtectionAllowed:](v9->_loadDelegate, "setIsMailPrivacyProtectionAllowed:", [v6 isMailPrivacyProtectionAllowed]);
    uint64_t v14 = +[_WKRemoteObjectInterface remoteObjectInterfaceWithProtocol:&OBJC_PROTOCOL___MFMailWebProcessProxy];
    proxyInterface = v9->_proxyInterface;
    v9->_proxyInterface = (_WKRemoteObjectInterface *)v14;

    v16 = [v7 _remoteObjectRegistry];
    [v16 registerExportedObject:v9->_loadDelegate interface:v9->_proxyInterface];

    v17 = (MSPDFAttachmentController *)objc_alloc_init((Class)MSPDFAttachmentController);
    attachmentController = v9->_attachmentController;
    v9->_attachmentController = v17;

    [(MSPDFAttachmentController *)v9->_attachmentController setDelegate:v9];
    uint64_t v19 = +[_WKRemoteObjectInterface remoteObjectInterfaceWithProtocol:&OBJC_PROTOCOL___MSMailWebProcessAttachmentProxy];
    attachmentInterface = v9->_attachmentInterface;
    v9->_attachmentInterface = (_WKRemoteObjectInterface *)v19;

    v21 = [v7 _remoteObjectRegistry];
    [v21 registerExportedObject:v9->_attachmentController interface:v9->_attachmentInterface];

    v22 = +[_WKRemoteObjectInterface remoteObjectInterfaceWithProtocol:&OBJC_PROTOCOL___MFMailWebProcessDelegate];
    uint64_t v23 = objc_opt_class();
    v24 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v23, objc_opt_class(), 0);
    [v22 setClasses:v24 forSelector:"webProcessDidFinishDocumentLoadForURL:andRequestedRemoteURLs:" argumentIndex:1 ofReply:0];

    v25 = [v7 _remoteObjectRegistry];
    v26 = [v25 remoteObjectProxyWithInterface:v22];
    [(MFMailWebProcessLoadDelegate *)v9->_loadDelegate setMailDelegate:v26];

    [v7 setLoadDelegate:v9->_loadDelegate];
    v27 = [(MFMailWebProcessLoadDelegate *)v9->_loadDelegate mailDelegate];
    [v27 webProcessDidCreateBrowserContextControllerLoadDelegate];
  }
  return v9;
}

- (void)invalidate
{
  [(WKWebProcessPlugInBrowserContextController *)self->_controller _setEditingDelegate:0];
  [(MFMailWebProcessLoadDelegate *)self->_loadDelegate setMailDelegate:0];
  id v3 = [(WKWebProcessPlugInBrowserContextController *)self->_controller _remoteObjectRegistry];
  [v3 unregisterExportedObject:self->_loadDelegate interface:self->_proxyInterface];
  [v3 unregisterExportedObject:self->_attachmentController interface:self->_attachmentInterface];
}

- (id)_webProcessDelegateProxy
{
  webProcessDelegateProxy = self->_webProcessDelegateProxy;
  if (!webProcessDelegateProxy)
  {
    v4 = +[_WKRemoteObjectInterface remoteObjectInterfaceWithProtocol:&OBJC_PROTOCOL___MFMailWebProcessDelegate];
    uint64_t v5 = objc_opt_class();
    id v6 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v5, objc_opt_class(), 0);
    [v4 setClasses:v6 forSelector:"webProcessDidFinishDocumentLoadForURL:andRequestedRemoteURLs:" argumentIndex:1 ofReply:0];

    id v7 = [(WKWebProcessPlugInBrowserContextController *)self->_controller _remoteObjectRegistry];
    v8 = [v7 remoteObjectProxyWithInterface:v4];
    v9 = self->_webProcessDelegateProxy;
    self->_webProcessDelegateProxy = v8;

    webProcessDelegateProxy = self->_webProcessDelegateProxy;
  }
  return webProcessDelegateProxy;
}

- (id)_webProcessPlugInBrowserContextController:(id)a3 pasteboardDataForRange:(id)a4
{
  id v4 = a4;
  uint64_t v5 = [v4 frame];
  id v6 = +[WKWebProcessPlugInScriptWorld normalWorld];
  id v7 = [v5 jsRangeForRangeHandle:v4 inWorld:v6];
  v8 = [v5 jsContextForWorld:v6];
  v9 = [v8 globalObject];
  v18 = v7;
  v10 = +[NSArray arrayWithObjects:&v18 count:1];
  v11 = [v9 invokeMethod:@"longPressedAttachment" withArguments:v10];

  v12 = [v11 toString];
  if ([v12 length])
  {
    v13 = objc_msgSend(v12, "dataUsingEncoding:", 4, MFMailTypeIdentifiersAttachment);
    v17 = v13;
    uint64_t v14 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  }
  else
  {
    uint64_t v14 = &__NSDictionary0__struct;
  }

  return v14;
}

- (void)attachmentController:(id)a3 updateToInlineAttachment:(id)a4
{
  id v5 = a4;
  id v6 = [v5 contentID];
  id v7 = (void *)MFCreateURLForContentID();

  v8 = [(MFMailWebProcessLoadDelegate *)self->_loadDelegate currentJSContext];
  v9 = [v8 globalObject];
  v10 = [v5 contentID];
  v11 = objc_msgSend(v7, "absoluteString", v10);
  v15[1] = v11;
  v12 = [v5 additionalMarkup];
  v15[2] = v12;
  v13 = +[NSArray arrayWithObjects:v15 count:3];
  id v14 = [v9 invokeMethod:@"imageAttachmentNodeFinishedDownloading" withArguments:v13];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachmentInterface, 0);
  objc_storeStrong((id *)&self->_proxyInterface, 0);
  objc_storeStrong((id *)&self->_attachmentController, 0);
  objc_storeStrong((id *)&self->_loadDelegate, 0);
  objc_storeStrong((id *)&self->_webProcessDelegateProxy, 0);
  objc_storeStrong((id *)&self->_controller, 0);
}

@end